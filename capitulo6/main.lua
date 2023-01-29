function love.load()
  nave= love.graphics.newImage("assets/images/nave.png")
end

function love.update(dt)
  
end

function love.draw()
  love.graphics.line(0,300,800,300)
  love.graphics.line(400,0,400,600)
  love.graphics.draw(nave,400,300,0,0.25,0.25,nave:getWidth()/2,nave:getHeight()/2)
end

function love.mousepressed(x,y,b)
  
end