-- flatten.nvim: Prevents nested Neovim instances when opening files from terminal
-- This plugin allows you to open files in the existing Neovim instance instead of
-- creating a new one when you run `nvim` from a terminal inside Neovim (e.g., from lazygit).
--
-- Configuration:
-- - Opens files in an alternate window
-- - Blocks (waits) for git commit messages to be written before continuing
-- - Automatically closes the terminal window (e.g., lazygit overlay) when opening regular files
-- - This makes the workflow smoother when using lazygit's 'e' command to edit files

return {
  "willothy/flatten.nvim",
  opts = {
    window = {
      open = "alternate",
    },
    hooks = {
      should_block = function(argv)
        -- Block for git commits, but not for regular file edits
        return vim.tbl_contains(argv, "-c") or vim.tbl_contains(argv, "--no-edit")
      end,
      post_open = function(opts)
        -- opts contains: bufnr, winnr, filetype, is_blocking, is_diff, data

        -- If it's a normal file edit from the terminal (e.g., lazygit 'e' command)
        if not opts.is_blocking then
          -- Find and close the terminal window (lazygit overlay)
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            local buf = vim.api.nvim_win_get_buf(win)
            if vim.bo[buf].buftype == "terminal" then
              vim.api.nvim_win_close(win, false)
              break
            end
          end

          -- Focus the window with the newly opened file
          vim.api.nvim_set_current_win(opts.winnr)
        end
      end,
    },
  },
  lazy = false,
  priority = 1001,
}
