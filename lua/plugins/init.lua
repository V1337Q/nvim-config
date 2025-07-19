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
      require "configs.lspconfig"
    end,
  },
  {
    "V1337Q/comvimed-rust",
    event = "VeryLazy",
  },
  -- {
  --   dir = vim.fn.stdpath("config") .. "/lua/plugins/comvimed",
  --   name = "comvimed",
  --   config = function()
  --     require("plugins.comvimed")
  --   end
  -- }
  -- ["comvimed"] = {
  --   config = function()
  --     require("lua.plugins.comvimed")
  --   end
  -- }
  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
