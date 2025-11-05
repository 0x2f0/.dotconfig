local utils = require("Saroj.utils")
local set_theme = utils.set_theme
local set_interval = utils.set_interval
local clear_interval = utils.clear_interval

local timer = nil

local change_theme_according_to_time = function()
	local hour = tonumber(os.date("%H"))

	if hour < 12 then
		set_theme("vague", true)
	elseif hour > 13 and hour < 16 then
		set_theme("yugen", true)
	else
    vim.cmd([[colorscheme rasmus]])
	end
end

return {
	"kvrohit/rasmus.nvim",
	dependencies = {
		"vague2k/vague.nvim",
		"bettervim/yugen.nvim",
	},

	init = function()
		timer = set_interval(30, function()
			vim.schedule(function()
				change_theme_according_to_time()
			end)
		end)
	end,

	config = function()
		change_theme_according_to_time()
		vim.api.nvim_create_autocmd("UILeave", {
			callback = function()
				clear_interval(timer)
			end,
		})
	end,
}
