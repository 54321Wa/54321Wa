

player = {}
player.x = 100
player.y = 100
player.speed = 50
player.health = 20
player.damage = 2





function player_draw()
  --love.graphics.set.color(255,255,255)
  player.pic = love.graphics.newImage("red.png")
  
  love.graphics.draw(player.pic, player.x,player.y)

end

function player_move()
  if love.keyboard.isDown("up") then
     player.y = player.y - player.speed
  end
  if love.keyboard.isDown("down") then
     player.y = player.y + player.speed
  end
  if love.keyboard.isDown("left") then
     player.x = player.x - player.speed
  end
  if love.keyboard.isDown("right") then
     player.x = player.x + player.speed
  end
end