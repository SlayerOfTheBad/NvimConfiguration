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
  use "tpope/vim-fugitive"

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
