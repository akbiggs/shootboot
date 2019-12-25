local class = require('util.class')
local vec = require('vec')

local player = class.build()

function player:_init(pos)
  self.pos = vec(pos)
  self.life = 3
end

function player:update(dt)
end

function player:draw()
  love.graphics.rectangle("fill", self.pos.x, self.pos.y, 16, 32)
end

return player
