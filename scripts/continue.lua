local C = {}

function Continue()
  function love.draw()
    if xyz == 1 then
      love.graphics.setColor(255, 0, 0)
    elseif xyz == 2 then
      love.graphics.setColor(1.00,0.67,0.00)
    elseif xyz == 3 then
      love.graphics.setColor(1.00,1.00,0.00)
    elseif xyz == 4 then
      love.graphics.setColor(0, 255, 0)
    elseif xyz == 5 then
      love.graphics.setColor(0, 0, 255)
    elseif xyz == 6 then
      love.graphics.setColor(0.50,0.00,0.42)
    end
    love.graphics.circle("fill", button.x, button.y, button.size)
    love.graphics.setFont(myFont)
    love.graphics.setColor(255, 255, 255)
    love.graphics.print("Score: " ..s.score)

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
C.Continue = Continue

return C
