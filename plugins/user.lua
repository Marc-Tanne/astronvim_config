return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  { "tpope/vim-surround", lazy = false },
  -- {
  --   "jackMort/ChatGPT.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     require("chatgpt").setup({
  --       keymaps = {
  --         submit = "<C-q>"
  --       }
  --     })
  --   end,
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim"
  --   }
  -- },
  {
    "dpayne/CodeGPT.nvim",
    event = "VeryLazy",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require("codegpt.config")
    end
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = false
  },
  {
    "klen/nvim-test",
    event = "VeryLazy",
    config = function()
      require("nvim-test").setup {
        run = true,                 -- run tests (using for debug)
        commands_create = true,     -- create commands (TestFile, TestLast, ...)
        filename_modifier = ":p:.", -- modify filenames before tests run(:h filename-modifiers)
        silent = false,             -- less notifications
        term = "terminal",          -- a terminal to run ("terminal"|"toggleterm")
        termOpts = {
          direction = "vertical",   -- terminal's direction ("horizontal"|"vertical"|"float")
          width = 128,              -- terminal's width (for vertical|float)
          height = 24,              -- terminal's height (for horizontal|float)
          go_back = false,          -- return focus to original window after executing
          stopinsert = "auto",      -- exit from insert mode (true|false|"auto")
          keep_one = true,          -- keep only one terminal for testing
        },
        runners = {
          -- setup tests runners
          cs = "nvim-test.runners.dotnet",
          go = "nvim-test.runners.go-test",
          haskell = "nvim-test.runners.hspec",
          javascriptreact = "nvim-test.runners.jest",
          javascript = "nvim-test.runners.jest",
          lua = "nvim-test.runners.busted",
          python = "nvim-test.runners.pytest",
          ruby = "nvim-test.runners.rspec",
          rust = "nvim-test.runners.cargo-test",
          typescript = "nvim-test.runners.jest",
          typescriptreact = "nvim-test.runners.jest",
        }
      }
    end
  },
  {
    "ojroques/nvim-osc52",
    lazy = false,
    config = function()
      require('osc52').setup {
        trim = true
      }
      local function copy()
        if vim.v.event.operator == 'y' and vim.v.event.regname == 'a' then
          require('osc52').copy_register('a')
        end
      end
      vim.api.nvim_create_autocmd('TextYankPost', { callback = copy })
    end
  },
  {
    "iamcco/markdown-preview.nvim",
    config = function()
      vim.fn["mkdp#util#install"]()
      vim.g.mkdp_auto_start = 1
      vim.g.mkdp_filetypes = {"markdown", "puml"}
      vim.g.mkdp_open_to_the_world = 1
      vim.g.mkdp_open_ip = "192.168.56.109"
      vim.g.mkdp_echo_preview_url = 1
      vim.g.mkdp_command_for_global = 1
      vim.g.mkdp_open_to_the_world = 1
      vim.g.mkdp_theme = "dark"
    end,
    ft = { "markdown", "puml" },
  }
}
