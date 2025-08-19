return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim", -- eslint_d
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- LUA
        null_ls.builtins.formatting.stylua,
        -- JAVASCRIPT
        null_ls.builtins.formatting.prettier,
        -- require("none-ls.diagnostics.eslint_d"),
        -- C++
        require("none-ls.diagnostics.cpplint"),
        null_ls.builtins.formatting.clang_format,
        -- PYTHON
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
