function love.load()
  sheet = love.graphics.newImage("assets/images/sheet.png")
  naves = {
    love.graphics.newQuad(211,941,99,75,sheet:getDimensions()),
    love.graphics.newQuad(112,791,112,75,sheet:getDimensions()),
    love.graphics.newQuad(325,739,98,75,sheet:getDimensions())
  }
  selec = 1
end

function love.update(dt)
  
end

function love.draw()
  love.graphics.rectangle("line",300,200,200,200)
  love.graphics.draw(sheet,naves[selec],350,250,0,1.0,1.0)
end

function love.mousepressed(x,y,b)
  if b==1 then
    selec=selec+1
    if selec>3 then
      selec=1
    end
  end
end

function love.mousemoved(x,y,dx,dy)
  
end


function dis_ang(x1,y1,x2,y2)
  return math.sqrt(math.pow(x1-x1,2)+math.pow(y1-y2,2)),math.atan2(y2-y1,x2-x1)
end


