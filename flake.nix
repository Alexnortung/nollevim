{
  description = "Alexnortung's Nixvim config";

  inputs = {
    plugins = {
      url = "github:NixNeovim/NixNeovimPlugins";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      # url = "github:Alexnortung/nixvim/intelephense";
      # url = "path:/home/alexander/source/nixvim";
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
      modules = import ./modules;
      nixpkgsConfig = {
        allowUnfree = true;
      };
    in
    {
      nixvimModule = modules;
    } // flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs {
        inherit system;
        config = nixpkgsConfig;
      };
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
