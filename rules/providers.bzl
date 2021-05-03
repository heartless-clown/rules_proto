ProtoPluginInfo = provider(
    "ProtoPluginInfo provides metadata about how a protoc plugin should be run",
    fields = {
        "name": "The proto plugin name",
        "label": "The proto plugin label",
        "options": "A list of options to pass to the compiler for this plugin",
        "tool": "The plugin binary executable",
        "tool_target": "The plugin tool target attr",
        "use_built_in_shell_environment": "Whether the tool should use the built in shell environment or not",
        "protoc_plugin_name": "The name used for the plugin binary on the protoc command line. Useful for targeting built-in plugins. Uses plugin name when not set",
        "exclusions": "Exclusion filters to apply when generating outputs with this plugin. Used to prevent generating files that are included in the protobuf library, for example. Can exclude either by proto name prefix or by proto folder prefix",
        "data": "Additional files required for running the plugin",
        "out": "The format for the --x_out argument.  Defaults to to {BIN_DIR}",
        "supplementary_proto_deps": "Additional proto dependencies whose descriptors/files should be included in all protoc invocations",
        "separate_options_flag": "Flag to indicate if plugin options should be sent via the --{lang}_opts flag",
        # "deps": "The list of proto dependencies for this plugin",
    },
)

ProtoCompileInfo = provider("ProtoCompileInfo provides downstream rules with the outputs of proto_compile",
    fields = {
        "label": "The proto_compile rule label",
        "outputs": "The output files from the rule",
    },
)