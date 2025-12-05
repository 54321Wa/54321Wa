Pl = {}

function Pl:load()
 
 Pl.x = love.graphics.getWidth()/2
 Pl.y = love.graphics.getHeight()/2
 Pl.width = 50
 Pl.height = 50
 Pl.speed = 5

 button = {
    l = {0,400,200,100,0},
    r = {love.graphics.getWidth()-200,400,200,100,0},
}

 dx = 0
 dy = 0
 freq = 60

end

function Pl:update(dt)

-- Check for touches within button areas (using mousepressed works for touches too)
    -- [2] recommends checking touch.getTouches() for multi-touch, or using mousepressed/released for simple taps
    -- For continuous movement, use mouse.isDown (or touch.isDown if available)

Pl:Boundaries()

 
for i,v in pairs(button) do
    if v[5] > 0 then
      button[i][5] = v[5] - dt
    else 
      button[i][5] = 0
    end
    
  end

--player.x = player.x + dx * player.speed * dt

 Pl.x = Pl.x + dx * Pl.speed * dt

end



function Pl:Boundaries()
 if Pl.x < 0 then
  Pl.x = 0

 elseif Pl.x + Pl.width > love.graphics.getWidth() then
 Pl.x = love.graphics.getWidth() - Pl.width
 end
end

function Pl:draw()

 for i,v in pairs(button) do
  love.graphics.setColor(0.5,0.5,0.5,0.5)
  love.graphics.rectangle("fill",v[1],v[2],v[3],v[4])
  end

  love.graphics.setColor(1, 1, 1) -- Reset color

--Player
 love.graphics.rectangle("fill",Pl.x,Pl.y,Pl.width,Pl.height)

end


function Pl:mousepressed(mx,my)
 

for i,v in pairs(button) do
    
    if mx >= v[1] and mx <= v[1] + v[3] and my >= v[2] and my <= v[2] +  v[4] then
      
        button[i][5] = freq
        
        if i == "l" then
        dx = - 20
--   love.graphics.setBackgroundColor(0,255,0)
        elseif i == "r" then
        dx = 20
        end
      end  
    end 
end

function love.mousereleased()
  dx = 0
end







