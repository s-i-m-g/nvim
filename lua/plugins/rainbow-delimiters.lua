-- colors matching brackets/braces/parens by nesting depth, using treesitter
return {
  "HiPhish/rainbow-delimiters.nvim",
  event = "BufReadPost",
  init = function()
    vim.g.rainbow_delimiters = {
      highlight = {
        "RainbowDelimiterRed",
        "RainbowDelimiterYellow",
        "RainbowDelimiterBlue",
        "RainbowDelimiterOrange",
        "RainbowDelimiterGreen",
        "RainbowDelimiterViolet",
        "RainbowDelimiterCyan",
      },
    }
  end,
}
