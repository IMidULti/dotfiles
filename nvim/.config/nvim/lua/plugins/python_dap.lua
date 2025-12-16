-- lua/plugins/python-dap.lua
return {
  "mfussenegger/nvim-dap-python",
  ft = "python",
  dependencies = { "mfussenegger/nvim-dap" },

  config = function()
    local dap_python = require "dap-python"
    local dap = require "dap"

    -- Setup dap-python (adjust path to your Python with debugpy installed)
    -- This will try common locations, or you can specify directly:
    -- dap_python.setup("/path/to/python")
    dap_python.setup "python3"

    -- Custom Debug Configurations
    dap.configurations.python = dap.configurations.python or {}

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
              if config.python then
                -- Prepend project configs so they appear first in the selection menu
                for i = #config.python, 1, -1 do
                  table.insert(dap.configurations.python, 1, config.python[i])
                end
              end
            end
            vim.notify("Loaded Python DAP config from " .. config_file, vim.log.levels.INFO)
            return true
          end
        end
      end
      return false
    end

    -- Auto-load project config when opening Python files
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "python",
      callback = load_project_dap_config,
      once = true,
    })

    -- Keymaps (if not already set by go_dap)
    local function map(lhs, rhs, desc) vim.keymap.set("n", lhs, rhs, { silent = true, desc = desc }) end

    -- Only set these if they haven't been set already
    if not vim.fn.mapcheck("<leader>dc", "n") or vim.fn.mapcheck("<leader>dc", "n") == "" then
      map("<leader>dc", dap.continue, "DAP: Continue/Start")
      map("<leader>db", dap.toggle_breakpoint, "DAP: Toggle Breakpoint")
      map("<leader>do", dap.step_over, "DAP: Step Over")
      map("<leader>di", dap.step_into, "DAP: Step Into")
      map("<leader>dO", dap.step_out, "DAP: Step Out")
      map("<leader>dl", dap.run_last, "DAP: Run Last")
    end

    map("<leader>dL", load_project_dap_config, "DAP: Load Project Config")

    -- Python-specific test mappings
    map("<leader>dtm", dap_python.test_method, "DAP: Test Method")
    map("<leader>dtc", dap_python.test_class, "DAP: Test Class")
  end,
}
