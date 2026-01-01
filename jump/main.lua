function love.load()
player = {x=100, y=300, dy=0, canJump=true}
gravity = 900 -- pixels/second^2 (adjust for desired fall speed)
jumpForce = -400 -- pixels/second (negative for upward)
end

-- In love.update(dt)
function love.update(dt)
    -- Apply gravity
    player.dy = player.dy + gravity * dt
    player.y = player.y + player.dy * dt

    -- Check for ground collision (simple example)
    if player.y > 300 then -- Assuming ground is at y=300
        player.y = 300
        player.dy = 0
        player.canJump = true
    end
end

-- In love.keypressed(key)
function love.keypressed(key)
    if key == "space" and player.canJump then
        player.dy = jumpForce -- Give initial upward velocity
        player.canJump = false -- Prevent double jumps
        -- love.audio.play(jumpsound) -- Play sound if you have one [9]
    end
end

-- In love.draw()
function love.draw()
    love.graphics.rectangle("fill", player.x, player.y, 32, 32) -- Draw player
end
