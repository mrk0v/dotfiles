return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = { "NvimTreeToggle", "NvimTreeFocus" },
	config = function()
		require("nvim-tree").setup({
			view = { width = 32, side = "left" },
			renderer = {
				indent_markers = { enable = true },
				icons = {
					glyphs = {
						folder = { arrow_closed = "", arrow_open = "" },
					},
				},
			},
			filters = { dotfiles = false, custom = { ".git", "node_modules", ".cache" } },
			actions = {
				open_file = {
					quit_on_open = false,
					resize_window = true,
				},
			},
			git = { enable = true, ignore = false },
			update_focused_file = { enable = true },
		})
	end,
}
