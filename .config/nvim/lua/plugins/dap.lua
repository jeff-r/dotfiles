return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",      -- UI for DAP
      "theHamsta/nvim-dap-virtual-text"
      -- "mfussenegger/nvim-dap-ruby" -- Ruby-specific adapter
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      require("dap-ruby").setup() -- Setup Ruby DAP adapter

      dapui.setup()
      require("nvim-dap-virtual-text").setup()

      -- Automatically open UI on debugging start
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  }
}

