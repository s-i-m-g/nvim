return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    -- nvim-lint has no built-in norminette adapter, so it's defined here.
    -- `-f json` gives stable, parseable output; the buffer's filename is
    -- appended automatically by nvim-lint since stdin is not used (norminette
    -- doesn't read source from stdin).
    lint.linters.norminette = {
      cmd = "norminette",
      stdin = false,
      args = { "-f", "json", "--no-colors" },
      ignore_exitcode = true,
      parser = function(output)
        -- Some norminette versions print an extra "Setting locale to ..."
        -- line to stdout before the JSON payload, so decode from the
        -- first "{" instead of assuming the whole output is JSON.
        local json_start = output:find("{")
        if not json_start then
          return {}
        end
        local ok, decoded = pcall(vim.json.decode, output:sub(json_start))
        if not ok or not decoded or not decoded.files then
          return {}
        end

        local diagnostics = {}
        for _, file in ipairs(decoded.files) do
          for _, err in ipairs(file.errors or {}) do
            local hl = (err.highlights and err.highlights[1]) or {}
            local lnum = math.max((hl.lineno or 1) - 1, 0)
            local col = math.max((hl.column or 1) - 1, 0)
            table.insert(diagnostics, {
              lnum = lnum,
              col = col,
              severity = (err.level == "Warning") and vim.diagnostic.severity.WARN
                or vim.diagnostic.severity.ERROR,
              message = err.text,
              source = "norminette",
              code = err.name,
            })
          end
        end
        return diagnostics
      end,
    }

    lint.linters_by_ft = {
      c = { "norminette" },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
