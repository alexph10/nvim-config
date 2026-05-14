if vim.fn.executable("python3") == 1 then
  vim.g.python3_host_prog = vim.fn.exepath("python3")
elseif vim.fn.executable("python") == 1 then
  vim.g.python3_host_prog = vim.fn.exepath("python")
else
  vim.g.loaded_python3_provider = 0
end

if vim.fn.executable("node") == 1 then
  vim.g.node_host_prog = vim.fn.exepath("node")
else
  vim.g.loaded_node_provider = 0
end

vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
  }
elseif vim.fn.has("win32") == 1 then
  vim.opt.clipboard = "unnamedplus"
end
