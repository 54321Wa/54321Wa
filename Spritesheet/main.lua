local hero_atlas
local hero_sprite

function love.load()
 love.graphics.setBackgroundColor(0,0,60)

 love.graphics.setDefaultFilter("nearest","nearest")
  
 hero_atlas = love.graphics.newImage("assets/gfx/hero.png")

 hero_sprite = love.graphics.newQuad(32,16,16,16,hero_atlas:getDimension(),hero_atlas:getDimension())

end


function love.update(dt)
 
  
end

function love.draw()

love.graphics.setColor(255,0,0)
love.graphics.print("Love2D Tutorial EP2",450,100)

love.graphics.draw(hero_atlas,25,25,0,2,2)
end