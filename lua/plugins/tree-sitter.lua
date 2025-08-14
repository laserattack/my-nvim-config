-- Настройка treesitter`a

return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "c", "cpp", "lua", "zig", "python" },
            sync_install = false,
            auto_install = false,
            highlight = {
                enable = true,
                -- Эти парсеры почему то устанавливаются по умолчанию
                -- и там кривое нижнее подчеркивание у ссылок в моем xfce терминале
                disable = {
                    "markdown",
                    "markdown_inline",
                }
            },
        })
    end
}
