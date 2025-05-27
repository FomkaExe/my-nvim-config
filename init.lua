-- Vim options

vim.o.number = true
vim.o.wrap = true

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true

vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.o.showmode = true

vim.o.termguicolors = true

vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.signcolumn = 'yes'

vim.g.mapleader = vim.keycode('<Space>')
vim.keymap.set({'n', 'x'}, 'gy', '"+y', {desc = 'Copy to clipboard'})
vim.keymap.set({'n', 'x'}, 'gp', '"+p', {desc = 'Paste clipboard content'})

-- Colour theme

local ok_theme = pcall(vim.cmd.colorscheme, 'tokyonight')
if not ok_theme then
	vim.cmd.colorscheme('habamax')
end

-- Plugins

-- -- mini.nvim setup
require('mini.files').setup({})
vim.keymap.set('n', '<leader>e', '<cmd>lua MiniFiles.open()<cr>', {desc='File Explorer'})

require('mini.snippets').setup({})
require('mini.completion').setup({})
require('mini.icons').setup({})
require('mini.starter').setup({
	header = 'Emacs',
})
require('mini.comment').setup({
	options = {
		custom_commentstring = nil,
		ignore_blank_line = false,
		start_of_line = false,
		pad_comment_parts = true,
	},
	mappings = {
		comment = '<leader>c',
		comment_line = '<leader>cc',
		comment_visual = '<leader>c',
		textobject = '<leader>c',
	},
	hooks = {
		pre = function() end,
		post = function() end,
	},
})

-- -- clangd setup

vim.lsp.enable('clangd')
require("clangd_extensions").setup({})

-- -- clangd keybinds

vim.keymap.set('n', '<leader>d', '<cmd>ClangdSwitchSourceHeader<cr>', {desc='Goto definition'})

vim.keymap.set('n', '<leader>a', '<cmd>ClangdAST<cr>', {desc='Abstract Syntax Tree'})
vim.keymap.set('x', '<leader>a', '<cmd>\'<,\'>ClangdAST<cr>', {desc='Abstract Syntax Tree'})

vim.keymap.set('n', '<leader>t', '<cmd>ClangdTypeHierarchy<cr>', {desc='Type hierarchy'})
