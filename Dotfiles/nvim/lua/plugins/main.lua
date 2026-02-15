return {
  -- Catppuccin Color Theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      transparent_background = false,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        telescope = true,
        notify = true,
        mini = true,
      },
    },
  },

  -- Set Catppuccin as default theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },

  -- LazyGit
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
    config = function()
      -- Set catppuccin-mocha theme for lazygit
      vim.g.lazygit_floating_window_scaling_factor = 0.9
      vim.g.lazygit_floating_window_winblend = 0
    end,
  },

  -- Trouble (diagnostics viewer) - configure it
  {
    "folke/trouble.nvim",
    opts = {
      use_diagnostic_signs = true,
    },
  },

  -- Telescope (fuzzy finder) - custom keymaps and layout
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- Add keymap to browse plugin files
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },

  -- Language Support: TypeScript/JavaScript
  { import = "lazyvim.plugins.extras.lang.typescript" },

  -- Language Support: JSON
  { import = "lazyvim.plugins.extras.lang.json" },

  -- Python LSP - add pyright
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
      },
    },
  },

  -- Treesitter - syntax highlighting and parsing
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "rust",
      },
    },
  },

  -- Mason - tool installer (LSPs, formatters, linters)
  {
    "mason-org/mason.nvim",
    opts = {
      automatic_enable = true,
      ensure_installed = {
        "stylua", -- Lua formatter
        "shellcheck", -- Shell script linter
        "shfmt", -- Shell script formatter
        "flake8", -- Python linter
        "prettier", -- Multi-language formatter
        "eslint_d", -- JavaScript/TypeScript linter
        "rust_analyzer", --Rust formatters
      },
    },
  },
}
