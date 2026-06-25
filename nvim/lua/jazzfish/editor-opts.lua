local vim = vim
local g = vim.g -- a table to access global variables
local opt = vim.opt -- to set options

vim.cmd [[syntax on]]
vim.cmd [[filetype indent plugin on]]

vim.keymap.set('', '<Space>', '<Nop>', {noremap = true, silent = false})
g.mapleader = " "
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
opt.termguicolors = true

opt.relativenumber = false
opt.modifiable = true
opt.belloff = 'all'
opt.errorbells = false
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false
opt.hlsearch = false
opt.scrolloff = 8
opt.number = true
opt.hidden = true
opt.cmdheight = 0
opt.laststatus = 3
opt.mouse = ""

-- -- setting the colortheme
g.colorscheme = "github"
-- g.colorscheme = "gruvbox"
-- g.colorscheme = "everforest"
-- g.colorscheme = "cyberdream"
-- g.colorscheme = "ayu-light"
-- g.colorscheme = "nightfox"
-- g.colorscheme = "kanagawa"
-- g.colorscheme = "rose-pine"
-- g.colorscheme = 'acme'
-- g.colorscheme = 'koda'
require("jazzfish.system-appearance").setup()

if vim.o.background == 'light' then
    -- Seed bottom-row UI highlights before the colorscheme and lualine load.
    -- Neovim's built-in light-mode StatusLine defaults are still dark.
    vim.api.nvim_set_hl(0, 'StatusLine', {fg = '#797593', bg = '#fffaf3'})
    vim.api.nvim_set_hl(0, 'StatusLineNC', {fg = '#9893a5', bg = '#fdf8f1'})
    vim.api.nvim_set_hl(0, 'StatusLineTerm', {fg = '#797593', bg = '#fffaf3'})
    vim.api.nvim_set_hl(0, 'StatusLineTermNC', {fg = '#9893a5', bg = '#fdf8f1'})
    vim.api.nvim_set_hl(0, 'MsgSeparator', {fg = '#797593', bg = '#fffaf3'})
    vim.api.nvim_set_hl(0, 'MsgArea', {fg = '#464261', bg = '#faf4ed'})
end

opt.updatetime = 500
opt.redrawtime = 1000 -- ms to wait for syntax highlighting
opt.synmaxcol = 240 -- max column for syntax highlighting

-- ignore the file type for csv files since they are very slow
-- when we use the built in noevim identifiers
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"},
                            {pattern = "*.csv", command = "set filetype="})

opt.swapfile = false
opt.backup = false

opt.colorcolumn = '95'
opt.signcolumn = 'yes'

g.python3_host_prog = '/usr/bin/python3'
