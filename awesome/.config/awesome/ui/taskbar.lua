local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local taskbar_height = dpi(48)
local icon_size = dpi(taskbar_height * 0.5)
local gap_size = dpi(4)

-- beautiful.useless_gap = dpi(gap_size)

function mytextclock(format)
  if format == nil then
    format = "%b %d | %A %I:%M:%S %p"
  end

  return wibox.widget({
    format = format,
    refresh = 1,
    widget = wibox.widget.textclock,
  })
end

-- Sound
local sound_widget = wibox.widget.textbox()
sound_widget:buttons({
  awful.button({}, 1, function()
    awful.spawn("pavucontrol")
  end),
  awful.button({}, 4, function()
    awful.util.spawn("pamixer -i 5", false)
  end),
  awful.button({}, 5, function()
    awful.util.spawn("pamixer -d 5", false)
  end),
})

local sound_level = require("config.sound")
local function update_volume()
  local volume, icon = sound_level()
  sound_widget:set_text(" " .. icon .. " " .. volume .. " ")
end
update_volume()

local sound_timer = timer({ timeout = 1 })
sound_timer:connect_signal("timeout", update_volume)
sound_timer:start()

-- Battery
local battery_widget = wibox.widget.textbox()
battery_widget:set_align("right")

local battery = require("config.battery")
local battery_closure = battery.closure()
local function battery_update()
  battery_widget:set_text(battery_closure() .. " ")
end

local battery_timer = timer({ timeout = 1 })
battery_timer:connect_signal("timeout", battery_update)
battery_timer:start()
battery_update()
--

local tasklist_buttons = {
  awful.button({}, 1, function(c)
    c:activate({ context = "tasklist", action = "toggle_minimization" })
  end),
  awful.button({}, 3, function()
    awful.menu.client_list({ theme = { width = 250 } })
  end),
  awful.button({}, 4, function()
    awful.client.focus.byidx(-1)
  end),
  awful.button({}, 5, function()
    awful.client.focus.byidx(1)
  end),
}

screen.connect_signal("request::desktop_decoration", function(s)
  awful.tag({ "1", "2", "3" }, s, awful.layout.layouts[1])

  local mysystray = wibox.widget.systray()
  mysystray:set_base_size(icon_size)

  s.mypromptbox = awful.widget.prompt()
  s.mylayoutbox = awful.widget.layoutbox({
    screen = s,
    forced_height = icon_size,
    buttons = {
      awful.button({}, 1, function()
        awful.layout.inc(1)
      end),
      awful.button({}, 3, function()
        awful.layout.inc(-1)
      end),
      awful.button({}, 4, function()
        awful.layout.inc(-1)
      end),
      awful.button({}, 5, function()
        awful.layout.inc(1)
      end),
    },
  })

  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist({
    screen = s,
    filter = awful.widget.taglist.filter.all,
    buttons = {
      awful.button({}, 1, function(t)
        t:view_only()
      end),
      awful.button({ modkey }, 1, function(t)
        if client.focus then
          client.focus:move_to_tag(t)
        end
      end),
      awful.button({}, 3, awful.tag.viewtoggle),
      awful.button({ modkey }, 3, function(t)
        if client.focus then
          client.focus:toggle_tag(t)
        end
      end),
      awful.button({}, 4, function(t)
        awful.tag.viewprev(t.screen)
      end),
      awful.button({}, 5, function(t)
        awful.tag.viewnext(t.screen)
      end),
    },
  })

  -- Create a tasklist widget
  s.mytasklist = awful.widget.tasklist({
    screen = s,
    filter = awful.widget.tasklist.filter.currenttags,
    buttons = tasklist_buttons,
    layout = {
      spacing = gap_size,
      layout = wibox.layout.fixed.horizontal,
    },
    widget_template = {
      layout = wibox.layout.align.vertical,
      {
        widget = wibox.container.place,
        forced_height = icon_size * 1.5,
        {
          widget = wibox.container.place,
          forced_height = icon_size,
          {
            id = "clienticon",
            layout = wibox.layout.fixed.horizontal,
            awful.widget.clienticon,
          },
        },
      },
      {
        id = "background_role",
        widget = wibox.container.background,
        -- wibox.widget.base.make_widget(),
      },
      -- create_callback = function(self, c)
        --   self:get_children_by_id("clienticon")[1].client = c
        -- end,
      },
    })


    -- Create the wibox
    s.mywibox = awful.wibar({
      position = "top",
      screen = s,
      stretch = true,
      border_width = 0,
      -- margins = 8,
      --     top = gap_size,
      --     left = gap_size,
      --     right = gap_size,
      --     -- bottom = dpi(gap_size * 2),
      -- },
      height = taskbar_height,

      widget = {
        layout = wibox.layout.align.horizontal,

        -- Left Widget
        {
          layout = wibox.layout.fixed.horizontal,
          s.mytaglist,
          s.mytasklist,
          s.mypromptbox,
        },

        -- Center Widget
        {
          widget = wibox.container.place,
          {
            layout = wibox.layout.fixed.horizontal,
          },
        },

        -- Right Widget
        {
          widget = wibox.container.place,
          {
            layout = wibox.layout.fixed.horizontal,
            {
              widget = wibox.container.place,
              {
                layout = wibox.layout.fixed.horizontal,
                mysystray,
              },
            },
            sound_widget,
            battery_widget,
            mytextclock(),
          },
        },
      },
    })
  end)
