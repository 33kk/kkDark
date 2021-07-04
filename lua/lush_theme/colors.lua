local lush = require('lush')
local hsluv = lush.hsluv

return {
  fg = hsluv(220, 15, 90).hex,
  bg = hsluv(0, 0, 5).hex,
  
  black_dark = hsluv(0, 0, 3).hex,
  black = hsluv(0, 0, 10).hex,
  black_bright = hsluv(0, 0, 15).hex,
  red_light = hsluv(12, 60, 65).hex,
  red = hsluv(12, 75, 45).hex,
  red_bright = hsluv(12, 85, 50).hex,
  green = hsluv(127, 60, 50).hex,
  green_bright = hsluv(127, 50, 75).hex,
  orange_bright = hsluv(30, 80, 60).hex,
  yellow = hsluv(60, 70, 75).hex,
  yellow_bright = hsluv(60, 80, 75).hex,
  blue = hsluv(250, 70, 60).hex,
  blue_bright = hsluv(250, 80, 65).hex,
  purple = hsluv(270, 100, 50).hex,
  magenta = hsluv(300, 60, 65).hex,
  magenta_bright = hsluv(300, 85, 75).hex,
  cyan = hsluv(190, 65, 75).hex,
  cyan_bright = hsluv(190, 65, 90).hex,
	gray_dark = hsluv(220, 15, 40).hex,
  gray = hsluv(0, 0, 90).hex,
  gray_bright = hsluv(0, 0, 95).hex
}

