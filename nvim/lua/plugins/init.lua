vim.g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/lua_snippets"

return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css", "php", "javascript"
  		},
  	},
  },
  -- PERSONAL CONFIGURATION? 
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter'
  },
}