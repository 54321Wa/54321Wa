function love.load()
devicex = 5
devicey = 25
character = love.graphics.newImage("arrow.png")
sprx = 100
spry = 100
touches = {}
speed = 10

end

function love.update(dt)
touches = love.touch.getTouches()
for i,id in pairs(touches) do
pressure = love.touch.getPressure(id)
x,y = love.touch.getPosition(id)

if pressure > 0 then
   spry = spry - speed
----
   elseif 0+devicex <x and x<60 + devicex and 65+ devicey <y and y <125+devicey then
         sprx = sprx + speed
----
   elseif 0+devicex <x and x<60 + devicex and 130+ devicey <y and y <190+devicey then
         sprx = sprx + speed
----
    elseif 0+devicex <x and x<60 + devicex and 195+ devicey <y and y <255+devicey then
         sprx = sprx - speed

  end
  end
  end




function love.draw()
love.graphics.draw(character,sprx,spry)

end