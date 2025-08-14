-- Настройка treesitter`a

return  { 
    "nvim-treesitter/nvim-treesitter",
    ensure_installed = { "c", "lua", "go" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
}
