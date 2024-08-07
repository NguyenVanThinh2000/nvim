require("conform").setup({
	formatters_by_ft = {
		javascript = { { "prettier" } },
		typescript = { { "prettier" } },
		javascriptreact = { { "prettier" } },
		typescriptreact = { { "prettier" } },
		svelte = { { "prettier" } },
		css = { { "prettier" } },
		scss = { { "prettier" } },
		html = { { "prettier" } },
		json = { { "prettier" } },
		yaml = { { "prettier" } },
		markdown = { { "prettier" } },
		graphql = { { "prettier" } },
		prettierrc = { { "prettier" } },
		eslintrc = { { "prettier" } },
		lua = { "stylua" },
		-- python = { "isort", "black" },
	},
	format_on_save = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	},
})
vim.keymap.set({ "n", "v" }, "<leader>f", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	})
end, { desc = "Format file or range (in visual mode)" })

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
