-- lua/user/filetype.lua

-- Add a custom filetype for the .yaml.gotmpl extension
vim.filetype.add {
  -- Use the pattern key for complex/multiple extensions
  pattern = {
    -- The key is the Lua pattern to match the filename
    ["%.yaml%.gotmpl"] = "yaml.gotmpl",
  },
}
