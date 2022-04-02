-- written in love by love :) -Surya

--import files for game 
require("player")
require("nuts") --deezzz nuts 

function love.load()
    player:load()
end

function love.update(dt)
    player:update(dt)
end

function love.draw()
    player:draw()
end
