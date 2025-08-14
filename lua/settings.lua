-- Базовые настройки (не относящиеся к плагинам)

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
