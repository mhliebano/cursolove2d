function love.load()
   cuadroX=350
   cuadroY=250
   teclapulsada=""
end

function love.update(dt)
    if love.keyboard.isDown("a") then
        cuadroX=cuadroX+1
        if cuadroX>800 then
            cuadroX=0
        end
    end
    if love.keyboard.isDown("s") then
        cuadroY=cuadroY+1
        if cuadroY>600 then
            cuadroY=0
        end
    end
end

function love.draw()
    love.graphics.setBackgroundColor(0,0,1,0.5)
    love.graphics.rectangle("fill",cuadroX,cuadroY,100,100)
    love.graphics.print("tecla pulsada: "..teclapulsada,50,30)
end

function love.keypressed(key)
    teclapulsada=key
    
    if key=="i" then
        cuadroX=150
    end
    if key=="d" then
        cuadroX=550
    end
    
end

function love.keyreleased(key)
    if key=="i" then
        cuadroX=350
    end
end