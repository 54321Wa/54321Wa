local hero_atlas
local hero_sprite
local Anim = require("Animation")

local angle = 0

local fps = 10
local anim_timer = 1 / fps
local frame = 1
local num_frames = 6
local xoffset
local an = Anim()

local an = anim(16,32,16,16,6,6, 12)

function love.load()
 love.graphics.setBackgroundColor(0,0,255,200)

 love.graphics.setDefaultFilter("nearest","nearest")
  
 hero_atlas = love.graphics.newImage("assets/gfx/hero.png")

 hero_sprite = love.graphics.newQuad(16,32,16,16,hero_atlas:getDimensions())



end


function love.update(dt)
if dt > 0.035 then return end

--angle = angle + 27.5 * dt
anim_timer = anim_timer - dt

if anim_timer <= 0 then
anim_timer = 1 / fps
frame = frame + 1
if frame > num_frames then frame = 1 end
xoffset = 16 * frame
hero_sprite:setViewport(xoffset,32,16,16 )
end
  
end

function love.draw()

--love.graphics.setColor(255,0,0)
love.graphics.print("Love2D Tutorial EP5",450,100)

--love.graphics.draw(hero_atlas,25,25,0,2,2)
love.graphics.draw(hero_atlas,hero_sprite,320,160,math.rad(angle),10,10,8,8)
end