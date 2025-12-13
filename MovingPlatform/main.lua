local x = 100
local dir = 1

function love.load()
  print("console!")

end


function love.update(dt)
 if x >= 400 then
  x = x + dir * 60 * dt
 elseif 


end

function love.draw()
love.graphics.setColor(255,255,255)
love.graphics.print("Love2D Tutorial EP1",50,100)
love.graphics.setColor(128,64,255)
love.graphics.rectangle("fill",x,200,100,50)
end