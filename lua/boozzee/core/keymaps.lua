local map = vim.keymap.set

-- Insert mode
map("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Window left" })
map("n", "<C-j>", "<C-w>j", { desc = "Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window up" })
map("n", "<C-l>", "<C-w>l", { desc = "Window right" })

-- Resize
map("n", "<C-Up>",    ":resize +2<CR>",          { desc = "Resize up" })
map("n", "<C-Down>",  ":resize -2<CR>",           { desc = "Resize down" })
map("n", "<C-Left>",  ":vertical resize -2<CR>",  { desc = "Resize left" })
map("n", "<C-Right>", ":vertical resize +2<CR>",  { desc = "Resize right" })

-- Buffers
map("n", "<S-l>",      ":bnext<CR>",    { desc = "Next buffer" })
map("n", "<S-h>",      ":bprevious<CR>", { desc = "Prev buffer" })
map("n", "<leader>bd", ":bdelete<CR>",  { desc = "Close buffer" })

-- Move lines in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Better scroll + center
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- QoL
map("n", "<Esc>", ":noh<CR>", { desc = "Clear highlights" })
map("v", "p", '"_dP', { desc = "Paste without yanking" })

-- File
map("n", "<leader>w",  ":w<CR>",       { desc = "Save file" })
map("n", "<leader>q",  ":q<CR>",       { desc = "Quit" })
map("n", "<leader>Q",  ":qa!<CR>",     { desc = "Force quit all" })

-- Splits
map("n", "<leader>sv", ":vsplit<CR>",  { desc = "Split vertical" })
map("n", "<leader>sh", ":split<CR>",   { desc = "Split horizontal" })
map("n", "<leader>sx", "<C-w>c",       { desc = "Close split" })

-- Explorer
map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "File explorer" })

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<CR>",            { desc = "Find files" })
map("n", "<leader>fg", ":Telescope live_grep<CR>",             { desc = "Grep in files" })
map("n", "<leader>fb", ":Telescope buffers<CR>",               { desc = "Open buffers" })
map("n", "<leader>fh", ":Telescope help_tags<CR>",             { desc = "Help tags" })
map("n", "<leader>fo", ":Telescope oldfiles<CR>",              { desc = "Recent files" })
map("n", "<leader>fs", ":Telescope lsp_document_symbols<CR>",  { desc = "Document symbols" })
map("n", "<leader>fr", ":Telescope lsp_references<CR>",        { desc = "LSP references" })
map("n", "<leader>fd", ":Telescope diagnostics<CR>",           { desc = "Diagnostics" })

-- Diagnostics
map("n", "[d",        vim.diagnostic.goto_prev,  { desc = "Prev diagnostic" })
map("n", "]d",        vim.diagnostic.goto_next,  { desc = "Next diagnostic" })
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostic" })

-- Format (conform)
map({ "n", "v" }, "<leader>cf", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format file" })
