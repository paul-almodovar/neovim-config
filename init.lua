require("remap24")
require("set24")


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = require("lazyvimopts")

require("lazy").setup("plugins", opts)

-- setup must be called before loading the colorscheme
-- Default options:
require("gruvbox").setup({
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
        strings = false,
        comments = true,
        operators = false,
        folds = false,
    },
    strikethrough = true,
    invert_selection = false,
    invert_tabline = false,
    invert_signs = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "",  -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {
        -- QuickFixLine = { fg = colors.bg0, bg = colors.yellow, bold = config.bold },
        QuickFixLine = { fg = "#282828", bg = "#427b58", bold = 1 },
    },
    dim_inactive = false,
    transparent_mode = false,
})
vim.cmd("colorscheme gruvbox")
