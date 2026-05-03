local ok, wk = pcall(require, "which-key")
if not ok then
  return
end

wk.setup({
  delay = 0, -- show immediately after prefix
  win = { border = "rounded" },
})

-- Group labels (so <space> menu feels like Helix's command space)
wk.add({
  { "<leader>f", group = "file" },
  { "<leader>b", group = "buffer" },
  { "<leader>w", group = "window" },
  { "<leader>s", group = "search" },
  { "<leader>g", group = "goto" },
  { "<leader>c", group = "code" },
  { "<leader>t", group = "toggle" },
  { "<leader>q", group = "quit" },
})

local map = vim.keymap.set

-- Show the menu immediately when pressing <space> in normal/visual mode
map({ "n", "x" }, "<leader>", function()
  wk.show("<leader>")
end, { desc = "command palette" })

-- FILE
map("n", "<leader>ff", function()
  vim.cmd("edit " .. vim.fn.input("Open file: ", "", "file"))
end, { desc = "find/open file" })
map("n", "<leader>fs", "<cmd>write<cr>", { desc = "save file" })
map("n", "<leader>fS", "<cmd>wall<cr>", { desc = "save all files" })
map("n", "<leader>fr", "<cmd>edit #<cr>", { desc = "recent/alternate file" })

-- BUFFER
map("n", "<leader>bb", "<cmd>ls<cr>:buffer<space>", { desc = "switch buffer" })
map("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "next buffer" })
map("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "previous buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "delete buffer" })

-- WINDOW
map("n", "<leader>wh", "<C-w>h", { desc = "focus left" })
map("n", "<leader>wl", "<C-w>l", { desc = "focus right" })
map("n", "<leader>wk", "<C-w>k", { desc = "focus up" })
map("n", "<leader>wj", "<C-w>j", { desc = "focus down" })
map("n", "<leader>wv", "<C-w>v", { desc = "vertical split" })
map("n", "<leader>ws", "<C-w>s", { desc = "horizontal split" })
map("n", "<leader>wc", "<C-w>c", { desc = "close window" })
map("n", "<leader>wo", "<C-w>o", { desc = "only window" })

-- SEARCH
map("n", "<leader>ss", "<cmd>set hlsearch!<cr>", { desc = "toggle search highlight" })
map("n", "<leader>sw", "*", { desc = "search word under cursor" })
map("n", "<leader>sn", "n", { desc = "next search match" })
map("n", "<leader>sp", "N", { desc = "previous search match" })

-- GOTO
map("n", "<leader>gd", vim.lsp.buf.definition, { desc = "definition" })
map("n", "<leader>gr", vim.lsp.buf.references, { desc = "references" })
map("n", "<leader>gi", vim.lsp.buf.implementation, { desc = "implementation" })
map("n", "<leader>gt", vim.lsp.buf.type_definition, { desc = "type definition" })

-- CODE
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "code action" })
map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "rename symbol" })
map("n", "<leader>cf", function() vim.lsp.buf.format({ async = true }) end, { desc = "format buffer" })
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "line diagnostics" })

-- TOGGLE
map("n", "<leader>tn", "<cmd>set number!<cr>", { desc = "line numbers" })
map("n", "<leader>tr", "<cmd>set relativenumber!<cr>", { desc = "relative numbers" })
map("n", "<leader>tw", "<cmd>set wrap!<cr>", { desc = "wrap" })

-- QUIT
map("n", "<leader>qq", "<cmd>confirm quit<cr>", { desc = "quit" })
map("n", "<leader>qQ", "<cmd>confirm qall<cr>", { desc = "quit all" })
