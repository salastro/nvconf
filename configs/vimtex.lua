-- Zathura
vim.g.vimtex_view_method = "zathura_simple"

-- Compiler XeLaTeX
vim.g.vimtex_compiler_latexmk_engines = {
  _ = "-xelatex",
}

-- Conceal
vim.opt.conceallevel = 2
vim.g.tex_conceal = "abdmgs"

-- Quick fix
vim.g.vimtex_quickfix_open_on_warning = 0

-- Local leader
vim.g.maplocalleader = " "

-- Spell
vim.opt.spell = true

-- Inkscape
function _G.inkscape_figure()
  -- Get current line and root directory
  local line = vim.fn.getline "."
  local root = vim.fn.expand "%:p:h"

  -- Create command
  -- inkscap-figures create <line> <root>/figures/
  local command = string.format('silent .!inkscape-figures create "%s" "%s/figures/"', line, root)

  -- Run command
  vim.cmd(command)
  vim.cmd "write"
end

-- Drag PDF
function _G.dragPDF()
  -- Get current file name
  local file = vim.fn.expand "%:t:r"

  -- Create command
  -- drag <file>.pdf
  local command = string.format("silent !setsid dragon-drop %s.pdf &", file)

  -- Run command
  vim.cmd(command)

  -- Normal mode
  vim.cmd "stopinsert"
end
