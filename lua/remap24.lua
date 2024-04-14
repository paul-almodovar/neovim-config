vim.g.mapleader = " "

-- these make it so that you can move selected lines up and down in a really
-- nice formatting friendly way
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- this keeps your cursor in place when using J to Join lines
vim.keymap.set("n", "J", "mzJ`z")
-- these remaps keep your cusor in the middle of the screen during some
-- movements
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- this makes it so when you paste something on top of something else you can
-- keep pasting that same thing and not have your main register be overwritten
vim.keymap.set("x", "<leader>p", "\"_dP")

-- these remaps make it so that you can easily use your system clipboard with
-- neovim
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- these mappings send deleted text to null
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- apparently "Q" space is really bad
vim.keymap.set("n", "Q", "<nop>")

-- quickfix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")


-- makes a file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- call the relevant formatter
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- this one is my own since I type commands so fast that I am often creating "W" rather than just "w"
-- vim.api.nvim_set_keymap('c', 'W', 'w', {noremap = true})

-- working with the builtin terminal is hard so these keymaps are here to help
-- Edit: I'm blocking this off so that I can use the trouble.nvim plugin from
-- <leader>t . I straight up don't use the terminal in neovim because it's
-- too cumbersome and I have a terminal multiplexer for this kind of thing.
-- vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
-- vim.keymap.set("n", "<leader>t", "<cmd>terminal<CR>")

-- get to good old netrw FASTER
vim.keymap.set("n", "<leader>e", "<cmd>Explore<CR>")

-- this is to reload our snippets file on the go
vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")
