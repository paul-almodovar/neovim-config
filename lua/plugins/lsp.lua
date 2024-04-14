return {
    --- Uncomment the two plugins below if you want to manage the language servers from neovim
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        config = function() 
            require('java').setup()
            local lsp_zero = require('lsp-zero')

            lsp_zero.on_attach(function(client, bufnr)
              -- see :help lsp-zero-keybindings
              -- to learn the available actions
              lsp_zero.default_keymaps({buffer = bufnr})
            end)

            local lspconfig = require('lspconfig')
            -- lspconfig.lua_ls.setup(lsp_zero.nvim_lua_ls())
    --         lspconfig.yamlls.setup({
    --             settings = {
    --                 yaml = {
    --                     keyOrdering = false
    --                 }
    --             }
    --         })
            -- here you can setup the language servers 
            lspconfig.jdtls.setup({})
            require('mason').setup({})
            require('mason-lspconfig').setup({
              ensure_installed = {},
              handlers = {
                function(server_name)
                  require('lspconfig')[server_name].setup({})
                end,

                --- this is the "custom handler" for `example_server`
                --- in your own config you should replace `example_server`
                --- with the name of a language server you have installed
                -- example_server = function()
                  --- in this function you can setup
                  --- the language server however you want. 
                  --- in this example we just use lspconfig

                  -- require('lspconfig').example_server.setup({
                    ---
                    -- in here you can add your own
                    -- custom configuration
                    ---
                  -- })
                -- end,
              },
            })


        end
    },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },
    -- {
    --     'VonHeikemen/lsp-zero.nvim',
    --     branch = 'v3.x',
    --     -- event = "VeryLazy",
    --     dependencies = {
    --         {
    --             'williamboman/mason.nvim',
    --             -- build = function()
    --             --     pcall(vim.cmd, 'MasonUpdate')
    --             -- end,
    --         },
    --         { 'williamboman/mason-lspconfig.nvim' },
    --         { 'neovim/nvim-lspconfig' }, -- Required
    --
    --         -- Autocompletion
    --         { 'hrsh7th/nvim-cmp' },     -- Required
    --         { 'hrsh7th/cmp-nvim-lsp' }, -- Required
    --         { 'L3MON4D3/LuaSnip' },     -- Required
    --     },
    --     config = function()
    --         require('java').setup()
    --         local lsp = require('lsp-zero').preset({
    --             manage_nvim_cmp = {
    --                 set_sources = 'recommended'
    --             }
    --         })
    --
    --         lsp.on_attach(function(client, bufnr)
    --             -- lsp.default_keymaps({ buffer = bufnr })
    --             local opts = { buffer = bufnr }
    --
    --             vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    --             vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    --             vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    --             vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    --             -- vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    --             vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    --             vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    --             vim.keymap.set('n', 'gR', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    --             vim.keymap.set('n', 'gF', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    --             vim.keymap.set('n', 'gc', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    --             vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
    --             vim.keymap.set('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
    --             vim.keymap.set('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
    --         end)
    --
    --         -- (Optional) Configure lua language server for neovim
    --         local lspconfig = require('lspconfig')
    --         lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
    --         lspconfig.yamlls.setup({
    --             settings = {
    --                 yaml = {
    --                     keyOrdering = false
    --                 }
    --             }
    --         })
    --         lspconfig.jdtls.setup({})
    --
    --         -- special setup just for python formatting because pyright lsp doesn't have a builtin formatter -- lame
    --         -- ironically this is straight from the maintainer of lsp_zero.nvim which is kind of a competing plugin
    --         local null_ls = require('null-ls')
    --         local null_opts = lsp.build_options('null-ls', {})
    --
    --         null_ls.setup({
    --             on_attach = function(client, bufnr)
    --                 null_opts.on_attach(client, bufnr)
    --                 --- you can add more stuff here if you need it
    --             end,
    --             sources = {
    --                 null_ls.builtins.formatting.black,
    --             }
    --         })
    --
    --
    --         lsp.skip_server_setup({ 'jdtls' })
    --         lsp.setup()
    --
    --
    --         local cmp = require('cmp')
    --         local cmp_action = require('lsp-zero').cmp_action()
    --
    --
    --         cmp.setup({
    --             sources = {
    --                 { name = 'luasnip' },
    --                 { name = 'path' },
    --                 { name = 'nvim_lsp' },
    --                 { name = 'vim-dadbod-completion' },
    --             },
    --             mapping = {
    --                 ['<CR>'] = cmp.mapping.confirm({ select = true }),
    --                 ['<Tab>'] = cmp_action.luasnip_supertab(),
    --                 ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
    --             },
    --             window = {
    --                 completion = cmp.config.window.bordered(),
    --                 documentation = cmp.config.window.bordered(),
    --             },
    --             snippet = {
    --                 expand = function(args)
    --                     local luasnip = require("luasnip")
    --                     if not luasnip then
    --                         return
    --                     end
    --                     luasnip.lsp_expand(args.body)
    --                 end,
    --             },
    --             formatting = {
    --                 fields = { 'abbr', 'kind', 'menu' },
    --                 format = require('lspkind').cmp_format({
    --                     mode = 'symbol', -- show only symbol annotations
    --                     maxwidth = 75, -- prevent the popup from showing more than provided characters
    --                     ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
    --                 })
    --             }
    --
    --         })
    --
    --     end
    -- },
}
