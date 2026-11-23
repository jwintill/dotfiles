-- extremely minimal for now

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local opt = vim.opt

opt.termguicolors = true
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
Plug("morhetz/gruvbox")
Plug("dylanaraps/wal.vim")
Plug("MeanderingProgrammer/render-markdown.nvim")
Plug("MunifTanjim/nui.nvim")
Plug("m4xshen/hardtime.nvim")
Plug("nvim-tree/nvim-tree.lua")
Plug("nvim-tree/nvim-web-devicons")
Plug("nvim-lua/plenary.nvim")
Plug("BurntSushi/ripgrep")
Plug("sharkdp/fd")
Plug("nvim-telescope/telescope.nvim")
Plug("nvim-mini/mini.icons")
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

-- empty setup using defaults
require("nvim-tree").setup()

-- telescope keymaps (leader is '\')
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files)   -- fuzzy-find a file by name
vim.keymap.set("n", "<leader>fg", builtin.live_grep)    -- search text in every file (uses rg)
vim.keymap.set("n", "<leader>fb", builtin.buffers)      -- switch between open buffers
vim.keymap.set("n", "<leader>fr", builtin.oldfiles)     -- recently opened files
vim.keymap.set("n", "<leader>fh", builtin.help_tags)    -- search nvim's help
vim.keymap.set("n", "<leader>fk", builtin.keymaps)      -- search every keymap you have
vim.keymap.set("n", "<leader>f.", builtin.resume)       -- reopen the last picker

-- nvim-tree keymaps
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>E", ":NvimTreeFindFile<CR>")  -- open the tree and jump to the current file

-- colorscheme for nvim
vim.o.termguicolors = true
vim.cmd.colorscheme("gruvbox")
