function love.load()
  love.window.setMode(love.graphics.getWidth(),love.graphics.getHeight())
love.graphics.setBackgroundColor(0,0,0)

    
player = {x=150,y=150,w=50,h=50,speed =20}
platform = {x=300,y=500,w=100,h=100}

speed_no_delta = 100
speed = 0
ga = 9.81
gv = 0
gc = false

end



function love.draw()
love.graphics.setColor(0,0.5,0)
love.graphics.rectangle("fill",player.x,player.y,player.w,player.h)
if CheckCollision(player.x,player.y,player.w,player.h,platform.x,platform.y,platform.w,platform.h) then
love.graphics.setColor(1,0,0)
end


love.graphics.setColor(1,0,0)
love.graphics.rectangle("fill", platform.x, platform.y,platform.w, platform.h)
------ Button
love.graphics.rectangle("line",20,20,50,50,10)
love.graphics.rectangle("line",20,120,50,50,10)
love.graphics.setColor(0,0,1)
love.graphics.rectangle("line",20,220,50,50,10)

----
t = love.touch.getTouches()

leftButton = false
rightButton = false


   
for id = 1, #t do
  local tx, ty = love.touch.getPosition(t[id])
  love.graphics.print(id, tx, ty)
  --rightButton
  if tx > 20 and tx < 70 then
     if ty > 20 and ty < 70 then
       love.graphics.rectangle("fill",20,20,50,50,10)
       player.x = player.x + player.speed
     end
  end
  --leftButton
  if tx > 20 and tx < 70 then
     if ty > 120 and ty < 170 then
       love.graphics.rectangle("fill",20,120,50,50,10)
       player.x = player.x - player.speed
     end
  end
  --jumpButton
  if tx > 20 and tx < 70 then
     if ty > 220 and ty < 270 then
       love.graphics.rectangle("fill",20,220,50,50,10)
          if ground == true then
              player.y = - 300 * dt
          end

     end
  end
end

end


function love.update(dt)

speed = speed_no_delta * dt

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
------ Gravity
  player.y  = player.y + gravity


  if player.y > love.graphics.getHeight() -200 then
  player.y = love.graphics.getHeight() - player.h
  gravity_Vel = 0
  end

-----
if CheckCollision(player.x,player.y,player.w,player.h,platform.x,platform.y,platform.w,platform.h) then
  
 
  
end

end



function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end
