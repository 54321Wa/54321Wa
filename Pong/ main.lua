local love = require "love"
local Player = require "Player"

require ("player")

function love.load()
  Player:load()

end

function  love.update(dt)
  Player:update(dt)

end

function love.draw()
  Player:draw()

end