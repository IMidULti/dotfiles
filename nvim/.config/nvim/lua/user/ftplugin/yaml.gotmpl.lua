-- lua/user/ftplugin/yaml.gotmpl.lua

-- This is run for any file where the filetype is 'yaml.gotmpl'

-- 1. Set the primary filetype to 'yaml' for base highlighting
vim.opt_local.filetype = "yaml"

-- 2. Inject the Go template syntax/treesitter parser
-- This command is a common way to load the syntax for a secondary language
-- into the current buffer. 'gotmpl' is often an alias for 'gohtmltmpl' or similar.
-- If the 'gotmpl' syntax/treesitter is not recognized, you might need to try 'gohtmltmpl'
-- or ensure you have a Go template highlighting plugin installed (like 'jmerle/go-template.nvim').
vim.cmd "setlocal filetype=yaml.gotmpl"
vim.cmd "runtime! syntax/gohtmltmpl.vim"
