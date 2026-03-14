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
