function love.load()
devicex = 5
devicey = 25
KeyImg = love.graphics.newImage("arrow.png")
sprx = 0
spry = 0
touches = {}

end

function love.update(dt)
touches = love.touch.getTouches()
for i,id in pairs(touches) do
pressure = love.touch.getPressure(id)
x,y = love.touch.getPosition(id)
if pressure > 0 then
   if 0+devicex <x and x<60 + devicex and 0+ devicey <y and y <60+devicey then
         spry = spry + 1


end


end


end

function love.draw()

end