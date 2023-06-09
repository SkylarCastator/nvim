-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

-- add list of plugins to install
return packer.startup(function(use)
	-- packer can manage itself
	use("wbthomason/packer.nvim")

	use("nvim-lua/plenary.nvim")

	use("bluz71/vim-nightfly-guicolors") -- preferred colorscheme

	--tmux & split window navigation
	use("christoomey/vim-tmux-navigator")

	use("szw/vim-maximizer") --maximizes and restores current window

	--essential plugins
	use("tpope/vim-surround")
	use("vim-scripts/ReplaceWithRegister")

	--commenting with gc
	use("numToStr/Comment.nvim")

	-- file explorer
	use("nvim-tree/nvim-tree.lua")

	--icons
	use("kyazdani42/nvim-web-devicons")

	--statusline
	use("nvim-lualine/lualine.nvim")

	--fuzzy finding
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

	--autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")

	--snippits
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

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

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	-- coding autocomplition tools AI
	use("github/copilot.vim")

	use("MunifTanjim/nui.nvim") -- UI library for Neovim

	--chatbot
	--use({
	--	"jackMort/ChatGPT.nvim",
	--	config = function()
	--		require("chatgpt").setup()
	--	end,
	--	requires = {
	--		"MunifTanjim/nui.nvim",
	--		"nvim-lua/plenary.nvim",
	--		"nvim-telescope/telescope.nvim",
	--	},
	--})

	-- Database
	--use({
	--	"tpope/vim-dadbod",
	--	opt = true,
	--	requires = {
	--		"kristijanhusak/vim-dadbod-ui",
	--		"kristijanhusak/vim-dadbod-completion",
	--	},
	--	config = function()
	--		require("config.dadbod").setup()
	--	end,
	--	cmd = { "DBUIToggle", "DBUI", "DBUIAddConnection", "DBUIFindBuffer", "DBUIRenameBuffer", "DBUILastQueryInfo" },
	--})

	-- Debugging
	use({
		"mfussenegger/nvim-dap",
	})

	-- vimspector
	use({
		"puremourning/vimspector",
		cmd = { "VimspectorInstall", "VimspectorUpdate" },
		fn = { "vimspector#Launch()", "vimspector#ToggleBreakpoint", "vimspector#Continue" },
		config = function()
			require("config.vimspector").setup()
		end,
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
