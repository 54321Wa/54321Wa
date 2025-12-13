local x = 100
local dir = 1

function love.load()
  --print("console!")

end


function love.update(dt)
 if x >= 400 or x <= 50 then
  x = x * 60 * dt
  dir = dir * -1
 end
end

function love.draw()

--love.graphics.setColor(255,255,255)
love.graphics.print("Love2D Tutorial EP1",50,100)
--love.graphics.setColor(128,64,255)
love.graphics.rectangle("fill",x,200,100,50)
end