 --local love = require "love"

--local Player = require "Player"



function love.load()
  player = {}
  player.x = 10
  player.y = love.graphics.getHeight()/2
  player.width = 20
  player.height = 100
   --player.speed = 500

  

end

function  love.update(dt)
  

end

function love.draw()
 love.graphics.rectangle("fill",player.x, player.y,player.width,player.height)

end