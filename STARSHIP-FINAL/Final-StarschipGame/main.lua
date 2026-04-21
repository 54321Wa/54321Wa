-- main.lua
-- Bullet Score and Win
-- Player Live and Loose
local ObjectLibrary = require("ObjectLibrary")



local player
local speed = 50
local spawnTimer = 0
spawnDelay = 1 -- Seconds between spawns
maxEnemies = 10
enemiesSpawned = 0

function love.load()
love.graphics.setBackgroundColor(0.5,0.5,1)

enemyImage = love.graphics.newImage("assets/enemy.png") 

player = ObjectLibrary:new(200, love.graphics.getHeight()-100, 50, 50, "assets/player.png")

    -- Object containers
    bullets = {}
    enemies = {}

score = 0
player.health = 5
isGameOver = false
isVictory = false -- Add this
winScore = 50    -- Set your target score here
largeFont = love.graphics.newFont(48)

end

function love.update(dt)
    if isGameOver or isVictory then return end

    ------ Player Movement & Screen Bounds
    player.x = player.x - speed * dt
    if player.x <= 0 or player.x >= love.graphics.getWidth() - player.width then
        speed = -speed
    end

    ------ Enemy Spawning
    if enemiesSpawned < maxEnemies then
        spawnTimer = spawnTimer + dt
        if spawnTimer >= spawnDelay then
            table.insert(enemies, {
                x = math.random(0, love.graphics.getWidth() - enemyImage:getWidth()),
                y = -enemyImage:getHeight(),
                width = enemyImage:getWidth(),
                height = enemyImage:getHeight(),
                speed = math.random(100, 200),
                img = enemyImage
            })
            spawnTimer = 0
            enemiesSpawned = enemiesSpawned + 1
        end
    end

    ------ 1. Update Bullets
    for i = #bullets, 1, -1 do
        local b = bullets[i]
        b.y = b.y - 300 * dt
        if b.y < 0 then table.remove(bullets, i) end
    end

    ------ 2. Update Enemies & Player Collision
    for i = #enemies, 1, -1 do
        local e = enemies[i]
        e.y = e.y + (e.speed * dt)

        -- Enemy hits Player OR falls off screen
        local hitPlayer = (player.x < e.x + e.width and player.x + player.width > e.x and player.y < e.y + e.height and player.y + player.height > e.y)
        
        if hitPlayer or e.y > love.graphics.getHeight() then
            table.remove(enemies, i)
            enemiesSpawned = enemiesSpawned - 1
            player.health = player.health - 1
            
            if player.health <= 0 then 
                isGameOver = true 
            end
        end
    end

    ------ 3. Bullet vs Enemy Collision
    for i = #bullets, 1, -1 do
        local b = bullets[i]
        for j = #enemies, 1, -1 do
            local e = enemies[j]
            if b.x < e.x + e.width and b.x + b.w > e.x and b.y < e.y + e.height and b.y + b.h > e.y then
                table.remove(bullets, i)
                table.remove(enemies, j)
                enemiesSpawned = enemiesSpawned - 1
                score = score + 10
                break -- Bullet is gone, move to next bullet
            end
        end
    end

    -- Win Condition
    if score >= winScore then
        isVictory = true
    end
end



function love.touchpressed(id, x, y, dx, dy, pressure)
    -- Spawn bullet at touch position
    table.insert(bullets, {x = player.x + player.width/2 , y = player.y, w = 10, h = 10})
end

function love.draw()

  -- Handle End Game Screens
    if isGameOver then
        love.graphics.setColor(1, 0, 0) 
-- Red for Game Over
love.graphics.setFont(largeFont)
        love.graphics.printf("GAME OVER\nFinal Score: " .. score, 0, love.graphics.getHeight()/2, love.graphics.getWidth(), "center")
        return 
    elseif isVictory then
        love.graphics.setColor(0, 1, 0) 
-- Green for Victory
love.graphics.setFont(largeFont)
        love.graphics.printf("YOU WON!\nFinal Score: " .. score, 0, love.graphics.getHeight()/2, love.graphics.getWidth(), "center")
        return
    end

-- Draw objects
    player:draw()

----
for i, enemy in ipairs(enemies) do
        -- Draw the image at the enemy's x and y coordinates
        love.graphics.draw(enemy.img, enemy.x, enemy.y)
    end

----
    love.graphics.setColor(1, 1, 1) -- White bullets
    for _, b in ipairs(bullets) do
        love.graphics.rectangle("fill", b.x, b.y, b.w, b.h)
    end

    -- Draw Score (Black text, top left)
    love.graphics.setColor(0, 0, 0)
love.graphics.print("Health: " .. player.health, 50, 150,0,2,2)
    love.graphics.print("Score: " .. score, 50, 100,0,2,2) 


    love.graphics.setColor(1, 1, 1) -- Reset color to white for other objects

end


