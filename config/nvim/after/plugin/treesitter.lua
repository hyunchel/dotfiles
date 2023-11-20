-- add noir
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.noir = {
    install_info = {
        url = "https://github.com/hhamud/tree-sitter-noir", -- the url for this tree-sitter grammar
        files = { "src/parser.c", "src/scanner.c" },
        branch = "main",
    },
    filetype = "noir", -- if filetype does not agrees with parser name you can define this field
}

require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "javascript", "typescript", "rust", "go", "c", "lua", "vim", "vimdoc", "query", "python",
        "haskell", "noir" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    highlight = {
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
}
