require("telescope").setup({
	defaults = {
		-- layout_strategy = 'vertical',
		-- layout_config = {
		--   height = 0.95,
		-- },
	},
})

require("telescope").load_extension("fzf")

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>", opts) -- find files within current working directory, respects .gitignore
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts) -- find files within current working directory, respects .gitignore
vim.keymap.set("n", "<C-f>", "<cmd>Telescope live_grep<cr>", opts) -- find string in current working directory as you type
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", opts) -- find string in current working directory as you type
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", opts) -- find string under cursor in current working directory
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts) -- list open buffers in current neovim instance
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts) -- list available help tags
require("telescope.builtin").find_files({ hidden = true, layout_config = { prompt_position = "top" } })
