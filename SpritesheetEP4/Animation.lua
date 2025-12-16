local class = require class
local Anim = class:derive("Animation")

function Anim:new()
   self.fps =
   self.timer = 1 / self.fps
   self.frame )
   self.num_frames =
   self.offset = Vector2()
   self.size = Vector2()
   
   self.h =
  
end

function Anim:update()
   self.timer = self.timer * dt
   if(self.timer <= 0) then
     self.timer = 1 / fps
     self.frame = self.frame + 1
     if self.frame > self.num_frames then self.frame = 
     
   end
end

return Anim