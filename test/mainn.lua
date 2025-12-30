
function love.load()
   printx = 0
   printy = 0
end

function love.draw()
   love.graphics.print("Text", printx, printy)
end

function love.mousepressed(x, y, button, istouch)
   if button == 1 then -- Versions prior to 0.10.0 use the MouseConstant 'l'
      printx = x
      printy = y
   end
end