package protoc

import (
	"flag"
	"fmt"
	"log"

	"github.com/bazelbuild/bazel-gazelle/config"
	"github.com/bazelbuild/bazel-gazelle/label"
	"github.com/bazelbuild/bazel-gazelle/language"
	"github.com/bazelbuild/bazel-gazelle/repo"
	"github.com/bazelbuild/bazel-gazelle/resolve"
	"github.com/bazelbuild/bazel-gazelle/rule"
)

const (
	languageName = "protoc"
)

type protocLang struct {
}

// NewLanguage is called by Gazelle to install this language extension in a binary.
func NewLanguage() language.Language {
	return &protocLang{}
}

// Name returns the name of the language. This should be a prefix of the kinds
// of rules generated by the language, e.g., "go" for the Go extension since it
// generates "go_library" rules.
func (*protocLang) Name() string { return languageName }

// The following methods are implemented to satisfy the
// https://pkg.go.dev/github.com/bazelbuild/bazel-gazelle/resolve?tab=doc#Resolver
// interface, but are otherwise unused.
func (lang *protocLang) RegisterFlags(fs *flag.FlagSet, cmd string, c *config.Config) {
}
func (*protocLang) CheckFlags(fs *flag.FlagSet, c *config.Config) error {
	return nil
}
func (*protocLang) KnownDirectives() []string {
	return []string{
		protoLanguageDirective,
		protoPluginDirective,
		protoRuleDirective,
	}
}
func (lang *protocLang) Configure(c *config.Config, rel string, f *rule.File) {
	if f == nil {
		return
	}
	getExtensionConfig(c.Exts).parseDirectives(rel, f.Directives)
}

// Kinds returns a map of maps rule names (kinds) and information on how to
// match and merge attributes that may be found in rules of those kinds. All
// kinds of rules generated for this language may be found here.
func (*protocLang) Kinds() map[string]rule.KindInfo {
	return protocKinds()
}

// Loads returns .bzl files and symbols they define. Every rule generated by
// GenerateRules, now or in the past, should be loadable from one of these
// files.
func (*protocLang) Loads() []rule.LoadInfo {
	return protocLoads()
}

// Fix repairs deprecated usage of language-specific rules in f. This is called
// before the file is indexed. Unless c.ShouldFix is true, fixes that delete or
// rename rules should not be performed.
func (*protocLang) Fix(c *config.Config, f *rule.File) {}

// Imports returns a list of ImportSpecs that can be used to import the rule r.
// This is used to populate RuleIndex.
//
// If nil is returned, the rule will not be indexed. If any non-nil slice is
// returned, including an empty slice, the rule will be indexed.
func (b *protocLang) Imports(c *config.Config, r *rule.Rule, f *rule.File) []resolve.ImportSpec {
	srcs := r.AttrStrings("srcs")
	imports := make([]resolve.ImportSpec, len(srcs))

	for i, src := range srcs {
		imports[i] = resolve.ImportSpec{
			// Lang is the language in which the import string appears (this
			// should match Resolver.Name).
			Lang: languageName,
			// Imp is an import string for the library.
			Imp: fmt.Sprintf("//%s:%s", f.Pkg, src),
		}
	}

	return imports
}

// Embeds returns a list of labels of rules that the given rule embeds. If a
// rule is embedded by another importable rule of the same language, only the
// embedding rule will be indexed. The embedding rule will inherit the imports
// of the embedded rule. Since SkyLark doesn't support embedding this should
// always return nil.
func (*protocLang) Embeds(r *rule.Rule, from label.Label) []label.Label { return nil }

// Resolve translates imported libraries for a given rule into Bazel
// dependencies. Information about imported libraries is returned for each rule
// generated by language.GenerateRules in language.GenerateResult.Imports.
// Resolve generates a "deps" attribute (or the appropriate language-specific
// equivalent) for each import according to language-specific rules and
// heuristics.
func (*protocLang) Resolve(
	c *config.Config,
	ix *resolve.RuleIndex,
	rc *repo.RemoteCache,
	r *rule.Rule,
	importsRaw interface{},
	from label.Label,
) {
	cfg := getExtensionConfig(c.Exts)
	provider := cfg.LookupRuleProvider(from)
	if provider == nil {
		return
		// panic(fmt.Sprintf("RuleProvider of %q was not registered.", from))
	}
	provider.Resolve(c, r, importsRaw, from)
}

// GenerateRules extracts build metadata from source files in a directory.
// GenerateRules is called in each directory where an update is requested in
// depth-first post-order.
//
// args contains the arguments for GenerateRules. This is passed as a struct to
// avoid breaking implementations in the future when new fields are added.
//
// A GenerateResult struct is returned. Optional fields may be added to this
// type in the future.
//
// Any non-fatal errors this function encounters should be logged using
// log.Print.
func (*protocLang) GenerateRules(args language.GenerateArgs) language.GenerateResult {
	cfg := getExtensionConfig(args.Config.Exts)

	protoFiles := make(map[string]*ProtoFile)
	for _, f := range args.RegularFiles {
		if !isProtoFile(f) {
			continue
		}
		file := NewProtoFile(args.Rel, f)
		if err := file.Parse(); err != nil {
			log.Fatalf("unparseable proto file dir=%s, file=%s: %v", args.Dir, file.Basename, err)
		}
		protoFiles[f] = file
	}

	protoLibraries := make([]ProtoLibrary, 0)
	for _, r := range args.OtherGen {
		if r.Kind() != "proto_library" {
			continue
		}
		srcs := r.AttrStrings("srcs")
		srcLabels := make([]label.Label, len(srcs))
		for i, src := range srcs {
			srcLabel, err := label.Parse(src)
			if err != nil {
				log.Fatalf("%s %q: unparseable source label %q: %v", r.Kind(), r.Name(), src, err)
			}
			srcLabels[i] = srcLabel
		}
		files := matchingFiles(protoFiles, srcLabels)
		protoLibraries = append(protoLibraries, &OtherProtoLibrary{rule: r, files: files})
	}

	pkg := NewProtoPackage(args.File, args.Rel, cfg, protoLibraries)

	return language.GenerateResult{
		Gen:     pkg.Rules(),
		Imports: pkg.Imports(),
	}
}