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
   if 

end


end


end

function love.draw()

end