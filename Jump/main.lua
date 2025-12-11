function love.load()

player.ground = player.y     -- This makes the character land on the plaform.

	player.y_velocity = 0        -- Whenever the character hasn't jumped yet, the Y-Axis velocity is always at 0.

	player.jump_height = -300    -- Whenever the character jumps, he can reach this height.
	player.gravity = -500        -- Whenever the character falls, he will descend at this rate.


end



function love.update()

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



function love.draw()


end