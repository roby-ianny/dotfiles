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
  {
    "hrsh7th/nvim-cmp",
    opts = {
      sources = {
        { name = "nvim_lsp", trigger_characters = { "-"}},
        { name = "luasnip" },
        { name = "buffer"},
        { name = "nvim_lua"},
        { name = "path"},
      },
    },

    dependencies = {
      --snippets plugin
      "L3MON4D3/LuaSnip",
      config = function()
        require("nvchad.configs.luasnip")

        -- estensione di html snippets a php
        local luasnip = require "luasnip"
        luasnip.filetype_extend("php", { "html" })
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
  },
}
