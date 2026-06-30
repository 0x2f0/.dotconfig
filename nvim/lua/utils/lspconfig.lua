-- oxfmt was referencing the util file of the lspconfig package so, it is just the copy of that file.
-- from here: https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/util.lua
-- Only those which are required.

local lsp = vim.lsp
local M = { path = {} }

M.default_config = {
	log_level = lsp.protocol.MessageType.Warning,
	message_level = lsp.protocol.MessageType.Warning,
	settings = vim.empty_dict(),
	init_options = vim.empty_dict(),
	handlers = {},
	autostart = true,
	capabilities = lsp.protocol.make_client_capabilities(),
}

--- Appends `new_names` to `root_files` if `field` is found in any such file in any ancestor of `fname`.
---
--- NOTE: this does a "breadth-first" search, so is broken for multi-project workspaces:
--- https://github.com/neovim/nvim-lspconfig/issues/3818#issuecomment-2848836794
---
--- @param root_files string[] List of root-marker files to append to.
--- @param new_names string[] Potential root-marker filenames (e.g. `{ 'package.json', 'package.json5' }`) to inspect for the given `field`.
--- @param field string | string[] Field(s) to search for in the given `new_names` files.
--- @param fname string Full path of the current buffer name to start searching upwards from.
--- @param match_mode? 'all' | 'any' Match mode - all or any field passed as `field`
function M.root_markers_with_field(root_files, new_names, field, fname, match_mode)
	local path = vim.fn.fnamemodify(fname, ':h')
	local found = vim.fs.find(new_names, { path = path, upward = true, type = 'file' })
	local fields = type(field) == 'string' and { field } or field
	local to_find = vim.deepcopy(fields)
	local matcher = (match_mode or 'any') == 'any'
			and function(line)
				return vim.iter(fields):any(function(s)
					return line:find(s)
				end)
			end
			or function(line)
				to_find = vim
						.iter(to_find)
						:filter(function(s)
							return not line:find(s)
						end)
						:totable()
				if #to_find == 0 then
					to_find = vim.deepcopy(files)
					return true
				end
				return false
			end
	for _, f in ipairs(found or {}) do
		-- Match the given `field`.
		local file = assert(io.open(f, 'r'))
		for line in file:lines() do
			if matcher(line) then
				root_files[#root_files + 1] = vim.fs.basename(f)
				break
			end
		end
		file:close()
	end

	return root_files
end

function M.insert_package_json(root_files, field, fname)
	return M.root_markers_with_field(root_files, { 'package.json', 'package.json5' }, field, fname)
end

return M
