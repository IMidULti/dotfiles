-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
  },
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        -- Enable treesitter highlighting and disable regex syntax
        pcall(vim.treesitter.start)
        -- Enable treesitter-based indentation
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
    local ensureInstalled = {
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
    }
    local alreadyInstalled = require("nvim-treesitter.info").installed_parsers()
    local parsersToInstall = vim.iter(ensureInstalled)
      :filter(function(parser)
        return not vim.tbl_contains(alreadyInstalled, parser)
      end)
      :totable()
    local install_module = require("nvim-treesitter.install")
    if install_module and install_module.ensure_installed then
      install_module.ensure_installed(parsersToInstall)
    end
  end,
  config = function(_, opts)
    -- Map gohtml filetype to gotmpl parser
    vim.treesitter.language.register("gotmpl", "gohtml")
    require("nvim-treesitter").setup(opts)
  end,
}
