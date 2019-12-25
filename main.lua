local player = require('player')
local keyboard = require('util.keyboard')
local vec = require('util.vec')

local state = {}

function love.conf(t)
  t.console = true
end

function love.load()
  state.player = player(vec(20, 20))
  state.keyboard = keyboard()
end

function love.keypressed(key, scancode, isrepeat)
  -- Store what keys have just been pressed.
  -- We just want the initial press, not repeat presses.
  if isrepeat then
    return
  end
  print('just pressed ' .. key)
  state.keyboard:onKeyPressed(key)
end

function love.update(dt)
  state.player:update(dt, state.keyboard)

  state.keyboard:clearJustPressedKeys()
end

function love.draw()
  state.player:draw()
end
