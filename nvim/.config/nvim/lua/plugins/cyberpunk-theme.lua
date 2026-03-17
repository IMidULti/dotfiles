return {
  "pablobfonseca/cyberpunk-theme",
  priority = 1000,
  config = function()
    require("cyberpunk").setup {
      -- Your config here
    }
    vim.cmd "colorscheme cyberpunk"
  end,
}
