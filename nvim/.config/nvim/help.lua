local function key(mode, key, cmd, opts)
  vim.keymap.set(mode, key, cmd, opts)
end

return key
