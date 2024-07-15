-- return {
--   'nvim-java/nvim-java',
--   dependencies = {
--     'nvim-java/lua-async-await',
--     'nvim-java/nvim-java-core',
--     'nvim-java/nvim-java-test',
--     'nvim-java/nvim-java-dap',
--     'MunifTanjim/nui.nvim',
--     'neovim/nvim-lspconfig',
--     'mfussenegger/nvim-dap',
--     {
--       'williamboman/mason.nvim',
--       opts = {
--         registries = {
--           'github:nvim-java/mason-registry',
--           'github:mason-org/mason-registry',
--         },
--       },
--     }
--   },
-- }
-- New update from the authors!
return {
  'nvim-java/nvim-java',
  config = false,
  dependencies = {
    {
      'neovim/nvim-lspconfig',
      opts = {
        servers = {
          jdtls = {
            -- Your custom jdtls settings goes here
          },
        },
        setup = {
          jdtls = function()
            require('java').setup({
              -- Your custom nvim-java configuration goes here
            })
          end,
        },
      },
    },
  },
}
