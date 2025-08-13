## Установка NeoVim

```
sudo apt install neovim
```

## Настройка NeoVim с 0

- Создать `~/.config/nvim/init.lua`
- Туда вставить содержимое `init.lua`
- [Отсюда](https://www.nerdfonts.com/font-downloads) скачать шрифт `JetBrainsMono Nerd Font`, разархивировать в папку `~/.local/share/fonts`
- Обновить кэш шрифтов `fc-cache -fv`
- В настройках терминала выбрать `JetBrainsMono Nerd Font Regular`
- В расширенных настройках терминала отключить все клавиши доступа к меню (такие как `Alt+F`), т.к. это может конфликтовать с биндами в конфиге 
