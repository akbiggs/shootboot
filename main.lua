local player = require('player')
local vec = require('vec')

local state = {}

function love.load()
  state.player = player(vec(20, 20))
end

function love.update()
  
end

function love.draw()
  state.player:draw()
end
