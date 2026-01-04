-- main.lua

-- Table to hold all created buttons
local buttons = {}

-- A simple function to create and "spawn" a new button object
local function createButton(x, y, text, id, width, height)
    local newButton = {
        x = x,
        y = y,
        width = width or 100,
        height = height or 30,
        text = text,
        id = id
    }
    table.insert(buttons, newButton)
    return newButton
end

-- Spawn initial buttons in love.load
function love.load()
    createButton(50, 50, "Start Game", "startGame")
    createButton(50, 100, "Options", "openOptions")
end

-- Check for clicks in love.mousepressed
function love.mousepressed(x, y, button)
    if button == 1 then -- Left mouse button
        for i, btn in ipairs(buttons) do
            -- Check if mouse click is within button bounds (simple AABB collision)
            if x > btn.x and x < btn.x + btn.width and
               y > btn.y and y < btn.y + btn.height then
                -- A button was clicked! Use the ID to decide what to do
                if btn.id == "startGame" then
                    print("Start Game button clicked!")
                    -- Call your game logic function here (e.g., startGameFunction())
                elseif btn.id == "openOptions" then
                    print("Options button clicked!")
                    -- Call your options logic function here (e.g., openOptionsFunction())
                end
            end
        end
    end
end

-- Draw the buttons
function love.draw()
    love.graphics.setColor(1, 1, 1) -- White color for text/shapes
    for i, btn in ipairs(buttons) do
        -- Draw the button rectangle
        love.graphics.rectangle("line", btn.x, btn.y, btn.width, btn.height)
        -- Draw the button text (adjust position for centering)
        love.graphics.print(btn.text, btn.x + 5, btn.y + 5)
    end
end