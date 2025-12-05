Pl = {}

function Pl:load()
 self.x = love.graphics.getWidth()/2
 self.y = love.graphics.getHeight()/2
 self.width = 50
 self.height = 50
 self.speed = - 5

 


end

function Pl:update(dt)
 Pl:move()


 

end

function Pl:move()
 Pl:Boundaries()
 Pl:mousepressed(mx,my)

 --test
 self.x = self.x + self.speed

end

function Pl:Boundaries()
 if self.x < 0 then
  self.x = 0

 elseif self.x + self.width > love.graphics.getWidth() then
 self.x = love.graphics.getWidth() - self.width
 end
end

function Pl:draw()
 love.graphics.rectangle("fill",self.x,self.y,self.width,self.height)

end


function Pl:mousepressed(mx,my)

end
 



function love.mousereleased()
  
end


