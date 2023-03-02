Bazel rules for [Fluent Types](https://github.com/benricheson101/fluent-types)

### Usage:

Add this to your `WORKSPACE.bazel`
```starlark
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
  name = "rules_fluent_types",
  url = "https://github.com/Benricheson101/rules_fluent_types/archive/e213570f13aa964917b8accae275dbe9ba949621.tar.gz",
  sha256 = "00352a791405068c29223a9b7827db5024359c3a2ded511f55d7341c35bfddf3",
  strip_prefix = "rules_fluent_types-e213570f13aa964917b8accae275dbe9ba949621",
)

load("@rules_fluent_types//:deps.bzl", "register_fluent_types_toolchain")
register_fluent_types_toolchain()
```
