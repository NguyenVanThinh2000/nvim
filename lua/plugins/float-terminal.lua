local opts = { noremap = true, silent = true }

local floaterm = require("FTerm")
floaterm.setup({
	dimensions = {
		height = 0.7,
		width = 0.7,
	},
})
vim.api.nvim_create_user_command("FTermOpen", floaterm.open, { bang = true })
vim.api.nvim_create_user_command("FTermClose", floaterm.close, { bang = true })
vim.api.nvim_create_user_command("FTermExit", floaterm.exit, { bang = true })
vim.api.nvim_create_user_command("FTermToggle", floaterm.toggle, { bang = true })

vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", opts)
vim.keymap.set("n", "fl", floaterm.toggle)
