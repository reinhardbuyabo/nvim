return {
	-- Mason: manages external tools
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	-- Mason-LSPConfig: bridges mason and lspconfig
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "html" },
			})
		end,
	},

	-- LSPConfig: configures language servers
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Use the new API (Neovim 0.11+)
			local lspconfig = vim.lsp.config

			-- Define and start language servers
			vim.lsp.start({
				name = "lua_ls",
				cmd = { "lua-language-server" },
				capabilities = capabilities,
				filetypes = { "lua" },
				root_dir = vim.fs.dirname(vim.fs.find({ ".luarc.json", ".luacheckrc", ".git" }, { upward = true })[1]),
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = { checkThirdParty = false },
					},
				},
			})

			vim.lsp.start({
				name = "ts_ls",
				cmd = { "typescript-language-server", "--stdio" },
				capabilities = capabilities,
				filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
				root_dir = vim.fs.dirname(
					vim.fs.find({ "tsconfig.json", "package.json", ".git" }, { upward = true })[1]
				),
			})

			vim.lsp.start({
				name = "html",
				cmd = { "vscode-html-language-server", "--stdio" },
				capabilities = capabilities,
				filetypes = { "html" },
				root_dir = vim.fs.dirname(vim.fs.find({ ".git", "index.html" }, { upward = true })[1]),
			})

			-- Global LSP keymaps
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>vca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, {})
			vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, {})
			vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, {})
		end,
	},

	-- nvim-cmp: completion framework (for LSP, snippets, buffer, path)
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
			})
		end,
	},
}
