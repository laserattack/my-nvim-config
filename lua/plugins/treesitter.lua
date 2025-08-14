-- Настройка treesitter`a

return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "c", "lua", "zig" },
            sync_install = false,
            auto_install = false,
            highlight = {
                enable = true,
            },
        })
    end
}
