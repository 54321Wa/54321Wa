
require "menu"
require "player"

function love.load()
medium = love.graphics.newFont(45)

gamestat = "menu"
--gamestat = "playing"

love.graphics.setBackgroundColor(255,255,255)

--Buttons

button_spawn(5,200,"Start")
button_spawn(5,400, "Quit")

end


function love.update(dt)
  if gamestat == "playing" then
     player_move(dt)
     --map_collide()
  end

end


function love.draw()
  if gamestat == "playing"then
     player_draw()
  end
  if gamestat == "menu" then
     button_draw()
  end

end

function love.mousepressed(x,y,)