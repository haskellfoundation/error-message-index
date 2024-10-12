{
  nixConfig.allow-import-from-derivation = true;
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    parts.url = "github:hercules-ci/flake-parts";
    haskell-flake.url = "github:srid/haskell-flake";
    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
    devshell.url = "github:numtide/devshell";
    devshell.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = inputs:
    inputs.parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];
      imports = [
        inputs.devshell.flakeModule
        inputs.haskell-flake.flakeModule
        inputs.pre-commit-hooks.flakeModule
      ];

      perSystem = {
        config,
        # pkgs,
        # lib,
        ...
      }: {
        devshells.default = {
          devshell = {
            packagesFrom = [config.devShells.ghc96];
            packages = [];
            startup = {
              pre-commit.text = config.pre-commit.installationScript;
            };
          };
        };
        pre-commit = {
          check.enable = true;
          settings.hooks = {
            cabal-fmt.enable = true;
            hlint.enable = true;

            alejandra.enable = true;
            statix.enable = true;
            deadnix.enable = true;
          };
        };
        haskellProjects.ghc96 = {
          # packages = {};
          # settings = {};
          projectRoot = ./message-index;
          # devShell.mkShellArgs = {
          #   packages = [
          #     # pkgs.zlib.dev
          #     # pkgs.haskellPackages.zlib
          #     # pkgs.haskellPackages.zlib_0_7_1_0.dev
          #   ];
          #   # shellHook = config.pre-commit.installationScript;
          # };
        };
      };
    };
}
