-- main.lua

local ObjectLibrary = require("ObjectLibrary")

local player
local bullet
local enemy

local speed = 50
local spawnTimer = 0
local bulletTimer = 0



function love.load()
love.graphics.setBackgroundColor(0.5,0.5,1)

-- Create two objects, one with an image and one without
player = ObjectLibrary:new(200, love.graphics.getHeight()-100, 50, 50, "assets/player.png") 
-- assumes you have a player.png

enemies = {}
bullets = {}

end
------/////:::::-----------//
function love.update(dt)

local prevX, prevY = player.x, player.y



 -- Move player with arrow keys
    if love.keyboard.isDown("right") then player.x = player.x + speed * dt end
    if love.keyboard.isDown("left") then player.x = player.x - speed * dt end
    if love.keyboard.isDown("up") then player.y = player.y - speed * dt end
    if love.keyboard.isDown("down") then player.y = player.y + speed * dt end

-- Move Enemy
spawnTimer = spawnTimer + dt
    if spawnTimer > 1 then -- Spawn every 2 seconds
        spawnEnemy(math.random(0, love.graphics.getWidth()), -50)
        spawnTimer = 0
    end
    
    -- Standard update loop for existing enemies
    for i, e in ipairs(enemies) do
        e:update(dt)
    end

bulletTimer = bulletTimer + dt
    if bulletTimer > 2 then -- Spawn every 2 seconds
        spawnBullet(player.x + (player.width / 2), player.y)
        
        bulletTimer = 0

    end

    -- Standard update loop for existing enemies
    for i, b in ipairs(bullets) do
        --b:update(dt)
    b.y = b.y - 200 * dt
    end
---- Move player
player.x = player.x + speed * dt

------ Player Movement
if player.x <= 0 or player.x >= love.graphics.getWidth() - player.width then
    speed = -speed
end
----- Edge of Screen
if player.x < 0 then
player.x = 0

elseif player.x + player.width > love.graphics.getWidth() then
player.x = love.graphics.getWidth() - player.width
----
for i = #enemies, 1, -1 do
  local enemy = enemies[i]
  for j = #bullets, 1, -1 do
    local bullet = bullets[j]
    if checkCollision(enemy.x, enemy.y, enemy.width, enemy.height, bullet.x, bullet.y, bullet.width, bullet.height) then
      table.remove(enemies, i)
      table.remove(bullets, j)
      break -- Stop checking this enemy since it's now gone
    end
  end
end
---------
--if bullet.y <= 0 then
--table.remove(bullets, j)
--end

------
 

---
end

    end

function love.draw()

-- Draw objects
    player:draw()

for i, e in ipairs(enemies) do
        e:draw() -- Assumes your ObjectLibrary has a draw method
    end

-- Bullet
for i, b in ipairs(bullets) do
        b:draw() -- Assumes your ObjectLibrary has a draw method
    end

    love.graphics.print("Press Space to shoot", 10, 100)

end

function spawnEnemy(x, y)
    local newEnemy = ObjectLibrary:new(x, y, 70, 70, "assets/enemy.png")
    table.insert(enemies, newEnemy)
end

function spawnBullet(x, y)
    local newBullet =
ObjectLibrary:new(x, y, 20, 20, "assets/bullet.png")
     table.insert(bullets, newBullet)
end


function checkCollision(x1, y1, w1, h1, x2, y2, w2, h2)
  return x1 < x2 + w2 and
         x2 < x1 + w1 and
         y1 < y2 + h2 and
         y2 < y1 + h1
end
