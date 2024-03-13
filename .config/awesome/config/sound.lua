local sound = {}

local function execute_cmd(command)
    local file = io.popen(command)
    local output = file:read("*all")
    file:close()
    return output
end

local function get_volume_status()
    local volume = execute_cmd(
        "pactl get-sink-volume $(pactl get-default-sink) | awk -F'[/,]' '{print $2}'"
    )

    local mute_status = execute_cmd(
        "pactl get-sink-mute $(pactl get-default-sink) | cut -d' ' -f 2"
    )

    return mute_status:gsub("%s+", "") == "no" and "🔊" .. volume or "🔇"
end

get_volume_status()

function sound.closure()
    return function()
        return get_volume_status()
    end
end

return sound
