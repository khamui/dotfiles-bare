local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
  -- package manager
  use 'wbthomason/packer.nvim'

  -- code parser
  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  use({ "elgiano/nvim-treesitter-angular", branch = "topic/jsx-fix" })
  -- Plug 'nvim-treesitter/playground'

  -- language servers
  use {
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- 'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      -- 'folke/neodev.nvim',
    },
  }

  -- enhance language servers
  use({
    "nvimdev/lspsaga.nvim",
    after = "nvim-lspconfig",
    config = function()
        require("lspsaga").setup({
          finder = {
            keys = {
              vsplit = "¬",
              split = "∆"
            }
          }
        })
    end,
    requires = {
        {"nvim-tree/nvim-web-devicons"},
        --Please make sure you install markdown and markdown_inline parser
        {"nvim-treesitter/nvim-treesitter"}
    }
  })

  -- formatting
  use { 'mhartington/formatter.nvim' }

  -- code completion
  use { 'L3MON4D3/LuaSnip' }
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-calc',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
  }

  -- fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

  -- fuzzy finder algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

  -- colorscheme
  use "savq/melange-nvim"

  -- status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- navigation
  use 'christoomey/vim-tmux-navigator'

  -- zoxide (telescope extension)
  use 'nvim-lua/popup.nvim'
  use 'jvgrootveld/telescope-zoxide'

  -- neoclip (telescope extension)
  use 'AckslD/nvim-neoclip.lua'

  -- git integration
  use 'lewis6991/gitsigns.nvim'

  -- tree explorer
  use {
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }

  -- explorer as buffer
  use {
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup()
    end,
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

require('plugins.configs.config-cmp')
require('plugins.configs.config-gitsigns')
require('plugins.configs.config-lsp')
require('plugins.configs.config-statusline')
require('plugins.configs.config-telescope')
require('plugins.configs.config-treesitter')
require('plugins.configs.config-formatter-prettier')
require('plugins.configs.config-nvim-tree')
