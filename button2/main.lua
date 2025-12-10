function love.load()
    buttonImage1 = love.graphics.newImage("btn_l.png")
    buttonImage2 = love.graphics.newImage("btn_l.png")
    -- Define the button's position and size
    buttonX1 = 100
    buttonY1 = 100
    buttonWidth1 = buttonImage:getWidth()
    buttonHeight1 = buttonImage:getHeight()
end

function love.draw()
    love.graphics.draw(buttonImage1, buttonX1, buttonY1)
end

function love.touchpressed(id, x, y, dx, dy, pressure)
    -- Check if the touch coordinates (x, y) are within the button's area
    if x >= buttonX and x <= buttonX + buttonWidth and
       y >= buttonY and y <= buttonY + buttonY + buttonHeight then
        -- This code runs when the button is touched
        print("Button was touched on iPhone!")
        -- Add your button logic here (e.g., change game state, open menu)

    love.graphics.setBackgroundColor(255,0,0)
    end
end
