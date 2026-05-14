return {
  -- rustaceanvim owns rust-analyzer; do not configure rust_analyzer in lsp.lua
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    ft = { "rust" },
    -- vim.g.rustaceanvim must be set before the ftplugin loads
    init = function()
      vim.g.rustaceanvim = {
        tools = {
          hover_actions = {
            auto_focus = true,
          },
          inlay_hints = {
            auto = true,
            show_parameter_hints = true,
            parameter_hints_prefix = "<- ",
            other_hints_prefix = "=> ",
          },
        },
        server = {
          on_attach = function(client, bufnr)
            local opts = { buffer = bufnr, silent = true }
            local function map(lhs, rhs, desc, mode)
              vim.keymap.set(mode or "n", lhs, rhs, vim.tbl_extend("force", opts, { desc = desc }))
            end

            map("<leader>ra", function() vim.cmd.RustLsp("codeAction") end, "Rust code action")
            map("<leader>rd", function() vim.cmd.RustLsp("debuggables") end, "Rust debuggables")
            map("<leader>rr", function() vim.cmd.RustLsp("runnables") end, "Rust runnables")
            map("<leader>rt", function() vim.cmd.RustLsp("testables") end, "Rust testables")
            map("<leader>rm", function() vim.cmd.RustLsp("expandMacro") end, "Rust expand macro")
            map("<leader>rc", function() vim.cmd.RustLsp("openCargo") end, "Open Cargo.toml")
            map("<leader>rp", function() vim.cmd.RustLsp("parentModule") end, "Rust parent module")
            map("<leader>rj", function() vim.cmd.RustLsp("joinLines") end, "Rust join lines")
            map("<leader>re", function() vim.cmd.RustLsp("explainError") end, "Rust explain error")
            map("K", function() vim.cmd.RustLsp({ "hover", "actions" }) end, "Rust hover actions")

            map("gD", vim.lsp.buf.declaration, "Go to declaration")
            map("gd", vim.lsp.buf.definition, "Go to definition")
            map("gi", vim.lsp.buf.implementation, "Go to implementation")
            map("<C-k>", vim.lsp.buf.signature_help, "Signature help")
            map("<space>rn", vim.lsp.buf.rename, "Rename symbol")
            map("gr", vim.lsp.buf.references, "Go to references")
            map("<space>f", function() vim.lsp.buf.format({ async = true }) end, "Format document")
          end,
          default_settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                runBuildScripts = true,
              },
              checkOnSave = {
                allFeatures = true,
                command = "clippy",
                extraArgs = { "--no-deps" },
              },
              procMacro = {
                enable = true,
                ignored = {
                  ["async-trait"] = { "async_trait" },
                  ["napi-derive"] = { "napi" },
                  ["async-recursion"] = { "async_recursion" },
                },
              },
            },
          },
        },
        dap = {
          adapter = function()
            local codelldb_path = vim.fn.exepath("codelldb")
            if codelldb_path ~= "" then
              return require("rustaceanvim.config").get_codelldb_adapter(codelldb_path, "")
            end
          end,
        },
      }
    end,
  },

  -- crates in Cargo.toml
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local crates = require("crates")
      crates.setup({
        popup = {
          border = "rounded",
          show_version_date = true,
        },
        lsp = {
          enabled = true,
          actions = true,
          completion = true,
          hover = true,
        },
      })

      vim.api.nvim_create_autocmd("BufRead", {
        pattern = "Cargo.toml",
        callback = function(ev)
          local opts = { buffer = ev.buf, silent = true }
          local function map(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, vim.tbl_extend("force", opts, { desc = desc }))
          end
          map("<leader>ct", crates.toggle, "Toggle crate info")
          map("<leader>cv", crates.show_versions_popup, "Show crate versions")
          map("<leader>cf", crates.show_features_popup, "Show crate features")
          map("<leader>cd", crates.show_dependencies_popup, "Show crate dependencies")
          map("<leader>cu", crates.update_crate, "Update crate")
          map("<leader>cU", crates.upgrade_crate, "Upgrade crate")
          map("<leader>cA", crates.upgrade_all_crates, "Upgrade all crates")
        end,
      })
    end,
  },
}
