return {
  {
    "yetone/avante.nvim",
    build = vim.fn.has("win32") ~= 0
        and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
        or "make",
    event = "VeryLazy",
    version = false,
    opts = {
      provider = "claude",
      mode = "agentic",
      auto_suggestions_provider = "claude",

      providers = {
        claude = {
          endpoint = "https://api.anthropic.com",
          model = "claude-3-5-sonnet-20241022",
          extra_request_body = {
            temperature = 0.75,
            max_tokens = 4096,
          },
        },
      },

      dual_boost = {
        enabled = false,
        first_provider = "openai",
        second_provider = "claude",
        prompt = "Based on the two reference outputs below, generate a response that incorporates elements from both but reflects your own judgment and unique perspective. Do not provide any explanation, just give the response directly. Reference Output 1: [{{provider1_output}}], Reference Output 2: [{{provider2_output}}]",
        timeout = 60000,
      },

      behaviour = {
        auto_suggestions = false,
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = false,
        minimize_diff = true,
        enable_token_counting = true,
        auto_approve_tool_permissions = false,
      },

      prompt_logger = {
        enabled = true,
        log_dir = vim.fn.stdpath("cache") .. "/avante_prompts",
        fortune_cookie_on_success = false,
        next_prompt = { normal = "<C-n>", insert = "<C-n>" },
        prev_prompt = { normal = "<C-p>", insert = "<C-p>" },
      },

      mappings = {
        diff = {
          ours = "co",
          theirs = "ct",
          all_theirs = "ca",
          both = "cb",
          cursor = "cc",
          next = "]x",
          prev = "[x",
        },
        suggestion = {
          accept = "<M-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
        jump = {
          next = "]]",
          prev = "[[",
        },
        submit = {
          normal = "<CR>",
          insert = "<C-s>",
        },
        cancel = {
          normal = { "<C-c>", "<Esc>", "q" },
          insert = { "<C-c>" },
        },
        sidebar = {
          apply_all = "A",
          apply_cursor = "a",
          retry_user_request = "r",
          edit_user_request = "e",
          switch_windows = "<Tab>",
          reverse_switch_windows = "<S-Tab>",
          remove_file = "d",
          add_file = "@",
          close = { "<Esc>", "q" },
          close_from_input = nil,
        },
      },

      selection = {
        enabled = true,
        hint_display = "delayed",
      },

      windows = {
        position = "right",
        wrap = true,
        width = 30,
        sidebar_header = {
          enabled = true,
          align = "center",
          rounded = true,
        },
        spinner = {
          editing = { "⡀","⠄","⠂","⠁","⠈","⠐","⠠","⢀","⣀","⢄","⢂","⢁","⢈","⢐","⢠","⣠","⢤","⢢","⢡","⢨","⢰","⣰","⢴","⢲","⢱","⢸","⣸","⢼","⢺","⢹","⣹","⢽","⢻","⣻","⢿","⣿" },
          generating = { "·", "✢", "✳", "∗", "✻", "✽" },
          thinking = { "🤯", "🙄" },
        },
        input = {
          prefix = "> ",
          height = 8,
        },
        edit = {
          border = "rounded",
          start_insert = true,
        },
        ask = {
          floating = false,
          start_insert = true,
          border = "rounded",
          focus_on_apply = "ours",
        },
      },

      highlights = {
        diff = {
          current = "DiffText",
          incoming = "DiffAdd",
        },
      },

      diff = {
        autojump = true,
        list_opener = "copen",
        override_timeoutlen = 500,
      },

      suggestion = {
        debounce = 600,
        throttle = 600,
      },
    },

    keys = {
      -- Sidebar
      { "<leader>aa", "<cmd>AvanteToggle<CR>", desc = "Avante: Toggle sidebar" },
      { "<leader>an", "<cmd>AvanteAsk<CR>", desc = "Avante: New ask" },
      { "<leader>ae", "<cmd>AvanteEdit<CR>", desc = "Avante: Edit selected blocks" },
      { "<leader>af", "<cmd>AvanteFocus<CR>", desc = "Avante: Switch sidebar focus" },
      { "<leader>ar", "<cmd>AvanteRefresh<CR>", desc = "Avante: Refresh sidebar" },
      { "<leader>as", "<cmd>AvanteToggleSuggestions<CR>", desc = "Avante: Toggle suggestions" },
      { "<leader>ad", "<cmd>AvanteToggleDebug<CR>", desc = "Avante: Toggle debug mode" },
      { "<leader>aS", "<cmd>AvanteStop<CR>", desc = "Avante: Stop current request" },

      -- Files
      { "<leader>ac", "<cmd>AvanteAddFile<CR>", desc = "Avante: Add current buffer to files" },
      { "<leader>aB", "<cmd>AvanteAddAllFiles<CR>", desc = "Avante: Add all buffer files" },
    },

    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "echasnovski/mini.pick",
      "nvim-telescope/telescope.nvim",
      "hrsh7th/nvim-cmp",
      "ibhagwan/fzf-lua",
      "stevearc/dressing.nvim",
      "folke/snacks.nvim",
      "nvim-tree/nvim-web-devicons",
      "zbirenbaum/copilot.lua",
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = { insert_mode = true },
            use_absolute_path = true,
          },
        },
      },
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = { file_types = { "markdown", "Avante" } },
        ft = { "markdown", "Avante" },
      },
    },
  }
}

