require("platform")

function love.load()

       love.window.setMode(love.graphics.getWidth(),love.graphics.getHeight())
  love.graphics.setBackgroundColor(255,0,100)

  platform:load()
   
  player = {}
  player.x = love.graphics.getWidth()/2
  player.y = love.graphics.getHeight()-200
  player.width = 100
  player.height = 100
  player.speed = 20
  
  gameFont = love.graphics.newFont(40)
  
  button = {
    l = {0,love.graphics.getHeight()-100,200,100,0},
    r = {love.graphics.getWidth()-200,love.graphics.getHeight()-100,200,100,0},
    j = {love.graphics.getWidth() /2,love.graphics.getHeight()-100,100,100,0},
  }

  


  dx = 0
  dy = 0
 
 freq = 60

  player.ground = player.y     -- This makes the character land on the plaform.

	player.y_velocity = 0        -- Whenever the character hasn't jumped yet, the Y-Axis velocity is always at 0.

	player.jump_height = -300    -- Whenever the character jumps, he can reach this height.
	player.gravity = -500        -- Whenever the character falls, he will descend at this rate.

  
  
end

function love.update(dt)

  platform:update(dt)
  
  for i,v in pairs(button) do
    if v[5] > 0 then
      button[i][5] = v[5] - dt
    else 
      button[i][5] = 0
    end
    
  end

  player.x = player.x + dx * player.speed * dt
  
   
  player.y = player.y + dy * player.speed * dt

  if player.x < 0 then
  player.x = 0

  elseif player.x + player.width > love.graphics.getWidth() then
  player.x = love.graphics.getWidth() - player.width
  
  end
  if player.y < 0 then
  player.y = 0

  elseif player.y > love.graphics.getHeight() - player.height then
  player.y = love.graphics.getHeight() - player.height

  end
 
-- Add below the right key assignment. 

        -- This is in charge of player jumping.
	if love.keyboard.isDown('space') then                     -- Whenever the player presses or holds down the Spacebar:

                -- The game checks if the player is on the ground. Remember that when the player is on the ground, Y-Axis Velocity = 0.
		if player.y_velocity == 0 then
			player.y_velocity = player.jump_height    -- The player's Y-Axis Velocity is set to it's Jump Height.
		end
	end

  -- Add below the jump key assignment.

	-- This is in charge of the jump physics.
	if player.y_velocity ~= 0 then                                      -- The game checks if player has "jumped" and left the ground.
		player.y = player.y + player.y_velocity * dt                -- This makes the character ascend/jump.
		player.y_velocity = player.y_velocity - player.gravity * dt -- This applies the gravity to the character.
	end

	-- This is in charge of collision, making sure that the character lands on the ground.
	if player.y > player.ground then    -- The game checks if the player has jumped.
		player.y_velocity = 0       -- The Y-Axis Velocity is set back to 0 meaning the character is on the ground again.
		player.y = player.ground    -- The Y-Axis Velocity is set back to 0 meaning the character is on the ground again.
	end

 
 end
    
  
 
end

function love.draw()

  platform:draw()
  
  for i,v in pairs(button) do
  love.graphics.setColor(255,255,255)
  love.graphics.rectangle("fill",v[1],v[2],v[3],v[4])
  end

  love.graphics.setFont(gameFont)
  -- love.graphics.print("Movement Example", love.graphics.getWidth()/2  ,40)

  -- Text
  love.graphics.setColor(0,255,0)
  love.graphics.print("Left",50,love.graphics.getHeight()-70)
  love.graphics.print("Right",love.graphics.getWidth()-150,love.graphics.getHeight()-70)
  
  love.graphics.setColor(255,0,0) --red
  love.graphics.rectangle("fill", 0,0,100,100)
  love.graphics.rectangle("fill",     love.graphics.getWidth()-100,0,100,100)
  
  love.graphics.setColor(0,255,0)
  love.graphics.rectangle("fill",player.x, player.y,player.width,player.height)
 

 
end

function love.mousepressed(mx,my)
  -- Check if touch is on virtual buttons (e.g., left/right)
  -- Set dx/dy variables (e.g., dx = -1 for left, 1 for right)

  for i,v in pairs(button) do
    
    if mx >= v[1] and mx <= v[1] + v[3] and my >= v[2] and my <= v[2] +  v[4] then
      
      
        button[i][5] = freq
        if i == "l" then
        
        dx = - 20

        

        elseif i == "r" then

        dx = 20

        elseif i == "j" then
        
        dy = -40
        
        end
      end  
    end 
  end

function love.mousereleased()
  -- Reset dx/dy when button is released to stop movement
    dx = 0
    dy = 9.81
end





  