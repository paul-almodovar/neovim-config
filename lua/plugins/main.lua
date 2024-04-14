return {
    { 'nvim-lua/plenary.nvim' },
    { "rafamadriz/friendly-snippets" },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'mattn/emmet-vim',             event = "VeryLazy", },
    {
        'tpope/vim-fugitive',
        config = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
        end
    },
    { 'tpope/vim-surround' },
    { 'mg979/vim-visual-multi' },
    { "ellisonleao/gruvbox.nvim" },
    { "onsails/lspkind.nvim" },
    { "jose-elias-alvarez/null-ls.nvim" },
    { 'tpope/vim-dadbod',                     event = "VeryLazy", },
    { 'kristijanhusak/vim-dadbod-ui',         event = "VeryLazy", },
    { 'kristijanhusak/vim-dadbod-completion', event = "VeryLazy", },
}
