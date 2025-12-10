function love.load()
    buttonImage = love.graphics.newImage("btn_l.png")
    -- Define the button's position and size
    buttonX = 100
    buttonY = 100
    buttonWidth = buttonImage:getWidth()
    buttonHeight = buttonImage:getHeight()
end

function love.draw()
    love.graphics.draw(buttonImage, buttonX, buttonY)
end

function love.touchpressed(id, x, y, dx, dy, pressure)
    -- Check if the touch coordinates (x, y) are within the button's area
    if x >= buttonX and x <= buttonX + buttonWidth and
       y >= buttonY and y <= buttonY + buttonY + buttonHeight then
        -- This code runs when the button is touched
        print("Button was touched on iPhone!")
        -- Add your button logic here (e.g., change game state, open menu)
    end
end
