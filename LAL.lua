local Object = require "classic"
Animation = Object:extend()

function getQuads(initX, initY, columns, rows, quadWidth, quadHeight, sheetWidth, sheetHeight)
  local quads = {}
  local sheetWidth = sheetWidth or columns*quadWidth
  local sheetHeight = sheetHeight or rows*quadHeight

  for currentRow=0,rows-1 do
    for currentColumn=0,columns-1 do
      local x = currentColumn*quadWidth + initX
      local y = currentRow*quadHeight + initY
      table.insert(quads, love.graphics.newQuad(x, y, quadWidth, quadHeight, sheetWidth, sheetHeight))
    end
  end

  return quads
end


function Animation:new(quads, initialFrame, totalFrames, timeBtwFrames)
  self.quads = quads
  self.currentFrame = initialFrame
  self.totalFrames = totalFrames
  self.timeBtwFrames = timeBtwFrames
  self.currentTime = 0
end

function Animation:play(dt)
  if self.currentTime >= self.timeBtwFrames then
    if self.currentFrame == self.totalFrames then
      self.currentFrame = 1
    else
      self.currentFrame = self.currentFrame + 1
    end
    self.currentTime = 0
  else
    self.currentTime = self.currentTime + dt
  end
end

function Animation:draw(spriteSheet, quads, x, y, r, sx, sy, ox, oy, kx, ky)
  local sheet = spriteSheet
  local currentFrame = quads[self.currentFrame]
  local xPos = x
  local yPos = y
  local radian = r or 0
  local scaleX = sx or 1
  local scaleY = sy or 1
  local originOffsetX = ox or 0
  local originOffsetY = oy or 0
  local skewX = kx or 0
  local skewY = ky or 0
  love.graphics.draw(sheet, currentFrame, xPos, yPos, radian, scaleX, scaleY, originOffsetX, originOffsetY, skewX, skewY)
end
