-- Customize Treesitter
-- --------------------
-- nvim-treesitter (main branch) only installs parsers; AstroNvim v6 configures
-- highlighting, indent and installation through AstroCore's `treesitter` options.

-- Map gohtml filetype to gotmpl parser
vim.treesitter.language.register("gotmpl", "gohtml")

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    treesitter = {
      highlight = true,
      indent = true,
      auto_install = true,
      ensure_installed = {
        "lua",
        "vim",
        "go",
        "yaml",
        "helm",
        "python",
        "markdown",
        "markdown_inline",
        "json",
        "bash",
        "gotmpl",
        "hcl",
        "terraform",
      },
    },
  },
}
