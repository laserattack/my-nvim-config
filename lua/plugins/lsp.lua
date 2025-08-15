-- Настройки LSP серверов

-- Настройки LSP-серверов
local ls_settings = {
    -- lsp сервер для Lua
    lua_ls = {
        cmd = { vim.fn.expand('~/.config/nvim/lsp/lua/bin/lua-language-server') },
        settings = {
            Lua = {
                runtime = { version = 'LuaJIT' },
                workspace = { library = vim.api.nvim_get_runtime_file("", true) },
                telemetry = { enable = false },
            },
        }
    },
    zls = {
        cmd = { vim.fn.expand('~/.config/nvim/lsp/zls/zls') },
    },
}

-- Общие настройки
local general_settings = function(_, _)
    vim.diagnostic.config({
        virtual_text = {
            -- позиция текста об ошибках - в правом конце строки
            virt_text_pos = 'right_align',
        },
        -- не показывать значки на полях
        signs = false,
        -- не подчеркивать места с ошибками
        underline = false,
    })
end

-- Функция для вывода уведомлений
local function notify(msg)
    print(msg)
    vim.notify("")
end

-- Функция для проверки наличия серверов
local function check_lsp_path(server_name, binary_path)
    if vim.fn.executable(binary_path) ~= 1 then
        notify(string.format("Language server '%s' not found by path: %s", server_name, binary_path))
        return false
    end
    return true
end

return {
    'neovim/nvim-lspconfig',
    config = function()
        for server_name, server_settings in pairs(ls_settings) do
            if not check_lsp_path(server_name, server_settings.cmd[1]) then
               goto continue
            end

            server_settings.on_attach = general_settings
            require("lspconfig")[server_name].setup(server_settings)

            ::continue::
        end
    end
}
