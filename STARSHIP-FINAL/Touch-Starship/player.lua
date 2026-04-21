

Player = Object:extend()

function Player:new()
--test
Object = require "bullet"

love.graphics.setColor(1,1,1)

  self.image = love.graphics.newImage("panda.png")
  self.x = 150
  self.y = 100
  self.xVel = 5
  self.width =   self.image:getWidth()
  self.height = self.image:getHeight()


end

function Player:update(dt)
    if love.keyboard.isDown("left") then
        self.x = self.x - self.speed * dt
    elseif love.keyboard.isDown("right") then
        self.x = self.x + self.speed * dt
    end
---
--Get the width of the window
    local window_width = love.graphics.getWidth()

    --If the x is too far too the left then..
    if self.x < 0 then
        --Set x to 0
        self.x = 0

    --Else, if the x is too far to the right then..
    elseif self.x + self.width > window_width then
        --Set the x to the window's width.
        self.x = window_width - self.width
    end
end


function Player:draw()
 love.graphics.draw(self.image,self.x,self.y)

-- Button Rectangle
love.graphics.rectangle("line",20,20,50,50,10)
love.graphics.rectangle("line",20,120,50,50,10)
love.graphics.rectangle("line",20,220,50,50,10)

t = love.touch.getTouches()
   
for id = 1, #t do
  local tx, ty = love.touch.getPosition(t[id])
  love.graphics.print(id, tx, ty)
  --rightButton
  if tx > 20 and tx < 70 then
     if ty > 20 and ty < 70 then
       love.graphics.rectangle("fill",20,20,50,50,10)
       player.x = player.x + player.xVel

love.graphics.print("Click",150,100)

     end
  end
  --leftButton
  if tx > 20 and tx < 70 then
     if ty > 120 and ty < 170 then
       love.graphics.rectangle("fill",20,120,50,50,10)
       player.x = player.x - player.xVel
     end
  end
  
  --fireButton
  if tx > 20 and tx < 70 then
     if ty > 220 and ty < 270 then

table.insert(listOfBullets, Bullet(self.x, self.y ))

        -- love.audio.play(jumpsound) -- Play sound if you have one [9]
          
          
     end
   end
end
end
