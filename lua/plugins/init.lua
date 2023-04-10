local lazy_status, lazy = pcall(require, 'lazy')
if lazy_status then
  lazy.setup({
    { 'christoomey/vim-tmux-navigator' },
    { 'nvim-lua/plenary.nvim' },

    {
      'glepnir/dashboard-nvim',
      event = 'VimEnter',
      config = function()
        return require 'plugins.config.dashboard'
      end
    },
    {
      'nvim-neo-tree/neo-tree.nvim',
      cmd = 'Neotree',
      dependencies = {
        'MunifTanjim/nui.nvim',
        'nvim-web-devicons'
      },
      init = function()
        vim.g.neo_tree_remove_legacy_commands = true
      end,
      config = function()
        require 'plugins.config.neotree'
      end
    },
    {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.1',
      config = function()
        require('telescope').setup()
      end
    },
    {
      'akinsho/bufferline.nvim',
      version = 'v3*',
      dependencies = 'nvim-web-devicons',
      config = function()
        require 'plugins.config.bufferline'
      end,
      event = 'BufWinEnter'
    },
    {
      'nvim-lualine/lualine.nvim',
      config = function()
        require 'plugins.config.lualine'
      end
    },
    {
      'lewis6991/gitsigns.nvim',
      event = 'BufRead',
      config = function()
        require('gitsigns').setup()
      end,
    },
    {
      'lukas-reineke/indent-blankline.nvim',
      event = 'BufRead',
      config = function()
        require 'plugins.config.blankline'
      end,
    },
    {
      'numToStr/Comment.nvim',
      event = 'InsertEnter',
      config = function()
        require('Comment').setup()
      end
    },
    {
      'windwp/nvim-autopairs',
      event = 'InsertEnter',
      opts = {
        check_ts = true,
        ts_config = {
          lua = {'string'},
          javascript = {'template_string'},
          java = false,
        }
      },
      config = function(_, opts)
        require('nvim-autopairs').setup(opts)
      end
    },
    {
      'norcalli/nvim-colorizer.lua',
      event = 'BufRead',
      config = function()
        require('colorizer').setup()
      end
    },
    {
      'nvim-tree/nvim-web-devicons',
      lazy = true,
      dependencies = 'DaikyXendo/nvim-material-icon',
      config = function()
        require('nvim-web-devicons').setup({
          override = require('nvim-material-icon').get_icons()
        })
      end
    },
    {
      'andweeb/presence.nvim',
      opts = {
        auto_update = true,
        neovim_image_text = "The One True Text Editor",
        main_image = "file",
        log_level = nil,
        debounce_timeout = 10,
        enable_line_number = false,
        blacklist = {},
        buttons = true,
        file_assets = {},
        show_time = true,

        editing_text = "Editing %s",
        file_explorer_text = "Browsing %s",
        git_commit_text = "Committing changes",
        plugin_manager_text = "Managing plugins",
        reading_text = "Reading %s",
        workspace_text = "Working on %s",
        line_number_text = "Line %s out of %s",
      },
      config = function(_, opts)
        require('presence').setup(opts)
      end
    },

    -- lang configs
    {
      'nvim-treesitter/nvim-treesitter',
      event = { 'BufReadPost', 'BufNewFile' },
      cmd = { 'TSIntall', 'TSBufEnable', 'TSBufDisable', 'TSModuleInfo' },
      build = ':TSUpdate',
      config = function()
        require('plugins.config.treesitter')
      end
    },
    {
      'hrsh7th/nvim-cmp',
      event = 'InsertEnter',
      dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'saadparwaiz1/cmp_luasnip',
        'L3MON4D3/LuaSnip',
        'rafamadriz/friendly-snippets',
        'onsails/lspkind.nvim'
      },
      config = function()
        require('plugins.lsp.cmp')
      end
    },
    {
      'neovim/nvim-lspconfig',
      event = { "BufReadPre", "BufNewFile" },
      dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'mason.nvim',
        'mason-lspconfig.nvim'
      },
      config = function()
        require('plugins.lsp.lspconfig')
      end
    },
    {
      'williamboman/mason.nvim',
      cmd = 'Mason',
      build = ':MasonUpdate',
      dependencies = 'mason-lspconfig.nvim',
      config = function()
        require('mason').setup()
      end
    },
    {
      'williamboman/mason-lspconfig.nvim',
      lazy = true,
      opts = {
        ensure_installed = {
          'html',
          'cssls',
          'pylsp',
          'tsserver',
          'volar',
          'lua_ls'
        }
      },
      config = function(_, opts)
        require('mason-lspconfig').setup(opts)
      end
    },
    {
      'glepnir/lspsaga.nvim',
      event = "LspAttach",
      dependencies = {
        'nvim-web-devicons',
        'nvim-treesitter'
      },
      config = function()
        require('lspsaga').setup()
      end
    },

    -- theme
    {
      'catppuccin/nvim',
      name = 'catppuccin',
      config = function()
        require('catppuccin').setup({
          flavour = 'mocha',
          -- transparent_background = true
        })
        vim.cmd('colorscheme catppuccin')
      end
    }
  })
end
