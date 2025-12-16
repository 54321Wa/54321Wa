local class = require("class")
local Anim = class:derive("Animation")

function Anim:new(xoffset, yoffset, w, h, column_size, num_frames,fps)
   self.fps = fps
   self.timer = 1 / self.fps
   self.frame = 1
   self.num_frames = num_frames
   self.start_offset = Vector2(xoffset,     yoffset)
   self.offset = V
   self.size = Vector2(w,h)
   
   
  
end

function Anim:update()
   self.timer = self.timer * dt
   if(self.timer <= 0) then
     self.timer = 1 / fps
     self.frame = self.frame + 1
     if self.frame > self.num_frames then
       self.frame = 1 end
     end
     self.offset.x = self.size.x * frame
end

return Anim