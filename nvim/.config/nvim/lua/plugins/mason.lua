-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        "lua-language-server",
        "terraform-ls",
        "gopls", -- Go language server (ESSENTIAL)
        "pyright", -- Python language server

        -- install formatters
        "stylua",
        "goimports", -- or "gofumpt" for stricter formatting
        "black", -- Python formatter
        "isort", -- Python import sorter

        -- install linters
        "ruff", -- Python linter/formatter (fast!)
        "tflint", -- Terraform linter

        -- install debuggers
        "debugpy", -- Python debugger
        "delve", -- Go debugger

        -- install any other package
        "tree-sitter-cli",
      },
    },
  },
}
