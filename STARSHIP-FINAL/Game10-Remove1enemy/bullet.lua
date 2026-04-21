Bullet = {}
Bullet.__index = Bullet

function Bullet.new(x, y)
    local instance = setmetatable({}, Bullet)
    instance.x = x
    instance.y = y
    instance.bulletspeed = 100
    instance.size = 30
    instance.dead = true
    return instance
end

function Bullet:update(dt)


end

function Bullet:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.size, self.size)
end
