local class = require class
local Vec = class:derive("Sprite")

function Sprite:new()
  self:animations = {}
end