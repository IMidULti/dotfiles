-- lua/plugins/go-dap.lua
return {
  "leoluz/nvim-dap-go",
  ft = "go",
  dependencies = { "mfussenegger/nvim-dap" },

  config = function()
    local dap_go = require "dap-go"
    local dap = require "dap"

    dap_go.setup()

    -- Custom Debug Configuration
    dap.configurations.go = dap.configurations.go or {}

    -- Load project-local debug configuration
    local function load_project_dap_config()
      local config_files = {
        ".nvim/dap.lua",
        ".nvim-dap.lua",
        ".dap.lua",
      }

      for _, config_file in ipairs(config_files) do
        local path = vim.fn.getcwd() .. "/" .. config_file
        if vim.fn.filereadable(path) == 1 then
          local ok, config = pcall(dofile, path)
          if ok and config then
            -- If the config returns a table, merge it with existing configurations
            if type(config) == "table" then
              if config.go then
                -- Prepend project configs so they appear first in the selection menu
                for i = #config.go, 1, -1 do
                  table.insert(dap.configurations.go, 1, config.go[i])
                end
              end
            end
            vim.notify("Loaded DAP config from " .. config_file, vim.log.levels.INFO)
            return true
          end
        end
      end
      return false
    end

    -- Auto-load project config when opening Go files
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "go",
      callback = load_project_dap_config,
      once = true,
    })

    --table.insert(dap.configurations.go, {
    --  name = "Debug package(custom)",
    --  type = "go",
    --  request = "launch",
    --  mode = "debug", -- or omit; it's default
    --  program = "${fileDirname}", -- current package directory
    --  stopOnEntry = true,
    --  console = "integratedTerminal",
    --})

    -- Keymaps (AstroNvim safe)
    local function map(lhs, rhs, desc) vim.keymap.set("n", lhs, rhs, { silent = true, desc = desc }) end

    map("<leader>dc", dap.continue, "DAP: Continue/Start")
    map("<leader>db", dap.toggle_breakpoint, "DAP: Toggle Breakpoint")
    map("<leader>do", dap.step_over, "DAP: Step Over")
    map("<leader>di", dap.step_into, "DAP: Step Into")
    map("<leader>dO", dap.step_out, "DAP: Step Out")
    map("<leader>dl", dap.run_last, "DAP: Run Last")
    map("<leader>dL", load_project_dap_config, "DAP: Load Project Config")
  end,
}
