howto = {}

local lg = love.graphics

function howto.enter()
	state = STATE_HOWTO
	howto.slide = 0
	howto.quad = lg.newQuad(0,0,256,200,getSize(img.howto))
	playMusic("menujazz")
end

function howto.update(dt)
	updateKeys()
end

function howto.draw()
	lg.push()
	lg.scale(config.scale)

	lg.drawq(img.howto, howto.quad, 0,0)

	lg.pop()
end

function howto.keypressed(k, uni)
	if k == "right" or k == "down" or k == "return" then
		howto.slide = cap(howto.slide + 1, 0, 8)
		howto.quad:setViewport(0,howto.slide*200,256,200)
		playSound("blip")
	elseif k == "left" or k == "up" then
		howto.slide = cap(howto.slide - 1, 0, 8)
		howto.quad:setViewport(0,howto.slide*200,256,200)
		playSound("blip")
	elseif k == "escape" then
		playSound("confirm")
		playMusic("opening")
		mainmenu.enter()
	end
end

function howto.joystickpressed(joy, k)
	if k == 3 then
		howto.slide = cap(howto.slide + 1, 0, 8)
		howto.quad:setViewport(0,howto.slide*200,256,200)
		playSound("blip")
	elseif k == 4 then
		playSound("confirm")
		playMusic("opening")
		mainmenu.enter()
	end
end

function howto.action(k)
	if k == "right" or k == "down" then
		howto.slide = cap(howto.slide + 1, 0, 8)
		howto.quad:setViewport(0,howto.slide*200,256,200)
		playSound("blip")
	elseif k == "left" or k == "up" then
		howto.slide = cap(howto.slide - 1, 0, 8)
		howto.quad:setViewport(0,howto.slide*200,256,200)
		playSound("blip")
	end
end
