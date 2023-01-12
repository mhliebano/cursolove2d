function love.load()
  fontRoboto = love.graphics.newFont("assets/fonts/Roboto-Black.ttf")
  fontTech = love.graphics.newFont("assets/fonts/techniqo.ttf")
  --love.graphics.setFont(fontRoboto)
  marquesina={x=-150}
  opacidad = 0
end

function love.update(dt)
  marquesina.x = marquesina.x +dt*100
  if marquesina.x>1000 then
    marquesina.x=-150
  end
  opacidad = opacidad+dt/10
  if opacidad>1 then
    opacidad=1.0
  end
end

function love.draw()
  love.graphics.setFont(fontRoboto)
  love.graphics.print({{1,0,0},"Hola Love2d con roboto"},marquesina.x,50,0,2.0,2.0)
  
  love.graphics.setFont(fontTech)
  love.graphics.print({{0,1,0,opacidad},"Hola Love2d con Techniqo"},50,150,0,1.5,1.5)
  
end

function love.mousepressed(x,y,b)
  if b==1 then
    opacidad=0.0
  end
end