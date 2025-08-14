-- Настройка менеджера плагинов

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Подключаемые плагины
local plugins = {
    -- Дерево директорий
    require("lua/plugins/nvim-tree"),
    -- Цветовая тема
    require("lua/plugins/color-scheme"),
}

require("lazy").setup(plugins)
