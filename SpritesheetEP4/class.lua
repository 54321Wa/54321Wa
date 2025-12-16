local Class = {}
Class.__index = Class

--default implementation
function Class:new() end

--create a new Class type from our base Class
function Class:derive(type)
  cls.type = type
  cls.__index = cls
  cls.super = self
  setmetatable(cls,self)
  return cls



function Class:get_type()
  return self.type

return Class