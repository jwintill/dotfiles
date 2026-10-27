-- extremely minimal for now

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.hlsearch = false
opt.smartcase = true
opt.ignorecase = true
opt.mouse = "a"
opt.cursorline = true
opt.swapfile = false
opt.completeopt = { "menu", "menuone", "noinsert" }
opt.guicursor = "a:block-Cursor"
opt.textwidth = 0
opt.wrapmargin = 0
opt.wrap = true
opt.linebreak = true

-- use the system clipboard
opt.clipboard:append("unnamedplus")

-- plugins (vim-plug)
local Plug = vim.fn["plug#"]
vim.call("plug#begin")
Plug("dylanaraps/wal.vim")
Plug("MeanderingProgrammer/render-markdown.nvim")
Plug("MunifTanjim/nui.nvim")
Plug("m4xshen/hardtime.nvim")
Plug("nvim-mini/mini.icons")
Plug("nvim-tree/nvim-web-devicons")
vim.call("plug#end")

require("hardtime").setup()

-- markdown rendering
pcall(function() require("mini.icons").setup() end)
pcall(function() require("nvim-web-devicons").setup() end)
pcall(function() require("render-markdown").setup({}) end)

-- folds
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevelstart = 99

-- colorscheme for nvim
vim.o.termguicolors = true
vim.cmd.colorscheme("habamax")
