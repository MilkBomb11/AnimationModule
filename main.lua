function love.load()
  Object = require "classic"
  require "AnimationClass"


  love.graphics.setBackgroundColor(1, 1, 1)
  love.graphics.setDefaultFilter("nearest", "nearest")

  spriteSheet = love.graphics.newImage("SpriteSheet14.png")

  playerQuads = getQuads(0, 0, 1, 4, 32, 32)
  playerAnimation = Animation(playerQuads, 1, 4, 1/12)

  angle = 0

end

function love.update(dt)
  if love.keyboard.isDown("space") then
    playerAnimation:play(dt)
  else
    playerAnimation.currentFrame = 1
  end
  angle = angle + 10*dt
end

function love.draw()
  playerAnimation:draw(spriteSheet, playerQuads, love.graphics.getWidth()/2, love.graphics.getHeight()/2, math.rad(angle), 5, 5, 16, 16)
  --love.graphics.draw(spriteSheet, quads[currentFrame], love.graphics.getWidth()/2, love.graphics.getHeight()/2, math.rad(angle), 5, 5, 16, 16)
end
