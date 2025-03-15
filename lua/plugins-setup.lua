local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use("wbthomason/packer.nvim") -- Have packer manage itself

	use("nvim-tree/nvim-web-devicons")

	use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

	-- color scheme
	use("craftzdog/solarized-osaka.nvim")
	use("nordtheme/vim")
	use("bluz71/vim-nightfly-guicolors") -- preferred colorscheme
	use("folke/tokyonight.nvim")
	use("morhetz/gruvbox")
	use("drewtempelmeyer/palenight.vim")
	use("Mofiqul/dracula.nvim")
	use("catppuccin/nvim")
	use({
		"loctvl842/monokai-pro.nvim",
		config = function()
			require("monokai-pro").setup()
		end,
	})

	-- file explorer
	use("nvim-tree/nvim-tree.lua")
	use("moll/vim-bbye") -- close buffer without closing window
	use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
	use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

	-- commenting with gc
	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- require for telescope
	use("nvim-lua/plenary.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("nvim-treesitter/nvim-treesitter")
	use({ "nvim-telescope/telescope.nvim", tag = "0.1.6" })

	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths

	-- snippets
	use("l3mon4d3/luasnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletio
	use("NguyenVanThinh2000/friendly-snippets") -- useful snippets

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use("windwp/nvim-ts-autotag") -- autoclose tags

	use({ "akinsho/bufferline.nvim", tag = "*" })

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	}) -- enhanced lsp uis
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	-- formatting width conform replace null-ls
	use({
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup()
		end,
	})
	use("mfussenegger/nvim-lint")

	-- git
	use("lewis6991/gitsigns.nvim")
	use("sindrets/diffview.nvim") -- view git diff
	-- use("github/copilot.vim")

	use({
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({})
		end,
	})
	use({
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	})
	use({
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "main",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {
			-- See Configuration section for options
		},
		-- See Commands section for default commands if you want to lazy load on them
	})

	use({
		"kdheepak/lazygit.nvim",
		requires = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("telescope").load_extension("lazygit")
		end,
	})

	use("WhoIsSethDaniel/mason-tool-installer.nvim")

	use("lukas-reineke/indent-blankline.nvim")
	-- use("TheGLander/indent-rainbowline.nvim")

	use("brenoprata10/nvim-highlight-colors")

	-- use("tribela/transparent.nvim")
	use("xiyaowong/transparent.nvim")

	-- statusline
	use("nvim-lualine/lualine.nvim")

	use({ "stevearc/dressing.nvim" })

	use({
		"akinsho/git-conflict.nvim",
		tag = "*",
		config = function()
			require("git-conflict").setup()
		end,
	})

	use("yioneko/nvim-vtsls")

	use("ggandor/leap.nvim")

	-- use("joeytwiddle/sexy_scroller.vim")

	use("mg979/vim-visual-multi")

	-- use("voldikss/vim-floaterm")
	use("numToStr/FTerm.nvim")

	use("luckasRanarison/tailwind-tools.nvim")

	use({ "MaximilianLloyd/tw-values.nvim" })

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
