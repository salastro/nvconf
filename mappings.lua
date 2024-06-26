---@type MappingsTable
local M = {}

M.general = {
  -- Insert mode
  i = {
    ["<C-s>"] = { "<cmd>normal! mm[s1z=`m<cr>", "Spell check previous mistake", opts = { silent = true } },
    ["jk"] = { "<esc>", "Easy escape" },
  },

  -- Normal mode
  n = {
    -- General
    [";"] = { ":", "Enter command mode", opts = { nowait = true } },
    [":"] = { ";" },
    ["gl"] = { "$", "End of line", opts = { nowait = true } },
    ["gh"] = { "^", "Beginning of line", opts = { nowait = true } },
    ["daE"] = { "ggdG", "Delete all" },

    -- Quick Fix
    ["<leader>q"] = { "<cmd>lua toggle_quickfix()<cr>", "Toggle quickfix", opts = { silent = true } },

    -- Git signs
    ["<leader>sh"] = { "<cmd>lua require('gitsigns').stage_hunk()<cr>", "Stage hunk", opts = { silent = true } },
    ["<leader>us"] = {
      "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>",
      "Undo stage hunk",
      opts = { silent = true },
    },

    -- LOC
    ["<C-g>"] = { "<cmd>!loc %<cr>", "Count lines of code of the current file" },

    -- Telescope LSP functions
    ["<leader>ld"] = { "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", "Document symbols" },
    ["<leader>lw"] = { "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>", "Workspace symbols" },
  },

  v = {
    [";"] = { ":", "Enter command mode", opts = { nowait = true } },
    [":"] = { ";" },
    [">"] = { ">gv", "indent" },
    ["gl"] = { "$", "End of line", opts = { nowait = true } },
    ["gh"] = { "^", "Beginning of line", opts = { nowait = true } },
  },

  -- Pending operation
  o = {
    ["gl"] = { "$", "End of line", opts = { nowait = true } },
    ["gh"] = { "^", "Beginning of line", opts = { nowait = true } },
  },
}

M.chatgpt = {
  plugin = true,
  n = {
    ["<leader>ce"] = {
      "<cmd>ChatGPTEditWithInstructions<cr>",
      "ChatGPT Edit with instruction",
      opts = { silent = true },
    },
    ["<leader>cr"] = { "<cmd>ChatGPTRun<cr>", "ChatGPT Run", opts = { silent = true } },
  },
  v = {
    ["<leader>cf"] = { "<cmd>ChatGPTRun fix_bug<cr>", "ChatGPT fix highlighted bug", opts = { silent = true } },
  },
}

M.hop = {
  plugin = true,
  n = {
    ["<leader>j"] = { "<cmd>HopChar1<cr>", "Hop 1 Character", opts = { silent = true } },
  },
}

M.vimtex = {
  plugin = true,
  i = {
    ["<M-f>"] = { "<cmd>lua inkscape_figure()<cr>", "Create Inkscape figure" },
  },
  n = {
    ["<leader>d"] = { "<cmd>lua dragPDF()<cr>", "Drag PDF of current tex file" },
  },
}

M.fugitive = {
  plugin = true,
  n = {
    ["<leader>gs"] = { "<cmd>Git<cr>", "Git status", opts = { silent = true } },
    ["<leader>gd"] = { "<cmd>Gdiffsplit<cr>", "Git diff", opts = { silent = true } },
    ["<leader>gc"] = { "<cmd>Git commit<cr>", "Git commit", opts = { silent = true } },
    ["<leader>gx"] = { "<cmd>Git commit --amend<cr>", "Git amend", opts = { silent = true } },
    ["<leader>gp"] = { "<cmd>Git push<cr>", "Git push", opts = { silent = true } },
    ["<leader>gl"] = { "<cmd>Git pull<cr>", "Git pull", opts = { silent = true } },
    ["<Leader>gr"] = { "<cmd>Git rebase<cr>", "Git rebase", opts = { silent = true } },
    ["<Leader>gR"] = { "<cmd>Git reset<cr>", "Git reset", opts = { silent = true } },
    ["<leader>gC"] = { "<cmd>Git checkout<cr>", "Git checkout", opts = { silent = true } },
    ["<leader>gB"] = { "<cmd>Git branch<cr>", "Git branch", opts = { silent = true } },
    ["<leader>gT"] = { "<cmd>Git stash<cr>", "Git stash", opts = { silent = true } },
  },
}

-- M.dap = {
--   plugin = true,
--   n = {
--     ["<leader>db"] = {"<cmd> DapToggleBreakpoint <CR>"}
--   }
-- }
-- M.dap_python = {
--   plugin = true,
--   n = {
--     ["<leader>dpr"] = {
--       function()
--         require('dap-python').test_method()
--       end
--     }
--   }
-- }

-- more keybinds!

return M
