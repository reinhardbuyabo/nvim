return {
	"nvim-treesitter/nvim-treesitter-context",
	opts = {
		enable = true,
		max_lines = 3,
		multiline_threshold = 20,
		trim_scope = "outer",
		mode = "topline",
	},
	config = function()
		vim.keymap.set("n", "[c", function()
			require("treesitter-context").go_to_context(vim.v.count1)
		end, { silent = true })
		vim.api.nvim_set_hl(0, "TreesitterContext", {
			bold = true,
			bg = "#2b2f3a",
		})
	end,
}
