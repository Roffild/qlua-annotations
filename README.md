# QUIK QLua подстановка с описанием для редакторов Lua

(Eng) QLua auto-completion with descriptions for Lua editors. I don't believe in using QUIK outside of Russia. If you are one of those, you can create Issus.

Я проверил в редакторах Lua:

[Visual Studio Code](https://code.visualstudio.com) с [Lua от sumneko](https://marketplace.visualstudio.com/items?itemName=sumneko.lua) (рекомендую).

[PyCharm](https://www.jetbrains.com/pycharm/) с [EmmyLua](https://plugins.jetbrains.com/plugin/9768-emmylua) (плохо отображаются многострочные описания).

Достаточно закинуть [zzz_qlua_annotations_ru.lua](zzz_qlua_annotations_ru.lua) в свой проект, чтобы появились подсказки.
Используется формат документирования [EmmyLua-Annotations](https://github.com/sumneko/lua-language-server/wiki/EmmyLua-Annotations).
Файл в кодировке UTF-8-BOM.

**НЕ ВКЛЮЧАЙТЕ [zzz_qlua_annotations_ru.lua](zzz_qlua_annotations_ru.lua) ЧЕРЕЗ `require()` или `dofile()`!** Просто положите файл в папку проекта.

## getItem() и SearchItems()
Функции `getItem()` и `SearchItems()` возвращают выбранную таблицу, поэтому нужно указать `---@type` с `ql`:
```lua
---@type qlmoney_limits
local tbl = getItem("money_limits", 2)
```
![описание функции](https://github.com/Roffild/qlua-annotations/blob/images/qlua_function.png)
![список полей](https://github.com/Roffild/qlua-annotations/blob/images/qlua_fields.png)<br/>
Описание поля при наводке мыши:<br/>
![описание поля при наводке мыши](https://github.com/Roffild/qlua-annotations/blob/images/qlua_field.png)

Ну, и... звездани на ГитХабе...
