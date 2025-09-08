return {
  "yetone/avante.nvim",
  build = vim.fn.has("win32") ~= 0
      and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      or "make",
  event = "VeryLazy",
  version = false,
  opts = {
    ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
    ---@type Provider
    provider = "copilot",            -- use GitHub Copilot as the main provider
    auto_suggestions_provider = "copilot",

    providers = {
      copilot = {
        model = "gpt-4o-mini",       -- default Copilot model (can also be "gpt-4")
        -- You don’t need to set endpoint/api key here,
        -- Copilot is handled by the copilot.lua plugin
        extra_request_body = {
          temperature = 0.7,
          max_tokens = 2048,
        },
      },
    },

    behaviour = {
      auto_suggestions = true, -- Copilot is designed for suggestions
      auto_set_keymaps = true,
    },

    suggestion = {
      debounce = 800,
      throttle = 800,
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "zbirenbaum/copilot.lua", -- Copilot integration
    "hrsh7th/nvim-cmp",       -- for completion
    "nvim-telescope/telescope.nvim",
    "echasnovski/mini.pick",
    "ibhagwan/fzf-lua",
    "stevearc/dressing.nvim",
    "folke/snacks.nvim",
    "nvim-tree/nvim-web-devicons",
  },
}

