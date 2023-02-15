function love.load()
  nave = love.graphics.newImage("assets/images/nave.png")
  laserImg = love.graphics.newImage("assets/images/laser.png")
  distancia = 0
  rotacion = 0
  laser = {
    x = 400,
    y = 300,
    angulo = 0,
    rotacion = 0,
    disparo = false,
    distancia = 0,
    dx = 0,
    dy = 0
  }
  musica_fondo = love.audio.newSource("assets/sounds/heroic.mp3","stream")
  musica_fondo:play()
end

function love.update(dt)
  if not musica_fondo:isPlaying() then
    musica_fondo:play()
  end
  if laser.disparo then
    laser.rotacion = laser.rotacion+dt*15
    if laser.rotacion>10 then
      laser.rotacion = 0
    end
    laser.distancia, laser.angulo = dis_ang(laser.x,laser.y,laser.dx,laser.dy)
    laser.x= laser.x+(math.cos(laser.angulo)*dt*500)
    laser.y= laser.y+(math.sin(laser.angulo)*dt*500)
    if laser.distancia<10 then
      laser.disparo = false
    end
  end
end

function love.draw()
  if laser.disparo then
    love.graphics.draw(laserImg,laser.x,laser.y,laser.rotacion,0.5,0.5,laserImg:getWidth()/2,laserImg:getHeight()/2)
  end
  love.graphics.draw(nave,400,300,rotacion,0.5,0.5,nave:getWidth()/2,nave:getHeight()/2)
  
end

function love.keyreleased(k)
  if k=="c" then
    musica_fondo:stop()
    musica_fondo=love.audio.newSource("assets/sounds/epic.mp3","stream")
    musica_fondo:play()
  end
end

function love.mousepressed(x,y,b)
  if not laser.disparo and b==1 then
    local sonido_laser = love.audio.newSource("assets/sounds/laser.mp3","static")
    laser.disparo = true
    laser.x=400
    laser.y=300
    laser.dx = x
    laser.dy = y
    laser.distancia, laser.angulo = dis_ang(400,300,x,y)
    sonido_laser:play()
  end
end

function love.mousemoved(x,y,dx,dy)
  distancia, rotacion = dis_ang(400,300,x,y)
end


function dis_ang(x1,y1,x2,y2)
  return math.sqrt(math.pow(x1-x1,2)+math.pow(y1-y2,2)),math.atan2(y2-y1,x2-x1)
end


