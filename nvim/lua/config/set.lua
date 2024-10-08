vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "120"

vim.opt.encoding = 'utf-8'
vim.opt.laststatus = 2
vim.opt.showmatch = true
vim.opt.splitbelow = true
vim.opt.ruler = true

vim.opt.spell = true
vim.opt.spelllang = "en_us"
vim.opt.spellsuggest = "best,9"

vim.opt.mouse = "r"

vim.lsp.set_log_level='debug'

vim.opt.list = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
