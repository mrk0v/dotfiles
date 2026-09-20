return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers", -- каждая открытая вкладка = буфер
				diagnostics = "nvim_lsp",
				separator_style = "slant",
				always_show_bufferline = true,
				show_buffer_close_icons = true,
				show_close_icon = false,
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
		})

		local map = vim.keymap.set
		map("n", "<leader>bn", ":BufferLineCycleNext<CR>", { desc = "Next tab" })
		map("n", "<leader>bp", ":BufferLineCyclePrev<CR>", { desc = "Prev tab" })
		map("n", "<leader>bc", ":BufferLinePickClose<CR>", { desc = "Close tab (pick)" })
		map("n", "<leader>bo", ":BufferLineCloseOthers<CR>", { desc = "Close other tabs" })
		map("n", "gb", ":BufferLinePick<CR>", { desc = "Pick tab" })
	end,
}
