return {
	classname = "scene",
	name = nil,
	screencoord = { x = 512, y = 384, scale = 1.2 },
	widgettree = {
		classname = "panel",
		name = nil,
		children = {
			{
				classname = "button",
				name = "btn1",
				children = {},
				options = {
					zorder = 1,
					atlas = "sample", 
					x = -100,
					y = 0,
					scalex = 0.5,
					scaley = 0.5,
					colors = {
						normal = { r = 255, g = 255, b = 255, a = 255 },
						pressed = { r = 183, g = 163, b = 123, a = 255 },
					},
					sprites = {
						normal = "cannon",
						pressed = nil--"mine",
					}
				}
			},
			{
				classname = "button",
				name = "btn2",
				children = {},
				options = {
					zorder = 1,
					atlas = "sample", 
					x = -200,
					y = 0,
					scalex = 0.5,
					scaley = 0.5,
					colors = {
						normal = { r = 255, g = 255, b = 255, a = 255 },
						pressed = { r = 183, g = 163, b = 123, a = 255 },
					},
					sprites = {
						normal = "cannon",
						pressed = nil--"mine",
					}
				}
			}
		},
		options = {
			zorder = 1
		}
	}
}