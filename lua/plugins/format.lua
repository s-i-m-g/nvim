return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  opts = {
    formatters_by_ft = {
      c = { "c_formatter_42" },
    },
    formatters = {
      c_formatter_42 = {
        command = "c_formatter_42",
        stdin = true,
      },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
