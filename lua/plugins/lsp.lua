-- Настройки LSP серверов

-- Настройки LSP-серверов
local ls_settings = {
    lua_ls = {
        cmd = { vim.fn.expand('~/.config/nvim/lsp/lua/bin/lua-language-server') },
        settings = {
            Lua = {
                runtime = { version = 'LuaJIT' },
                workspace = { library = vim.api.nvim_get_runtime_file("", true) },
                telemetry = { enable = false },
            },
        }
    }
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

return {
    'neovim/nvim-lspconfig',
    config = function()
        for server_name, server_settings in pairs(ls_settings) do
            server_settings.on_attach = general_settings
            require("lspconfig")[server_name].setup(server_settings)
        end
    end
}
