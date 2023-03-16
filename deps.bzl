load("@rules_fluent_types//internal:repo.bzl",
  _fluent_types_download = "fluent_types_download",
)

fluent_types_download = _fluent_types_download

def register_fluent_types_toolchain():
  releases = [
    {
      "urls": [
        "https://github.com/Benricheson101/fluent-types/releases/download/v1.0.13/fluent-types-x86_64-unknown-linux-gnu.tar.gz"
      ],
      "sha256": "842d48dfc3688afdf48e82fb8042604fbbe6e26d2fdbabbc1252ea02fa29f40c",
      "os": "linux",
      "arch": "x86_64"
    },
    {
      "urls": [
        "https://github.com/Benricheson101/fluent-types/releases/download/v1.0.13/fluent-types-aarch64-unknown-linux-gnu.tar.gz"
      ],
      "sha256": "ff682a1874e2deb603d906a88a963fb0af7a172ea52f9477fd2186b6cc80d63a",
      "os": "linux",
      "arch": "arm64"
    },
    {
      "urls": [
        "https://github.com/Benricheson101/fluent-types/releases/download/v1.0.13/fluent-types-x86_64-apple-darwin.tar.gz"
      ],
      "sha256": "69892c7cd200a0712bb5f170938bf3fba5c1edf76a56e1ca19959d96dd711254",
      "os": "macos",
      "arch": "x86_64"
    },
    {
      "urls": [
        "https://github.com/Benricheson101/fluent-types/releases/download/v1.0.13/fluent-types-aarch64-apple-darwin.tar.gz"
      ],
      "sha256": "afb0d3f5ae84df563ddd03ae9c9a44dfd643b073132fd84f2621dba768fbb469",
      "os": "macos",
      "arch": "arm64"
    }
  ]


  for r in releases:
    name = "fluent_types_{}_{}".format(r["os"], r["arch"])

    fluent_types_download(
      name = name,
      urls = r["urls"],
      sha256 = r["sha256"],
      os = r["os"],
      arch = r["arch"],
    )

    native.register_toolchains("@{}//:toolchain".format(name))
