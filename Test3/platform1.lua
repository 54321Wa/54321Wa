platform1 = {}

local x = 300
local dir = 1

function platform1:load()
   platform1.x = platform1.x
   platform1.y = 600
   platform.w  = 240
   platform.h  =  50
  
end


function platform1:update(dt)
 if dt > 0.040 then return end

 if x < 120 then
   dir = 1
 elseif x > 400 then
   dir = -1

 end
  
 x = x + dir * 120 * dt
  
end

function platform1:draw()



love.graphics.setColor(128,64,255)
love.graphics.rectangle("fill", x,200,100,50)
love.graphics.setColor(1,1,1)
end