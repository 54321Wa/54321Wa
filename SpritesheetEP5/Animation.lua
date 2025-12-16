local class = require("class")
local Anim = class:derive("Animation")

function Anim:new(xoffset, yoffset, w, h, column_size, num_frames,fps)
   self.fps = fps
   self.timer = 1 / self.fps
   self.frame = 1
   self.num_frames = num_frames
   self.colum_size = colum_size
   self.start_offset = Vector2(xoffset,     yoffset)
   self.offset = Vector2()
   self.size = Vector2(w,h)
end

function A
function Anim:update()
   self.timer = self.timer * dt
   if(self.timer <= 0) then
     self.timer = 1 / fps
     self.frame = self.frame + 1
     if self.frame > self.num_frames then
       self.frame = 1 end
     end
     self.offset.x = self.start_offset + ()self.size.x * (frame - 1))

     self.offset.y = self.start_offset + ()self.size.y * (frame - 1))
end

return Anim