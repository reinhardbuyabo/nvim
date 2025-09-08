return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      panel = {
        enabled = true,
        auto_refresh = true,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<CR>",
          refresh = "gr",
          open = "<M-CR>",
        },
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,  -- show suggestions as you type
        debounce = 75,
        keymap = {
          accept = "<M-l>",     -- accept suggestion
          accept_word = "<M-w>", -- accept current word
          accept_line = "<M-S-l>", -- accept current line
          next = "<M-]>",       -- cycle forward
          prev = "<M-[>",       -- cycle backward
          dismiss = "<C-]>",    -- dismiss suggestion
        },
      },
      filetypes = {
        yaml = true,
        markdown = true,
        help = false,
        gitcommit = true,
        gitrebase = true,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
      },
      copilot_node_command = "node", -- Node.js >= 18.x required
      server_opts_overrides = {},
    })
  end,
}

