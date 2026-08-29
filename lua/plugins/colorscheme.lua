return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "night",
    transparent = true, -- see-through background
  },
  config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd.colorscheme("tokyonight")

    -- brighter, more readable line numbers (fg only — keeps gutter transparent)
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#73daca" })
    vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#73daca" })
    vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#73daca" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#27a1b9", bold = true })

    -- Tree-sitter's C grammar doesn't categorize plain identifiers (most
    -- variable/parameter/field references render as default fg), so most of
    -- the distinction between "kinds of things" comes from clangd's LSP
    -- semantic tokens instead. Give those categories their own colors.
    vim.api.nvim_set_hl(0, "@lsp.type.parameter", { fg = "#ff9e64" }) -- function parameters
    vim.api.nvim_set_hl(0, "@lsp.type.variable", { fg = "#7dcfff" }) -- local variables
    vim.api.nvim_set_hl(0, "@lsp.type.property", { fg = "#7aa2f7" }) -- struct fields
    vim.api.nvim_set_hl(0, "@lsp.type.enumMember", { fg = "#e0af68" })
    vim.api.nvim_set_hl(0, "@lsp.type.macro", { fg = "#bb9af7", italic = true })
  end,
}
