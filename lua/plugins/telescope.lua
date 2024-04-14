return {
    {
        'nvim-telescope/telescope.nvim',
        version = '0.1.4',
        event = "VeryLazy",
        dependencies = { { 'nvim-lua/plenary.nvim' } },
        config = function()
            -- require('telescope').setup({
            --   extensions = {
            --     command_palette = {
            --       {"File",
            --         { "entire selection (C-a)", ':call feedkeys("GVgg")' },
            --         { "save current file (C-s)", ':w' },
            --         { "save all files (C-A-s)", ':wa' },
            --         { "quit (C-q)", ':qa' },
            --         { "file browser (C-i)", ":lua require'telescope'.extensions.file_browser.file_browser()", 1 },
            --         { "search word (A-w)", ":lua require('telescope.builtin').live_grep()", 1 },
            --         { "git files (A-f)", ":lua require('telescope.builtin').git_files()", 1 },
            --         { "files (C-f)",     ":lua require('telescope.builtin').find_files()", 1 },
            --       },
            --       {"Help",
            --         { "tips", ":help tips" },
            --         { "cheatsheet", ":help index" },
            --         { "tutorial", ":help tutor" },
            --         { "summary", ":help summary" },
            --         { "quick reference", ":help quickref" },
            --         { "search help(F1)", ":lua require('telescope.builtin').help_tags()", 1 },
            --       },
            --       {"Vim",
            --         { "reload vimrc", ":source $MYVIMRC" },
            --         { 'check health', ":checkhealth" },
            --         { "jumps (Alt-j)", ":lua require('telescope.builtin').jumplist()" },
            --         { "commands", ":lua require('telescope.builtin').commands()" },
            --         { "command history", ":lua require('telescope.builtin').command_history()" },
            --         { "registers (A-e)", ":lua require('telescope.builtin').registers()" },
            --         { "colorshceme", ":lua require('telescope.builtin').colorscheme()", 1 },
            --         { "vim options", ":lua require('telescope.builtin').vim_options()" },
            --         { "keymaps", ":lua require('telescope.builtin').keymaps()" },
            --         { "buffers", ":Telescope buffers" },
            --         { "search history (C-h)", ":lua require('telescope.builtin').search_history()" },
            --         { "paste mode", ':set paste!' },
            --         { 'cursor line', ':set cursorline!' },
            --         { 'cursor column', ':set cursorcolumn!' },
            --         { "spell checker", ':set spell!' },
            --         { "relative number", ':set relativenumber!' },
            --         { "search highlighting (F12)", ':set hlsearch!' },
            --       }
            --     }
            --   }
            -- })
            -- local tele = require('telescope')
            -- local telecommand = tele.load_extension('command_palette')
            local actions = require("telescope.actions")
            require("telescope").setup {
                telescopedefaults = {
                    mappings = {
                        i = {
                            ["<esc>"] = actions.close
                        },
                    },
                }
            }


            local builtin = require('telescope.builtin')

            -- vim.keymap.set('n', '<leader>p', telecommand.command_palette, {})
            vim.keymap.set('n', '<leader>gf', builtin.find_files, {})
            vim.keymap.set('n', 'gh', builtin.lsp_references, {})
            vim.keymap.set('n', 'go', builtin.treesitter, {})
            vim.keymap.set('n', '<C-g>', builtin.git_files, {})
            vim.keymap.set('n', '<c-p>', builtin.builtin, {})
            vim.keymap.set('n', '<leader>gs', function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") });
            end)
            vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
        end
    }
}
