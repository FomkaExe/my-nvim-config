-- https://vonheikemen.github.io/devlog/tools/build-your-first-lua-config-for-neovim/
-- Props to that dude

vim.o.number = true
vim.o.wrap = true

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true

vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.o.showmode = true --?

vim.o.termguicolors = true

vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.signcolumn = 'yes'

vim.g.mapleader = ' '
vim.keymap.set({'n', 'x'}, 'gy', '"+y', {desc = 'Copy to clipboard'})
vim.keymap.set({'n', 'x'}, 'gp', '"+p', {desc = 'Paste clipboard content'})

local ok_theme = pcall(vim.cmd.colorscheme, 'tokyonight')
if not ok_theme then
	vim.cmd.colorscheme('habamax')
end

require('mini.files').setup({})
vim.keymap.set('n', '<leader>e', '<cmd>lua MiniFiles.open()<cr>', {desc='File Explorer'})

require('mini.snippets').setup({})
require('mini.completion').setup({})
require('mini.icons').setup({})
require('mini.starter').setup({
	header = 'Emacs',
})

-- I don't know if I need it
--[[ vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'LSP actions',
	callback = function(event)
		local opts = {buffer = event.buf}

		-- Display documentation of the symbol under the cursor
		vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)

		-- Jump to the definition
		vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)

		-- Format current file
		vim.keymap.set({'n', 'x'}, 'gq', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)

		-- Displays a function's signature information
		vim.keymap.set('i', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)

		-- Jump to declaration
		vim.keymap.set('n', '<leader>ld', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)

		-- Lists all the implementations for the symbol under the cursor
		vim.keymap.set('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)

		-- Jumps to the definition of the type symbol
		vim.keymap.set('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)

		-- Lists all the references
		vim.keymap.set('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)

		-- Renames all references to the symbol under the cursor
		vim.keymap.set('n', '<leader>ln', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)

		-- Selects a code action available at the current cursor position
		vim.keymap.set('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
	end,
	})
} ]]
