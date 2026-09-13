return {
	"ray-x/go.nvim",
	dependencies = {
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
	},
	ft    = { "go", "gomod", "gowork", "gosum" },
	build = ':lua require("go.install").update_all_sync()',
	config = function()
		require("go").setup({
			lsp_cfg      = false,
			lsp_keymaps  = false,
			lsp_codelens = false,

			lsp_document_formatting = false,
			lsp_on_attach = false,

			goimports  = "gopls",
			gofmt      = "gofumpt",
			tag_transform = "snakecase",
			test_runner   = "go",
			run_in_floaterm = true,

			icons  = false,
			verbose = false,
		})

		local map = vim.keymap.set
		map("n", "<leader>Gt", ":GoTest<CR>",       { desc = "Go: test package" })
		map("n", "<leader>Gf", ":GoTestFunc<CR>",   { desc = "Go: test func" })
		map("n", "<leader>Gc", ":GoCoverage<CR>",   { desc = "Go: coverage" })
		map("n", "<leader>Ga", ":GoAddTag<CR>",     { desc = "Go: add tags" })
		map("n", "<leader>Gr", ":GoRmTag<CR>",      { desc = "Go: remove tags" })
		map("n", "<leader>Ge", ":GoIfErr<CR>",      { desc = "Go: if err" })
		map("n", "<leader>Gs", ":GoFillStruct<CR>", { desc = "Go: fill struct" })
		map("n", "<leader>Gd", ":GoDoc<CR>",        { desc = "Go: doc" })
	end,
}
