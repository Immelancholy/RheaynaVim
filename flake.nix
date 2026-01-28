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
  inputs = {
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    opencode.url = "github:anomalyco/opencode";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };
  outputs = {
    self,
    nixpkgs,
    wrappers,
    rust-overlay,
    ...
  } @ inputs: let
    forAllSystems = nixpkgs.lib.genAttrs nixpkgs.lib.platforms.all;
    module = nixpkgs.lib.modules.importApply ./module.nix inputs;
    wrapper = wrappers.lib.evalModule module;
  in {
    overlays = {
      default = final: prev: {neovim = wrapper.config.wrap {pkgs = final;};};
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
      system: let
        overlays = [(import rust-overlay)];
        pkgs = import nixpkgs {inherit system overlays;};
      in {
        default = wrapper.config.wrap {inherit pkgs;};
        neovim = self.packages.${system}.default;
      }
    );
  };
}
