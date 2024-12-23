{
  description = "Alexnortung's Nixvim config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    plugins = {
      url = "github:NixNeovim/NixNeovimPlugins";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    Neve = {
      # url = "github:redyf/Neve";
      url = "github:Alexnortung/Neve/enable-keymaps";
      inputs.nixvim.follows = "nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      # url = "github:Alexnortung/nixvim/intelephense";
      # url = "path:/home/alexander/source/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { nixpkgs
    , nixvim
    , flake-utils
    , ...
    } @ inputs:
    let
      config = import ./config; # import the module directly
    in
    flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
      nixvim' = nixvim.legacyPackages.${system};
      nvim = nixvim'.makeNixvimWithModule {
        inherit pkgs;
        module = config;
        extraSpecialArgs = {
          inherit inputs;
        };
      };
    in
    {
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
