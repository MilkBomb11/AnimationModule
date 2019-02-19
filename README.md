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
