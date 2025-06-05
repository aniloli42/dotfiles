local function execute_cmd(command)
  local file = io.popen(command)
  local output = file:read("*all")
  file:close()
  return output
end

return execute_cmd
