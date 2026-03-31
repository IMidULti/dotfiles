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
      "bash",
      "gotmpl",
      "hcl",
      "terraform",
    },
    highlight = { enable = true },
    indent = { enable = true },
  },
  config = function(_, opts)
    -- Map gohtml filetype to gotmpl parser
    vim.treesitter.language.register("gotmpl", "gohtml")
    require("nvim-treesitter.configs").setup(opts)
  end,
}
