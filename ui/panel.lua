local ej = require "ejoy2d"
local button = require "ui.button"

local wigdets = { button = button }

local panel = {}
local childrens = {}

function panel:new(conf)
	local obj = {}
	setmetatable(obj, self)
	self.__index = self
	obj:init(conf)
	return obj
end

local function widget(conf)
	for _, v in ipairs(conf.children) do
		childrens[#childrens + 1] = wigdets[v.classname]:new(v)
	end
	table.sort(childrens, function(a, b) return a.zorder < b.zorder end)
end

function panel:init(conf)
	self.name = conf.name
	self.zorder = conf.options.zorder
	widget(conf)
end

function panel:update()
	for _, v in pairs(childrens) do
		v:update()
	end
end

function panel:drawframe(screencoord)
	for _, v in pairs(childrens) do
		v:drawframe(screencoord)
	end
end

function panel:touch(what, x, y, screencoord)
	for _, v in pairs(childrens) do
		v:touch(what, x, y, screencoord)
	end
end

return panel