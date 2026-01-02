player = {}
player.x = 10
player.y = 10
player.speed = 50
player.health = 20
player.damage = 2

player.pic = love.graphics.newImage("red.png")

function player_draw()
  love.graphics.set.color(255,255,255)
  love.graphics.draw(player.pic, player.x,player.y)

end

function player_move()


end