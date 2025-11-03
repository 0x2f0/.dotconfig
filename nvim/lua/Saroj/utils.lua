--- @alias Mode ("n" | string)?
--- @alias Fn fun()
---
--- @class utils
--- @field get_word_under_cursor fun(): string
--- @field keymap fun(key:string, fn:Fn ,desc:string?, mode:Mode?)
local U = {}

U.get_word_under_cursor = function()
	return vim.fn.expand("<cword>")
end

U.keymap = function(key, fn, mode, desc)
	vim.keymap(mode or "n", key, fn, {
		desc = desc,
	})
end

return U
