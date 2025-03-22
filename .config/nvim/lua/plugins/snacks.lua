return {
  "snacks.nvim",
  opts = {
    indent = { enabled = false },
    input = { enabled = true },
    notifier = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = false }, -- we set this in options.lua
    toggle = { map = LazyVim.safe_keymap_set },
    words = { enabled = true },
  },
}
