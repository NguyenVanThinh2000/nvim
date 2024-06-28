-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	vim.keymap.set("n", "<leader>e", ":NvimTreeFocus<CR>")
	vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>")
end

-- OR setup with some options
require("nvim-tree").setup({
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = 35,
	},
	renderer = {
		group_empty = true,
	},
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	git = {
		ignore = false,
	},
	filters = {
		dotfiles = false,
	},
	on_attach = my_on_attach,
})
