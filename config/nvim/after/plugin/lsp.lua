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
end)

--[[
lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)

  -- XXX not sure what this is
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)

  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

  -- vim.keymap.set("n", "test", function() print("test") end, opts)
end)
--]]

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
  },
  handlers = {
    lsp.default_setup,
  }
})

lsp.setup()
