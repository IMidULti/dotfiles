-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "go",
      "yaml",
      "helm",
      "python",
      "markdown",
      "json",
      "bash"
    },
    highlight = { enable = true },
    indent = { enable = true },
  },
}
