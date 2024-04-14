return {}
-- return {
--     {
--         'nvim-java/nvim-java',
--         dependencies = {
--             'nvim-java/lua-async-await',
--             'nvim-java/nvim-java-core',
--             'nvim-java/nvim-java-test',
--             'nvim-java/nvim-java-dap',
--             'MunifTanjim/nui.nvim',
--             'neovim/nvim-lspconfig',
--             'mfussenegger/nvim-dap',
--             {
--                 'williamboman/mason.nvim',
--                 opts = {
--                     registries = {
--                         'github:nvim-java/mason-registry',
--                         'github:mason-org/mason-registry',
--                     },
--                 },
--             },
--         },
--         ft = "java",
--         config = function()
--             require('java').setup()
--             require('lspconfig').jdtls.setup({})
--         end
--     },
    -- {
    --     'mfussenegger/nvim-jdtls',
    --     dependencies = {
    --         { 'VonHeikemen/lsp-zero.nvim' }
    --     },
    --     ft = "java",
    --     config = function()
    --         local home = os.getenv("HOME")
    --         local project_name = vim.loop.cwd()
    --         local java_path = 'java' -- or '/path/to/java17_or_newer/bin/java'
    --         local jar_file = vim.fn.glob(home ..
    --             "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar")
    --         local config_dir = home .. '/.local/share/nvim/mason/packages/jdtls/config_linux'
    --         local workspace_dir = home .. '/.cache/jdtls/workspaces/' .. project_name
    --         local extendedClientCapabilities = require("jdtls").extendedClientCapabilities
    --         local capabilities = {
    --             workspace = {
    --                 configuration = true
    --             },
    --             textDocument = {
    --                 completion = {
    --                     completionItem = {
    --                         snippetSupport = true
    --                     }
    --                 }
    --             }
    --         }
    --         extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
    --
    --         -- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
    --         local config = {
    --             -- The command that starts the language server
    --             -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
    --             cmd = {
    --                 java_path,
    --                 '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    --                 '-Dosgi.bundles.defaultStartLevel=4',
    --                 '-Declipse.product=org.eclipse.jdt.ls.core.product',
    --                 '-Dlog.protocol=true',
    --                 '-Dlog.level=ALL',
    --                 "-javaagent:" .. home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",
    --                 '-Xmx1g',
    --                 '--add-modules=ALL-SYSTEM',
    --                 '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    --                 '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    --                 '-jar', jar_file,
    --                 '-configuration', config_dir,
    --                 '-data', workspace_dir,
    --             },
    --             root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew' }),
    --             -- Here you can configure eclipse.jdt.ls specific settings
    --             -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    --             -- for a list of options
    --             flags = {
    --                 debounce_text_changes = 50,
    --                 allow_incremental_sync = true,
    --             },
    --             settings = {
    --                 java = {
    --                     signatureHelp = { enabled = true },
    --                     configuration = {
    --                         -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    --                         -- And search for `interface RuntimeOption`
    --                         -- The `name` is NOT arbitrary, but must match one of the elements from `enum ExecutionEnvironment` in the link above
    --                         -- runtimes = {
    --                         --     {
    --                         --         name = "JavaSE-11",
    --                         --         path = "/usr/lib/jvm/java-11-openjdk/",
    --                         --     },
    --                         --     {
    --                         --         name = "JavaSE-17",
    --                         --         path = "/usr/lib/jvm/java-17-openjdk/",
    --                         --     },
    --                         -- },
    --                         updateBuildConfiguration = "interactive",
    --                         -- eclipse = {
    --                         --   downloadSources = true,
    --                         -- },
    --                         -- maven = {
    --                         --   downloadSources = true,
    --                         -- },
    --                         implementationsCodeLens = {
    --                             enabled = true,
    --                         },
    --                         referencesCodeLens = {
    --                             enabled = true,
    --                         },
    --                         -- references = {
    --                         --   includeDecompiledSources = true,
    --                         -- },
    --                         inlayHints = {
    --                             parameterNames = {
    --                                 enabled = "all", -- literals, all, none
    --                             },
    --                         },
    --                         completion = {
    --                             -- favoriteStaticMembers = {
    --                             --   "org.hamcrest.MatcherAssert.assertThat",
    --                             --   "org.hamcrest.Matchers.*",
    --                             --   "org.hamcrest.CoreMatchers.*",
    --                             --   "org.junit.jupiter.api.Assertions.*",
    --                             --   "java.util.Objects.requireNonNull",
    --                             --   "java.util.Objects.requireNonNullElse",
    --                             --   "org.mockito.Mockito.*",
    --                             -- },
    --                         },
    --                         sources = {
    --                             organizeImports = {
    --                                 starThreshold = 9999,
    --                                 staticStarThreshold = 9999,
    --                             },
    --                         },
    --                         codeGeneration = {
    --                             toString = {
    --                                 template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
    --                             },
    --                             useBlocks = true,
    --                         }
    --                     }
    --                 }
    --             },
    --             -- Language server `initializationOptions`
    --             -- You need to extend the `bundles` with paths to jar files
    --             -- if you want to use additional eclipse.jdt.ls plugins.
    --             --
    --             -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
    --             --
    --             -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
    --             init_options = {
    --                 bundles = {},
    --                 extendedClientCapabilities = extendedClientCapabilities,
    --             },
    --             capabilities = capabilities
    --         }
    --         -- This starts a new client & server,
    --         -- or attaches to an existing client & server depending on the `root_dir`.
    --         require('jdtls').start_or_attach(config)
    --     end
    -- },
-- }