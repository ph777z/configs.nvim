local lazy_status, lazy = pcall(require, 'lazy')
if lazy_status then
  lazy.setup({
    -- theme
    {
      'catppuccin/nvim',
      name = 'catppuccin',
      config = function()
        require('catppuccin').setup({
          flavour = 'mocha',
        })
        vim.cmd('colorscheme catppuccin')
      end,
    },

    -- ui
    {
      'glepnir/dashboard-nvim',
      event = 'VimEnter',
      config = function()
        require('plugins.config.dashboard')
      end,
    },
    {
      'nvim-neo-tree/neo-tree.nvim',
      branch = 'v3.x',
      event = 'VimEnter',
      dependencies = {
        'MunifTanjim/nui.nvim',
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
      },
      config = function()
        require('plugins.config.neotree')
        require('plugins.config.web-devicons')
      end,
    },
    {
      'nvim-telescope/telescope.nvim',
      branch = '0.1.x',
      cmd = 'Telescope',
      dependencies = {
        'nvim-lua/plenary.nvim',
      },
      config = function()
        require('telescope').setup()
      end,
    },
    {
      'akinsho/bufferline.nvim',
      version = 'v3*',
      event = 'User FileOpened',
      dependencies = 'nvim-web-devicons',
      config = function()
        require('plugins.config.bufferline')
      end,
    },
    {
      'nvim-lualine/lualine.nvim',
      event = 'User FileOpened',
      config = function()
        require('plugins.config.lualine')
      end,
    },

    -- editor
    {
      'lewis6991/gitsigns.nvim',
      event = 'User FileOpened',
      config = function()
        require('gitsigns').setup()
      end,
    },
    {
      'lukas-reineke/indent-blankline.nvim',
      main = 'ibl',
      event = 'User FileOpened',
      config = function()
        require('plugins.config.blankline')
      end,
    },
    {
      'numToStr/Comment.nvim',
      event = 'User FileOpened',
      config = function()
        require('Comment').setup()
      end,
    },
    {
      'windwp/nvim-autopairs',
      event = 'User FileOpened',
      opts = {
        check_ts = true,
        ts_config = {
          lua = { 'string' },
          javascript = { 'template_string' },
          java = false,
        },
      },
      config = function(_, opts)
        require('nvim-autopairs').setup(opts)
      end,
    },
    {
      'norcalli/nvim-colorizer.lua',
      event = 'User FileOpened',
      config = function()
        require('colorizer').setup()
      end,
    },

    -- others
    { 'christoomey/vim-tmux-navigator' },

    -- lsp configs
    {
      'hrsh7th/nvim-cmp',
      event = 'InsertEnter',
      dependencies = {
        'LuaSnip',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-nvim-lsp',
        'onsails/lspkind.nvim',
        'saadparwaiz1/cmp_luasnip',
        'rafamadriz/friendly-snippets',
      },
      config = function()
        require('plugins.lsp.cmp')
      end,
    },
    {
      'L3MON4D3/LuaSnip',
      version = '2.*',
      run = 'make install_jsregexp',
      config = function()
        require('luasnip').setup()
      end
    },
    {
      'neovim/nvim-lspconfig',
      event = 'User FileOpened',
      dependencies = {
        'mason.nvim',
        'nvim-web-devicons',
        'nvim-treesitter',
        'nvimdev/lspsaga.nvim',
      },
      config = function()
        require('plugins.lsp.lspconfig')
        require('lspsaga').setup()
      end,
    },
    {
      'williamboman/mason.nvim',
      dependencies = 'williamboman/mason-lspconfig.nvim',
      cmd = {
        'Mason',
        'MasonInstall',
        'MasonLog',
        'MasonUninstall',
        'MasonUninstallAll',
        'MasonUpdate',
      },
      config = function()
        require('mason').setup()
        require('mason-lspconfig').setup({
          ensure_installed = {
            'bashls',
            'cssls',
            'html',
            'lua_ls',
            'pyright',
            'ts_ls',
            'volar',
          },
        })
      end,
    },
    {
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
      dependencies = 'HiPhish/rainbow-delimiters.nvim',
      config = function()
        require('plugins.config.treesitter')
      end,
    },
  })
end
