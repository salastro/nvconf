vim.loader.enable()
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Relative numbering
vim.opt.rnu = true

-- Auto commands
autocmd("BufWritePost", { -- Reload kmonad
  pattern = "*.kbd",
  command = "!pkill kmonad; setsid kmonad %:p &",
})
autocmd("BufWritePost", { -- Reload sxhkd
  pattern = "sxhkdrc",
  command = "!pkill -USR1 sxhkd",
})
autocmd("BufReadPost", { -- Open the last edited position
  pattern = "*",
  command = 'if line("\'\\"") > 1 && line("\'\\"") <= line("$") | exe "normal! g\'\\"" | endif',
})
autocmd("VimResized", { -- Resize splits
  pattern = "*",
  command = "tabdo wincmd =",
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

-- Folds
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
