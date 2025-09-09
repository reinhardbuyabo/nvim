return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true, -- inline ghost text shows up automatically
        debounce = 75,
        keymap = {
          accept = "<Tab>",        -- default accept
          accept_word = "<M-w>",   -- default word
          accept_line = "<M-l>",   -- default line
          next = "<M-]>",          -- default cycle forward
          prev = "<M-[>",          -- default cycle backward
          dismiss = "<C-]>",       -- default dismiss
        },
      },
      panel = { enabled = false },
    })
  end,
}
