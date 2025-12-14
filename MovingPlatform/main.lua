

local x = 100
local dir = 1

function love.load()
 love.graphics.setBackgroundColor(0,0,60)



end


function love.update(dt)
 if dt > 0.040 then return

 if x < 120 then
   dir = dir * 1
 elseif x > 400
   dir = dir * -1

 end
  
 x = x + dir * 120 * dt
  
end

function love.draw()

love.graphics.setColor(255,0,0)
love.graphics.print("Love2D Tutorial EP1",50,100)

love.graphics.setColor(128,64,255)
love.graphics.rectangle("fill",x,200,100,50)
love.graphics.setColor(1,1,1)
end