local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

    require("lazy").setup({
--[[{
    "sheerun/vim-polyglot",
},
{
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },--]]
    {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").setup()
    end,
    },
    {
    "neovim/nvim-lspconfig",
    },
    {
    "mason-org/mason-lspconfig.nvim",
    },

    {
    "saghen/blink.cmp",
    version = "*",
    opts = {
        keymap = {
            preset = "enter",
        },

        appearance = {
            nerd_font_variant = "mono",
        },

        completion = {
            documentation = {
                auto_show = true,
            },
        },
    },
    },
    {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
        local transparent= true

        local bg = "#0B2430"
        local bg_dark = "#394d49"
        local bg_highlight = "#143652"
        local bg_float = "#26423A"
        local bg_search = "#0A64AC"
        local bg_visual = "#3E3E75"
        local fg = "#CBE0F0"
        local fg_dark = "#B4D0E9"
        local fg_gutter = "#627E97"
        local border = "#547998"

        require("tokyonight").setup({
            style = "night",
            transparent = transparent,
            styles = {
                sidebars = transparent and "transparent" or "dark",
                floats = transparent and "transparent" or "dark",
            },
            on_colors = function(colors)
                colors.bg = bg
                colors.bg_dark = transparent and colors.none or bg_dark
                colors.bg_float = transparent and colors.none or bg_float
                colors.bg_highlight = bg_highlight
                colors.bg_popup = bg_dark
                colors.bg_search = bg_search
                colors.bg_sidebar = transparent and colors.none or bg_dark
                colors.bg_statusline = transparent and colors.none or bg_dark
                colors.bg_visual = bg_visual
                colors.border = border
                colors.fg = fg
                colors.fg_dark = fg_dark
                colors.fg_float = fg
                colors.fg_gutter = fg_gutter
                colors.fg_sidebar = fg_dark
            end,
        })

        vim.cmd.colorscheme("tokyonight")
    end,
},
{
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("lualine").setup({
            options = {
                theme = "tokyonight",
                globalstatus = true,
                section_separators = "",
                component_separators = "│",
                disabled_filetypes = {
                statusline = {},
                },
            },

            sections = {
                lualine_a = {
                    {
                        "mode",
                        separator = { left = "", right = "" },
                    },
                },

                lualine_b = {
                    {
                        "branch",
                        icon = "",
                    },
                    {
                        "diff",
                    },
                },

                lualine_c = {
                    {
                        "filename",
                        path = 1,
                        symbols = {
                            modified = " ●",
                            readonly = " ",
                            unnamed = "[No Name]",
                        },
                    },
                },

                lualine_x = {
                    "diagnostics",
                },

                lualine_y = {
                    "filetype",
                },

                lualine_z = {
                    "location",
                },
            },
        })
    end,
},
    {
    "echasnovski/mini.pairs",
    version = false,
    config = function()
        require("mini.pairs").setup()
    end,
},
{
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
},
{
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
}
})
vim.g.mapleader = " "
require("keymaps")
    --opt looks 
vim.opt.number = true
vim.opt.relativenumber = false

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.opt.smartindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.clipboard = "unnamedplus"

vim.lsp.enable("clangd")
vim.lsp.enable("basedpyright")
