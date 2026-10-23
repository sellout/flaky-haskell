# Flaky Haskell

[![Nix CI](https://nix-ci.com/badge/gh:sellout:flaky-haskell)](https://nix-ci.com/gh:sellout:flaky-haskell)
[![Project Manager](https://img.shields.io/badge/%20-Project%20Manager-%235277C3?logo=nixos&labelColor=%23cccccc)](https://sellout.github.io/project-manager/)

Building Haskell libraries across many GHC versions

## usage

## contributing

- [contributor guide](https://sellout.github.io/flaky/CONTRIBUTING)

## comparisons

Other projects similar to this one, and how they differ.

### [haskell.nix](https://input-output-hk.github.io/haskell.nix/)

This is an entirely different approach to Haskell Nix infrastructure. In my opinion, it’s extremely overcomplicated and fragile.

Flaky Haskell implements a small fraction of this – basically just extracting Nix from cabal.project. Which, if haskell.nix was more modular, I might be able to just depend on instead.
