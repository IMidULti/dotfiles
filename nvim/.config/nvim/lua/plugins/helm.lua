---@type LazySpec
return {
  "towolf/vim-helm",
  ft = { "helm", "gotmpl" },
  config = function()
    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
      pattern = { "*argo*/*.yaml", "*argo*/*.yml" },
      callback = function(args)
        vim.bo[args.buf].filetype = "helm"
      end,
    })
  end,
}
