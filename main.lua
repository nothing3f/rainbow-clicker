function love.load()
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

  score = 9990

  newgame = 0

  continue = 0
end

function love.update(dt)

end

function love.draw()
  love.graphics.setColor(0, 0, 255)
  love.graphics.draw(n.text, n.x, n.y)
  love.graphics.setColor(255, 255, 0)
  love.graphics.draw(c.text, c.x, c.y)
  if newgame == 1 then
    function love.draw()
      love.graphics.setColor(255, 0, 0)
      love.graphics.circle("fill", button.x, button.y, button.size)
      love.graphics.setFont(myFont)
      love.graphics.setColor(255, 255, 255)
      love.graphics.print("Score: " ..score)

      if score == 9999 then
        function love.draw()
          love.graphics.setColor(0, 255, 0)
          love.graphics.print("You win!!!", 25, 100)
          love.graphics.setColor(255, 0, 0)
          love.graphics.draw(quit.text, quit.x, quit.y)
        end
      end
    end
  end
end

function love.mousepressed(x, y, b, isTouch)
  if b == 1 then
    if distanceBetween(button.x, button.y, love.mouse.getX(), love.mouse.getY()) < button.size then
      score = score + 1
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

function distanceBetween(x1, y1, x2, y2)
  return math.sqrt((y2 - y1)^2 + (x2 - x1)^2)
end
