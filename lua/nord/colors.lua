local colors = {}

---@class Nord.Palette.PolarNight
---@field origin string nord 0
---@field bright string nord 1
---@field brighter string nord 2
---@field brightest string  nord 3
---@field light string out of palette

---@class Nord.Palette.SnowStorm
---@field origin string  nord 4
---@field brighter string nord 5
---@field brightest string  nord 6

---@class Nord.Palette.Frost
---@field polar_water string nord 7
---@field ice string nord 8
---@field artic_water string nord 9
---@field artic_ocean string nord 10

---@class Nord.Palette.Aurora
---@field red string nord 11
---@field orange string nord 12
---@field yellow string nord 13
---@field green string nord 14
---@field purple string nord 15

---@class Nord.Palette
---@field polar_night Nord.Palette.PolarNight
---@field snow_storm Nord.Palette.SnowStorm
---@field frost Nord.Palette.Frost
---@field aurora Nord.Palette.Aurora
---@field none string

---@type Nord.Palette
local defaults = {
  polar_night = {
    origin = "#212630", -- nord0
    bright = "#333a48", -- nord1
    brighter = "#454e60", -- nord2
    brightest = "#576279", -- nord3
    light = "#6a7792", -- out of palette
  },
  snow_storm = {
    origin = "#a5cbe3", -- nord4
    brighter = "#bae5ff", -- nord5
    brightest = "#d3eeff", -- nord6
  },
  frost = {
    polar_water = "#60ac82", -- nord7
    ice = "#5aac9d", -- nord8
    artic_water = "#588ead", -- nord9
    artic_ocean = "#3c637a", -- nord10
  },
  aurora = {
    red = "#b03031", -- nord11
    orange = "#af5224", -- nord12
    yellow = "#ac9354", -- nord13
    green = "#6fac61", -- nord14
    purple = "#8269ae", -- nord15
  },
  none = "NONE",
}

colors.palette = defaults
colors.default_bg = "#212630" -- nord0

function colors.daltonize(severity)
  local daltonize = require("nord.utils.colorblind").daltonize

  for group, color in pairs(defaults) do
    if type(color) == "table" then
      for sub_group, sub_color in pairs(color) do
        colors.palette[group][sub_group] = daltonize(sub_color, severity)
      end
    end
  end
end

return colors
