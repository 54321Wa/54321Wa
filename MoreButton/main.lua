
require "menu"
require "player"

function love.load()
medium = love.graphics.newFont(45)

gamestat = "menu"
--gamestat = "playing"

love.graphics.setBackgroundColor(255,255,255)

--Buttons

button_spawn(5,200,"Start", "start")
button_spawn(5,400, "Quit", "quit ")

end


function love.update(dt)
  mousex = love.mouse.getX()
  mousey = love.mouse.getY()
  if gamestat == "playing" then
     player_move(dt)
     --map_collide()
  end
  if gamestat == "menu" then
     button_check()
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

function love.mousepressed(x,y) 
   if gamestat == "menu" then
      button_click(x,y)

   end 


end