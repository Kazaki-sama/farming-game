_G.love = require ('love')

function love.load()
    anim8= require "libraries/anim8.lua"    
    player={}
    player.x=200
    player.y=200
    player.walk=1
    player.image=love.graphics.newImage("char/char.png")
    player.spritesheet=love.graphics.newImage("char/sprite sheet.png")
    player.grid=anim8.newGrid(22,32, player.spritesheet:getWidth(), player.spritesheet:getHeight())

    player.animations= {}
    player.animations.down = anim8.newAnimation(player.grid('1-4',1), 0.2)

    background=love.graphics.newImage("char/bg.png")
end    

function love.update(dt)
    if love.keyboard.isDown("right","d") then
        player.x=player.x+player.walk
    end

    if love.keyboard.isDown("up","w") then
        player.y=player.y-player.walk
    end

    if love.keyboard.isDown("down","s") then
        player.y=player.y+player.walk
    end

    if love.keyboard.isDown("left","a") then
        player.x=player.x-player.walk
    end


    player.animations.down:update(dt)
end

function love.draw()
    love.graphics.draw(background,0,0)
    player.animations.down:draw(player.spritesheet,player.x,player.y)
end