local lush = require('lush')
local hsluv = lush.hsluv

return {
	fg = hsluv(220, 15, 90),
	bg = hsluv(0, 0, 5),
	
	black_dark = hsluv(0, 0, 3),
	black = hsluv(0, 0, 10),
	black_bright = hsluv(0, 0, 15),
	red_light = hsluv(12, 60, 65),
	red_dark = hsluv(12, 85, 50).darken(40),
	red = hsluv(12, 75, 45),
	red_bright = hsluv(12, 85, 50),
	green_darker = hsluv(127, 65, 50).darken(50),
	green_dark = hsluv(127, 65, 50).darken(40),
	green = hsluv(127, 65, 50),
	green_bright = hsluv(127, 60, 75),
	orange = hsluv(30, 80, 55),
	orange_bright = hsluv(30, 80, 65),
	yellow_dark = hsluv(60, 70, 75),
	yellow = hsluv(60, 70, 75).darken(40),
	yellow_bright = hsluv(60, 80, 75),
	blue_dark = hsluv(250, 90, 45),
	blue = hsluv(250, 70, 60),
	blue_bright = hsluv(250, 80, 65),
	purple = hsluv(270, 100, 50),
	magenta = hsluv(300, 60, 65),
	magenta_bright = hsluv(300, 85, 75),
	cyan = hsluv(190, 65, 75),
	cyan_bright = hsluv(190, 65, 85),
	gray = hsluv(0, 0, 25),
	gray_bright = hsluv(0, 0, 35),
	white_dark = hsluv(0, 0, 65),
	white = hsluv(0, 0, 90),
	white_bright = hsluv(0, 0, 95)
}
