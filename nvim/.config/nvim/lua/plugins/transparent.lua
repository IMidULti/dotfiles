return {
  "xiyaowong/transparent.nvim",
  lazy = false,  -- load immediately so highlights are cleared early
  config = function()
    require("transparent").setup({
      extra_groups = {
        "NormalFloat",    -- floating windows (help, plugin popups)
        "NvimTreeNormal", -- example: file tree plugin
      },
      exclude_groups = {},
      -- other options as default
    })
    vim.cmd([[TransparentEnable]])
  end,
}

