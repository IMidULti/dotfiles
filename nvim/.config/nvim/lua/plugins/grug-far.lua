-- Configure grug-far with custom keybindings
return {
  "MagicDuck/grug-far.nvim",
  opts = {
    -- Add any grug-far specific options here if needed
  },
  keys = {
    {
      "<Leader>sr",
      function()
        local grug = require("grug-far")
        local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
        grug.open({
          transient = true,
          prefills = {
            filesFilter = ext and ext ~= "" and "*." .. ext or nil,
          },
        })
      end,
      desc = "Search and Replace",
    },
  },
}
