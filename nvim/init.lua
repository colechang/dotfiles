-----------------------------------------------------------
-- Minimal Neovim Config
-- Everforest + LSP + Treesitter + Telescope
-----------------------------------------------------------


-----------------------------------------------------------
-- Leader
-----------------------------------------------------------

vim.g.mapleader = " "
vim.g.maplocalleader = " "


-----------------------------------------------------------
-- Options
-----------------------------------------------------------

local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true

opt.wrap = false

opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true

opt.signcolumn = "yes"

opt.cursorline = true

opt.scrolloff = 8

opt.updatetime = 250

opt.clipboard = "unnamedplus"

opt.splitright = true
opt.splitbelow = true


-----------------------------------------------------------
-- Keymaps
-----------------------------------------------------------

local map = vim.keymap.set

map("n", "<leader>w", "<cmd>w<CR>")
map("n", "<leader>q", "<cmd>q<CR>")

map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>")

-- Oil file explorer
map("n", "<leader>e", "<cmd>Oil<CR>")


-----------------------------------------------------------
-- lazy.nvim bootstrap
-----------------------------------------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

-----------------------------------------------------------
-- Plugins
-----------------------------------------------------------

require("lazy").setup({

    -------------------------------------------------------
    -- Theme
    -------------------------------------------------------

    {
        "neanias/everforest-nvim",
        priority = 1000,

        config = function()
            require("everforest").setup({
                background = "hard",

                italics = true,
            })

            vim.cmd.colorscheme("everforest")
        end,
    },


    -------------------------------------------------------
    -- Treesitter
    -------------------------------------------------------

    {
        "nvim-treesitter/nvim-treesitter",

        build = ":TSUpdate",

        config = function()

            require("nvim-treesitter").setup({

                ensure_installed = {
                    "lua",
                    "vim",
                    "vimdoc",
                    "bash",
                    "python",
                    "javascript",
                    "json",
                    "yaml",
                    "markdown",
                    "c",
                    "cpp"
                },

                highlight = {
                    enable = true,
                },

            })

        end,
    },


    -------------------------------------------------------
    -- Telescope
    -------------------------------------------------------

    {
        "nvim-telescope/telescope.nvim",

        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },


    -------------------------------------------------------
    -- Goyo
    -------------------------------------------------------
    {
        "junegunn/goyo.vim",
        cmd = "Goyo", -- Loads only when the command is called
    },


    -------------------------------------------------------
    -- Oil file manager
    -------------------------------------------------------

    {
        "stevearc/oil.nvim",

        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },

        config = true,
    },


    -------------------------------------------------------
    -- Mini.nvim utilities
    -------------------------------------------------------

    {
        "echasnovski/mini.nvim",

        version = false,

        config = function()

            require("mini.pairs").setup()
            require("mini.surround").setup()
            require("mini.comment").setup()

        end,
    },


    -------------------------------------------------------
    -- LSP
    -------------------------------------------------------

   {
        "neovim/nvim-lspconfig",

        dependencies = {

            {
                "williamboman/mason.nvim",

                config = true,
            },

            {
                "williamboman/mason-lspconfig.nvim",
            },

        },


        config = function()

            require("mason-lspconfig").setup({

                ensure_installed = {
                    "lua_ls",
                    "pyright",
                    "clangd",
                },

            })


            local capabilities =
                vim.lsp.protocol.make_client_capabilities()


            local servers = {
                "lua_ls",
                "pyright",
                "clangd",
            }


            for _, server in ipairs(servers) do

                vim.lsp.config(server, {
                    capabilities = capabilities,
                })

                vim.lsp.enable(server)

            end


        end,
    }, 

    -------------------------------------------------------
    -- Completion
    -------------------------------------------------------

    {
        "saghen/blink.cmp",

        version = "1.*",

        dependencies = {
            "rafamadriz/friendly-snippets",
        },

        opts = {

            keymap = {
                preset = "default",
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


})


-----------------------------------------------------------
-- Extra UI tweaks
-----------------------------------------------------------

vim.cmd([[
highlight Normal guibg=NONE
highlight NormalNC guibg=NONE
]])

----------------------------------------------------------
-- Theme Colours Specs
-----------------------------------------------------------
vim.g.everforest_background = "hard"
vim.g.everforest_transparent_background = 0

vim.cmd.colorscheme("everforest")
