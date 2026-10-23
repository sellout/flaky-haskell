{
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

    lib = import ../../nix/lib.nix {inherit (nixpkgs) lib;};
  }
  // flake-utils.lib.eachSystem supportedSystems (system: let
    pkgs = nixpkgs.legacyPackages.${system}.appendOverlays [
      flaky.overlays.default
    ];

    src = pkgs.lib.cleanSource ../..;
  in {
    projectConfigurations =
      flaky.lib.projectConfigurations.nix {inherit pkgs self;};

    devShells =
      self.projectConfigurations.${system}.devShells
      // {default = flaky.lib.devShells.default system self [] "";};

    checks = self.projectConfigurations.${system}.checks;
    formatter = self.projectConfigurations.${system}.formatter;
  })
