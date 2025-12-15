local hero_atlas
local hero_sprite
local angle = 0

lo

function love.load()
 love.graphics.setBackgroundColor(0,0,0.9)

 love.graphics.setDefaultFilter("nearest","nearest")
  
 hero_atlas = love.graphics.newImage("assets/gfx/hero.png")

 hero_sprite = love.graphics.newQuad(16,32,16,16,hero_atlas:getDimensions())

end


function love.update(dt)
if dt > 0.035 then return end

--angle = angle + 27.5 * dt
 
  
end

function love.draw()

love.graphics.setColor(255,0,0)
love.graphics.print("Love2D Tutorial EP3",450,100)

--love.graphics.draw(hero_atlas,25,25,0,2,2)
love.graphics.draw(hero_atlas,hero_sprite,320,160,math.rad(angle),10,10,8,8)
end