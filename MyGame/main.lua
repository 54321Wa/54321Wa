
require "game"

require "menu"



function love.load()
medium = love.graphics.newFont(45)

gamestate = "menu"

love.graphics.setBackgroundColor(255,0,255)

--Buttons

button_spawn(5,200,"Start","start")
button_spawn(5,400,"Quit","quit")

game_load()

end


function love.update(dt)
  mousex = love.mouse.getX()
  mousey = love.mouse.getY()
  if gamestate == "game_playing" then
    --player_move(dt)
    game_update()
    
     
  end

  if gamestate == "menu" then
     button_check()
  end

  if gamestate == "quit" then
     button_check()
     love.event.quit()
  end

 
end


function love.draw()
  if gamestate == "game_playing" then
     game_draw()
  end
  if gamestate == "menu" then
     button_draw()
  end

end

function love.mousepressed(x,y) 
   
   if gamestate == "menu" then
      button_click(x,y)

   end 
 
   if gamestate == "quit" then
      button_click()
   end
   
   


end