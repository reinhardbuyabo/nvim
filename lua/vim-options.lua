vim.cmd("set guicursor=")

vim.cmd("set number")
vim.cmd("set relativenumber")

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.cmd("set smartindent")

vim.cmd("set nowrap")

vim.cmd("set noswapfile")
vim.cmd("set nobackup")
vim.cmd("set undodir=" .. os.getenv("HOME") .. "/.vim/undodir")
vim.cmd("set undofile")

vim.cmd("set nohlsearch")
vim.cmd("set incsearch")

vim.cmd("set scrolloff=8")
vim.cmd("set signcolumn=yes")
vim.cmd("set isfname+=@-@")

vim.cmd("set updatetime=50")

vim.cmd("set colorcolumn=80")

vim.g.mapleader = " "

-- Diagnostic UI tweaks
vim.diagnostic.config {
  virtual_text = false,
  float = {
    header = false,
    border = 'rounded',
    focusable = true,
  },
}

