require('telescope').setup({
    defaults = {
        file_ignore_patterns = { '.*.min.css', '.*.min.js' },
    },
})

local builtin = require('telescope.builtin')
-- files
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep For > ") })
end, {})
vim.keymap.set('n', '<leader>pr', builtin.live_grep, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})

-- helpful
vim.keymap.set('n', '<leader>mp', builtin.man_pages, {})
vim.keymap.set('n', '<leader>ch', builtin.command_history, {})
vim.keymap.set('n', '<leader>sh', builtin.search_history, {})
vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, {})

-- LSPs
vim.keymap.set('n', '<leader>li', builtin.lsp_implementations, {})
vim.keymap.set('n', '<leader>lr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>lc', builtin.lsp_incoming_calls, {})
vim.keymap.set('n', '<leader>loc', builtin.lsp_outgoing_calls, {})
vim.keymap.set('n', '<leader>ld', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>lw', builtin.lsp_workspace_symbols, {})
vim.keymap.set('n', '<leader>ldw', builtin.lsp_dynamic_workspace_symbols, {})
