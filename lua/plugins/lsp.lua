return {
  -- mason
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "rust-analyzer",
        "pyright",
        "codelldb",
        "typescript-language-server",
        "html-lsp",
        "css-lsp",
        "json-lsp",
        "bash-language-server",
        "marksman",
        "taplo",
        "clangd",
        "stylua",
        "prettier",
        "black",
        "isort",
        "rustfmt",
        "clang-format",
        "eslint_d",
        "flake8",
        "shellcheck",
      },
      ui = {
        icons = {
          package_installed = "[x]",
          package_pending = "[~]",
          package_uninstalled = "[ ]",
        },
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      mr:on("package:install:success", function()
        vim.defer_fn(function()
          require("lazy.core.handler.event").trigger({
            event = "FileType",
            buf = vim.api.nvim_get_current_buf(),
          })
        end, 100)
      end)
      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end
      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },

  -- mason-lspconfig (servers set up manually below)
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    opts = {
      ensure_installed = {
        "lua_ls",
        "pyright",
        "ts_ls",
        "html",
        "cssls",
        "jsonls",
        "bashls",
        "marksman",
        "taplo",
        "clangd",
      },
      automatic_enable = false,
    },
  },

  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      capabilities.textDocument.completion.completionItem = {
        documentationFormat = { "markdown", "plaintext" },
        snippetSupport = true,
        preselectSupport = true,
        insertReplaceSupport = true,
        labelDetailsSupport = true,
        deprecatedSupport = true,
        commitCharactersSupport = true,
        tagSupport = { valueSet = { 1 } },
        resolveSupport = {
          properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
          },
        },
      }

      -- rust_analyzer is owned by rustaceanvim; do not set it up here
      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              diagnostics = { globals = { "vim" } },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
              },
              telemetry = { enable = false },
              completion = { callSnippet = "Replace" },
            },
          },
        },
        pyright = {
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
              },
            },
          },
        },
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
          },
          init_options = {
            usePlaceholders = true,
          },
        },
        ts_ls = {},
        html = {},
        cssls = {},
        jsonls = {},
        bashls = {},
        marksman = {},
        taplo = {},
      }

      for server, config in pairs(servers) do
        config.capabilities = capabilities
        lspconfig[server].setup(config)
      end

      vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
      vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = "Go to previous diagnostic" })
      vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = "Go to next diagnostic" })
      vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, { desc = "Set diagnostic loclist" })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- defer keymap setup to avoid E36 "Not enough room" on LspRestart
          vim.schedule(function()
            if not vim.api.nvim_buf_is_valid(ev.buf) then return end
            local opts = { buffer = ev.buf }
            local function map(lhs, rhs, desc, mode)
              vim.keymap.set(mode or "n", lhs, rhs, vim.tbl_extend("force", opts, { desc = desc }))
            end
            map("gD", vim.lsp.buf.declaration, "Go to declaration")
            map("gd", vim.lsp.buf.definition, "Go to definition")
            map("K", vim.lsp.buf.hover, "Hover documentation")
            map("gi", vim.lsp.buf.implementation, "Go to implementation")
            map("<C-k>", vim.lsp.buf.signature_help, "Signature help")
            map("<space>wa", vim.lsp.buf.add_workspace_folder, "Add workspace folder")
            map("<space>wr", vim.lsp.buf.remove_workspace_folder, "Remove workspace folder")
            map("<space>wl", function()
              print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, "List workspace folders")
            map("<space>D", vim.lsp.buf.type_definition, "Type definition")
            map("<space>rn", vim.lsp.buf.rename, "Rename symbol")
            map("<space>ca", vim.lsp.buf.code_action, "Code action", { "n", "v" })
            map("gr", vim.lsp.buf.references, "Go to references")
            map("<space>f", function() vim.lsp.buf.format({ async = true }) end, "Format document")
          end)
        end,
      })

      vim.diagnostic.config({
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "*",
        },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "E ",
            [vim.diagnostic.severity.WARN]  = "W ",
            [vim.diagnostic.severity.HINT]  = "H ",
            [vim.diagnostic.severity.INFO]  = "I ",
          },
        },
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = true,
          header = "",
          prefix = "",
        },
      })
    end,
  },
}
