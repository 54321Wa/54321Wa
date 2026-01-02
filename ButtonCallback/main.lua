function love.load()

buttons = {}

function newButton(x, y, w, h, text, callback)
    local btn = {
        x = x, y = y, w = w, h = h,
        text = text,
        callback = callback
    }
    table.insert(buttons, btn) -- Add the new button to the table [1, 4]
end

newButton(100, 50, 150, 40, "Game Start!", function() print("Game Start!") end)
newButton(100, 100, 150, 40, "Game Play!", function() print("Game Play!") end)
newButton(100, 150, 150, 40, "Game Quit!", function() print("Game Quit!") end)
end

-- In love.draw()
function love.draw()
    for i, btn in ipairs(buttons) do
        love.graphics.rectangle("line", btn.x, btn.y, btn.w, btn.h)
        love.graphics.print(btn.text, btn.x + 10, btn.y + 10)
    end
end

-- In love.mousepressed(x, y, button)
function love.mousepressed(x, y, button,istouch)
    if button == 1 then -- Left mouse button
        for i, btn in ipairs(buttons) do
            if x > btn.x and x < btn.x + btn.w and
               y > btn.y and y < btn.y + btn.h then
                btn.callback() -- Execute the button's function
                love.graphics.setBackgroundColor(255,0,100)
                break -- Stop checking once a button is clicked
            end
        end
    end
    
end


