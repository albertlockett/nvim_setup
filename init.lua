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

vim.keymap.set({'n'}, '<Leader>b', ':Neotree<CR>')
vim.keymap.set({'n'}, '<Leader>ff', ':Telescope find_files<CR>')


vim.g.tagbar_ctags_bin = "/opt/homebrew/bin/ctags"
vim.g.tagbar_type_rust = {
	ctagstype = "rust",
	kinds = {
        'T:types,type definitions',
        'f:functions,function definitions',
        'g:enum,enumeration names',
        's:structure names',
        'm:modules,module names',
        'c:consts,static constants',
        't:traits',
        'i:impls,trait implementations',
	}
}

