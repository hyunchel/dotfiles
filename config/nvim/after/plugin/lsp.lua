local lsp_zero = require('lsp-zero').preset({
    name = 'recommended',
})

-- cmp
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    window = {
        documentation = cmp.config.window.bordered(),
    },
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
    --[[ defaults
        K: Displays hover information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.hover().
        gd: Jumps to the definition of the symbol under the cursor. See :help vim.lsp.buf.definition().
        gD: Jumps to the declaration of the symbol under the cursor. Some servers don't implement this feature. See :help vim.lsp.buf.declaration().
        gi: Lists all the implementations for the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.implementation().
        go: Jumps to the definition of the type of the symbol under the cursor. See :help vim.lsp.buf.type_definition().
        gr: Lists all the references to the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.references().
        gs: Displays signature information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.signature_help(). If a mapping already exists for this key this function is not bound.
        gl: Show diagnostics in a floating window. See :help vim.diagnostic.open_float().
        [d: Move to the previous diagnostic in the current buffer. See :help vim.diagnostic.goto_prev().
        ]d: Move to the next diagnostic. See :help vim.diagnostic.goto_next().
    --]]

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

-- add noir lsp
local lspconfig = require 'lspconfig'
local configs = require 'lspconfig.configs'
if not configs.noir_lsp then
    configs.noir_lsp = {
        default_config = {
            cmd = { 'nargo', 'lsp' },
            root_dir = lspconfig.util.root_pattern('.git'),
            filetypes = { 'noir' },
        },
    }
end
lspconfig.noir_lsp.setup {}

-- setup
lsp_zero.setup()
