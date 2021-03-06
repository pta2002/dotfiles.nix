print('LSP server started')

local map = function(type, key, value)
  vim.fn.nvim_buf_set_keymap(0, type, key, value, {
    noremap = true,
    silent = true
  })
end

vim.api.nvim_command('setlocal omnifunc=v:lua.vim.lsp.omnifunc')

map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
-- TODO Find a way to show this on hover
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
map('n','gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
map('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
map('n','<leader>ah','<cmd>lua vim.lsp.buf.hover()<CR>')
map('n','<leader>af','<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n','<leader>ee','<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
map('n','<leader>ar','<cmd>lua vim.lsp.buf.rename()<CR>')
map('n','<leader>ff', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map('n','<leader>ai','<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
map('n','<leader>ao','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')

vim.api.nvim_command('autocmd! CursorHold * lua vim.lsp.buf.hover()')
vim.api.nvim_command('setlocal ut=500')
