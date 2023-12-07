{ inputs, ... }:

{
  extraPlugins = [
    inputs.plugins.packages.competitest-nvim
  ];

  extraConfigLua = ''
    require('competitest').setup { -- to customize settings
        -- put here configuration
    }
  '';
}


