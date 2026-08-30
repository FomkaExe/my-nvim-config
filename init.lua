---- Vim options
-- visual
vim.o.number = true
vim.o.relativenumber = true
vim.o.showmode = true
vim.o.signcolumn = 'yes'

-- search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true

-- Indentation and wrapping
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.smartindent = true
vim.o.wrap = true
vim.o.scrolloff = 8

-- Folding
vim.opt.foldmethod = "syntax"
-- vim.opt.foldlevelstart = 2
-- vim.opt.foldlevel  = 99
vim.opt.foldnestmax = 1
vim.opt.foldcolumn = "0"

-- Colors
vim.opt.colorcolumn = {"80", "100"}
vim.opt.termguicolors = true

vim.o.updatetime = 700
vim.o.timeout = true
vim.o.timeoutlen = 200
vim.o.ttimeoutlen = 10

vim.opt.winborder = "rounded"

-- Leader & copy-paste
vim.g.mapleader = vim.keycode('<Space>')
vim.keymap.set({'n', 'x'}, 'gy', '"+y', {desc = 'Copy to clipboard'})
vim.keymap.set({'n', 'x'}, 'gp', '"+p', {desc = 'Paste clipboard content'})

-- Colour theme

local ok_theme = pcall(vim.cmd.colorscheme, 'tokyonight')
if not ok_theme then
	vim.cmd.colorscheme('habamax')
end

-- Plugins

-- -- clangd
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client or client.name ~= "clangd" then
      return
    end

    local bufnr = args.buf

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
      buffer = bufnr,
      silent = true,
      noremap = true,
      desc = "Go to definition"
    })
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {
      buffer = bufnr,
      silent = true,
      noremap = true,
      desc = "Go to declaration"
    })
    vim.keymap.set("n", "<leader>d", "<cmd>LspClangdSwitchSourceHeader<CR>", opts)
    vim.keymap.set("n", "<leader>s", "<cmd>LspClangdShowSymbolInfo<CR>", opts)
  end,
})

vim.lsp.enable('clangd')

-- -- nvim-cmp
local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "buffer" },
  }),
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- -- classlayout.nvim
require("classlayout").setup({
  keymap = "<leader>c",
  compiler = "clang",
  args = {},
  compile_commands = true,
  { desc = "Class layout" }
})

-- -- Diagnostic setup

vim.diagnostic.config({
  signs = true,
  inderline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {desc = "Open diagnostic"})

vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format({ async = true })
end,
{ desc = "Clang-format" })

-- nvim-web-devicons
require('nvim-web-devicons').setup()


