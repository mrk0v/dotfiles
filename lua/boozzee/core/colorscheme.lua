local ok = pcall(require, "gruber-darker")
if not ok then
	return
end

require("gruber-darker").setup({
	bold = true,
	italic = { strings = true, comments = true },
	undercurl = true,
})

vim.cmd.colorscheme("gruber-darker")
