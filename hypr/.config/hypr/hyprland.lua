-- Learn how to configure Hyprland: https://wiki.hypr.land/Configuring/Start/

-- Load user modules from ~/.config hypr folder.
package.path = os.getenv("HOME")
  .. "/.config/?.lua;"
  .. package.path

-- Change your own setup in these files and override defaults.
require("hypr.init")
require("hypr.monitors")
require("hypr.input")
require("hypr.bindings")
require("hypr.rules")
require("hypr.looknfeel")
require("hypr.colors")
require("hypr.autostart")

