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
                enabled = false,
            },
            filetypes = {
                yaml = true,
                markdown = true,
                gitcommit = true,
                gitrebase = true,
                help = false,
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
