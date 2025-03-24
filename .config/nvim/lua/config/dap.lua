local dap = require("dap")

dap.adapters.ruby = {
  type = "executable",
  command = "bundle",
  args = { "exec", "rdbg", "--open", "--port", "12345", "--nonstop", "--command" }
}

dap.configurations.ruby = {
  {
    type = "ruby",
    name = "Debug Rails server",
    request = "attach",
    port = 12345,
    localfs = true,
    remotefs = nil,
    waitFor = true,
  },
}

