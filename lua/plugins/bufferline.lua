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
