vim.loader.enable()
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

-- Relative numbering
vim.opt.rnu = true

-- Auto commands
autocmd("BufWritePost", {
  pattern = "blocks.def.h",
  command = "!doas rm 'blocks.h' && doas make clean install && { pkill dwmblocks;setsid dwmblocks & }",
})
autocmd("BufWritePost", {
  pattern = "config.def.h",
  command = "!doas rm 'config.h' && doas make clean install",
})
autocmd("BufWritePost", {
  pattern = "*.kbd",
  command = "!pkill kmonad; setsid kmonad %:p &",
})

-- Quickfix
function _G.toggle_quickfix()
  local wininfo = vim.fn.getwininfo()
  local has_quickfix = false

  for _, info in ipairs(wininfo) do
    if info.quickfix == 1 then
      has_quickfix = true
      break
    end
  end

  if not has_quickfix then
    vim.cmd "copen"
  else
    vim.cmd "cclose"
  end
end
