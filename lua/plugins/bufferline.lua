require("bufferline").setup({
	options = {
		mode = "buffers",
		diagnostics = "nvim_lsp" or "coc",
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				text_align = "left",
				separator = true,
			},
		},
		separator_style = "slant",
		numbers = "none",
		max_name_length = 30,
		show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
		sort_by = "insert_after_current",
	},
})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "tn", ":BufferLineCycleNext<CR>", opts)
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)
vim.keymap.set("n", "<s-Tab>", ":BufferLineCyclePrev<CR>", opts)
vim.keymap.set("n", "tb", ":BufferLineCyclePrev<CR>", opts)
-- Close all tabs
vim.keymap.set("n", "ta", [[:tabedit<cr>:BufferLineCloseLeft<cr>:BufferLineCloseRight<cr>]], opts)
-- Keep current tab and close the others
vim.keymap.set("n", "to", ":BufferLineCloseOthers<CR>", opts)
-- add number to buffer
vim.keymap.set("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", opts)
vim.keymap.set("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", opts)
vim.keymap.set("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", opts)
vim.keymap.set("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", opts)
vim.keymap.set("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", opts)
vim.keymap.set("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", opts)
vim.keymap.set("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", opts)
vim.keymap.set("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", opts)
vim.keymap.set("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", opts)
vim.keymap.set("n", "<leader>0", ":BufferLineGoToBuffer 10<CR>", opts)
