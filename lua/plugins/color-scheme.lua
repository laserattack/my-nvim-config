-- Настройки цветовой темы

return  {
    "rebelot/kanagawa.nvim",
    config = function()
        vim.cmd("colorscheme kanagawa-wave")
        -- Фон у колонки с номерами строк выключаю
        vim.cmd([[
            highlight! LineNr guibg=NONE ctermbg=NONE
        ]])
    end
}
