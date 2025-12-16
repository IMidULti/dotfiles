return {
  "akinsho/git-conflict.nvim",
  version = "*",
  config = function()
    require("git-conflict").setup {
      default_mappings = true, -- disable this if you want to set custom mappings
      disable_diagnostics = true, -- This prevents LSP errors on conflict markers
    }
  end,
}
