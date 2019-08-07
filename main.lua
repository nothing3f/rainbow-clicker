function love.load()
  button = {}
  button.x = 125
  button.y = 125
  button.size = 50

  score = 0
  timer = 0

  myFont = love.graphics.newFont(40)
end

function love.update(dt)

end

function love.draw()
  love.graphics.setColor(255, 0, 0)
  love.graphics.circle("fill", button.x, button.y, button.size)

  love.graphics.setFont(myFont)
  love.graphics.setColor(255, 255, 255)
  love.graphics.print("Score: " ..score)

  if score == 9999 then
    function love.draw()
      love.graphics.setColor(124, 252, 0)
      love.graphics.print("You win!!!", 25, 100)
    end
  end
end

function love.mousepressed(x, y, b, isTouch)
  if b == 1 then
    if distanceBetween(button.x, button.y, love.mouse.getX(), love.mouse.getY()) < button.size then
      score = score + 1
    end
  end
end

function distanceBetween(x1, y1, x2, y2)
  return math.sqrt((y2 - y1)^2 + (x2 - x1)^2)
end
