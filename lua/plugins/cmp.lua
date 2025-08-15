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
                -- enter чтобы выбрать нужный вариант
                -- переключение вариантов на стрелочки
                ['<CR>'] = cmp.mapping.confirm({select = true}),
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
