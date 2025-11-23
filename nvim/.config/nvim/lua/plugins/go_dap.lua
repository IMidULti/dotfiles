-- lua/plugins/go-dap.lua
return {
  "leoluz/nvim-dap-go",
  ft = "go",
  dependencies = { "mfussenegger/nvim-dap" },

  config = function()
    local dap_go = require("dap-go")
    local dap = require("dap")

    dap_go.setup()

    -- Custom Debug Configuration
    dap.configurations.go = dap.configurations.go or {}

    table.insert(dap.configurations.go, {
      name = "Build & Debug (cwd)",
      type = "go",
      request = "launch",

      -- Build step (runs before dlv)
      preLaunchTask = function()
        vim.fn.jobstart("go build -o ./debugbin", { detach = true })
      end,

      program = "./debugbin",

      -- Equivalent to: dlv exec /tmp/debugbin
      dlvToolPath = "dlv",
    })

    -- Keymaps (AstroNvim safe)
    local function map(lhs, rhs, desc)
      vim.keymap.set("n", lhs, rhs, { silent = true, desc = desc })
    end

    map("<leader>dc", dap.continue,        "DAP: Continue/Start")
    map("<leader>db", dap.toggle_breakpoint, "DAP: Toggle Breakpoint")
    map("<leader>do", dap.step_over,       "DAP: Step Over")
    map("<leader>di", dap.step_into,       "DAP: Step Into")
    map("<leader>dO", dap.step_out,        "DAP: Step Out")
    map("<leader>dl", dap.run_last,        "DAP: Run Last")
  end,
}

