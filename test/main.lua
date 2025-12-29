function love.load()

-- on load
buttons = {}
buttons['reset'] = {text = 'reset', x=10, y=10, w=35, h=15}

end

function love.update(dt)
-- on update
local pressed_button = pressed_button (buttons)
if pressed_button and pressed_button == "reset" then
	-- do code
end

end

function love.draw()
-- on draw
for button_name, button in pairs (buttons) do
	button_draw (button)
end

end