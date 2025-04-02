require("conform").setup({
	formatters_by_ft = {
		javascript = { "prettier", stop_after_first = true },
		typescript = { "prettier", stop_after_first = true },
		javascriptreact = { "prettier", stop_after_first = true },
		typescriptreact = { "prettier", stop_after_first = true },
		svelte = { "prettier", stop_after_first = true },
		css = { "prettier", stop_after_first = true },
		scss = { "prettier", stop_after_first = true },
		html = { "prettier", stop_after_first = true },
		json = { "prettierd", stop_after_first = true },
		yaml = { "prettier", stop_after_first = true },
		markdown = { "prettier", stop_after_first = true },
		graphql = { "prettier", stop_after_first = true },
		prettierrc = { "prettier", stop_after_first = true },
		eslintrc = { "prettier", stop_after_first = true },
		lua = { "stylua" },
		-- python = { "isort", "black" },
	},
	format_on_save = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	},
})
vim.keymap.set({ "n", "v" }, "<leader>f", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	})
end, { desc = "Format file or range (in visual mode)" })

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
