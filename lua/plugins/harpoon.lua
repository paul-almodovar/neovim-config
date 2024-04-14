return
{
    "theprimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    config = function()
        local harpoon = require("harpoon")

        -- REQUIRED
        harpoon:setup()
        -- REQUIRED

        vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        vim.keymap.set("n", "<Left>",  function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<Down>",  function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<Up>",    function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<Right>", function() harpoon:list():select(4) end)
    end,
    keys = {
        { "<leader>a", function() require("harpoon"):list():append() end,  desc = "harpoon a file", },
        { "<Left>",    function() require("harpoon"):list():select(1) end, desc = "harpoon to file 1", },
        { "<Down>",    function() require("harpoon"):list():select(2) end, desc = "harpoon to file 2", },
        { "<Up>",      function() require("harpoon"):list():select(3) end, desc = "harpoon to file 3", },
        { "<Right>",   function() require("harpoon"):list():select(4) end, desc = "harpoon to file 4", },
    },
}
