package protoc

import (
	"testing"
)

type languageConfigCheck func(t *testing.T, cfg *LanguageConfig)

func TestLanguageConfigClone(t *testing.T) {
	a := newLanguageConfig("fake")
	a.Plugins["fake_proto"] = newLanguagePluginConfig("fake_proto")
	a.Rules["fake_proto_library"] = newLanguageRuleConfig("fake_proto_library")
	b := a.clone()

	check := allLanguageChecks(
		withLanguageEnabled(true),
	)

	check(t, a)
	check(t, b)

	b.Enabled = false
	b.Plugins["fake_proto"].Enabled = false
	b.Rules["fake_proto_library"].Enabled = false

	withLanguageEnabled(true)(t, a)
	withLanguageEnabled(false)(t, b)

	withLanguagePluginEnabled("fake_proto", true)(t, a)
	withLanguagePluginEnabled("fake_proto", false)(t, b)

	withNamedRuleEnabled("fake_proto_library", true)(t, a)
	withNamedRuleEnabled("fake_proto_library", false)(t, b)
}

func TestLanguageDirectives(t *testing.T) {
	testDirectives(t, map[string]packageConfigTestCase{
		"proto_language enabled": {
			directives: withDirectives("proto_language", "fake enabled true"),
			check:      withLanguage("fake", withLanguageEnabled(true)),
		},
		"proto_language disabled": {
			directives: withDirectives("proto_language", "fake enabled false"),
			check:      withLanguage("fake", withLanguageEnabled(false)),
		},
		"proto_language plugin": {
			directives: withDirectives(
				"proto_plugin", "fake_proto label @fake//plugin",
				"proto_language", "fake plugin fake_proto",
			),
			check: withLanguage("fake",
				withLanguageEnabled(true),
				withLanguagePluginEnabled("fake_proto", true),
			),
		},
		"proto_language -plugin": {
			directives: withDirectives(
				"proto_plugin", "fake_proto label @fake//plugin",
				"proto_language", "fake +plugin fake_proto",
				"proto_language", "fake -plugin fake_proto",
			),
			check: withLanguage("fake",
				withLanguageEnabled(true),
				withLanguagePluginEnabled("fake_proto", false),
			),
		},
		"proto_language rule": {
			directives: withDirectives(
				"proto_rule", "fake_proto_library enabled true",
				"proto_language", "fake rule fake_proto_library",
			),
			check: withLanguage("fake",
				withLanguageEnabled(true),
				withNamedRuleEnabled("fake_proto_library", true),
			),
		},
		"proto_language -rule": {
			directives: withDirectives(
				"proto_rule", "fake_proto_library enabled true",
				"proto_language", "fake +rule fake_proto_library",
				"proto_language", "fake -rule fake_proto_library",
			),
			check: withLanguage("fake",
				withLanguageEnabled(true),
				withNamedRuleEnabled("fake_proto_library", false),
			),
		},
	})
}

func allLanguageChecks(checks ...languageConfigCheck) languageConfigCheck {
	return func(t *testing.T, cfg *LanguageConfig) {
		for _, check := range checks {
			check(t, cfg)
		}
	}
}

func withLanguage(name string, checks ...languageConfigCheck) packageConfigCheck {
	return func(t *testing.T, cfg *PackageConfig) {
		lang, ok := cfg.langs[name]
		if !ok {
			t.Fatal("lang not found", name)
		}
		for _, check := range checks {
			check(t, lang)
		}
	}
}

func withLanguageEnabled(enabled bool) languageConfigCheck {
	return func(t *testing.T, cfg *LanguageConfig) {
		if cfg.Enabled != enabled {
			t.Logf("withLanguageEnabled cfg: %+v", cfg)
			t.Errorf("lang enabled: want %t, got %t", enabled, cfg.Enabled)
		}
	}
}

func withLanguagePluginEnabled(name string, enabled bool) languageConfigCheck {
	return func(t *testing.T, cfg *LanguageConfig) {
		plugin, ok := cfg.Plugins[name]
		if !ok {
			t.Fatal("plugin not found:", name)
		}
		if plugin.Enabled != enabled {
			t.Logf("failing lang config: %+v", cfg)
			t.Errorf("lang plugin enabled: want %t, got %t", enabled, plugin.Enabled)
		}
	}
}

func withNamedRuleEnabled(name string, enabled bool) languageConfigCheck {
	return func(t *testing.T, cfg *LanguageConfig) {
		rule, ok := cfg.Rules[name]
		if !ok {
			t.Fatal("rule not found:", name)
		}
		if rule.Enabled != enabled {
			t.Errorf("lang rule enabled: want %t, got %t", enabled, rule.Enabled)
		}
	}
}
