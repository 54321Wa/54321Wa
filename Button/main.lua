local buttons = {}

function love.load()
    -- Store button data with an ID as the key
    buttons["startButton"] = {x = 50, y = 50, w = 100, h = 40, label = "Start Game"}
    buttons["optionsButton"] = {x = 50, y = 100, w = 100, h = 40, label = "Options"}
end

function love.draw()
    -- Draw all buttons
    for id, button in pairs(buttons) do
        love.graphics.rectangle("fill", button.x, button.y, button.w, button.h)
        love.graphics.print(button.label, button.x + 5, button.y + 10)
    end
end

function love.mousepressed(x, y, button_id)
    if button_id == 1 then -- Check for left mouse button
        for id, button in pairs(buttons) do
            -- Check if mouse click is within button boundaries
            if x >= button.x and x <= button.x + button.w and y >= button.y and y <= button.y + button.h then
                -- Perform action based on the 'id'
                if id == "startButton" then
                    print("Start button pressed!")
                    -- Add game logic here
                    love.graphics.setBackgroundColor(200,100,50)
                elseif id == "optionsButton" then
                    print("Options button pressed!")

                    -- Add game logic here
                    love.graphics.setBackgroundColor(3,50,80)
                end
            end
        end
    end
end
