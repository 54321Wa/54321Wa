function love.load() 
player ={} 
player.y = 470 
player.x = 0 
jumping = false 
end

function love.update() --- gravity if jumping == false then player.y = player.y + 3.1 if player.y + 10 > 470 then player.y = 470 end end end
end


function love.keypressed(key) if jumping == false then if key =="j" and player.y == 470 then player.y = player.y - 150 end end

end

function love.touchpressed( id, x, y, dx, dy, pressure )
    -- test if the touch happened in the upper half of the screen
    if y < love.graphics.getHeight()/2 then
        player:jump()
    end
end