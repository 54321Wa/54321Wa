io.stdout:setvbuf("no")
--
function love.load()
  Object = require "classic"
  require "player"
  require "enemy"
  require "bullet"
  

  player = Player()
  enemy = Enemy()
  --button = Button()
  listOfBullets = {}
end

function love.update(dt)
  player:update(dt)
  enemy:update(dt)
  --bullet:update(dt)
  for i,v in ipairs(listOfBullets) do
        v:update(dt)
    --Each bullets checks if there is collision with the enemy
        v:checkCollision(enemy)

   --If the bullet has the property dead and it's true then..
        if v.dead then
            --Remove it from the list
            table.remove(listOfBullets, i)
        end
    end

end


function love.draw()
  player:draw()
  enemy:draw()
  
  --bullet:draw()

  for i,v in ipairs(listOfBullets) do
        v:draw()
    end

end
---------------------------------
--function love.touchpressed(id,x,y,dx,dy,pressure)
--player:touchpressed()
--button:clicked()
--if y < love.graphics.getHeight()/2 then
  --love.graphics.print("aea",100,100)
--end


--end

