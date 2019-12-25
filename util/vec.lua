local class = require('util.class')

local vec = class.build()

function vec:_init(x, y)
  if class.instance_of(x, vec) then
    self.x = x.x
    self.y = x.y
  else
    self.x = x
    self.y = y
  end
end

--[[
Makes a binary operator for the vector that can take
either two vectors or a vector and a number.
]]--
function _vec_binary_op(op)
  return function(v1, v2)
    if type(v1) == "table" and type(v2) == "table" then
      -- two vectors
      return vec(op(v1.x, v2.x), op(v1.y, v2.y))
    end

    -- one of the arguments should be numeric
    if type(v1) == "table" then
      -- v2 is numeric
      return vec(op(v1.x, v2), op(v1.y, v2))
    end
  
    -- v1 is numeric
    -- preserving the order of operations is important
    return vec(op(v1, v2.x), op(v1, v2.y))
  end
end

vec.__add = _vec_binary_op(function(x,y) return x+y end)
vec.__sub = _vec_binary_op(function(x,y) return x-y end)
vec.__mul = _vec_binary_op(function(x,y) return x*y end)
vec.__div = _vec_binary_op(function(x,y) return x/y end)
vec.__pow = _vec_binary_op(function(x,y) return x^y end)

vec.__unm = function(v)
  return vec(-v.x, -v.y)
end

vec.__eq = function(v1, v2)
  return v1.x == v2.x and v1.y == v2.y
end

function vec:mag()
  return sqrt(self:sqr_mag())
end

function vec:sqr_mag()
  return self.x * self.x + self.y * self.y
end

function vec:normalized()
  local mag = self:mag()
  if mag == 0 then
    return vec()
  else
    return self / self:mag()
  end
end

function vec:min(v)
  return vec(min(self.x, v.x), min(self.y, v.y))
end

function vec:max(v)
  return vec(max(self.x, v.x), max(self.y, v.y))
end

function vec:clamp(vmin, vmax)
  return vec(
    clamp(self.x, vmin.x, vmax.x),
    clamp(self.y, vmin.y, vmax.y))
end

return vec
