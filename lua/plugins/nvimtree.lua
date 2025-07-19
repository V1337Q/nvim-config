return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup {
    }

    local get_theme_tb = require("base46").get_theme_tb
    local colors = get_theme_tb "base_30"
    -- local theme_type = get_theme_tb "type"
    -- local tune_color = require("base46.colors").change_hex_lightness

    vim.api.nvim_set_hl(0, "NvimTreeEmptyFolderName", { fg = colors.folder_bg })
    vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { fg = colors.black, bg = colors.black })
  end,
}
