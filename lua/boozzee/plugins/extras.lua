return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			indent = { char = "│" },
			scope = { enabled = true, show_start = false, show_end = false },
		},
	},
	{
		"folke/todo-comments.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup()
			vim.keymap.set("n", "<leader>ft", ":TodoTelescope<CR>", { desc = "Find TODOs" })
		end,
	},
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = true,
	},
	{
		"kevinhwang91/nvim-bqf",
		ft = "qf",
		config = true,
	},
	-- Схемы для JSON/YAML LSP
	{
		"b0o/schemastore.nvim",
		lazy = true,
	},
	-- git
	{
		"kdheepak/lazygit.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = "LazyGit",
		keys = {
			{ "<leader>gg", ":LazyGit<CR>", desc = "LazyGit" },
		},
	},
}
