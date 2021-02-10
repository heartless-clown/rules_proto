---
layout: default
title: closure_proto_library
permalink: closure/closure_proto_library
parent: closure
---

# closure_proto_library

Generates protocol buffer sources for the [closure](/closure) language.

## `WORKSPACE`

```python
load("@build_stack_rules_proto//toolchains:protoc.bzl", "protoc_toolchain")

protoc_toolchain()

load("@build_stack_rules_proto//rules:closure_proto_library_deps.bzl", "closure_proto_library_deps")

closure_proto_library_deps()

load("@io_bazel_rules_closure//closure:repositories.bzl", "rules_closure_dependencies", "rules_closure_toolchains")

rules_closure_dependencies(
    omit_bazel_skylib = True,
    omit_com_google_protobuf = True,
    omit_zlib = True,
)

rules_closure_toolchains()
```

## `BUILD.bazel`

```python
load("@rules_proto//proto:defs.bzl", "proto_library")
load("@build_stack_rules_proto//rules:closure_proto_library.bzl", "closure_proto_library")

proto_library(
    name = "foo_proto",
    srcs = ["foo.proto"],
)

closure_proto_library(
    name = "closure_proto_library_foo_proto",
    deps = [":foo_proto"],
)
```

## Plugins

| Label | Tool | Outputs |
| ---- | ---- | ------- |
| `//plugins/closure/proto:proto` |  |  `{protopath}.js` |

## Dependencies

```python
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_file")

def _maybe(repo_rule, name, **kwargs):
    if name not in native.existing_rules():
        repo_rule(name = name, **kwargs)

def closure_proto_library_deps():
    bazel_skylib()
    rules_python()
    zlib()
    com_google_protobuf()
    io_bazel_rules_closure()

def bazel_skylib():
    _maybe(
        http_archive,
        name = "bazel_skylib",
        sha256 = "ebdf850bfef28d923a2cc67ddca86355a449b5e4f38b0a70e584dc24e5984aa6",
        strip_prefix = "bazel-skylib-f80bc733d4b9f83d427ce3442be2e07427b2cc8d",
        urls = [
            "https://github.com/bazelbuild/bazel-skylib/archive/f80bc733d4b9f83d427ce3442be2e07427b2cc8d.tar.gz",
        ],
    )

def rules_python():
    _maybe(
        http_archive,
        name = "rules_python",
        sha256 = "8cc0ad31c8fc699a49ad31628273529ef8929ded0a0859a3d841ce711a9a90d5",
        strip_prefix = "rules_python-c7e068d38e2fec1d899e1c150e372f205c220e27",
        urls = [
            "https://github.com/bazelbuild/rules_python/archive/c7e068d38e2fec1d899e1c150e372f205c220e27.tar.gz",
        ],
    )

def zlib():
    _maybe(
        http_archive,
        name = "zlib",
        sha256 = "c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1",
        strip_prefix = "zlib-1.2.11",
        urls = [
            "https://mirror.bazel.build/zlib.net/zlib-1.2.11.tar.gz",
            "https://zlib.net/zlib-1.2.11.tar.gz",
        ],
        build_file = "@build_stack_rules_proto//third_party:BUILD.bazel.zlib",
    )

def com_google_protobuf():
    _maybe(
        http_archive,
        name = "com_google_protobuf",
        sha256 = "d0f5f605d0d656007ce6c8b5a82df3037e1d8fe8b121ed42e536f569dec16113",
        strip_prefix = "protobuf-3.14.0",
        urls = [
            "https://github.com/protocolbuffers/protobuf/archive/v3.14.0.tar.gz",
        ],
    )

def io_bazel_rules_closure():
    _maybe(
        http_archive,
        name = "io_bazel_rules_closure",
        sha256 = "4c98a6b8d2d81210f3e291b1c7c5034ab2e22e7870ab3e9603599c79833f7da3",
        strip_prefix = "rules_closure-4c99be33856ce1b7b80f55a0e9a8345f559b6ef3",
        urls = [
            "https://github.com/bazelbuild/rules_closure/archive/4c99be33856ce1b7b80f55a0e9a8345f559b6ef3.tar.gz",
        ],
    )

```