return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  opts = {
    terminal = {
      snacks_win_opts = {
        position = "float", -- Open Claude in a floating window
        width = 0.85, -- 85% of screen width
        height = 0.85, -- 85% of screen height
      },
    },
  },
  config = true,
  keys = {
    -- AI/Claude Code keybindings
    { "<Leader>a", desc = "AI/Claude Code" },

    -- Core Claude commands
    { "<Leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude Code" },
    { "<Leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude Code" },
    { "<Leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude session" },
    { "<Leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },

    -- Model and buffer management
    { "<Leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
    { "<Leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer to Claude" },

    -- Visual mode: send selection to Claude
    { "<Leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send selection to Claude" },

    -- Diff management
    { "<Leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept Claude diff" },
    { "<Leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny Claude diff" },
  },
}
