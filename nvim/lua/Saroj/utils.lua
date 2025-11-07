--- @alias Mode ("n" | string)?
--- @alias Fn fun()
--- @alias Seconds number Numbers that represent time value in seconds
---
--- @class utils
--- @field get_word_under_cursor fun(): string
--- @field keymap fun(key:string, fn:Fn|string ,desc:string?, mode:Mode?)
---
--- @field set_theme fun(theme_name:string, transparent_bg:boolean?)
---
--- @field set_interval fun(interval: Seconds, callback:fun()): uv.uv_timer_t | nil
--- @field clear_interval fun(timer: uv.uv_timer_t | nil)
local U = {}

U.get_word_under_cursor = function()
	return vim.fn.expand("<cword>")
end

U.keymap = function(key, fn, desc, mode)
	vim.keymap.set(mode or "n", key, fn, {
		desc = desc,
	})
end

U.set_theme = function(theme_name, transparent_bg)
	vim.cmd.colorscheme(theme_name)

	if transparent_bg then
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	end
end

U.set_interval = function(interval, callback)
	local uv = vim.uv
	local timer = uv.new_timer()
	local intervalInSec = interval * 1000

	if timer == nil then
		print("Something went wrong!!")
		return nil
	end

	timer:start(intervalInSec, intervalInSec, function()
		callback()
	end)
	return timer
end

U.clear_interval = function(timer)
	if timer == nil then
		print("Nil timer provided so, nothing to stop")
		return
	end

	timer:stop()
	timer:close()
end

return U
