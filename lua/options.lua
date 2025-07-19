require "nvchad.options"
vim.o.relativenumber = true
vim.opt.virtualedit = "onemore"
vim.opt.autoindent = true
vim.opt.clipboard = "unnamedplus"
-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

local highlights = {
  Normal          = { fg = "#f4f4f4",     bg = "#1a1b26" },
  Separator       = { fg = "#111119",     bg = "#1a1b26" },
  -- Separator2      = { fg = "#3a435a",     bg = "#111119" },
  Separator2      = { fg = "#ff9e64",     bg = "#111119" },
  ModeText        = { fg = "#956dca",     bg = "#111119" },
  PathText        = { fg = "#956dca",     bg = "#111119" },
  FileText        = { fg = "#f4f3ee",     bg = "#111119" },
  FileType        = { fg = "#e37e4f",     bg = "#111119" },
  BranchName      = { fg = "#69bfce",     bg = "#111119" },
  LineText        = { fg = "#e34f4f",     bg = "#111119" },
  ColumnText      = { fg = "#5679e3",     bg = "#111119" },
  PercentageText  = { fg = "#5599e2",     bg = "#111119" },
  TotalLineText   = { fg = "#956dca",     bg = "#111119" },
}

for group, opts in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, opts)
end

_G.RecolorMode = function()
  local mode = vim.fn.mode()
  local color_map = {
    n  =        { fg = "#5599e2", bg = "#111119" },
    i  =        { fg = "#e34f4f", bg = "#111119" },
    R  =        { fg = "#69bfce", bg = "#111119" },
    v  =        { fg = "#e37e4f", bg = "#111119" },
    V  =        { fg = "#e37e4f", bg = "#111119" },
    [""] =    { fg = "#e37e4f", bg = "#111119" },
    c  =        { fg = "#5679e3", bg = "#111119" },
    t  =        { fg = "#5679e3", bg = "#111119" },
  }

  local hl = color_map[mode]
  if hl then
    vim.api.nvim_set_hl(0, "ModeText", hl)
  end
  return ""
end

_G.SetFiletype = function(filetype)
  return (filetype == nil or filetype == "") and "unknown" or filetype
end

_G.GetBranchName = function()
  local dir = vim.fn.expand("%:h")
  if vim.fn.finddir(".git", dir .. ";") == "" then return "no-git" end

  local handle = io.popen("git -C " .. vim.fn.shellescape(dir) .. " branch --show-current 2>/dev/null")
  local result = handle and handle:read("*a") or ""
  if handle then handle:close() end

  return vim.trim(result) ~= "" and vim.trim(result) or "no-branch"
end

_G.HandleColumnGap = function()
  local col = vim.fn.col(".")
  -- return col > 9 and "✖  " or "✖ "
  return col > 9 and "" or ""
end

vim.opt.statusline = table.concat({
  "%{%v:lua.RecolorMode()%}",

  -- "%#Separator#█",
  -- "%#ModeText#",
  -- -- "%#ModeText# 󰊠",
  -- "%#Separator#██",

  -- "%#PathText#%{expand('%:p:h:t')}",
  -- "%#Separator#██",
  -- "%#FileText#%t",
  -- "%#Separator#",

  "%#Separator#",
  -- "%#ModeText#",
  "%#ModeText#  ",
  "%#Separator# █",

  "%#PathText#%{expand('%:p:h:t')}",
  "%#Separator#██",
  "%#FileText#%t",
  "%#Separator#",
  

  "%=",

  "%#Separator#",
  "%#FileType#%{v:lua.SetFiletype(&filetype)}",
  "%#Separator# ",

  "%#Separator#",
  "%#BranchName#%{v:lua.GetBranchName()}",
  "%#Separator# ",

  "%#Separator#",
  "%#LineText#%2l",
  "%#Separator#█",
  "%#Separator2#%{v:lua.HandleColumnGap()}",
  "%#ColumnText#%2c",

  "%#Separator2#",
  "%#Separator#██",
  "%#PercentageText#%p%%",
  "%#Separator#█",
  "%#Separator2#  ",
  "%#Separator#█",
  "%#TotalLineText#%L",
  "%#Separator#█",
})
