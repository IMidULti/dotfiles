return {
  "nvim-mini/mini.map",
  version = "*",
  keys = {
    { "<leader>mm", function() require("mini.map").toggle() end, desc = "Toggle Minimap" },
  },
  config = function()
    require("mini.map").setup({})

    vim.api.nvim_set_hl(0, "MiniMapNormal", { bg = "#2d2d2d", fg = "#d4d4d4" })
    vim.api.nvim_set_hl(0, "MiniMapVisual", { bg = "#5a5a5a", fg = "#ffffff" })
    vim.api.nvim_set_hl(0, "MiniMapScrollbar", { bg = "#404040", fg = "#7aa2f7" })
    vim.api.nvim_set_hl(0, "MiniMapScrollbarThumb", { bg = "#565f89", fg = "#565f89" })
  end,
}
