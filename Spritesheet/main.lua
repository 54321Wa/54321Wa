local hero_atlas

function love.load()
 love.graphics.setBackgroundColor(0,0,60)
  
 hero_atlas = love.graphics.newImage("assets/gfx/hero.pn
g")



end


function love.update(dt)
 
  
end

function love.draw()

love.graphics.setColor(255,0,0)
love.graphics.print("Love2D Tutorial EP2",50,100)

love.graphics.draw(hero_atlas,hero_sprite,120,120,)
end