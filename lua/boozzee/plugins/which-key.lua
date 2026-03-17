return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")
		wk.setup({
			plugins = { marks = true, registers = true, spelling = { enabled = false } },
			win = { border = "rounded" },
		})
		wk.add({
			{ "<leader>b", group = "Buffer" },
			{ "<leader>c", group = "Code" },
			{ "<leader>f", group = "Find" },
			{ "<leader>G", group = "Go" },
			{ "<leader>h", group = "Git hunk" },
			{ "<leader>r", group = "Rename" },
			{ "<leader>s", group = "Split" },
		})
	end,
}
