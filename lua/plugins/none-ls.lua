return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvimtools/none-ls-extras.nvim" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- Lua
        null_ls.builtins.formatting.stylua,

        -- JavaScript / TypeScript
        null_ls.builtins.formatting.prettier,
        -- require("none-ls-extras.diagnostics.eslint_d"),

        -- C++
        null_ls.builtins.formatting.clang_format,

        -- Python
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
      },
    })

    vim.keymap.set("n", "<leader>gf", function()
      vim.lsp.buf.format({ async = true })
    end, { desc = "Format current file" })
  end,
}
