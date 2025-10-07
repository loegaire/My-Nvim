return {
  -- Simple plugins that don't require complex configuration
  'RRethy/vim-illuminate',
  
  -- Git related plugins
  {
    'tpope/vim-fugitive',
    lazy = true,
  },
  {
    'tpope/vim-rhubarb',
    lazy = true
  },
  
  -- DAP (Debug Adapter Protocol)
  {
    'mfussenegger/nvim-dap',
  },
  
  -- Formatter
  {
    'sbdchd/neoformat',
  },
  
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  
  -- Motion plugin
  'justinmk/vim-sneak',
  
  -- Color highlighter
  {
    'norcalli/nvim-colorizer.lua',
    event = 'ColorScheme',
    config = function()
      require('colorizer').setup()
    end,
  },
  
  -- Useful plugin to show you pending keybinds
  { 
    'folke/which-key.nvim', 
    opts = {} 
  },
  
  -- "gc" to comment visual regions/lines
  { 
    'numToStr/Comment.nvim', 
    opts = {} 
  },
}
