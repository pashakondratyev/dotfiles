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
                log_level = "error",
                auto_save_enabled = true,
                auto_restore_enabled = true,
                pre_save_cmds = {
                    -- prevents cmdline spanning almost the entire window height on restore.
                    -- this will close all float windows before saving.
                    function()
                        for _, win in ipairs(vim.api.nvim_list_wins()) do
                            local config = vim.api.nvim_win_get_config(win)
                            if config.relative ~= "" then
                                vim.api.nvim_win_close(win, false)
                            end
                        end
                    end,
                },
            })
        end,
    })

    use({
        "github/copilot.vim",
        config = function()
            require("user.copilot")
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
        "rebelot/kanagawa.nvim",
        config = function()
            require("user.colorscheme")
        end,
    })

    use({
        "xiyaowong/transparent.nvim",
        config = function()
            require("transparent").setup({ -- Optional, you don't have to run setup.
                groups = { -- table: default groups
                    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
                    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
                    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
                    'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
                    'EndOfBuffer',
                },
                extra_groups = {}, -- table: additional groups that should be cleared
                exclude_groups = {}, -- table: groups you don't want to clear
            })
        end,
    })

    use({
        "ellisonleao/gruvbox.nvim",
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
    use({ 'folke/which-key.nvim', opts = {} })

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
        "akinsho/bufferline.nvim",
        config = function()
            require("bufferline").setup({
                options = {
                    diagnostics = "nvim_lsp",
                },
            })
        end,
    })

    use({
        "nvim-lualine/lualine.nvim",
        config = function()
            require("user.lualine")
        end,
    })

    use({
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional
            { 'nvim-lua/lsp-status.nvim' },          --Optional
            { "onsails/lspkind-nvim" },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },             -- Required
            { 'hrsh7th/cmp-nvim-lsp' },         -- Required
            { 'hrsh7th/cmp-buffer' },           -- Optional
            { 'hrsh7th/cmp-path' },             -- Optional
            { 'saadparwaiz1/cmp_luasnip' },     -- Optional
            { 'hrsh7th/cmp-nvim-lua' },         -- Optional
            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        },
        config = function()
            require("lspkind").init()
            require("user.lsp")
        end,
    })

    use({
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            require("user.hop")
        end,
    })

    use({
        'tpope/vim-fugitive',
        config = function()
            require("user.fugitive")
        end,
    })

    use({
        'theprimeagen/harpoon',
        config = function()
            require("user.harpoon")
        end,
    })

    use("theprimeagen/refactoring.nvim")

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
