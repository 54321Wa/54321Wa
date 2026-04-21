Player = {}
Player.__index = Player

function Player.new(x, y)
    local instance = setmetatable({}, Player)
    instance.x = x
    instance.y = y
    instance.speed = 200
    instance.size = 30
    instance.dir = -1
    return instance
end

function Player:update(dt)
    if love.keyboard.isDown("right") then self.x = self.x + self.speed * dt end
    if love.keyboard.isDown("left") then self.x = self.x - self.speed * dt end
---
-- Update the object's state (e.g., movement)

---
end

function Player:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.size, self.size)
end
