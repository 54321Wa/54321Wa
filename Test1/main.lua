require("platform")

function love.load()

       love.window.setMode(love.graphics.getWidth(),love.graphics.getHeight())
  love.graphics.setBackgroundColor(255,0,100)

  platform:load()
   
  player = {}
  player.x = love.graphics.getWidth()/2
  player.y = love.graphics.getHeight()-200
  player.width = 100
  player.height = 100
  player.speed = 20

  player.gr
  
  gameFont = love.graphics.newFont(40)
  
  button = {
    l = {0,love.graphics.getHeight()-100,200,100,0},
    r = {love.graphics.getWidth()-200,love.graphics.getHeight()-100,200,100,0},
    j = {love.graphics.getWidth() /2,love.graphics.getHeight()-100,100,100,0},
  }

  


  dx = 0
  dy = 0
 
 freq = 60

  
  
  
end

function love.update(dt)

  platform:update(dt)
  
  for i,v in pairs(button) do
    if v[5] > 0 then
      button[i][5] = v[5] - dt
    else 
      button[i][5] = 0
    end
    
  end

  player.x = player.x + dx * player.speed * dt
  
   
  player.y = player.y + dy * player.speed * dt

  if player.x < 0 then
  player.x = 0

  elseif player.x + player.width > love.graphics.getWidth() then
  player.x = love.graphics.getWidth() - player.width
  
  end
  if player.y < 0 then
  player.y = 0

  elseif player.y > love.graphics.getHeight() -200 then
  player.y = love.graphics.getHeight() - player.height

  end
 


 
 end
    
  
 


function love.draw()

  platform:draw()
  
  for i,v in pairs(button) do
  love.graphics.setColor(255,255,255)
  love.graphics.rectangle("fill",v[1],v[2],v[3],v[4])
  end

  love.graphics.setFont(gameFont)
  -- love.graphics.print("Movement Example", love.graphics.getWidth()/2  ,40)

  -- Text
  love.graphics.setColor(0,255,0)
  love.graphics.print("Left",50,love.graphics.getHeight()-70)
  love.graphics.print("Right",love.graphics.getWidth()-150,love.graphics.getHeight()-70)
  
  love.graphics.setColor(255,0,0) --red
  love.graphics.rectangle("fill", 0,0,100,100)
  love.graphics.rectangle("fill",     love.graphics.getWidth()-100,0,100,100)
  
  love.graphics.setColor(0,255,0)
  love.graphics.rectangle("fill",player.x, player.y,player.width,player.height)
 

 
end

function love.mousepressed(mx,my)
  -- Check if touch is on virtual buttons (e.g., left/right)
  -- Set dx/dy variables (e.g., dx = -1 for left, 1 for right)

  for i,v in pairs(button) do
    
    if mx >= v[1] and mx <= v[1] + v[3] and my >= v[2] and my <= v[2] +  v[4] then
      
      
        button[i][5] = freq
        if i == "l" then
        
        dx = - 20

        

        elseif i == "r" then

        dx = 20

        elseif i == "j" then
        
        dy = -40
        
        end
      end  
    end 
  end

function love.mousereleased()
  -- Reset dx/dy when button is released to stop movement
    dx = 0
    dy = 9.81
end





  