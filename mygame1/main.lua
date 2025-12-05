require("pl")

require("enemy")



function love.load()
love.window.setMode(love.graphics.getWidth(),love.graphics.getHeight())

--love.graphics.setBackgroundColor(255,255,255)

 Pl:load()
 Enemy:load()



end

function love.update(dt)
 Pl:update(dt)
 Enemy:update(dt)



end



function love.draw()
 Pl:draw()
 Enemy:draw()



end



