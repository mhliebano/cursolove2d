function love.load()
  nave= love.graphics.newImage("assets/images/nave.png")
  laserimg= love.graphics.newImage("assets/images/laser.png")
  rotacion= 0
  distancia =0 
  laser ={ 
    x         = 400,
    y         = 300,
    angulo    = 0,
    rotacion  = 0,
    disparo   = false,
    distancia = 0,
    dx  = 0,
    dy  = 0 
  }
end

function love.update(dt)
  if laser.disparo then
    laser.rotacion = laser.rotacion + dt*10
    laser.distancia,laser.angulo = dis_ang(laser.x,laser.y,laser.dx,laser.dy)
    laser.x=laser.x+(math.cos(laser.angulo))*dt*300
    laser.y=laser.y+(math.sin(laser.angulo))*dt*300
    if laser.distancia<10 then
      laser.disparo = false
    end
    if laser.rotacion>10 then
      laser.rotacion = 0
    end
  end
end

function love.draw()
  love.graphics.line(0,300,800,300)
  love.graphics.line(400,0,400,600)
  
  if laser.disparo then
    love.graphics.draw(laserimg,laser.x,laser.y,laser.rotacion,0.5,0.5,laserimg:getWidth()/2,laserimg:getHeight()/2)
  end
  love.graphics.draw(nave,400,300,rotacion,1.0,1.0,nave:getWidth()/2,nave:getHeight()/2)
  
  love.graphics.print(rotacion,2,100)
  love.graphics.print(distancia,2,150)
end

function love.mousepressed(x,y,b)
  if not laser.disparo then
    laser.disparo = true
    laser.x=400
    laser.y=300
    laser.dx =x
    laser.dy=y
    laser.distancia,laser.angulo = dis_ang(400,300,x,y)
  end
end

function love.mousemoved(x,y,dx,dy)
  distancia,rotacion = dis_ang(400,300,x,y)
end

function dis_ang(x1,y1,x2,y2)
  return math.sqrt( math.pow( (x1-x2),2 ) + math.pow( (y1-y2),2 ) ), math.atan2(y2-y1,x2-x1)
end
