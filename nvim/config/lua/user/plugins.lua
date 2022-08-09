local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init({
  autoremove = true,
})

packer.startup(function(use)
  use("wbthomason/packer.nvim") -- Have packer manage itself

  use({
    "lewis6991/impatient.nvim",
    config = function()
      require("impatient").enable_profile()
    end,
  })

  use({
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup({
        auto_save_enabled = true,
        auto_restore_enabled = true,
      })
    end,
  })

  use({
    "kyazdani42/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({
        default = true,
      })
    end,
  })

  use({
    "gruvbox-community/gruvbox",
    config = function()
      require("user.colorscheme")
    end,
  })

  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  })

  use({
    "nvim-telescope/telescope.nvim",
    config = function()
      require("user.telescope")
    end,
    requires = {
      "nvim-lua/plenary.nvim",
    },
  })

  use({
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("user.treesitter")
    end,
    requires = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter-context",
      "lewis6991/spellsitter.nvim",
    },
  })

  use({
    "neovim/nvim-lspconfig",
    config = function()
      require("user.lsp")
    end,
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/nvim-cmp"
    }
  })

  if is_bootstrap then
    packer.sync()
  end
end)

if is_bootstrap then
  print("==================================")
  print("    Plugins are being installed")
  print("    Wait until Packer completes,")
  print("       then restart nvim")
  print("==================================")
  return
end
