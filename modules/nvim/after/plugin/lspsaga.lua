require('lspsaga').setup({
   -- Use navic to put breadcrumbs in lualine
   symbol_in_winbar = { enable = false },
   lightbulb = {
      sign = false,
   },
})

vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', { silent = true, remap = false })
vim.keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', { silent = true, remap = false })
vim.keymap.set('n', 'do', '<cmd>lua vim.diagnostic.open_float()<CR>', { silent = true, remap = false })
vim.keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<CR>', { silent = true, remap = false })
vim.keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', { silent = true, remap = false })
-- vim.keymap.set('n', 'K', vim.lsp.buf.hover, { silent = true, remap = false })
