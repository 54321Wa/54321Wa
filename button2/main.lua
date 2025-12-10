function love.load()

    player = {}
    playerImage  =  love.graphics.newImage("assets/player.png")
    player.x = love.graphics.getWidth()/2
    player.y = love.graphics.getHeight() - 100
    playerWidth = playerImage:getWidth()
    playerHeight = playerImage:getHeight()

    buttonImage1 = love.graphics.newImage("btn_l.png")
    buttonImage2 = love.graphics.newImage("btn_r.png")
    buttonImage3 = love.graphics.newImage("btn_j.png")

    -- Define the button's position and size
    buttonX1 = 100
    buttonY1 = 100
    buttonWidth1 = buttonImage1:getWidth()
    buttonHeight1 = buttonImage1:getHeight()

    buttonX2 = 300
    buttonY2 = 100
    buttonWidth2 = buttonImage2:getWidth()
    buttonHeight2 = buttonImage2:getHeight()

    buttonX3 = 500
    buttonY3 = 100
    buttonWidth3 = buttonImage3:getWidth()
    buttonHeight3 = buttonImage3:getHeight()
end

function love.draw()

    love.graphics.draw(playerImage, playerWidth, playerHeight)
    love.graphics.draw(buttonImage1, buttonX1, buttonY1)
    love.graphics.draw(buttonImage2, buttonX2, buttonY2)
    love.graphics.draw(buttonImage3, buttonX3, buttonY3)
end

function love.touchpressed(id, x, y, dx, dy, pressure)
    -- Check if the touch coordinates (x, y) are within the button's area ---left
    if x >= buttonX1 and x <= buttonX1 + buttonWidth1 and
       y >= buttonY1 and y <= buttonY1 + buttonY1 + buttonHeight1 then
        -- This code runs when the button is touched
        print("Button was touched on iPhone!")
        -- Add your button logic here (e.g., change game state, open menu)
    love.graphics.setBackgroundColor(255,0,0)
    end

    ---right
    if x >= buttonX2 and x <= buttonX2 + buttonWidth2 and
       y >= buttonY2 and y <= buttonY2 + buttonY2 + buttonHeight2 then
    love.graphics.setBackgroundColor(255,0,255)
    end
 
    --jump
    if x >= buttonX3 and x <= buttonX3 + buttonWidth3 and
       y >= buttonY3 and y <= buttonY3 + buttonY3 + buttonHeight3 then
    love.graphics.setBackgroundColor(0,255,0)
    end
    
end
