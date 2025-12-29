
anyDown = true

function love.load()
--anyDown = love.mouse.isDown( button1, button2, button3)
buttons = {1,2,3,x,y,w,h}

end


function love.draw()

table.insert(buttons,1,"Left")
table.insert(buttons,2,"Right")
table.insert(buttons,3,"Jump")

end

function love.update(dt)

val = 0   -- establish a variable for later use
function love.update(dt)
	if love.mouse.isDown(2) then
		val = val + dt   -- we will increase the variable by 1 for every second the button is held down
	end	
end


end