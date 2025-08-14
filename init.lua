-- Комбинации клавиш


--- Базовые
---- alt+e - открыть/закрыть меню дерева директорий
---- alt+1 - уменьшить ширину меню дерева директорий на 5 символов  
---- alt+2 - увеличить ширину меню дерева директорий на 5 символов
---- alt+w - циклическое переключение между окнами
---- alt+z - включить/выключить режим при котором текст в строке если не помещается в экран переносятся на другую строку
---- alt+` - открыть терминал в новой вкладке + сразу переходит в режим терминала (выход из режима терминала - ESC)
---- alt+3 - перейти на предыдущую вкладку (можно использовать для циклического переключения между вкладками)
---- alt+4 - перейти на следующую вкладку (можно использовать для циклического переключения между вкладками)
--- Работа с текстом
---- tab/shift+tab - сдвиг выделенного текста в визуальном режиме на 1 tab вправо/влево
---- y - копировать выделенный текст
---- yy - копировать выделенную строку 
---- d - вырезать выделенный текст
---- dd - вырезать выделенную строку


-- Базовые настройки


-- Для нормального взамодействия с системным буфером
vim.opt.clipboard = "unnamedplus"
-- Отключение swap файлов
vim.opt.swapfile = false
-- Относительные номера строк
vim.opt.number = true
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
-- alt+z - vim.opt.wrap = false/true
vim.keymap.set('n', '<A-z>', function() vim.opt.wrap = not vim.opt.wrap:get() end, { silent = true })
-- alt+` - открыть терминал в новой вкладке + сразу заходит в режим терминала
vim.keymap.set('n', '<A-`>', ':tabnew | terminal<CR>i', { noremap = true, silent = true })
-- Выход из режима терминала используя esc
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
-- alt+3 - Перейти на пред. вкладку
vim.keymap.set('n', '<A-3>', ':tabprevious<CR>', { noremap = true, silent = true })
-- alt+4 - Перейти на след. вкладку
vim.keymap.set('n', '<A-4>', ':tabnext<CR>', { noremap = true, silent = true })


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
