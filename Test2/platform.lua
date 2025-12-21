platform = {}

function platform:load()

  function CheckCollision(player.x,player.y,player.w,player.h,platform.x,platform.y,platform.w,platform.h) then
love.graphics.setColor(0,255,0)


end
        -- This is the height and the width of the platform.
	platform.w = love.graphics.getWidth()    -- This makes the platform as wide as the whole game window.
	platform.h = love.graphics.getHeight()  -- This makes the platform as tall as the whole game window.
        
        -- This is the coordinates where the platform will be rendered.
	platform.x = 400                               
--This starts drawing the platform at the left edge of the game window.
  platform.w = 200
	platform.y = (platform.h / 2)             -- This starts drawing the platform at the very middle of the game window
  platform.h = 40

  
end

function platform:update(dt)
end

function platform:draw()
	love.graphics.setColor(1, 1, 1)        -- This sets the platform color to white.

        -- The platform will now be drawn as a white rectangle while taking in the variables we declared above.
	love.graphics.rectangle('fill', platform.x, platform.y, platform.w, platform.h)
end