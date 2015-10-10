local ej = require "ejoy2d"
local fw = require "ejoy2d.framework"
local pack = require "ejoy2d.simplepackage"
local panel = require "ui.panel"

local workdir = fw.WorkDir..[[examples/asset/?]]

local scene = {}
local screencoord = nil
local widgettree = {}

local atlas = {}
local function loadassert(conf)
	for _,v in ipairs(conf.children) do
		atlas[v.options.atlas] = true
		loadassert(v)
	end

	for k in pairs(atlas) do
		pack.load {
			pattern = workdir,
			k,
		}
	end
end

function scene.init(conf)
	screencoord = conf.screencoord
	loadassert(conf.widgettree)
	widgettree[#widgettree + 1] = panel:new(conf.widgettree)
end

function scene.start()
	ej.start(scene)
end

function scene.update()
	for _, v in pairs(widgettree) do
		v:update()
	end
end

function scene.drawframe()
	ej.clear(0xff808080)	-- clear (0.5,0.5,0.5,1) gray
	for _, v in pairs(widgettree) do
		v:drawframe(screencoord)
	end
end

function scene.touch(what, x, y)
	for _, v in pairs(widgettree) do
		v:touch(what, x, y, screencoord)
	end
end

function scene.message(...)
	
end

function scene.handle_error(...)
	
end

function scene.on_resume()
	
end

function scene.on_pause()
	
end

return scene