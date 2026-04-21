Bullet = {}
Bullet.__index = Bullet

function Bullet.new(x, y)
    local instance = setmetatable({}, Bullet)
    instance.x = x
    instance.y = y
    instance.bulletspeed = -200
    instance.size = 70
    return instance
end

function Bullet:update(dt)
self.y = self.y + self.bulletspeed * dt
end

function Bullet:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.size, self.size)
end


