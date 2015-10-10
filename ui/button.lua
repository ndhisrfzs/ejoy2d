local ej = require "ejoy2d"

local button = {}

function button:new(conf)
	local obj = {}
	setmetatable(obj, self)
	self.__index = self
	obj:init(conf)
	return obj
end

function button:init(conf)
	local options = conf.options
	self.name = conf.name
	self.zorder = options.zorder
	self.options = options
	local normal = ej.sprite(options.atlas, options.sprites.normal)
	self.sprites = {}
	self.sprites.normal = normal
	normal:ps(options.x, options.y)
	normal:sr(options.scalex, options.scaley)
	if options.sprites.pressed ~= nil then
		local pressed = ej.sprite(options.atlas, options.sprites.pressed)
		self.sprites.pressed = pressed
		pressed:ps(options.x, options.y)
		pressed:sr(options.scalex, options.scaley)
	end
	self.cursprite = normal
end

function button:update()
	self.cursprite.turret.frame = self.cursprite.turret.frame + 1
end

function button:drawframe(screencoord)
	self.cursprite:draw(screencoord)
end

local function getcolor(tbl)
	return tbl.a << 24 | tbl.r << 16 | tbl.g << 8 | tbl.b
end

function button:touch(what, x, y, screencoord)
	if what == "BEGIN" then
		self.touched = self.cursprite:test(x,y,screencoord)
		if self.touched then
			self.touched.color = getcolor(self.options.colors.pressed)
			if self.sprites.pressed ~= nil then
				self.cursprite = self.sprites.pressed
			end
		end
	elseif self.touched ~= nil then
		self.touched.color = getcolor(self.options.colors.normal)
		if self.sprites.pressed ~= nil then
			self.cursprite = self.sprites.normal
		end
	end
end

return button