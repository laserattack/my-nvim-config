return {
    'neovim/nvim-lspconfig',
    config = function()
        -- Lua LSP
        require('lspconfig').lua_ls.setup({
            cmd = { '/home/serr/Рабочий стол/lua_lsp/bin/lua-language-server' },
            settings = {
                Lua = {
                    runtime = { version = 'LuaJIT' },
                    workspace = { library = vim.api.nvim_get_runtime_file("", true) },
                    telemetry = { enable = false },
                },
            },
            on_attach = function(_, _)
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
        })
    end
}
