vim.lsp.enable({'lua_ls', 'tsgo', 'jsonls', 'emmet_ls'})

-- default keybinds
-- These GLOBAL keymaps are created unconditionally when Nvim starts:
-- - "gra" (Normal and Visual mode) is mapped to |vim.lsp.buf.code_action()|
-- - "gri" is mapped to |vim.lsp.buf.implementation()|
-- - "grn" is mapped to |vim.lsp.buf.rename()|
-- - "grr" is mapped to |vim.lsp.buf.references()|
-- - "grt" is mapped to |vim.lsp.buf.type_definition()|
-- - "gO" is mapped to |vim.lsp.buf.document_symbol()|
-- - CTRL-S (Insert mode) is mapped to |vim.lsp.buf.signature_help()|
-- - "an" and "in" (Visual and Operator-pending mode) are mapped to outer and inner incremental
--   selections, respectively, using |vim.lsp.buf.selection_range()|
