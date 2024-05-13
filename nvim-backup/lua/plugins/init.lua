return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require "configs.conform"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- lua
        "lua-language-server",
        "stylua",

        -- web dev
        "html-lsp",
        "css-lsp",
        "css-variables-language-server",
        "prettier",
        "tailwindcss-language-server",
        "eslint-lsp",
        "graphql-language-service-cli",
        "js-debug-adapter",

        -- shell
        "shfmt",
        "bash-language-server",
        "bash-debug-adapter",

        -- docker
        "docker-compose-language-server",
        "dockerfile-language-server",

        -- go
        "gopls",
        "go-debug-adapter",

        -- python
        "debugpy",

        -- web debug
        "firefox-debug-adapter",

        -- markdown
        "marksman",

        -- sql
        "sqls",

        -- configs
        "json-lsp",
        "yaml-language-server"
      },
    },
  },

  {
    "mfussenegger/nvim-dap",
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = "mason.nvim",
    cmd = { "DapInstall", "DapUninstall" },
    opts = {
      automatic_installation = true,
      ensure_installed = { "js", "firefox", "bash", "python" },
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    cmd = { "LspInstall", "LspUninstall" },
    config = function()
      require("mason-lspconfig").setup()
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "jsdoc",
        "typescript",
        "tsx",
        "markdown",
        "markdown_inline",
        "json",
        "jsonc",
        "yaml",
        "graphql",
        "go",
        "bash",
        "dockerfile",
        "gitignore",
      },
    },
  },

  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    lazy = false,
    opts = {},
  },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-jest",
    },
    config = function()
      require("neotest").setup {
        adapters = {
          require "neotest-jest" {
            jestCommand = "yarn test --",
            -- jestConfigFile = "custom.jest.config.ts",
            -- env = { CI = true },
            cwd = function(path)
              return vim.fn.getcwd()
            end,
          },
        },
      }
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  {
    "b0o/schemastore.nvim",
    version = "*",
  },
}
