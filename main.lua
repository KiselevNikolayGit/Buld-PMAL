function love.load()
	rgbhex, love.PMALdraw, love.PMALphysic, love.PMALopen = love.filesystem.load("pmal.lua")()
	scale = 50
	w, h = 800, 800
	order = {}
	filename = "no-name-" .. tostring(love.math.random(0, 999))
	love.keyboard.setKeyRepeat(true)
	love.window.setTitle("Buld-PMAL")
	love.window.setMode(w, h) -- , {resizable=true, minwidth=600, minheight=600})
	love.mouse.setCursor(love.mouse.getSystemCursor("crosshair"))
	font = love.graphics.newFont("Zilla-Slab/ZillaSlab-Bold.ttf", 24)
	mainMap = {
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
	}
	tranx, trany = 0, 0
	love.graphics.setBackgroundColor(255, 176, 59)
end

function love.mousepressed(x, y, button, istouch)
	if button == 1 and scale == 50 and tranx == 0 and trany == 0 then
		i = math.floor(((x - (scale / 2)) * (w / 25) / scw) + 0.5)
		j = math.floor(((y - (scale / 2)) * (w / 25) / scw) + 0.5)
		if mainMap[i][j] ~= 0 then
			mainMap[i][j] = 0
			for key = 1, #order do
				value = order[key]
				if value == {i, j} then
					order[key] = {}
				end
			end
		else
			mainMap[i][j] = 1
			order[#order + 1] = {i, j}
		end
  end
	scale = 50
  tranx, trany = 0, 0
	scw = w - scale * 2
	sch = h - scale * 2
end

function love.textinput(t)
	filename = filename .. t
end
 
function love.keypressed(key)
	if key == "backspace" then
		filename = string.sub(filename, 1, -2)
	end
	if key == "left" then
		tranx = tranx + 12
	end
	if key == "right" then
		tranx = tranx - 12
	end
	if key == "up" then
		trany = trany + 12
	end
	if key == "down" then
		trany = trany - 12
	end		
end

function love.wheelmoved(x, y)
  scale = scale - (y * 6)
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

function love.update(dt)
	if time ~= nil then
		time = time + dt
	else
		time = dt
	end
	scw = w - scale * 2
	sch = h - scale * 2
	polygonparts = {}	
	for i, ord in ipairs(order) do
		polygonparts[#polygonparts + 1] = scale + ((ord[1] - 1) * scw / (w / 25))
		polygonparts[#polygonparts + 1] = scale + ((ord[2] - 1) * scw / (w / 25))
	end
end

function love.draw()
	love.graphics.setFont(font)
	love.graphics.setLineStyle("smooth")
	if time > 0.4 then
		love.graphics.translate(tranx, trany)
		love.graphics.setLineWidth(2.5)
		love.graphics.setColor(182, 73, 38)
		for i = 0, w / 25 do
			love.graphics.line(0 + scale + (i * scw / (w / 25)), 0 + scale, 0 + scale + (i * scw / (w / 25)), sch + scale)
			love.graphics.line(0 + scale, 0 + scale + (i * sch / (w / 25)), scw + scale, 0 + scale + (i * sch / (w / 25)))		
		end
		love.graphics.setColor(70, 137, 102)
		love.graphics.setLineWidth(5)
		if #polygonparts >= 6 then
			love.graphics.polygon("line", polygonparts)
			love.graphics.polygon("fill", polygonparts)
		end
		love.graphics.setLineWidth(2.5)		
		for i, map in ipairs(mainMap) do
			for j, cond in ipairs(map) do
		 		if mainMap[i][j] == 0 then
					love.graphics.circle("line", scale + ((i - 1) * scw / (w / 25)), scale + ((j - 1) * scw / (w / 25)), 2.5)
					love.graphics.circle("fill", scale + ((i - 1) * scw / (w / 25)), scale + ((j - 1) * scw / (w / 25)), 2.5)
				else
					love.graphics.circle("line", scale + ((i - 1) * scw / (w / 25)), scale + ((j - 1) * scw / (w / 25)), 5)
					love.graphics.circle("fill", scale + ((i - 1) * scw / (w / 25)), scale + ((j - 1) * scw / (w / 25)), 5)
				end
			end
		end
		love.graphics.setColor(142, 40, 0)
		love.graphics.print("File name: " .. filename, -tranx + 10, -trany + 10)
	else
		love.graphics.setColor(142, 40, 0)
		love.graphics.print("\n\n\nRules:\n\n\tMouse - set point of mesh.\n\tMouseWheel - resize.\n\tArrows - move.\n\tDrop Folder in window - save in folder.\n\tDrop File in window - append picture (only '.png').", 10, 10)
		love.graphics.setColor(70, 137, 102)
		love.graphics.print("Buld-PMAL.", 10, 10)
	end
end