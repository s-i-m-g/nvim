return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({ "c", "lua", "vimdoc", "cmake" })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "c", "lua", "vim", "cmake" },
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
