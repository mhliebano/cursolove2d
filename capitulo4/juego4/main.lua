function love.load()
    math.randomseed(os.time())
    heroe={x=400,y=300,vidas=3,puntos=0}
    bomba={x=0,y=0,cantidad=3,visible=false}
    power={x=math.random( 10,780),y=math.random( 10,580)}
    enemigos={}
    for i=1,5 do
        table.insert( enemigos,{x=math.random( 10,780),y=math.random( 10,580),r=10})
    end
    segundos=0
    conteo=0
    pausa=false
    fin =false
 end
 
 function love.update(dt)
    if fin then
        return
    end
    if pausa then
        return
    end
    segundos = segundos+dt
    if segundos>5 then
        segundos=0
        conteo=conteo + 1
        if conteo>6 then
            for i=1,5 do
                table.insert( enemigos,{x=math.random( 10,780),y=math.random( 10,580),r=10})
            end
            conteo=0
        end
    end
    if love.keyboard.isDown("a") then
        heroe.x=heroe.x-50*dt
    end
    if love.keyboard.isDown("d") then
        heroe.x=heroe.x+50*dt
    end
    if love.keyboard.isDown("w") then
        heroe.y=heroe.y-50*dt
    end
    if love.keyboard.isDown("s") then
        heroe.y=heroe.y+50*dt
    end

    for i,e in ipairs(enemigos) do
        if segundos==0 then
            e.r=e.r+2
        end
        if distancia({x=heroe.x,y=heroe.y},{x=e.x,y=e.y})-(e.r+10)<1 then
            table.remove( enemigos,i )
            heroe.vidas=heroe.vidas-1
            heroe.puntos=heroe.puntos+1000
            if heroe.vidas==0 then
                fin=true
            end
        end
        if bomba.visible then
            if distancia({x=bomba.x,y=bomba.y},{x=e.x,y=e.y})-(e.r+10)<1 then
                table.remove( enemigos,i )
                heroe.puntos=heroe.puntos+500
                bomba.visible=false
            end
        end
    end

    if distancia({x=heroe.x,y=heroe.y},{x=power.x,y=power.y})-(15)<1 then
        power={x=math.random( 10,780),y=math.random( 10,580)}
        heroe.puntos=heroe.puntos+100
    end
 end

 function distancia (p1,p2)
    return math.sqrt( math.pow(p1.x-p2.x,2) + math.pow(p1.y-p2.y,2))
 end

 function love.draw()
    if fin then
        love.graphics.print("F I N   D E L   J U E G O",200,300)
        love.graphics.setColor(1,0,0,0.5)
        love.graphics.rectangle("fill",0,0,800,600)
    end
    love.graphics.print(heroe.puntos,400,20)
    --heroe vidas
    for i=1,heroe.vidas do
        love.graphics.setColor(1,0,0)
        love.graphics.rectangle("fill",(i*25)+10,10,10,20)
        love.graphics.setColor(1,1,1)
    end
    --bombas cantidad
    for i=1,bomba.cantidad do
        love.graphics.setColor(1,1,0)
        love.graphics.rectangle("fill",(i*25)+650,10,10,20)
        love.graphics.setColor(1,1,1)
    end
    --heroe
    love.graphics.circle("fill",heroe.x,heroe.y,10,100)
    --bomba
    if bomba.visible then
        love.graphics.setColor(1,1,0)
        love.graphics.circle("fill",bomba.x,bomba.y,10,100)
        love.graphics.setColor(1,1,1)
    end
    --power
    love.graphics.setColor(0,1,0)
    love.graphics.circle("fill",power.x,power.y,5,100)
    love.graphics.setColor(1,1,1)
    --enemigos
    for i,e in ipairs(enemigos) do
        love.graphics.setColor(1,0,0)
        love.graphics.circle("line",e.x,e.y,e.r,100)
        love.graphics.setColor(1,1,1)
    end
 end
 
 function love.mousemoved(x,y,boton)
 
 end
 
 function love.mousepressed(x,y,boton,touch,presses)
    if boton==1 and bomba.visible==false then
        bomba.x=heroe.x
        bomba.y=heroe.y
        bomba.visible=true
        bomba.cantidad=bomba.cantidad-1
    end
    if boton==2 and bomba.visible==true then
        bomba.visible=false
        bomba.cantidad=bomba.cantidad+1
    end

 end
 
 
 function love.mousereleased(x,y,boton)
     
 end
 
 function love.keyreleased(tecla)
    if tecla == "p" then
        if pausa then
            pausa=false
        else
            pausa=true
        end
    end
 end