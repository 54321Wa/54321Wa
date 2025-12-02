local love = require "love"

--local Player = require "Player"



function love.load()
  player = {
  x = 10
  y = love.graphics.getHeight()/2
  width = 20
  height = 100
  speed = 500
}
  

end

function  love.update(dt)
  Player:update(dt)

end

function love.draw()
  Player:draw()

end