{
  colorschemes.oxocarbon = {
    enable = true;
  };

  # colorschemes.nord = {
  #   enable = true;
  #   borders = true;
  #   contrast = true;
  # };
  #
  # extraConfigLuaPost = ''
  #
  #   local nord_colors = require("nord.colors")
  #   local kind_text = nord_colors.nord6_gui
  #   local cmp_colors = {
  #       -- CmpItemAbbrDeprecated = { fg = "#7E8294", bg = "NONE", fmt = "strikethrough" },
  #       -- CmpItemAbbrMatch = { fg = "#82AAFF", bg = "NONE", fmt = "bold" },
  #       -- CmpItemAbbrMatchFuzzy = { fg = "#82AAFF", bg = "NONE", fmt = "bold" },
  #       -- CmpItemMenu = { fg = "#C792EA", bg = "NONE", fmt = "italic" },
  #
  #       CmpItemKindField = { fg = kind_text, bg = nord_colors.nord11_gui },
  #       CmpItemKindProperty = { fg = kind_text, bg = nord_colors.nord11_gui },
  #       CmpItemKindEvent = { fg = kind_text, bg = nord_colors.nord11_gui },
  #
  #       CmpItemKindText = { fg = kind_text, bg = nord_colors.nord14_gui },
  #       CmpItemKindEnum = { fg = kind_text, bg = nord_colors.nord14_gui },
  #       CmpItemKindKeyword = { fg = kind_text, bg = nord_colors.nord14_gui },
  #
  #       CmpItemKindConstant = { fg = kind_text, bg = nord_colors.nord13_gui },
  #       CmpItemKindConstructor = { fg = kind_text, bg = nord_colors.nord13_gui },
  #       CmpItemKindReference = { fg = kind_text, bg = nord_colors.nord13_gui },
  #
  #       CmpItemKindFunction = { fg = kind_text, bg = nord_colors.nord15_gui },
  #       CmpItemKindStruct = { fg = kind_text, bg = nord_colors.nord15_gui },
  #       CmpItemKindClass = { fg = kind_text, bg = nord_colors.nord15_gui },
  #       CmpItemKindModule = { fg = kind_text, bg = nord_colors.nord15_gui },
  #       CmpItemKindOperator = { fg = kind_text, bg = nord_colors.nord15_gui },
  #
  #       CmpItemKindVariable = { fg = kind_text, bg = nord_colors.nord9_gui },
  #       CmpItemKindFile = { fg = kind_text, bg = nord_colors.nord9_gui },
  #
  #       CmpItemKindUnit = { fg = kind_text, bg = nord_colors.nord13_gui },
  #       CmpItemKindSnippet = { fg = kind_text, bg = nord_colors.nord13_gui },
  #       CmpItemKindFolder = { fg = kind_text, bg = nord_colors.nord13_gui },
  #
  #       CmpItemKindMethod = { fg = kind_text, bg = nord_colors.nord10_gui },
  #       CmpItemKindValue = { fg = kind_text, bg = nord_colors.nord10_gui },
  #       CmpItemKindEnumMember = { fg = kind_text, bg = nord_colors.nord10_gui },
  #
  #       CmpItemKindInterface = { fg = kind_text, bg = nord_colors.nord7_gui },
  #       CmpItemKindColor = { fg = kind_text, bg = nord_colors.nord7_gui },
  #       CmpItemKindTypeParameter = { fg = kind_text, bg = nord_colors.nord7_gui },
  #   }
  #
  #   for name, values in pairs(cmp_colors) do
  #       -- local temp_map = vim.api.nvim_get_hl_by_name(name, true)
  #       -- for attr, value in pairs(values) do temp_map[attr] = value end
  #       -- vim.api.nvim_set_hl(0, name, temp_map)
  #       vim.api.nvim_set_hl(0, name, values)
  #       -- vim.cmd(string.format('highlight! %s guifg=%s guibg=%s', name, values.fg, values.bg))
  #       -- print(name)
  #       -- print(values)
  #   end
  #
  #
  #   local TelescopePrompt = {
  #       TelescopePromptNormal = {
  #           bg = nord_colors.nord3_gui,
  #       },
  #       TelescopePromptBorder = {
  #           bg = nord_colors.nord3_gui,
  #       },
  #       TelescopePromptTitle = {
  #           fg = nord_colors.nord0_gui,
  #           bg = nord_colors.nord9_gui,
  #       },
  #       TelescopePreviewTitle = {
  #           fg = nord_colors.nord0_gui,
  #           bg = nord_colors.nord10_gui,
  #       },
  #       TelescopeResultsTitle = {
  #           -- hide this title
  #           fg = nord_colors.nord1_gui,
  #           bg = nord_colors.nord1_gui,
  #       },
  #       TelescopeNormal = {
  #           -- fg = nord_colors.nord2_gui,
  #           bg = nord_colors.nord1_gui,
  #       },
  #       TelescopeBorder = {
  #           bg = nord_colors.nord1_gui,
  #       },
  #       TelescopeResultsBorder = {
  #           bg = nord_colors.nord1_gui,
  #       },
  #       TelescopePreviewBorder = {
  #           bg = nord_colors.nord1_gui,
  #       },
  #   }
  #   for hl, col in pairs(TelescopePrompt) do
  #       vim.api.nvim_set_hl(0, hl, col)
  #   end
  # '';
}
