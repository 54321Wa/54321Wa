Pl = {}



function Pl:load()
 self.x = love.graphics.getWidth()/2
 self.y = love.graphics.getHeight()/2
 self.width = 50
 self.height = 50
 self.speed = - 5

 button = {
   l = {50, love.graphics.getHeight()-100, 80, 80},
   r = {200, love.graphics.getHeight()-100, 80, 80},
}

end

function Pl:update(dt)

-- Check for touches within button areas (using mousepressed works for touches too)
    -- [2] recommends checking touch.getTouches() for multi-touch, or using mousepressed/released for simple taps
    -- For continuous movement, use mouse.isDown (or touch.isDown if available)
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

 for i,v in pairs(button) do
  love.graphics.setColor(0.5,0.5,0.5,0.5)
  love.graphics.rectangle("fill",v[1],v[2],v[3],v[4])
  end

-- Draw buttons (visual feedback is key)
    --love.graphics.setColor(0.5, 0.5, 0.5, 0.5) -- Grey semi-transparent


    --love.graphics.rectangle("fill", leftButton.x, leftButton.y, leftButton.w, leftButton.h)
    --love.graphics.rectangle("fill", rightButton.x, rightButton.y, rightButton.w, rightButton.h)


    love.graphics.setColor(1, 1, 1) -- Reset color
 love.graphics.rectangle("fill",self.x,self.y,self.width,self.height)

end


function Pl:mousepressed(mx,my)
 --x=50, y=love.graphics.getHeight()-100, w=80, h=80

--if mx >= v[1] and mx <= v[1] + v[3] and my >= v[2] and my <= v[2] +  v[4] then

 

end
 



function love.mousereleased()
  
end







