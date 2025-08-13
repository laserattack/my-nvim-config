

-- Базовые настройки


-- Для нормального взамодействия с системным буфером
vim.opt.clipboard = "unnamedplus"
-- Относительные номера строк
vim.opt.relativenumber = true
-- Чтобы не было разбиения строки если она не помещается в ширину экрана
vim.opt.wrap = false
vim.wo.linebreak = true
-- Оффест скролла чтобы не нужно было доходить до самого низа
-- при скролле на стрелочки на клавиатуре
vim.opt.scrolloff = 8
-- Таб = 4 пробела
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
-- alt+w - циклическое переключение между окнами
vim.keymap.set("n", "<A-w>", "<C-w>w", { silent = true })
-- Tab/Shift-Tab для сдвига текста в визуальном режиме 
vim.keymap.set("v", "<Tab>", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true, silent = true })


-- Настройки плагинов


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
require("lazy").setup({
    -- Дерево директорий
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup()
            local nvt_api = require("nvim-tree.api")
            -- Открытие дерева директорий при запуске
            vim.api.nvim_create_autocmd("VimEnter", {
                callback = function ()
                    nvt_api.tree.open()
                    vim.cmd("wincmd p")
                end
            })
            -- При закрытии файла дерево директорий также закрывается
            vim.api.nvim_create_autocmd("QuitPre", {
                callback = function()
                    if nvt_api.tree.winid() ~= nil then
                        nvt_api.tree.close()
                    end
                end,
            })
            -- alt+e - открыть/закрыть меню директорий
            vim.keymap.set("n", "<A-e>", ":NvimTreeToggle<CR>", { silent = true })
            -- alt+1 - уменьшить ширину меню директорий на 5 символов
            vim.keymap.set("n", "<A-1>", ":NvimTreeResize -5<CR>", { silent = true })
            -- alt+2 - увеличить ширину меню директорий на 5 символов
            vim.keymap.set("n", "<A-2>", ":NvimTreeResize +5<CR>", { silent = true })
        end
    },
    -- Цветовая тема
    { 
        "rebelot/kanagawa.nvim",
        config = function() 
            vim.cmd("colorscheme kanagawa-wave")
            -- Фон у колонки с номерами строк выключаю
            vim.cmd([[
                highlight! LineNr guibg=NONE ctermbg=NONE
            ]])
        end
    },
})
