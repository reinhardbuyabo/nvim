return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim", -- eslint_d, cpplint
  },
  config = function()
    local null_ls = require("null-ls")

    -- Custom Prisma formatter
    local prisma_fmt = {
      method = null_ls.methods.FORMATTING,
      filetypes = { "prisma" },
      generator = null_ls.formatter({
        command = "prisma",
        args = { "format", "--schema", "$FILENAME" },
        to_temp_file = true,
      }),
    }

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
        -- PRISMA
        prisma_fmt,
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
