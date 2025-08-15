-- Варианты автодополнения вводимого текста 

return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
        local cmp = require 'cmp'
        cmp.setup({
            -- Настройка красивого стиля окна с вариантами дополнения
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered()
            },
            -- Маппинги
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                -- Вызов автодополнения
                ['<C-Space>'] = cmp.mapping.complete(),
                -- Отмена автодополнения
                ['<C-e>'] = cmp.mapping.abort(),
                -- Подтверждение выбора - enter
                ['<CR>'] = cmp.mapping.confirm({select = true}),
                -- Переключение между вариантами автодополнения (tab - вперед, shift+tab - назад)
                ["<Tab>"] = cmp.mapping(
                    function(fallback)
                        if cmp.visible() then cmp.select_next_item() else fallback() end
                    end, {"i", "s"}
                ),
                ["<S-Tab>"] = cmp.mapping(
                    function(fallback)
                        if cmp.visible() then cmp.select_prev_item() else fallback() end
                    end, {"i", "s"}
                )
            }),
            -- Источник автодополнения - текущий буффер
            sources = cmp.config.sources({{name = "nvim_lsp"}}, {{name = 'buffer'}})
        })
        -- Автодополнение для поиска (/ и ?)
        cmp.setup.cmdline({'/', '?'}, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {{name = 'buffer'}}
        })
        -- Автодополнение для команд (:)
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline'}})
        })
    end
}
