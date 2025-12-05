require("pl")

require("enemy")

--local lg = love.graphics

function love.load()
love.window.setMode(love.graphics.getWidth(),love.graphics.getHeight())

love.graphics.setBackgroundColor(0,255,80)

 Pl:load()
 Enemy:load()
--width,height = lg.getDimensions()
--x = lg.getWidth()/2

--w = 40
--h = 40
--speed = 10


end

function love.update(dt)
 Pl:update(dt)
 Enemy:update(dt)

--x = x + 1

end



function love.draw()
 Pl:draw()
 Enemy:draw()

--lg.setColor(255,0,0)
--lg.translate(w,h)

--lg.rectangle("fill",x,lg.getHeight()/2,w/2,h/2)

end



