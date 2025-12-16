local Class = {}
Class.__index = Class

--default implementation
function Class:new() end

--create a new Class type from our base Class
function Class:derive(type)


function Class:get_type()
  return self.type

return Class