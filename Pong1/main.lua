function love.load()
love.graphics.setBackgroundColor(255,0,100)

player = {}
  player.x = 10
  player.y = love.graphics.getHeight()/2
  player.width = 20
  player.height = 100
end

function love.update()

end

function love.draw()
love.graphics.rectangle("fill",player.x, player.y,player.width,player.height)

end