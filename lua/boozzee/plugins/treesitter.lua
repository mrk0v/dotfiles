return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local status, configs = pcall(require, "nvim-treesitter.configs")
		if not status then
			return
		end

		configs.setup({
			ensure_installed = {
				"go", "gomod", "gowork", "gosum",
				"lua", "json", "yaml", "toml",
				"dockerfile", "sql", "bash",
				"markdown", "markdown_inline",
				"proto", "make",
				"vim", "vimdoc", "query", 
			},
			highlight = { 
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
	end,
}

