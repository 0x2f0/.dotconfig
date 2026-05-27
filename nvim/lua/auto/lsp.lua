vim.lsp.enable({
	'emmet_ls',
	'jsonls',
	'lua_ls',
	"ts_ls",
	"oxfmt",
	'tsgo',
	'tailwindcss'
})

-- default keybinds
-- These GLOBAL keymaps are created unconditionally when Nvim starts:
-- - "gra" (Normal and Visual mode) is mapped to |vim.lsp.buf.code_action()|
-- - "gri" is mapped to |vim.lsp.buf.implementation()| (TODO: This one is creating two entries of the same location and populating a quick fix list instead of going to the implementation directly. )
--
-- - "grn" is mapped to |vim.lsp.buf.rename()|
-- - "grr" is mapped to |vim.lsp.buf.references()|
-- - "grt" is mapped to |vim.lsp.buf.type_definition()|
-- - "gO" is mapped to |vim.lsp.buf.document_symbol()|
-- - CTRL-S (Insert mode) is mapped to |vim.lsp.buf.signature_help()|
-- - "an" and "in" (Visual and Operator-pending mode) are mapped to outer and inner incremental
--   selections, respectively, using |vim.lsp.buf.selection_range()|
