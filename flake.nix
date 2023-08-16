{
  description = "Alexnortung's Nixvim config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixvim = {
      url = "github:nix-community/nixvim";
      # url = "github:Alexnortung/nixvim/vuels";
      # url = "path:/home/alexander/source/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
    vim-extra-plugins.url = "github:m15a/nixpkgs-vim-extra-plugins";
  };

  outputs = {
    nixpkgs,
    nixvim,
    flake-utils,
    ...
  } @ inputs: let
    config = import ./config; # import the module directly
  in
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};
      nixvim' = nixvim.legacyPackages.${system};
      nvim = nixvim'.makeNixvimWithModule {
        inherit pkgs;
        module = config;
      };
    in {
      checks = {
        # Run `nix flake check .` to verify that your config is not broken
        # default = nixvimLib.${system}.check.mkTestDerivation "Nollevim" config;
        # default = nixvimLib.${system}.check.mkTestDerivationFromNvim {
        #   inherit nvim;
        #   name = "Nollevim";
        #   dontRun = false;
        # };
      };

      packages = {
        # Lets you run `nix run .` to start nixvim
        default = nvim;
      };
    });
}
