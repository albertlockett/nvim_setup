require("config.lazy")

-- suggested from here for Terraform
-- https://www.mukeshsharma.dev/2022/02/08/neovim-workflow-for-terraform.html
vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])


-- Treesitter folding 
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

-- always enable sign column to prevent screen "jumping"
vim.opt.signcolumn = "yes"

vim.wo.number = true

vim.opt.fillchars = { eob = " "}

vim.keymap.set({'n'}, '<Leader>b', ':Neotree<CR>')
vim.keymap.set({'n'}, '<Leader>ff', ':Telescope find_files<CR>')
vim.keymap.set({'n'}, '<Leader>ih', ':lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>')



--vim.g.tagbar_ctags_bin = "/opt/homebrew/bin/ctags"
vim.g.tagbar_type_rust = {
	ctagstype = "rust",
	kinds = {
         'M:macro,Macro Definition',
         'P:method,A method',
         'c:implementation,implementation',
         'e:enumerator,An enum variant',
         'f:function,Function',
         'g:enum,Enum',
         'i:interface,trait interface',
         'm:field,A struct field',
         'n:module,module',
         's:struct,structural type',
         't:typedef,Type Alias',
         'v:variable,Global variable',
	},
	n = 1000
}

