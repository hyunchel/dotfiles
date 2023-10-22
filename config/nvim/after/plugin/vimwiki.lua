-- config
vim.g.vimwiki_list = { {
    path = '~/wiki',
    ext = '.md',
    -- auto_toc = 1,
} }
vim.g.vimwiki_key_mappings = {
    table_mappings = 0,
    table_format = 0,
    html = 0,
}
vim.g.vimwiki_global_ext = 0
vim.g.vimwiki_conceallevel = 2
vim.g.vimwiki_markdown_link_ext = 1
vim.g.vimwiki_folding = 'expr'

-- mappings
vim.keymap.set("n", "<leader>vwi", "<cmd>VimwikiIndex<CR>")
vim.keymap.set("n", "<leader>vwd", "<cmd>VimwikiDiaryIndex<CR>")
vim.keymap.set("n", "<leader>vwmd", "<cmd>VimwikiMakeDiaryNote<CR>")
vim.keymap.set("n", "<leader>vwgd", "<cmd>VimwikiDiaryGenerateLinks<CR>")

-- reload variables
vim.fn['vimwiki#vars#init']()
