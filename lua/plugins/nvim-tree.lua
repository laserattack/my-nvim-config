-- Настройки дерева директорий

return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("nvim-tree").setup({
            filters = {
                git_ignored = false,
            }
        })
        local nvt_api = require("nvim-tree.api")
        -- Открытие дерева директорий при запуске nvim, при открытии новой вкладки
        local function open_nvim_tree()
            if not nvt_api.tree.is_visible() then
                nvt_api.tree.open()
                vim.cmd("wincmd p")  -- Возвращаем фокус в предыдущее окно
            end
        end
        vim.api.nvim_create_autocmd("TabNew", { callback = open_nvim_tree })
        vim.api.nvim_create_autocmd("VimEnter", { callback = open_nvim_tree })
        -- При закрытии файла дерево директорий также закрывается
        vim.api.nvim_create_autocmd("QuitPre", {
            callback = function()
                if nvt_api.tree.winid() ~= nil then
                    nvt_api.tree.close()
                end
            end,
        })
        -- alt+e - открыть/закрыть меню директорий
        vim.keymap.set("n", "<A-e>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
        -- alt+1 - уменьшить ширину меню директорий на 5 символов
        vim.keymap.set("n", "<A-1>", ":NvimTreeResize -5<CR>", { noremap = true, silent = true })
        -- alt+2 - увеличить ширину меню директорий на 5 символов
        vim.keymap.set("n", "<A-2>", ":NvimTreeResize +5<CR>", { noremap = true, silent = true })
        -- alt+] - сделать выбранную директорию корневой
        vim.keymap.set("n", "<A-]>", nvt_api.tree.change_root_to_node, { noremap = true, silent = true })
        -- alt+t - открывает файл в новой вкладке
        vim.keymap.set("n", "<A-t>", nvt_api.node.open.tab, { noremap = true, silent = true })
    end
}
