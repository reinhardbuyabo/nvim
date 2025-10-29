return {
  "sainnhe/gruvbox-material",
  name = "gruvbox-material",
  priority = 1000,
  config = function()
    -- Set recommended background (soft, medium, or hard)
    vim.g.gruvbox_material_background = "medium"

    -- Optional: Enable better contrast or performance
    vim.g.gruvbox_material_foreground = "material"
    vim.g.gruvbox_material_enable_bold = 1
    vim.g.gruvbox_material_enable_italic = 1
    vim.g.gruvbox_material_diagnostic_text_highlight = 1
    vim.g.gruvbox_material_diagnostic_line_highlight = 1
    vim.g.gruvbox_material_diagnostic_virtual_text = "colored"

    -- Load the colorscheme
    vim.cmd.colorscheme "gruvbox-material"
  end,
}
