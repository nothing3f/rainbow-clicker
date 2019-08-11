function love.load()
  contents, size = love.filesystem.read("data.json")

  s = {}
  s.score = tonumber(contents)

  if contents == nil then
    s.score = 0
  end

  myFont = love.graphics.newFont(40)

  button = {}
  button.x = 125
  button.y = 125
  button.size = 50

  quit = {}
  quit.text = love.graphics.newText(myFont, "Quit")
  quit.x = 150
  quit.y = 200

  n = {}
  n.text = love.graphics.newText(myFont, " New game")
  n.x = 0
  n.y = 50

  c = {}
  c.text = love.graphics.newText(myFont, "  Continue")
  c.x = 0
  c.y = 100

  newgame = 0

  continue = 0

  --[[purple = 0.50,0.00,0.42
  blue = 0, 0, 255
  green = 0, 255, 0
  yellow = 1.00,1.00,0.00
  orange = 1.00,0.67,0.00
  red = 255, 0, 0]]--

  xyz = 1
end

function love.update(dt)

end

function love.draw()
  local ngame = require "scripts.newgame"
  local cgame = require "scripts.continue"
  love.graphics.setColor(0, 0, 255)
  love.graphics.draw(n.text, n.x, n.y)
  love.graphics.setColor(255, 255, 0)
  love.graphics.draw(c.text, c.x, c.y)
  if newgame == 1 then
    ngame.newGame()
  elseif continue == 1 then
    cgame.Continue()
  end
end

function love.mousepressed(x, y, b, isTouch)
  local distance = require "scripts.distance"
if b == 1 then
    if distance.distanceBetween(button.x, button.y, love.mouse.getX(), love.mouse.getY()) < button.size then
      s.score = s.score + 1
      xyz = math.random(1, 6)
      love.filesystem.write("data.json", s.score)
    end
  end
  if x >= quit.x and x <= quit.x + quit.text:getWidth() and
     y >= quit.y and y <= quit.y + quit.text:getHeight() then
    love.event.quit()
  end
  if x >= n.x and x <= n.x + n.text:getWidth() and
     y >= n.y and y <= n.y + n.text:getHeight() then
    newgame = 1
  end
  if x >= c.x and x <= c.x + c.text:getWidth() and
     y >= c.y and y <= c.y + c.text:getHeight() then
    continue = 1
  end
end
