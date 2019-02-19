# AnimationModule
Light-weight animation module


## How to use

### Initializtion
```lua
require "path.to.module"
```

### Create new quad
```lua
quads = getQuads(initX, initY, columns, rows, quadWidth, quadHeight, sheetWidth, sheetHeight)
```
getQuads() is a function that gets quads from a sprite sheet
  - initX, initY is the start positon when generating quads from a sprite sheet
  - columns is the total amount of columns in the part of the sprite sheet you want to make into an animation
  - rows is the total amount of rows in the part of the sprite sheet you want to make into an animation<br>
  **Setting both the columns and rows over 1 will only work properly when total number of frames is an even number.**  
  - quadWidth is the width of a quad
  - quadHeight is the height of a quad
  - sheetWidth is the width of the sprite sheet (when omitted becomes columns * quadWidth)
  - sheetHeight is the height of the sprite sheet (when omitted becomes rows * quadHeight)
  
### Create new animation
```lua
animation = Animation(quads, initialFrame, totalFrames, timeBtwFrames)
```
Animation() is a function that creates an animation
  - quads is a table of quads (Use getQuads())
  - initialFrame is the number of the frame the animation poses when created 
  - totalFrames is the total number of frames
  - timeBtwFrames is the time it takes to change from one frame to the next one

### Play animation
```lua
animation:play(dt)
```

### Draw animation
```lua
animation:draw(spriteSheet, quads, x, y, r, sx, sy, ox, oy, kx, ky)
```
  - spriteSheet is the sprite sheet image
  - quads is a table containing qauds (Use getQauds())
  - x, y is the positon of the animation in world cordinates
  - r is the angle of the animation in radians (when omitted becomes 0)
  - sx, sy is the scale of the animation (when omitted becomes 1, 1)
  - ox, oy is the origin offset for each frame of the animation (when omitted becomes 0, 0)
  - kx, ky is the skew of the animation (when omitted becomes 0)


## Example
```lua
function love.load()
  Object = require "classic" --needs classic and you have to assign it a variable named Object
  require "AnimationClass"   --you can rename the module's name if you want


  love.graphics.setBackgroundColor(1, 1, 1)
  love.graphics.setDefaultFilter("nearest", "nearest") --setting background color and setting filter

  spriteSheet = love.graphics.newImage("SpriteSheet14.png") -- the sprite sheet

  playerQuads = getQuads(0, 0, 1, 4, 32, 32) -- get quads
  playerAnimation = Animation(playerQuads, 1, 4, 1/12) -- create new animation

  angle = 0 --angle variable 

end

function love.update(dt) --do this every frame
  if love.keyboard.isDown("space") then --when space key is pressed
    playerAnimation:play(dt) --play animation
  else
    playerAnimation.currentFrame = 1 --if space key is not pressed, set player animation's current frame to 1
  end
  angle = angle + 10*dt -- for every frame angle increases by 10
end

function love.draw()
  playerAnimation:draw(spriteSheet, playerQuads, love.graphics.getWidth()/2, love.graphics.getHeight()/2, math.rad(angle), 5, 5, 16, 16)
  --love.graphics.draw(spriteSheet, quads[currentFrame], love.graphics.getWidth()/2, love.graphics.getHeight()/2, math.rad(angle), 5, 5, 16, 16) --draw animation at the middle of the screen, its pivot on the center of the animation. Also, rotate the animation
end
```
