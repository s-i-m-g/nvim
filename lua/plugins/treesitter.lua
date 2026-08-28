return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({ "c", "lua", "vimdoc" })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "c", "lua", "vim" },
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
