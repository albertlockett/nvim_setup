local M = {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
	require('nvim-treesitter.configs').setup {
	  ensure_installed = { "lua", "rust", "toml" },
	  auto_install = true,
	  highlight = {
	    enable = true,
	    additional_vim_regex_highlighting=false,
	  },
	  ident = { enable = true }, 
	  rainbow = {
	    enable = true,
	    extended_mode = true,
	    max_file_lines = nil,
	  }
	}
    end,
}

return { M }
