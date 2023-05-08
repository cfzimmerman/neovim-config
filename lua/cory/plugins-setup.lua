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

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	-- basics
	use("wbthomason/packer.nvim") -- package manager
	use("nvim-lua/plenary.nvim") -- lua functions used by many plugins
	use("bluz71/vim-nightfly-guicolors") -- color scheme
	use("christoomey/vim-tmux-navigator") -- tmux and split window navigation
	use("szw/vim-maximizer") -- maximizes and restores current window
	use("tpope/vim-surround") -- mappings to change characters around text
	use("vim-scripts/ReplaceWithRegister") -- fast text copy pasting

	-- fast commenting
	use("numToStr/Comment.nvim")

	-- file explorer
	use("nvim-tree/nvim-tree.lua")

	-- file icons
	use("kyazdani42/nvim-web-devicons")

	-- styled status line
	use("nvim-lualine/lualine.nvim")

	-- fuzzy search
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy search

	-- autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer") -- gives cmp access to buffer
	use("hrsh7th/cmp-path") -- gives cmp access to filepaths

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- allows cmp to show snippets in autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets for a lot of languages

	-- managing and installing LSP servers
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	-- configuring LSP servers
	use("neovim/nvim-lspconfig")
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
	use("onsails/lspkind.nvim") -- icons for autocompletion

	-- formatting and linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters and linters
	use("jayp0521/mason-null-ls.nvim") -- bridges mason and null-ls

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

	if packer_bootstrap then
		require("packer").sync()
	end
end)
