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

return vec
