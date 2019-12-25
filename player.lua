local class = require('util.class')
local vec = require('util.vec')

local player = class.build()

function player:_init(pos)
  self.pos = vec(pos)
  self.vel = vec(0, 0)
  self.grounded = false
  self.life = 3
end

function player:update(dt, keyboard)
  -- TODO: Proper collisions
  local ground = 200
  local gravity = 0.2

  if not self.grounded then
    self.vel = self.vel + vec(0, gravity)
  elseif keyboard:isJustPressed('space') then
    self.grounded = false
    local jumpspeed = 5;
    self.vel.y = -jumpspeed;
  end
  
  self.pos = self.pos + self.vel
  if self.pos.y > ground then
    self.pos.y = ground
    self.vel.y = 0
    self.grounded = true
  end
end

function player:draw()
  love.graphics.rectangle("fill", self.pos.x, self.pos.y, 24, 32)
end

return player
