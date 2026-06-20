{
  description = "Flake exporting a configured neovim package";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.wrappers.url = "github:BirdeeHub/nix-wrapper-modules";
  inputs.wrappers.inputs.nixpkgs.follows = "nixpkgs";
  # Demo on fetching plugins from outside nixpkgs
  inputs.plugins-lze = {
    url = "github:BirdeeHub/lze";
    flake = false;
  };
  # These 2 are already in nixpkgs, however this ensures you always fetch the most up to date version!
  inputs.plugins-lzextras = {
    url = "github:BirdeeHub/lzextras";
    flake = false;
  };
  inputs.plugins-atone = {
    url = "github:XXiaoA/atone.nvim";
    flake = false;
  };
  inputs.plugins-conflict-marker = {
    url = "github:tronikelis/conflict-marker.nvim";
    flake = false;
  };
  inputs.plugins-nvim-highlight-colors = {
    url = "github:brenoprata10/nvim-highlight-colors";
    flake = false;
  };
  inputs.plugins-mole = {
    url = "github:zion-off/mole.nvim";
    flake = false;
  };
  inputs.plugins-nvim-autopairs = {
    url = "github:windwp/nvim-autopairs";
    flake = false;
  };
  inputs.plugins-vim-be-good = {
    url = "github:ThePrimeagen/vim-be-good";
    flake = false;
  };
  inputs.plugins-arborist = {
    url = "github:arborist-ts/arborist.nvim";
    flake = false;
  };
  inputs.plugins-conform = {
    url = "github:auscyber/conform.nvim";
    flake = false;
  };
  inputs.plugins-quickbuf = {
    url = "github:tjgao/quickbuf.nvim";
    flake = false;
  };
  inputs = {
    git-hooks.url = "github:cachix/git-hooks.nix";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };
  outputs =
    {
      self,
      nixpkgs,
      wrappers,
      rust-overlay,
      ...
    }@inputs:
    let
      forAllSystems = nixpkgs.lib.genAttrs nixpkgs.lib.platforms.all;
      module = nixpkgs.lib.modules.importApply ./module.nix inputs;
      wrapper = wrappers.lib.evalModule module;
    in
    {
      formatter = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          config = self.checks.${system}.pre-commit-check.config;
          inherit (config) package configFile;
          script = ''
            ${pkgs.lib.getExe package} run --all-files --config ${configFile}
          '';
        in
        pkgs.writeShellScriptBin "pre-commit-run" script
      );

      checks = forAllSystems (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          pre-commit-check = inputs.git-hooks.lib.${system}.run {
            src = ./.;
            hooks = {
              nixfmt.enable = true;

              stylua = {
                enable = true;
                args = [
                  "--indent-type"
                  "Spaces"
                  "--indent-width"
                  "2"
                  "-"
                ];
              };
            };

            package = pkgs.prek;
          };
        }
      );

      overlays = {
        default = final: prev: { rheayna-vim = wrapper.config.wrap { pkgs = final; }; };
        neovim = self.overlays.default;
      };
      wrapperModules = {
        default = module;
        neovim = self.wrapperModules.default;
      };
      wrappers = {
        default = wrapper.config;
        neovim = self.wrappers.default;
      };
      packages = forAllSystems (
        system:
        let
          overlays = [ (import rust-overlay) ];
          pkgs = import nixpkgs { inherit system overlays; };
        in
        {
          default = wrapper.config.wrap { inherit pkgs; };
          neovim = self.packages.${system}.default;
        }
      );
      devShells = forAllSystems (system: {
        default =
          let
            pkgs = import nixpkgs { inherit system; };
            inherit (self.checks.${system}.pre-commit-check) shellHook enabledPackages;
          in
          pkgs.mkShell {
            inherit shellHook;
            buildInputs = enabledPackages;
            packages = [
              self.packages.${system}.neovim
            ];
          };
      });
    };
}
