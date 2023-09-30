local lsp = require('lsp-zero').preset({
    name = 'recommended',
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	['<C-Space>'] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
	mappings = cmp_mappings,
})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({
      buffer = bufnr,
      exclude = {'<F2>', '<F3>', '<F4>'},
  })

  -- custom bindings
  vim.keymap.set("n", ",gr", vim.lsp.buf.rename)
  vim.keymap.set("n", ",ga", vim.lsp.buf.code_action)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
  -- XXX: or we could auto format on save?
  vim.keymap.set("n", ",gf", vim.lsp.buf.format)
  vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
  vim.keymap.set("n", ".,", vim.lsp.buf.document_symbol)
end)

lsp.set_sign_icons = ({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
})

-- mason
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'tsserver',
    'rust_analyzer',
    'lua_ls',
    'gopls',
    'hls',
  },
  handlers = {
    lsp.default_setup,
  }
})

-- lua specific settings
local lua_opts = lsp.nvim_lua_ls()
require('lspconfig').lua_ls.setup(lua_opts)

-- setup
lsp.setup()
