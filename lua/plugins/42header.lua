local patterns = { "*.c", "*.h", "*.cpp", "*.hpp", "Makefile" }

return {
  "Diogo-ss/42-header.nvim",
  cmd = { "Stdheader" },
  keys = { "<F1>" },
  event = vim.tbl_map(function(p)
    return "BufWritePre " .. p
  end, patterns),
  opts = {
    default_map = true,
    -- Header insertion is handled by our own BufWritePre autocmd below (so
    -- new files get a header too, not just existing ones), so the plugin's
    -- built-in update-only autocmd would just be redundant.
    auto_update = false,
    user = "sganase",
    mail = "simon.ganase@learner.42.tech",
  },
  config = function(_, opts)
    -- vim.g.user/vim.g.mail take priority over $USER/$MAIL and opts,
    -- so set them explicitly or the header falls back to the OS username.
    vim.g.user = opts.user
    vim.g.mail = opts.mail
    require("42header").setup(opts)

    -- Insert (or update) the header as part of the save/autoformat pipeline,
    -- so it's always present without needing to hit <F1> manually.
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("42header_autoformat", { clear = true }),
      pattern = patterns,
      callback = function()
        require("42header.utils.header").stdheader()
      end,
    })
  end,
}
