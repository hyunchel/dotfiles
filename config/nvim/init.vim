set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

lua << EOF
local custom_lsp_attach = function(client)

  -- Mappings.
  vim.api.nvim_buf_set_keymap(0, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})

end

local servers = {'pyright', 'rust_analyzer', 'tsserver', 'gopls'}
for _, lsp in ipairs(servers) do
    require('lspconfig')[lsp].setup {
      on_attach = custom_lsp_attach
    }
end

-- Load custom lua plugins
require('wikimatter')

EOF
