function love.load()
    
end

function love.update(dt)
    
end

function love.draw()
    love.graphics.setBackgroundColor(255,255,255)
    love.graphics.setColor(0,0,255)
    love.graphics.line(0,300,800,300)
    love.graphics.setColor(255,255,0)
    love.graphics.circle("fill",400,150,25,100)
    love.graphics.circle("line",400,450,25,100)
    love.graphics.ellipse("fill",500,350,100,50)
    
    love.graphics.setColor(0,255,0)
    love.graphics.rectangle("line",10,10,100,100)
    love.graphics.polygon("line",{20,20,30,50,50,20})
    love.graphics.setColor(128,250,100)
    love.graphics.arc("line",600,100,50,math.rad(0),math.rad(300),100)
    love.graphics.setColor(255,255,255)
end