function love.load()
	rgbhex, love.PMALdraw, love.PMALphysic, love.PMALopen = love.filesystem.load("pmal.lua")()
	scale = 50
	w, h = 600, 600
	filename = "no-name-" .. tostring(love.math.random(0, 999))
	love.keyboard.setKeyRepeat(true)
	love.window.setTitle("Buld-PMAL")
	love.window.setMode(w, h) -- , {resizable=true, minwidth=600, minheight=600})
end

function love.mousepressed(x, y, button, istouch)
  if button == 1 then
		--ищву
  end
end

function love.textinput(t)
    filename = filename .. t
end
 
function love.keypressed(key)
    if key == "backspace" then
			filename = string.sub(filename, 1, -2)
    end
end

function love.wheelmoved(x, y)
  scale = scale + (y * 4)
end

function love.directorydropped(path)
	print(path)
	pmalfile = io.open(path .. "/" .. filename .. ".pmal", "w")
	pmalfile:write("return" .. "")
	pmalfile:close()
	if imagedata ~= nil then
		picfile = io.open(path .. "/" .. filename .. ".png", "w")
		picfile:write(imagedata)
		picfile:close()
	end
end

function love.filedropped(file)
	file:open("r")
	imagedata = file:read()
	file:close()
end

-- function love.resize(nw, nh)
-- 	love.window.setMode(nw, nw, {resizable=true, minwidth=600, minheight=600})
-- 	w, h = nw, nw
-- end

function love.update(dt)
	if time ~= nil then
		time = time + dt
	else
		time = dt
	end
	scw = w - scale * 2
	sch = h - scale * 2
end

function love.draw()
	if time > 4 then
		love.graphics.setColor(10, 55, 100)
		for i = 0, w / 25 do
			love.graphics.line(0 + scale + (i * scw / (w / 25)), 0 + scale, 0 + scale + (i * scw / (w / 25)), sch + scale)
			love.graphics.line(0 + scale, 0 + scale + (i * sch / (w / 25)), scw + scale, 0 + scale + (i * sch / (w / 25)))		
		end
		love.graphics.setColor(144, 55, 4)
		love.graphics.print("file name: " .. filename)
	else
		love.graphics.print("Rules:\n\n\tMouse - set point of mesh\n\tMouseWheel - resize\n\tArrows - move\n\tDrop Folder in window - save in folder\n\tDrop File in window - append picture (only '.png')")
	end
end