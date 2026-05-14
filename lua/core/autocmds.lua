-- auto-save modified buffers
vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave", "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  callback = function()
    if vim.bo.modified and vim.bo.buftype == "" and vim.fn.expand("%") ~= "" then
      vim.cmd("silent! write")
    end
  end,
})

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  command = "if mode() != 'c' | checktime | endif",
})

vim.api.nvim_create_autocmd({ "BufWritePost", "BufNewFile", "BufDelete" }, {
  pattern = "*",
  callback = function()
    local neo_tree = require("neo-tree.command")
    if neo_tree then
      vim.schedule(function()
        neo_tree.execute({ action = "refresh" })
      end)
    end
  end,
})

vim.api.nvim_create_autocmd({ "FileChangedShellPost" }, {
  pattern = "*",
  callback = function()
    vim.notify("File changed on disk. Buffer reloaded.", vim.log.levels.INFO)
    local neo_tree = require("neo-tree.command")
    if neo_tree then
      vim.schedule(function()
        neo_tree.execute({ action = "refresh" })
      end)
    end
  end,
})

vim.api.nvim_create_autocmd({ "FocusGained" }, {
  pattern = "*",
  callback = function()
    vim.schedule(function()
      local neo_tree = require("neo-tree.command")
      if neo_tree then
        neo_tree.execute({ action = "refresh" })
      end
    end)
  end,
})

-- transparent background
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    local groups = {
      "Normal", "NormalFloat", "NormalNC", "LineNr", "SignColumn",
      "StatusLine", "StatusLineNC", "TabLine", "TabLineFill", "TabLineSel",
      "VertSplit", "WinSeparator", "EndOfBuffer",
      "NeoTreeNormal", "NeoTreeNormalNC", "NeoTreeEndOfBuffer",
      "TelescopeNormal", "TelescopeBorder",
      "TelescopePromptNormal", "TelescopeResultsNormal", "TelescopePreviewNormal",
      "Pmenu", "PmenuSbar",
      "WhichKeyFloat",
      "DiagnosticFloatingError", "DiagnosticFloatingWarn",
      "DiagnosticFloatingInfo", "DiagnosticFloatingHint",
    }
    for _, g in ipairs(groups) do
      vim.api.nvim_set_hl(0, g, { bg = "none" })
    end
  end,
})

vim.cmd([[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NormalFloat guibg=NONE ctermbg=NONE
  highlight NormalNC guibg=NONE ctermbg=NONE
  highlight LineNr guibg=NONE ctermbg=NONE
  highlight SignColumn guibg=NONE ctermbg=NONE
  highlight StatusLine guibg=NONE ctermbg=NONE
  highlight StatusLineNC guibg=NONE ctermbg=NONE
  highlight TabLine guibg=NONE ctermbg=NONE
  highlight TabLineFill guibg=NONE ctermbg=NONE
  highlight TabLineSel guibg=NONE ctermbg=NONE
  highlight VertSplit guibg=NONE ctermbg=NONE
  highlight WinSeparator guibg=NONE ctermbg=NONE
  highlight EndOfBuffer guibg=NONE ctermbg=NONE
]])
