local class = require('util.class')

keyboard = class.build()

function keyboard:_init()
  self.justpressed = {}
end

function keyboard:onKeyPressed(key)
  self.justpressed[key] = 1
end

function keyboard:isJustPressed(key)
  return self.justpressed[key] ~= nil
end

-- Call this at the end of each frame or isJustPressed will
-- be wrong.
function keyboard:clearJustPressedKeys()
  self.justpressed = {}
end

return keyboard
