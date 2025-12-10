function love.load()
    buttonImage1 = love.graphics.newImage("btn_l.png")
    buttonImage2 = love.graphics.newImage("btn_r.png")
    -- Define the button's position and size
    buttonX1 = 100
    buttonY1 = 100
    buttonWidth1 = buttonImage1:getWidth()
    buttonHeight1 = buttonImage1:getHeight()

    buttonX2 = 300
    buttonY2 = 100
    buttonWidth2 = buttonImage1:getWidth()
    buttonHeight2 = buttonImage1:getHeight()
end

function love.draw()
    love.graphics.draw(buttonImage1, buttonX1, buttonY1)
    love.graphics.draw(buttonImage2, buttonX2, buttonY2)
end

function love.touchpressed(id, x, y, dx, dy, pressure)
    -- Check if the touch coordinates (x, y) are within the button's area
    if x >= buttonX1 and x <= buttonX1 + buttonWidth1 and
       y >= buttonY1 and y <= buttonY1 + buttonY1 + buttonHeight1 then
        -- This code runs when the button is touched
        print("Button was touched on iPhone!")
        -- Add your button logic here (e.g., change game state, open menu)
    love.graphics.setBackgroundColor(255,0,0)
    end
    if x >= buttonX2 and x <= buttonX2 + buttonWidth2 and
       y >= buttonY2 and y <= buttonY2 + buttonY2 + buttonHeight2 then
    love.graphics.setBackgroundColor(255,0,255)
    end
    
end
