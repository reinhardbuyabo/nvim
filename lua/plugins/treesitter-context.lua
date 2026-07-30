return {
	"nvim-treesitter/nvim-treesitter-context",
	opts = {
		enable = true,
		max_lines = 3,
		multiline_threshold = 20,
		trim_scope = "outer",
		mode = "cursor",
	},
	config = function()
		vim.keymap.set("n", "[c", function()
			require("treesitter-context").go_to_context(vim.v.count1)
		end, { silent = true })
	end,
}
