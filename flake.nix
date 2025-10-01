{
  description = "Building Haskell libraries across many GHC versions";

  nixConfig = {
    ## TODO: This is needed because of the `exe` hack to turn some derivations
    ##       into fixed-outputs. Will need to change that upstream.
    allow-import-from-derivation = true;
    ## https://github.com/NixOS/rfcs/blob/master/rfcs/0045-deprecate-url-syntax.md
    extra-experimental-features = ["no-url-literals"];
    extra-substituters = ["https://cache.garnix.io"];
    extra-trusted-public-keys = [
      "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
    ];
    ## Isolate the build.
    registries = false;
    sandbox = "relaxed";
  };

  outputs = {
    flake-utils,
    flaky,
    nixpkgs,
    self,
    systems,
  }: let
    pname = "flaky-haskell";

    supportedSystems = import systems;
  in
    {
      schemas = {
        inherit
          (flaky.schemas)
          projectConfigurations
          devShells
          checks
          formatter
          ;
      };

      lib = import ./nix/lib.nix {inherit (nixpkgs) lib;};
    }
    // flake-utils.lib.eachSystem supportedSystems (system: let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [flaky.overlays.default];
      };

      src = pkgs.lib.cleanSource ./.;
    in {
      projectConfigurations =
        flaky.lib.projectConfigurations.nix {inherit pkgs self;};

      devShells =
        self.projectConfigurations.${system}.devShells
        // {default = flaky.lib.devShells.default system self [] "";};

      checks = self.projectConfigurations.${system}.checks;
      formatter = self.projectConfigurations.${system}.formatter;
    });

  inputs = {
    ## Flaky should generally be the source of truth for its inputs.
    flaky.url = "github:sellout/flaky";

    flake-utils.follows = "flaky/flake-utils";
    nixpkgs.follows = "flaky/nixpkgs";
    systems.follows = "flaky/systems";
  };
}
