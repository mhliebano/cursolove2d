function love.load()
   mX=400
   mY=300
   esVisible = false
   circulos = {}
   radio = 0
end

function love.update(dt)
    if love.mouse.isDown(1) then
        radio = radio + 1
    end
    if love.mouse.isDown(2) then
        radio = radio - 1
    end
end

function love.draw()
    love.graphics.setBackgroundColor(0.5,0.5,0.3)
    love.graphics.line(0,300,800,300)
    love.graphics.line(400,0,400,800)
    love.graphics.print(mX..","..mY,50,50)
    if esVisible then
        love.graphics.circle("fill",400,300,25,100)
    end
    for i,circulo in ipairs(circulos) do 
        love.graphics.circle("line",circulo.x,circulo.y,circulo.r,100)
    end
    love.graphics.arc("fill",600,100,30,math.rad(0),math.rad(radio),100)
end

function love.mousemoved(x,y,dx,dy, touch)
    mX = x
    mY = y
end

function love.mousepressed(x,y,button,istouch,presses)
    if button == 1 then
        esVisible = true
    end
    if presses == 2 then
        table.insert( circulos,{x=x,y=y,r=15})
    end
    if presses == 3 then
        table.insert( circulos,{x=x,y=y,r=25})
    end
end

function love.mousereleased(x,y,button,istouch,presses)
    if button == 1 then
        esVisible = false
    end
end