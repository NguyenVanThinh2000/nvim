require("mason-tool-installer").setup({
	ensure_installed = {
		"lua-language-server",
		"vim-language-server",
		"stylua",
		"prettier",
		"prettierd",
		"eslint_d",
		"isort",
		"black",
	},
	auto_update = true,
	run_on_start = true,
	start_delay = 3000, -- 3 second delay
	debounce_hours = 5, -- at least 5 hours between attempts to install/update
})
