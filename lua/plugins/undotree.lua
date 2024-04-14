return {
    {
        "jiaoshijie/undotree",
        dependencies = "nvim-lua/plenary.nvim",
        config = true,
        keys = { -- load the plugin only when using it's keybinding:
            { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
        },
    },
    -- {
    --     'mbbill/undotree',
    --     keys = { { '<leader>u', vim.cmd.UndotreeToggle, desc = "Opens side Undo Tree" } },
    -- },
}
