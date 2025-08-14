return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
	{
		"nvim-telescope/telescope-media-files.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					media_files = {
						filetypes = {
							"png",
							"jpg",
							"jpeg",
							"webp",
							"svg",
							"gif",
							"pdf",
							"ico",
							"ttf",
							"mp4",
							"3gp",
							"mpeg",
						}, -- default {"png", "jpg", "mp4", "webm", "pdf"}
						find_cmd = "rg", -- find command defaults to `fd`
						command_open_imen = "display", -- Example to use imageMagick to show the image instead default eog
						-- command_open_image = 'gnome-terminal -- env TMUX="" kitty --hold kitten ica' -- Example to use the kitty terminal for the images
						-- command_open_thumbnail = "kitten icat" -- Example open image Thumbnail with kitty
						-- show_file_details = 0 -- Example to disable the file details.
						tmux_always_open_pane = 1, -- Example to open a new pane in tmux for each Thumbnail
						tmux_time_wait = 1, -- Example to wait 1 second for console render the image
						-- tmux_index_pane_thumbnail = 0 -- Example to show the Thumbnail at the left of the tmux pane.
						-- tmux_resize_open_pane = 30 -- Example of number of columns to open the tmux pane.
					},
				},
        backend = "terminal",
        previewer = function(filepath)
        vim.fn.jobstart({ "fim", filepath }, { detach = true })
      end
			})
			local telescope = require("telescope")

			vim.keymap.set("n", "<leader>fm", telescope.extensions.media_files.media_files, {})
		end,
	},
}
