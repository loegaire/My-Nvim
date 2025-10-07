return {
   {
    --place code down here
    'gen740/SmoothCursor.nvim',
      config = function()
    require('smoothcursor').setup()
      end,
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() 
    end, 
  "lewis6991/satellite.nvim",
  event = "BufEnter", -- Load on buffer enter to ensure UI elements are ready
  config = function()
    require("satellite").setup({
      current_only = false,
      winblend = 50,
      zindex = 40,
      excluded_filetypes = {},
      width = 2,
      handlers = {
        cursor = {
          enable = true,
          symbols = { "⎺", "⎻", "⎼", "⎽" },
        },
        search = {
          enable = true,
        },
        diagnostic = {
          enable = true,
          signs = { "-", "=", "≡" },
          min_severity = vim.diagnostic.severity.HINT,
        },
        gitsigns = {
          enable = true,
          signs = {
            add = "│",
            change = "│",
            delete = "-",
          },
        },
        marks = {
          enable = true,
          show_builtins = false,
          key = "m",
        },
        quickfix = {
          signs = { "-", "=", "≡" },
        },
      },
    })
  end,

  "Isrothy/neominimap.nvim",
  version = "v3.x.x",
  lazy = false, -- NOTE: NO NEED to Lazy load
  -- Optional. You can alse set your own keybindings
  keys = {
    -- Global Minimap Controls
    { "<leader>nm", "<cmd>Neominimap Toggle<cr>", desc = "Toggle global minimap" },
    { "<leader>no", "<cmd>Neominimap Enable<cr>", desc = "Enable global minimap" },
    { "<leader>nc", "<cmd>Neominimap Disable<cr>", desc = "Disable global minimap" },
    { "<leader>nr", "<cmd>Neominimap Refresh<cr>", desc = "Refresh global minimap" },

    -- Window-Specific Minimap Controls
    { "<leader>nwt", "<cmd>Neominimap WinToggle<cr>", desc = "Toggle minimap for current window" },
    { "<leader>nwr", "<cmd>Neominimap WinRefresh<cr>", desc = "Refresh minimap for current window" },
    { "<leader>nwo", "<cmd>Neominimap WinEnable<cr>", desc = "Enable minimap for current window" },
    { "<leader>nwc", "<cmd>Neominimap WinDisable<cr>", desc = "Disable minimap for current window" },

    -- Tab-Specific Minimap Controls
    { "<leader>ntt", "<cmd>Neominimap TabToggle<cr>", desc = "Toggle minimap for current tab" },
    { "<leader>ntr", "<cmd>Neominimap TabRefresh<cr>", desc = "Refresh minimap for current tab" },
    { "<leader>nto", "<cmd>Neominimap TabEnable<cr>", desc = "Enable minimap for current tab" },
    { "<leader>ntc", "<cmd>Neominimap TabDisable<cr>", desc = "Disable minimap for current tab" },

    -- Buffer-Specific Minimap Controls
    { "<leader>nbt", "<cmd>Neominimap BufToggle<cr>", desc = "Toggle minimap for current buffer" },
    { "<leader>nbr", "<cmd>Neominimap BufRefresh<cr>", desc = "Refresh minimap for current buffer" },
    { "<leader>nbo", "<cmd>Neominimap BufEnable<cr>", desc = "Enable minimap for current buffer" },
    { "<leader>nbc", "<cmd>Neominimap BufDisable<cr>", desc = "Disable minimap for current buffer" },

    ---Focus Controls
    { "<leader>nf", "<cmd>Neominimap Focus<cr>", desc = "Focus on minimap" },
    { "<leader>nu", "<cmd>Neominimap Unfocus<cr>", desc = "Unfocus minimap" },
    { "<leader>ns", "<cmd>Neominimap ToggleFocus<cr>", desc = "Switch focus on minimap" },
  },
 init = function()
    vim.opt.wrap = false
    vim.opt.sidescrolloff = 36

    ---@type Neominimap.UserConfig
    vim.g.neominimap = {
      auto_enable = true,
      -- Use split layout so the minimap never overlays your code
      layout = "split",
      split = {
        side = "right", -- show minimap on the right
        minimap_width = 20,
        winfixwidth = true,
      },
  buf_filter = function(bufnr)
        local line_count = vim.api.nvim_buf_line_count(bufnr)
        return line_count < 4096
      end,
      fold = {
        -- Enabled by default, allows seeing the minimap
        enabled = true,
      },
      git = {
        -- Show git signs in minimap
        enabled = true,
      },
      search = {
        -- Show search results in minimap  
        enabled = true,
      },
      mark = {
        -- Show marks in minimap
        enabled = true,
      },
      treesitter = {
        -- Use treesitter for better highlighting
        enabled = true,
      },
      click = {
        -- Enable clicking to jump to position
        enabled = true,
      },
    }
  end,
  config = function()
    -- Ensure minimap window is visually subtle
    vim.api.nvim_set_hl(0, "NeominimapBackground", { bg = "NONE", ctermbg = "NONE" })
    vim.api.nvim_set_hl(0, "NeominimapBorder", { bg = "NONE", ctermbg = "NONE" })
    -- Slight transparency if the plugin uses a floating/popup at times
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "neominimap",
      callback = function()
        pcall(function() vim.wo.winblend = 10 end)
      end,
    })
  end,
    "rachartier/tiny-glimmer.nvim",
    event = "VeryLazy",
    priority = 10, -- Needs to be a really low priority, to catch others plugins keybindings.
    opts = {
        -- your configuration
         search = {
            enabled = true,
            default_animation = "pulse",

            -- Keys to navigate to the next match
            next_mapping = "n",

            -- Keys to navigate to the previous match
            prev_mapping = "N",
        },
        undo = {
            enabled = true,

            default_animation = {
                name = "fade",

                settings = {
                  from_color = "DiffDelete",

                  max_duration = 500,
                  min_duration = 500,
                },
            },
            undo_mapping = "u",
        },
        redo = {
            enabled = true,

            default_animation = {
                name = "fade",

                settings = {
                    from_color = "DiffAdd",

                    max_duration = 500,
                    min_duration = 500,
                },
            },

            redo_mapping = "<c-r>",
        },
    },
   },

   {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = true,
        theme = 'everforest',
        component_separators = '|',
        section_separators = '',
      },
    },
  },
  {
    'akinsho/bufferline.nvim', 
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = 'BufEnter',
    opts = {
      options = {
        separator_style = "slant"
      }
    },
    config = function(_, opts)
      require("bufferline").setup(opts)
    end,
  },
  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    main = "ibl",
    -- See `:help indent_blankline.txt`
    opts = {},
  },
  {
    'mbbill/undotree',
    event = 'BufEnter',
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
  {
  'mawkler/modicator.nvim',
  dependencies = 'mawkler/onedark.nvim', -- Add your colorscheme plugin here
  init = function()
    -- These are required for Modicator to work
    vim.o.cursorline = true
    vim.o.number = true
    vim.o.termguicolors = true
  end,
  opts = {
    -- Warn if any required option above is missing. May emit false positives
    -- if some other plugin modifies them, which in that case you can just
    -- ignore. Feel free to remove this line after you've gotten Modicator to
    -- work properly.
    show_warnings = true,
  }
},
}
