local Class = {}
Class.__index = Class

--default implementation
function Class:new() end

--create a new Class type from our base Class
function Class:derive(type)
  local class = {}
  class["__call"] = Class.__call
  
  cls.type = type
  cls.__index = cls
  cls.super = self
  setmetatable(cls,self)
  return cls

function Class:__call(...)
  local inst = setmetatable({}, self)
  inst:new(...)
  return
end

function Class:get_type()
  return self.type

local Player = Class:derive("Player")
  function Player:new(name)
  end
local plyr1 = Player("nelix")


return Class