-- thx dan

local class = {}

function class.build(superclass)
  local new_class = {}
  new_class.__index = new_class
  new_class._init = function() end

  local new_metatable = {}
  new_metatable.__call = function(thisClass, ...)
    local self = setmetatable({}, thisClass)
    self:_init(...)
    return self
  end

  if superclass then
    new_metatable.__index = superclass
    new_metatable.__metatable = superclass
  end

  setmetatable(new_class, new_metatable)
  return new_class
end

function class.instance_of(instance, superclass)
  while instance do
    if instance == superclass then return true end
    instance = getmetatable(instance)
  end
  return false
end

return class
