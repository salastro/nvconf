local overrides = require "custom.configs.overrides"
local autocmd = vim.api.nvim_create_autocmd

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {},
    opts = function()
      return require "custom.configs.cmp"
    end,
    config = function(_, opts)
      require("cmp").setup(opts)
    end,
  },

  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require "custom.configs.db"
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {}
    end,
  },

  {
    "baskerville/vim-sxhkdrc",
    ft = "sxhkdrc",
    config = function()
      autocmd("BufWritePost", {
        pattern = "sxhkdrc",
        command = "!pkill -USR1 sxhkd",
      })
    end,
  },

  {
    "kmonad/kmonad-vim",
    lazy = false,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "benfowler/telescope-luasnip.nvim",
      config = function()
        require('telescope').load_extension('luasnip')
      end,
    },
  },

  {
    "lervag/vimtex",
    ft = "tex",
    dependencies = {
      "iurimateus/luasnip-latex-snippets.nvim",
    },
    config = function()
      require "custom.configs.vimtex"
      require("core.utils").load_mappings "vimtex"
      require("luasnip-latex-snippets").setup()
      -- or setup({ use_treesitter = true })
      require("luasnip").config.setup { enable_autosnippets = true }
    end,
  },

  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
  },

  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      vim.g.copilot_assume_mapped = true
    end,
  },

  {
    "kevinhwang91/nvim-hlslens",
    event = "SearchWrapped",
    config = function()
      require("hlslens").setup()
    end,
  },

  {
    "christoomey/vim-sort-motion",
    event = "VeryLazy",
  },

  {
    "christoomey/vim-titlecase",
    event = "VeryLazy",
  },

  {
    "smoka7/hop.nvim",
    event = "VeryLazy",
    config = function()
      require("hop").setup()
      require("core.utils").load_mappings "hop"
    end,
  },

  -- -- To make a plugin not be loaded
  -- -- LuaSnip
  -- {
  --   "L3MON4D3/LuaSnip",
  --   enabled = false,
  -- },

  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    config = function()
      require("core.utils").load_mappings "fugitive"
      autocmd("FileType", {
        pattern = "fugitive",
        command = "nnoremap <buffer> cc :vert Git commit<cr> | nnoremap <buffer> gp :Git push<cr>",
      })
    end,
  },

  {
    -- automatically adjusts 'shiftwidth' and 'expandtab'
    "tpope/vim-sleuth",
    lazy = false,
  },

  {
    "Julian/lean.nvim",
    event = { "BufReadPre *.lean", "BufNewFile *.lean" },

    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-lua/plenary.nvim",
      -- you also will likely want nvim-cmp or some completion engine
    },

    -- see details below for full configuration options
    opts = {
      mappings = true,
    },
  },

  {
    "wakatime/vim-wakatime",
    lazy = false,
  },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
