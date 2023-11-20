require("hyunchel.set")
require("hyunchel.remap")
require("hyunchel.packer")

-- autogroups
-- local hyunchel = vim.api.nvim_create_augroup("hyunchel", { clear = true })
local hyunchel = vim.api.nvim_create_augroup("hyunchel", {})
local noir = vim.api.nvim_create_augroup("noir", {})

-- highlight symbol on cursor position
-- don't know how to do this elegant yet.
local lspFilePattern = "*.go,*.rs,*.hs,*.js,*.ts,*.lua"
vim.api.nvim_create_autocmd("CursorHold", {
    group = "hyunchel",
    pattern = lspFilePattern,
    callback = function()
        vim.lsp.buf.document_highlight()
    end,
    desc = "Highlight symbol on cursor hold.",
})
vim.api.nvim_create_autocmd("CursorHoldI", {
    group = "hyunchel",
    pattern = lspFilePattern,
    callback = function()
        vim.lsp.buf.document_highlight()
    end,
    desc = "Highlight symbol on cursor hold insert.",
})
vim.api.nvim_create_autocmd("CursorMoved", {
    group = "hyunchel",
    pattern = lspFilePattern,
    callback = function()
        vim.lsp.buf.clear_references()
    end,
    desc = "Clear highlights of a symbol on cursor move.",
})

-- format on save
vim.api.nvim_create_autocmd("BufWritePre", {
    group = "hyunchel",
    pattern = lspFilePattern,
    callback = function()
        vim.lsp.buf.format()
    end,
    desc = "Format on save.",
})

-- noir
vim.api.nvim_create_autocmd("BufRead", {
    group = "noir",
    pattern = "*.nr",
    callback = function()
        vim.bo.filetype = "noir"
    end,
    desc = "Set filetype to noir.",
})
