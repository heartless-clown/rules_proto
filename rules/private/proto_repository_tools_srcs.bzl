""" Code generated by list_repository_tools_srcs.go; DO NOT EDIT."""
PROTO_REPOSITORY_TOOLS_SRCS = [
    "@build_stack_rules_proto//:BUILD.bazel",
    "@build_stack_rules_proto//cmd/gazelle:BUILD.bazel",
    "@build_stack_rules_proto//cmd/gazelle:diff.go",
    "@build_stack_rules_proto//cmd/gazelle:fix-update.go",
    "@build_stack_rules_proto//cmd/gazelle:fix.go",
    "@build_stack_rules_proto//cmd/gazelle:gazelle.go",
    "@build_stack_rules_proto//cmd/gazelle:langs.go",
    "@build_stack_rules_proto//cmd/gazelle:metaresolver.go",
    "@build_stack_rules_proto//cmd/gazelle:print.go",
    "@build_stack_rules_proto//cmd/gazelle:update-repos.go",
    "@build_stack_rules_proto//cmd/gazelle:wspace.go",
    "@build_stack_rules_proto//deps:BUILD.bazel",
    "@build_stack_rules_proto//language/protobuf:BUILD.bazel",
    "@build_stack_rules_proto//language/protobuf:protobuf.go",
    "@build_stack_rules_proto//pkg/language/protobuf:BUILD.bazel",
    "@build_stack_rules_proto//pkg/language/protobuf:config.go",
    "@build_stack_rules_proto//pkg/language/protobuf:fix.go",
    "@build_stack_rules_proto//pkg/language/protobuf:generate.go",
    "@build_stack_rules_proto//pkg/language/protobuf:kinds.go",
    "@build_stack_rules_proto//pkg/language/protobuf:lang.go",
    "@build_stack_rules_proto//pkg/language/protobuf:override.go",
    "@build_stack_rules_proto//pkg/language/protobuf:resolve.go",
    "@build_stack_rules_proto//pkg/plugin/akka/akka_grpc:BUILD.bazel",
    "@build_stack_rules_proto//pkg/plugin/akka/akka_grpc:protoc_gen_akka_grpc.go",
    "@build_stack_rules_proto//pkg/plugin/builtin:BUILD.bazel",
    "@build_stack_rules_proto//pkg/plugin/builtin:cpp_plugin.go",
    "@build_stack_rules_proto//pkg/plugin/builtin:csharp_plugin.go",
    "@build_stack_rules_proto//pkg/plugin/builtin:doc.go",
    "@build_stack_rules_proto//pkg/plugin/builtin:grpc_grpc_cpp.go",
    "@build_stack_rules_proto//pkg/plugin/builtin:java_plugin.go",
    "@build_stack_rules_proto//pkg/plugin/builtin:js_closure_plugin.go",
    "@build_stack_rules_proto//pkg/plugin/builtin:js_common_plugin.go",
    "@build_stack_rules_proto//pkg/plugin/builtin:objc_plugin.go",
    "@build_stack_rules_proto//pkg/plugin/builtin:php_plugin.go",
    "@build_stack_rules_proto//pkg/plugin/builtin:python_plugin.go",
    "@build_stack_rules_proto//pkg/plugin/builtin:ruby_plugin.go",
    "@build_stack_rules_proto//pkg/plugin/gogo/protobuf:BUILD.bazel",
    "@build_stack_rules_proto//pkg/plugin/gogo/protobuf:protoc-gen-gogo.go",
    "@build_stack_rules_proto//pkg/plugin/golang/protobuf:BUILD.bazel",
    "@build_stack_rules_proto//pkg/plugin/golang/protobuf:protoc-gen-go.go",
    "@build_stack_rules_proto//pkg/plugin/grpc/grpc:BUILD.bazel",
    "@build_stack_rules_proto//pkg/plugin/grpc/grpc:protoc-gen-grpc-python.go",
    "@build_stack_rules_proto//pkg/plugin/grpc/grpcgo:BUILD.bazel",
    "@build_stack_rules_proto//pkg/plugin/grpc/grpcgo:protoc-gen-go-grpc.go",
    "@build_stack_rules_proto//pkg/plugin/grpc/grpcjava:BUILD.bazel",
    "@build_stack_rules_proto//pkg/plugin/grpc/grpcjava:protoc-gen-grpc-java.go",
    "@build_stack_rules_proto//pkg/plugin/grpc/grpcnode:BUILD.bazel",
    "@build_stack_rules_proto//pkg/plugin/grpc/grpcnode:protoc-gen-grpc-node.go",
    "@build_stack_rules_proto//pkg/plugin/grpcecosystem/grpcgateway:BUILD.bazel",
    "@build_stack_rules_proto//pkg/plugin/grpcecosystem/grpcgateway:protoc-gen-grpc-gateway.go",
    "@build_stack_rules_proto//pkg/plugin/scalapb/scalapb:BUILD.bazel",
    "@build_stack_rules_proto//pkg/plugin/scalapb/scalapb:protoc_gen_scala.go",
    "@build_stack_rules_proto//pkg/plugin/stackb/grpc_js:BUILD.bazel",
    "@build_stack_rules_proto//pkg/plugin/stackb/grpc_js:protoc-gen-grpc-js.go",
    "@build_stack_rules_proto//pkg/plugin/stephenh/ts-proto:BUILD.bazel",
    "@build_stack_rules_proto//pkg/plugin/stephenh/ts-proto:protoc-gen-ts-proto.go",
    "@build_stack_rules_proto//pkg/plugintest:BUILD.bazel",
    "@build_stack_rules_proto//pkg/plugintest:case.go",
    "@build_stack_rules_proto//pkg/plugintest:doc.go",
    "@build_stack_rules_proto//pkg/plugintest:utils.go",
    "@build_stack_rules_proto//pkg/protoc:BUILD.bazel",
    "@build_stack_rules_proto//pkg/protoc:depsresolver.go",
    "@build_stack_rules_proto//pkg/protoc:file.go",
    "@build_stack_rules_proto//pkg/protoc:intent.go",
    "@build_stack_rules_proto//pkg/protoc:language_config.go",
    "@build_stack_rules_proto//pkg/protoc:language_plugin_config.go",
    "@build_stack_rules_proto//pkg/protoc:language_rule.go",
    "@build_stack_rules_proto//pkg/protoc:language_rule_config.go",
    "@build_stack_rules_proto//pkg/protoc:other_proto_library.go",
    "@build_stack_rules_proto//pkg/protoc:package.go",
    "@build_stack_rules_proto//pkg/protoc:package_config.go",
    "@build_stack_rules_proto//pkg/protoc:plugin.go",
    "@build_stack_rules_proto//pkg/protoc:plugin_configuration.go",
    "@build_stack_rules_proto//pkg/protoc:plugin_context.go",
    "@build_stack_rules_proto//pkg/protoc:plugin_registry.go",
    "@build_stack_rules_proto//pkg/protoc:proto_compile.go",
    "@build_stack_rules_proto//pkg/protoc:proto_compiled_sources.go",
    "@build_stack_rules_proto//pkg/protoc:proto_descriptor_set.go",
    "@build_stack_rules_proto//pkg/protoc:proto_enum_option_collector.go",
    "@build_stack_rules_proto//pkg/protoc:proto_library.go",
    "@build_stack_rules_proto//pkg/protoc:protoc_configuration.go",
    "@build_stack_rules_proto//pkg/protoc:registry.go",
    "@build_stack_rules_proto//pkg/protoc:resolver.go",
    "@build_stack_rules_proto//pkg/protoc:rewrite.go",
    "@build_stack_rules_proto//pkg/protoc:rule_provider.go",
    "@build_stack_rules_proto//pkg/protoc:rule_registry.go",
    "@build_stack_rules_proto//pkg/protoc:ruleindex.go",
    "@build_stack_rules_proto//pkg/protoc:syntaxutil.go",
    "@build_stack_rules_proto//pkg/protoc:yconfig.go",
    "@build_stack_rules_proto//pkg/rule/rules_cc:BUILD.bazel",
    "@build_stack_rules_proto//pkg/rule/rules_cc:cc_library.go",
    "@build_stack_rules_proto//pkg/rule/rules_cc:grpc_cc_library.go",
    "@build_stack_rules_proto//pkg/rule/rules_cc:proto_cc_library.go",
    "@build_stack_rules_proto//pkg/rule/rules_closure:BUILD.bazel",
    "@build_stack_rules_proto//pkg/rule/rules_closure:closure_js_library.go",
    "@build_stack_rules_proto//pkg/rule/rules_closure:grpc_closure_js_library.go",
    "@build_stack_rules_proto//pkg/rule/rules_closure:proto_closure_js_library.go",
    "@build_stack_rules_proto//pkg/rule/rules_go:BUILD.bazel",
    "@build_stack_rules_proto//pkg/rule/rules_go:go_library.go",
    "@build_stack_rules_proto//pkg/rule/rules_java:BUILD.bazel",
    "@build_stack_rules_proto//pkg/rule/rules_java:grpc_java_library.go",
    "@build_stack_rules_proto//pkg/rule/rules_java:java_library.go",
    "@build_stack_rules_proto//pkg/rule/rules_java:proto_java_library.go",
    "@build_stack_rules_proto//pkg/rule/rules_nodejs:BUILD.bazel",
    "@build_stack_rules_proto//pkg/rule/rules_nodejs:grpc_nodejs_library.go",
    "@build_stack_rules_proto//pkg/rule/rules_nodejs:js_library.go",
    "@build_stack_rules_proto//pkg/rule/rules_nodejs:proto_nodejs_library.go",
    "@build_stack_rules_proto//pkg/rule/rules_nodejs:proto_ts_library.go",
    "@build_stack_rules_proto//pkg/rule/rules_python:BUILD.bazel",
    "@build_stack_rules_proto//pkg/rule/rules_python:grpc_py_library.go",
    "@build_stack_rules_proto//pkg/rule/rules_python:proto_py_library.go",
    "@build_stack_rules_proto//pkg/rule/rules_python:py_library.go",
    "@build_stack_rules_proto//pkg/rule/rules_scala:BUILD.bazel",
    "@build_stack_rules_proto//pkg/rule/rules_scala:scala_library.go",
    "@build_stack_rules_proto//pkg/rule/rules_scala:scala_proto_library.go",
    "@build_stack_rules_proto//plugin:BUILD.bazel",
    "@build_stack_rules_proto//plugin/akka/akka-grpc:BUILD.bazel",
    "@build_stack_rules_proto//plugin/builtin:BUILD.bazel",
    "@build_stack_rules_proto//plugin/gogo/protobuf:BUILD.bazel",
    "@build_stack_rules_proto//plugin/golang/protobuf:BUILD.bazel",
    "@build_stack_rules_proto//plugin/grpc/grpc:BUILD.bazel",
    "@build_stack_rules_proto//plugin/grpc/grpc-go:BUILD.bazel",
    "@build_stack_rules_proto//plugin/grpc/grpc-java:BUILD.bazel",
    "@build_stack_rules_proto//plugin/grpc/grpc-node:BUILD.bazel",
    "@build_stack_rules_proto//plugin/scalapb/scalapb:BUILD.bazel",
    "@build_stack_rules_proto//plugin/stackb/grpc_js:BUILD.bazel",
    "@build_stack_rules_proto//plugin/stephenh/ts-proto:BUILD.bazel",
    "@build_stack_rules_proto//rules:BUILD.bazel",
    "@build_stack_rules_proto//rules/cc:BUILD.bazel",
    "@build_stack_rules_proto//rules/closure:BUILD.bazel",
    "@build_stack_rules_proto//rules/go:BUILD.bazel",
    "@build_stack_rules_proto//rules/java:BUILD.bazel",
    "@build_stack_rules_proto//rules/nodejs:BUILD.bazel",
    "@build_stack_rules_proto//rules/private:BUILD.bazel",
    "@build_stack_rules_proto//rules/private:list_repository_tools_srcs.go",
    "@build_stack_rules_proto//rules/proto:BUILD.bazel",
    "@build_stack_rules_proto//rules/py:BUILD.bazel",
    "@build_stack_rules_proto//rules/scala:BUILD.bazel",
    "@build_stack_rules_proto//toolchain:BUILD.bazel",
]
