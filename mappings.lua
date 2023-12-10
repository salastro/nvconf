---@type MappingsTable
local M = {}

M.general = {
  -- Insert mode
  i = {
    ["<C-s>"] = { "<cmd>normal! mm[s1z=`m<cr>", "Spell check previous mistake", opts = { silent = true } },
  },
  -- Normal mode
  n = {
    -- General
    [";"] = { ":", "Enter command mode", opts = { nowait = true } },
    [":"] = { ";" },
    ["gl"] = { "$", "End of line", opts = { nowait = true } },
    ["gh"] = { "^", "Beginning of line", opts = { nowait = true } },
    ["daE"] = { "ggdG", "Delete all" },
    ["gs"] = { "z=1<cr>", "Correct spell", opts = { nowait = true } },

    -- Quick Fix
    ["<leader>q"] = { "<cmd>lua toggle_quickfix()<cr>", "Toggle quickfix", opts = { silent = true } },
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
