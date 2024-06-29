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
		add_trailing = false,
		group_empty = false,
		full_name = false,
		root_folder_label = ":~:s?$?/..?",
		indent_width = 1,
		special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
		symlink_destination = true,
		highlight_git = "name",
		highlight_diagnostics = "none",
		highlight_opened_files = "name",
		highlight_modified = "name",
		highlight_bookmarks = "none",
		highlight_clipboard = "name",
		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				bottom = "",
				none = " ",
			},
		},
		icons = {
			web_devicons = {
				file = {
					enable = true,
					color = true,
				},
				folder = {
					enable = false,
					color = true,
				},
			},
			git_placement = "after",
			modified_placement = "after",
			diagnostics_placement = "after",
			bookmarks_placement = "after",
			padding = " ",
			symlink_arrow = " ➛ ",
			show = {
				file = true,
				folder = true,
				folder_arrow = false,
				git = true,
				modified = true,
				diagnostics = true,
				bookmarks = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				bookmark = "󰆤",
				modified = "[+]",
				folder = {
					arrow_closed = "",
					arrow_open = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
	modified = {
		enable = true,
		show_on_dirs = false,
	},
	actions = {
		open_file = {
			window_picker = {
				enable = false,
				chars = "123456",
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
	diagnostics = {
		enable = true,
		show_on_dirs = false,
		show_on_open_dirs = true,
		debounce_delay = 50,
		severity = {
			min = vim.diagnostic.severity.HINT,
			max = vim.diagnostic.severity.ERROR,
		},
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	filters = {
		dotfiles = false,
	},
	on_attach = my_on_attach,
})
