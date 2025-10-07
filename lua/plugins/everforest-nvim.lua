return {
  "neanias/everforest-nvim",
  version = false,
  lazy = false,
  priority = 1000, -- make sure to load this before all the other start plugins
  -- Optional; default configuration will be used if setup isn't called.
  config = function()
    require("everforest").setup({
  on_highlights = function(hl, palette)
    -- The default highlights for TSBoolean is linked to `Purple` which is fg
    -- purple and bg none. If we want to just add a bold style to the existing,
    -- we need to have the existing *and* the bold style. (We could link to
    -- `PurpleBold` here otherwise.)
    hl.TSBoolean = { fg = palette.purple, bg = palette.none, bold = true }
  end,
})
  end,
}
