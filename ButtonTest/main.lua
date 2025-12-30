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
         spry = spry - 1
----
   elseif 0+devicex <x and x<60 + devicex and 130+ devicey <y and y <190+devicey then
         spry = spry + 1
----
   elseif 0+devicex <x and x<60 + devicex and 130+ devicey <y and y <190+devicey then
         sprx = sprx + 1
----
    elseif 0+devicex <x and x<60 + devicex and 195+ devicey <y and y <255+devicey then
         sprx = sprx - 1


end
end

end


end

function love.draw()
love.graphics.setBackgroundColor(1,1,1)
love.graphics.setColor(0,0,0,1)
love.graphics.circle("fill",sprx + devicex, spry + devicey)

love.graphics.setColor(0,0,0,0.5)
love.graphics.draw(KeyImg, 0+devicex,0+devicey,0,0.75)

love.graphics.draw(KeyImg, 60+devicex,125+devicey,math.rad(180),0.75)
love.graphics.draw(KeyImg, 60+devicex,130+devicey,math.rad(90),0.75)
love.graphics.draw(KeyImg, 60+devicex,255+devicey,math.rad(-90),0.75)


end