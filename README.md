# Flaky Haskell

[![built with garnix](https://img.shields.io/endpoint?url=https%3A%2F%2Fgarnix.io%2Fapi%2Fbadges%2Fsellout%2Fflaky-haskell)](https://garnix.io/repo/sellout/flaky-haskell)

Building Haskell libraries across many GHC versions

## development environment

We recommend the following steps to make working in this repository as easy as possible.

### `nix run github:sellout/project-manager -- switch`

This is sort-of a catch-all for keeping your environment up-to-date. It regenerates files, wires up the project’s Git configuration, ensures the shells have the right packages configured the right way, enables checks & formatters, etc.

If you already have it installed on your system or once you’ve run `direnv allow`, you can instead use `project-manager switch`.

### `direnv allow`

This command ensures that any work you do within this repository happens within a consistent reproducible environment. That environment provides various debugging tools, etc. When you leave this directory, you will leave that environment behind, so it doesn’t impact anything else on your system.

## building & development

`nix build` will build the various packages that are part of this project.

`nix develop` will put you into an environment where the traditional build tooling works. If you also have `direnv` installed, then you should automatically be in that environment when you're in a directory in this project.

`nix flake check` will do a comprehensive check of the state of the repository (package-specific tests are usually run as part of `nix build`, but this covers formatting, consistency, and larger integration testing).

## versioning

In the absolute, almost every change is a breaking change. This section describes how we mitigate that to offer minor updates and revisions.

## comparisons

Other projects similar to this one, and how they differ.

### [haskell.nix](https://input-output-hk.github.io/haskell.nix/)

I unfortunately don’t know much about it. Hopefully someone will convince me that it’s just better than this in every way, and I can abandon this project.
