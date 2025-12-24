function love.load()
  love.window.setMode(love.graphics.getWidth(),love.graphics.getHeight())
love.graphics.setBackgroundColor(0,0,0)

    
player = {x=150,y=love.graphics.getHeight()-250,w=50,h=50,speed=20}
platform = {x=300,y=500,w=100,h=100}



end



function love.draw()
love.graphics.setColor(0,0.5,0)
love.graphics.rectangle("fill",player.x,player.y,player.w,player.h)
if CheckCollision(player.x,player.y,player.w,player.h,platform.x,platform.y,platform.w,platform.h) then
love.graphics.setColor(1,0,0)
end


love.graphics.setColor(1,0,0)
love.graphics.rectangle("fill", platform.x, platform.y,platform.w, platform.h)
------
touches = love.touch.getTouches()





end


function love.update(dt)
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
-----




-----
if CheckCollision(player.x,player.y,player.w,player.h,platform.x,platform.y,platform.w,platform.h) then
  
  --player.x = 0
  
  
end

end

function love.mousepressed(mx,my)
  
end

function love.mousereleased()
  
    
end

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end
