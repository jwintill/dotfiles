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
Plug("MeanderingProgrammer/render-markdown.nvim")
Plug("MunifTanjim/nui.nvim")
Plug("m4xshen/hardtime.nvim")
Plug("nvim-tree/nvim-tree.lua")
Plug("nvim-tree/nvim-web-devicons")
Plug("nvim-lua/plenary.nvim")
Plug("nvim-telescope/telescope.nvim")
Plug("neovim/nvim-lspconfig")
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-path")
Plug("hrsh7th/cmp-cmdline")
Plug("hrsh7th/nvim-cmp")
Plug("hrsh7th/cmp-vsnip")
Plug("hrsh7th/vim-vsnip")
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })
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
vim.cmd.colorscheme("gruvbox")

-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
    vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered({
      max_height = 5,
    }),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
  }),
  sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
    }, {
      { name = 'buffer' },
  })
})

-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
-- Set configuration for specific filetype.
--[[ cmp.setup.filetype('gitcommit', {
sources = cmp.config.sources({
{ name = 'git' },
}, {
{ name = 'buffer' },
})
})
require("cmp_git").setup() ]]--

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
mapping = cmp.mapping.preset.cmdline(),
sources = {
  { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
mapping = cmp.mapping.preset.cmdline(),
sources = cmp.config.sources({
  { name = 'path' }
  }, {
  { name = 'cmdline' }
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})

-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("clangd", {
  capabilities = capabilities,
})
vim.lsp.enable("clangd")
