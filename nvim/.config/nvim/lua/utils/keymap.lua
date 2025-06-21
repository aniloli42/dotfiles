local function keymap(mode, key, cmd, opts)
  vim.keymap.set(mode, key, cmd, opts)
end

return keymap
