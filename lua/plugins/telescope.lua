return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope",
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files", silent = true },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep", silent = true },
    { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps", silent = true },
    { "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Commands", silent = true },
    { "<leader>fd", "<cmd>Telescope lsp_definitions<cr>", desc = "Definitions", silent = true },
    { "<leader>fr", "<cmd>Telescope lsp_references<cr>", desc = "References", silent = true },
  },
}
