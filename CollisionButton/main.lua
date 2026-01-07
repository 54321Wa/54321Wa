function love.load()
  love.window.setMode(love.graphics.getWidth(),love.graphics.getHeight())
love.graphics.setBackgroundColor(0,0,0)

    
player = {x=150,y=200,w=50,h=50,xVel =20,dy=0,canJump = true}
box = {x=150,y=800,w=200,h=100}

gravity = 900 -- pixels/second^2 (adjust for desired fall speed)
jumpForce = -800 -- pixels/second (negative for upward)

ground = love.graphics.getHeight() - player.h

score = 0
medium = love.graphics.newFont(45)
end



function love.draw()
love.graphics.setColor(0,0,255)
love.graphics.setFont(medium)
love.graphics.print("Score  ",300,50)



love.graphics.setColor(0,0.5,0)
love.graphics.rectangle("fill",player.x,player.y,player.w,player.h)

if        CheckCollision(player.x,player.y,player.w,player.h,box.x,box.y,box.w,box.h) then
  love.graphics.setColor(0,1,0)
else
  love.graphics.setColor(1,0,0)
end


love.graphics.setColor(1,0,0)
love.graphics.rectangle("fill", box.x, box.y,box.w, box.h)
------ Button
love.graphics.rectangle("line",20,20,50,50,10)
love.graphics.rectangle("line",20,120,50,50,10)
love.graphics.rectangle("line",20,220,50,50,10)

----

t = love.touch.getTouches()
   
for id = 1, #t do
  local tx, ty = love.touch.getPosition(t[id])
  love.graphics.print(id, tx, ty)
  --rightButton
  if tx > 20 and tx < 70 then
     if ty > 20 and ty < 70 then
       love.graphics.rectangle("fill",20,20,50,50,10)
       player.x = player.x + player.xVel
     end
  end
  --leftButton
  if tx > 20 and tx < 70 then
     if ty > 120 and ty < 170 then
       love.graphics.rectangle("fill",20,120,50,50,10)
       player.x = player.x - player.xVel
     end
  end
  --jumpButton
  if tx > 20 and tx < 70 then
     if ty > 220 and ty < 270  and player.canJump then
       
        player.dy = jumpForce -- Give initial upward velocity
        player.canJump = false -- Prevent double jumps
        -- love.audio.play(jumpsound) -- Play sound if you have one [9]
          love.graphics.rectangle("fill",20,220,50,50,10)
          
     end
   end
end
end

function love.update(dt)
-- Apply gravity
    player.dy = player.dy + gravity * dt
    player.y = player.y + player.dy * dt

    -- Check for ground collision (simple example)
    if player.y > ground then 
        -- Assuming ground is at y=300
        player.y = ground
        player.canJump = true
    end


----
if love.keyboard.isDown("right") then
  player.x = player.x + player.speed

elseif love.keyboard.isDown("left")then
  player.x = player.x - player.speed
elseif love.keyboard.isDown("up") then
  player.y = player.y - player.speed
elseif love.keyboard.isDown("down") then
  player.y = player.y - player.speed
end
----- Edge of Screen
  if player.x < 0 then
  player.x = 0

  elseif player.x + player.w > love.graphics.getWidth() then
  player.x = love.graphics.getWidth() - player.w
  end
----- Collision Check
  if        CheckCollision(player.x,player.y,player.w,box.h,box.x,box.y,box.w,box.h) then
  print("Collision")
  
  --score = score + 1
  
  end
   

end

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end
