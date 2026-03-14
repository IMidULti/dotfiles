return {
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  init = function()
    -- Force Lazygit to use nvim so flatten.nvim can catch the command
    vim.env.EDITOR = "nvim"
    vim.env.GIT_EDITOR = "nvim"
  end,
  keys = {
    { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
  },
}
