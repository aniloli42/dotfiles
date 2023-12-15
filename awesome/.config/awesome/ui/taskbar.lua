local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

-- mykeyboardlayout = awful.widget.keyboardlayout()
local mytextclock = wibox.widget {
  format = '%A %I:%M %p · %Y/%m/%d ',
  widget = wibox.widget.textclock,
  align = "center"
}

-- Battery
battery = require("config.battery")

battery_widget = wibox.widget.textbox()
battery_widget:set_align("right")
battery_closure = battery.closure()

function battery_update()
    battery_widget:set_text(" " .. battery_closure() .. " ")
end

battery_update()
battery_timer = timer({ timeout = 10 })
battery_timer:connect_signal("timeout", battery_update)
battery_timer:start()
--

beautiful.useless_gap = dpi(2)

local systray = wibox.widget.systray()
systray:set_base_size (dpi(24))

local tasklist_buttons = {
            awful.button({ }, 1, function (c)
                c:activate { context = "tasklist", action = "toggle_minimization" }
            end),
            awful.button({ }, 3, function() awful.menu.client_list { theme = { width = 250 } } end),
            awful.button({ }, 4, function() awful.client.focus.byidx(-1) end),
            awful.button({ }, 5, function() awful.client.focus.byidx( 1) end),
}

screen.connect_signal("request::desktop_decoration", function(s)
    awful.tag({ "1", "2", "3" }, s, awful.layout.layouts[1])

    s.mypromptbox = awful.widget.prompt()
    s.mylayoutbox = awful.widget.layoutbox {
        screen  = s,
        buttons = {
            awful.button({ }, 1, function () awful.layout.inc( 1) end),
            awful.button({ }, 3, function () awful.layout.inc(-1) end),
            awful.button({ }, 4, function () awful.layout.inc(-1) end),
            awful.button({ }, 5, function () awful.layout.inc( 1) end),
        }
    }

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = {
            awful.button({ }, 1, function(t) t:view_only() end),
            awful.button({ modkey }, 1, function(t)
                                            if client.focus then
                                                client.focus:move_to_tag(t)
                                            end
                                        end),
            awful.button({ }, 3, awful.tag.viewtoggle),
            awful.button({ modkey }, 3, function(t)
                                            if client.focus then
                                                client.focus:toggle_tag(t)
                                            end
                                        end),
            awful.button({ }, 4, function(t) awful.tag.viewprev(t.screen) end),
            awful.button({ }, 5, function(t) awful.tag.viewnext(t.screen) end),
        }
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons =  tasklist_buttons,
        layout = {
            spacing = dpi(4),
            layout = wibox.layout.fixed.horizontal
        },
        widget_template = {

              {
                  {
                      id     = 'clienticon',
                      widget = awful.widget.clienticon,
                      forced_height = dpi(27)
                  },
                  widget  = wibox.container.place,
              },
              {
                  wibox.widget.base.make_widget(),
                  id            = 'background_role',
                  widget        = wibox.container.background,
              },
              nil,
              create_callback = function(self, c)
                  self:get_children_by_id('clienticon')[1].client = c
              end,
              layout = wibox.layout.align.vertical,
          },
  }

    -- Create the wibox
    s.mywibox = awful.wibar {
        position = "top",
        screen   = s,
        stretch = false,
        margins = dpi(2),
        height = dpi(32),
        width = s.geometry.width - dpi(10),
        bg = "#092635",
        fg = "#9EC8B9",

        widget   = {
            layout = wibox.layout.align.horizontal,
            {
                layout = wibox.layout.fixed.horizontal,
                s.mytaglist,
                s.mypromptbox,
                s.mytasklist,
            },
                mytextclock,
            {
                widget = wibox.container.place,
                height = dpi(24),
                    {
                        layout = wibox.layout.fixed.horizontal,
                        systray,
                        battery_widget
                    }
            },
        }
    }
end)
