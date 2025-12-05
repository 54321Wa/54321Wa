Pl = {}

function Pl:load()
 self.x = love.graphics.getWidth()/2
 self.y = love.graphics.getHeight()/2
 self.width = 50
 self.height = 50
 self.speed = 5

 button = {
    l = {0,400,200,100,0},
    r = {love.graphics.getWidth()-200,400,200,100,0},
  }

  --dx = 0
  --dy = 0
 
 --freq = 60


--checkBoundaries  = true

end

function Pl:update(dt)
 Pl:move()
for i,v in pairs(button) do
    if v[5] > 0 then
      button[i][5] = v[5] - dt
    else 
      button[i][5] = 0
    end
    
  end

  --player.x = player.x + dx * player.speed * dt
  
   
  --player.y = player.y + dy * player.speed * dt

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
for i,v in pairs(button) do
  love.graphics.setColor(255,255,255)
  love.graphics.rectangle("fill",v[1],v[2],v[3],v[4])
  end
 love.graphics.rectangle("fill",self.x,self.y,self.width,self.height)
end

function Pl:mousepressed(mx,my)
for i,v in pairs(button) do
    
    if mx >= v[1] and mx <= v[1] + v[3] and my >= v[2] and my <= v[2] +  v[4] then
      
      
        button[i][5] = freq
        if i == "l" then
        
        dx = - 20

        

        elseif i == "r" then

        dx = 20
        
        end
      end  
    end
 

end

function love.mousereleased()
  -- Reset dx/dy when button is released to stop movement
    dx = 0
end


