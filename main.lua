function love.load()
	rgbhex, love.PMALdraw, love.PMALphysic, love.PMALopen = love.filesystem.load("pmal.lua")()
	scale = 0
	w, h = 600, 600
	filename = "no-name"
	love.window.setTitle("Buld-PMAL")
	love.window.setMode(w, h) -- , {resizable=true, minwidth=600, minheight=600})
end

function love.wheelmoved(x, y)
  scale = scale + y
end

function love.directorydropped(path)
	print(path)
	file = io.open(path .. "/" .. filename .. ".pmal", "w")
	file:write ("return" .. "")
	file:close()
end

-- function love.resize(nw, nh)
-- 	love.window.setMode(nw, nw, {resizable=true, minwidth=600, minheight=600})
-- 	w, h = nw, nw
-- end

function love.update(dt)
	scw = w - scale * 2
	sch = h - scale * 2
end

function love.draw()
		love.graphics.setColor(0, 255, 0)
		for i = 0, w / 25 do
			love.graphics.line(0 + scale + (i * scw / (w / 25)), 0 + scale, 0 + scale + (i * scw / (w / 25)), sch + scale)
			love.graphics.line(0 + scale, 0 + scale + (i * sch / (w / 25)), scw + scale, 0 + scale + (i * sch / (w / 25)))		
		end
end