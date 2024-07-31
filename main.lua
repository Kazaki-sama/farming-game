_G.love = require ('love')

function love.load()
    anim8= require 'libraries.anim8.anim8'
    love.graphics.setDefaultFilter("nearest","nearest")
    player={}
    player.x=200
    player.y=200
    player.walk=4
    player.image=love.graphics.newImage("char/char.png")
    player.spriteSheet=love.graphics.newImage("char/sprite sheet.png")
    player.grid=anim8.newGrid(24,32, player.spriteSheet:getWidth(), player.spriteSheet:getHeight())

    player.animations= {}
    player.animations.down = anim8.newAnimation(player.grid('1-4',1), 0.2)
    player.animations.up = anim8.newAnimation(player.grid('1-4',3), 0.2)
    player.animations.left = anim8.newAnimation(player.grid('1-4',4), 0.2)
    player.animations.right = anim8.newAnimation(player.grid('1-4',2), 0.2)
    player.anim=player.animations.down
    background=love.graphics.newImage("char/bg.png")
end

function love.update(dt)
    local isMoving=false
    
    if love.keyboard.isDown("right","d") then
        player.x=player.x+player.walk
        player.anim=player.animations.right
        isMoving=true
    end

    if love.keyboard.isDown("up","w") then
        player.y=player.y-player.walk
        player.anim=player.animations.up
        isMoving=true
    end

    if love.keyboard.isDown("down","s") then
        player.y=player.y+player.walk
        player.anim=player.animations.down
        isMoving=true
    end

    if love.keyboard.isDown("left","a") then
        player.x=player.x-player.walk
        player.anim=player.animations.left
        isMoving=true
    
    end

    if isMoving ==false then
        player.anim:gotoFrame(2)
    end

    player.anim:update(dt)
    
end

function love.draw()
    love.graphics.draw(background,0,0)
    player.anim:draw(player.spriteSheet,player.x,player.y,nil , 5)
end