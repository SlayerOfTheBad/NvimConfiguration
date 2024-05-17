local fn = vim.fn

-- Install packer --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Reload NVim when saving plugins.lua so any changes get adapted immediately --
-- vim.cmd [[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]]


local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

return lazy.setup({
  
})

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}


return packer.startup(function(use)
  use "wbthomason/packer.nvim"
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"

  -- Tim Pope, vim plugin king --
  use "tpope/vim-fugitive"
  use "tpope/vim-surround"
  use "tpope/vim-commentary"
  use "tpope/vim-repeat"
  use "tpope/vim-sleuth"

  -- Colorschemes --
  use "rafi/awesome-vim-colorschemes"
  use "vim-airline/vim-airline"
  use "vim-airline/vim-airline-themes"

  -- Autocompletion + snippets --
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"

  use "rafamadriz/friendly-snippets"

  use { '~/programming/lua/idris2-nvim', requires = { 'neovim/nvim-lspconfig', 'MunifTanjim/nui.nvim' } }

  -- Mason --
  use "williamboman/mason.nvim"
  use "neovim/nvim-lspconfig"
  use "williamboman/mason-lspconfig.nvim"
  use "mfussenegger/nvim-dap"
  use "jose-elias-alvarez/null-ls.nvim"

  -- Debugging --
  use "rcarriga/nvim-dap-ui"
  use "theHamsta/nvim-dap-virtual-text"
  use "nvim-telescope/telescope-dap.nvim"
  use "ldelossa/nvim-dap-projects"

  -- Navigation --
  -- use "justinmk/vim-dirvish"
  use {
    "junegunn/fzf",
   run = function() vim.fn["fzf#install"]() end
  }
  use "junegunn/fzf.vim"
  -- use "luukvbaal/nnn.nvim"
  use "nvim-telescope/telescope.nvim"
  -- use "preservim/nerdtree"
  -- use "Xuyuanp/nerdtree-git-plugin"
  -- use "tiagofumo/vim-nerdtree-syntax-highlight"
  use "ryanoasis/vim-devicons"
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

  -- CTAGS --
  use "ludovicchabant/vim-gutentags"
  use "preservim/tagbar"

  -- Syntax highlighting --
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ':TSUpdate',
  }
  use "p00f/nvim-ts-rainbow";

  -- Autopairing --
  use "windwp/nvim-autopairs"

  -- PHP specific --
  use {
    "phpactor/phpactor",
  }

  -- Rust specific --
  use {
    "mrcjkb/rustaceanvim",
    version = '^3',
    ft = { 'rust' }
  }

  -- Terminal --
  use "akinsho/toggleterm.nvim"

  -- Nvim text boxes in Firefox --
  use "glacambre/firenvim"

  use "~/programming/lua/ltex-ls.nvim"

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
