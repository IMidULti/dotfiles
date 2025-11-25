---@type LazySpec
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      yamlls = {
        settings = {
          yaml = {
            validate = true,
            hover = true,
            completion = true,
            format = { enable = true },
            schemas = {
              -- Kubernetes schema, applied to various patterns
              kubernetes = {
                -- common k8s filename patterns
                "/*.k8s.yaml",
                "/*.k8s.yml",
                "*/k8s/**/*.yaml",
                "*/k8s/**/*.yml",
                "*/manifests/**/*.yaml",
                "*/manifests/**/*.yml",
                -- generic: any yaml in a k8s directory
                "kubernetes/**/*.yaml",
                "kubernetes/**/*.yml",
              },
              -- examples for other yaml types (keep/add as you like)
              ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
              ["https://json.schemastore.org/github-action.json"] = "/.github/action.{yml,yaml}",
            },
          },
        },
      },
    },
  },
}
