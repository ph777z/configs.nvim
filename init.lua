local lazypath = vim.fn.stdpath('data') .. 'lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  require('core.bootstrap').lazy(lazypath)
end

vim.opt.rtp:prepend(lazypath)
require 'plugins'

-- require('plugins-setup')

-- require('config.options')
-- require('config.keymaps')

-- -- plugins
-- require('plugins.theme')
-- require('plugins.devicons')
-- require('plugins.comment')
-- require('plugins.nvim-tree')
-- require('plugins.lualine')
-- require('plugins.telescope')
-- require('plugins.nvim-cmp')
-- require('plugins.dashboard')
-- require('plugins.gitsigns')
-- require('plugins.bufferline')
-- require('plugins.colorizer')
-- require('plugins.ds-presence')
-- require('plugins.blankline')

-- -- lsp 
-- require('plugins.lsp.mason')
-- require('plugins.lsp.lspsaga')
-- require('plugins.lsp.lspconfig')

-- -- highlighting and autoclosing
-- require('plugins.treesitter')
-- require('plugins.autopairs')
