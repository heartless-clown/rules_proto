load("@io_bazel_rules_dotnet//dotnet:defs.bzl", "nuget_package")

def nuget_protobuf_packages():
    ### Generated by the tool
    nuget_package(
        name = "google.protobuf",
        package = "google.protobuf",
        version = "3.6.1",
        core_lib = {
            "netstandard1.0": "lib/netstandard1.0/Google.Protobuf.dll",
        },
        net_lib = {
            "net45": "lib/net45/Google.Protobuf.dll",
        },
        mono_lib = "lib/net45/Google.Protobuf.dll",
        core_deps = {
            "netstandard1.0": [
                "@io_bazel_rules_dotnet//dotnet/stdlib.core:netstandard.library.dll",
            ],
        },
        net_deps = {},
        mono_deps = [],
        core_files = {
            "netstandard1.0": [
                "lib/netstandard1.0/Google.Protobuf.dll",
                "lib/netstandard1.0/Google.Protobuf.xml",
            ],
        },
        net_files = {
            "net45": [
                "lib/net45/Google.Protobuf.dll",
                "lib/net45/Google.Protobuf.xml",
            ],
        },
        mono_files = [
            "lib/net45/Google.Protobuf.dll",
            "lib/net45/Google.Protobuf.xml",
        ],
    )
    ### End of generated by the tool

def nuget_grpc_packages():
    ### Generated by the tool
    nuget_package(
        name = "system.interactive.async",
        package = "system.interactive.async",
        version = "3.2.0",
        core_lib = {
            "netstandard2.0": "lib/netstandard2.0/System.Interactive.Async.dll",
        },
        net_lib = {
            "net46": "lib/net46/System.Interactive.Async.dll",
        },
        mono_lib = "lib/net46/System.Interactive.Async.dll",
        core_deps = {},
        net_deps = {},
        mono_deps = [],
        core_files = {
            "netstandard2.0": [
                "lib/netstandard2.0/System.Interactive.Async.dll",
                "lib/netstandard2.0/System.Interactive.Async.xml",
            ],
        },
        net_files = {
            "net46": [
                "lib/net46/System.Interactive.Async.dll",
                "lib/net46/System.Interactive.Async.xml",
            ],
        },
        mono_files = [
            "lib/net46/System.Interactive.Async.dll",
            "lib/net46/System.Interactive.Async.xml",
        ],
    )
    nuget_package(
        name = "grpc.core",
        package = "grpc.core",
        version = "1.17.1",
        core_lib = {
            "netstandard1.5": "lib/netstandard1.5/Grpc.Core.dll",
        },
        net_lib = {
            "net45": "lib/net45/Grpc.Core.dll",
        },
        mono_lib = "lib/net45/Grpc.Core.dll",
        core_deps = {
            "netstandard1.5": [
                "@io_bazel_rules_dotnet//dotnet/stdlib.core:netstandard.library.dll",
                "@system.interactive.async//:netstandard2.0_core",
                "@io_bazel_rules_dotnet//dotnet/stdlib.core:system.runtime.loader.dll",
                "@io_bazel_rules_dotnet//dotnet/stdlib.core:system.threading.thread.dll",
                "@io_bazel_rules_dotnet//dotnet/stdlib.core:system.threading.threadpool.dll",
            ],
        },
        net_deps = {
            "net45": [
                "@system.interactive.async//:net",
            ],
        },
        mono_deps = [
            "@system.interactive.async//:mono",
        ],
        core_files = {
            "netstandard1.5": [
                "lib/netstandard1.5/Grpc.Core.dll",
                "lib/netstandard1.5/Grpc.Core.pdb",
                "lib/netstandard1.5/Grpc.Core.xml",
                # NOTE: these were manually added
                "runtimes/win/native/grpc_csharp_ext.x86.dll",
                "runtimes/win/native/grpc_csharp_ext.x64.dll",
                "runtimes/linux/native/libgrpc_csharp_ext.x86.so",
                "runtimes/linux/native/libgrpc_csharp_ext.x64.so",
                "runtimes/osx/native/libgrpc_csharp_ext.x86.dylib",
                "runtimes/osx/native/libgrpc_csharp_ext.x64.dylib",
            ],
        },
        net_files = {
            "net45": [
                "lib/net45/Grpc.Core.dll",
                "lib/net45/Grpc.Core.pdb",
                "lib/net45/Grpc.Core.xml",
            ],
        },
        mono_files = [
            "lib/net45/Grpc.Core.dll",
            "lib/net45/Grpc.Core.pdb",
            "lib/net45/Grpc.Core.xml",
        ],
    )
    nuget_package(
        name = "grpc",
        package = "grpc",
        version = "1.17.1",
        core_deps = {
            "netstandard1.5": [
                "@grpc.core//:netstandard1.5_core",
            ],
        },
        net_deps = {
            "net45": [
                "@grpc.core//:net",
            ],
        },
        mono_deps = [
            "@grpc.core//:mono",
        ],
    )
    ### End of generated by the tool