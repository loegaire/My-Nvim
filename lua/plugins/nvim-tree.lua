return {
  'nvim-tree/nvim-tree.lua',
  event = 'BufEnter',
  config = function()
    vim.keymap.set('n','tr',vim.cmd.NvimTreeToggle)
    vim.keymap.set('n','<leader>fi',vim.cmd.NvimTreeFindFile)
    require("nvim-tree").setup({
      sort_by = "case_sensitive",
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
    })
  end,
}
