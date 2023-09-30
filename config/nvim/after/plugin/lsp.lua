local lsp_zero = require('lsp-zero').preset({
    name = 'recommended',
})

-- cmp
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
    })
})

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({
        buffer = bufnr,
        exclude = { '<F2>', '<F3>', '<F4>' },
    })

    -- custom bindings
    vim.keymap.set("n", "gc", vim.lsp.buf.incoming_calls)
    vim.keymap.set("n", ",gr", vim.lsp.buf.rename)
    vim.keymap.set("n", ",ga", vim.lsp.buf.code_action)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
    -- XXX: or we could auto format on save?
    vim.keymap.set("n", ",gf", vim.lsp.buf.format)
    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
    vim.keymap.set("n", ".,", vim.lsp.buf.document_symbol)
end)

lsp_zero.set_sign_icons = ({
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
        lsp_zero.default_setup,
        lua_ls = function()
            -- lua specific settings
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end
    }
})

-- setup
lsp_zero.setup()
