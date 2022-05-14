"Fetch dependencies needed by users."

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

# WARNING: any changes in this function may be BREAKING CHANGES for users
# because we'll fetch a dependency which may be different from one that
# they were previously fetching later in their WORKSPACE setup, and now
# ours took precedence. Such breakages are challenging for users, so any
# changes in this function should be marked as BREAKING in the commit message
# and released only in semver majors.
def rules_rollup_dependencies():
    # The minimal version of bazel_skylib we require
    maybe(
        http_archive,
        name = "bazel_skylib",
        sha256 = "c6966ec828da198c5d9adbaa94c05e3a1c7f21bd012a0b29ba8ddbccb2c93b0d",
        urls = [
            "https://github.com/bazelbuild/bazel-skylib/releases/download/1.1.1/bazel-skylib-1.1.1.tar.gz",
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.1.1/bazel-skylib-1.1.1.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "aspect_bazel_lib",
        sha256 = "a8b47eeaf3c1bd41c4f4b633ef4c959daf83fdee343379495098b50571d4b3b8",
        strip_prefix = "bazel-lib-0.11.1",
        url = "https://github.com/aspect-build/bazel-lib/archive/refs/tags/v0.11.1.tar.gz",
    )

    maybe(
        http_archive,
        name = "aspect_rules_js",
        sha256 = "7bce67d6bfc7992f29f55405a6e750075987c9fc142fdb5d4f452a4b669c3faf",
        strip_prefix = "rules_js-0.6.2",
        url = "https://github.com/aspect-build/rules_js/archive/refs/tags/v0.6.2.tar.gz",
    )

    maybe(
        http_archive,
        name = "rules_nodejs",
        sha256 = "26766278d815a6e2c43d2f6c9c72fde3fec8729e84138ffa4dabee47edc7702a",
        urls = ["https://github.com/bazelbuild/rules_nodejs/releases/download/5.4.2/rules_nodejs-core-5.4.2.tar.gz"],
    )
