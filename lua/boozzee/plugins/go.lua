return {
	"ray-x/go.nvim",
	dependencies = {
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
	},
	ft = { "go", "gomod" },
	build = ':lua require("go.install").update_all_sync()',
	config = function()
		require("go").setup({
			lsp_cfg = false,
			lsp_keymaps = false,
			goimports = "gopls",
			gofmt = "gofumpt",
			tag_transform = "snakecase",
			test_runner = "go",
			icons = false,
			verbose = false,
		})

		local map = vim.keymap.set
		map("n", "<leader>Gt", ":GoTest<CR>", { desc = "Go test" })
		map("n", "<leader>Gf", ":GoTestFunc<CR>", { desc = "Go test func" })
		map("n", "<leader>Ga", ":GoAddTag<CR>", { desc = "Go add tags" })
		map("n", "<leader>Gr", ":GoRmTag<CR>", { desc = "Go remove tags" })
		map("n", "<leader>Ge", ":GoIfErr<CR>", { desc = "Go if err" })
		map("n", "<leader>Gs", ":GoFillStruct<CR>", { desc = "Go fill struct" })
	end,
}