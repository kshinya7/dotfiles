require('nvim-treesitter.configs').setup {
    -- A list of parser names, or "all"
    ensure_installed = { "javascript", "typescript","sql", "php", "markdown_inline", "bash", "c", "lua", "html", "json", "latex", "go", "ruby", "scss", "yaml", "typescript", "python", "java", "css", "vimdoc", "vim", "query"},

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    highlight = {
        enable = true,

        -- list of language that will be disabled
        disable = { "latex" },
    },
}
