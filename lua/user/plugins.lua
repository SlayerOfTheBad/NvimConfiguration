local fn = vim.fn

-- Install packer --
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
       "git",
       "clone",
       "--depth",
       "1",
       "https://github.com/wbthomason/packer.nvim",
       install_path,
    }
    print "installing packer close and open NeoVim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Reload NVim when saving plugins.lua so any changes get adapted immediately --
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

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

  -- LSP --
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"

  -- Navigation --
  use "nvim-telescope/telescope.nvim"
  use "preservim/nerdtree"
  use "Xuyuanp/nerdtree-git-plugin"
  use "tiagofumo/vim-nerdtree-syntax-highlight"
  use "ryanoasis/vim-devicons"

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

  -- Terminal --
  use "akinsho/toggleterm.nvim"
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
