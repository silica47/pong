-- written in love by love :) -Surya

--import files for game 
require("player")
require("nuts") --deezzz nuts 

function love.load()
    player:load()
    ball:load()
end

function love.update(dt)
    player:update(dt)
    ball:update(dt)
end

function love.draw()
    player:draw()
    ball:draw()
end

--checking collision between bodies
function collision(a, b)
    if a.x + a.width > b.x and a.x < b.x + b.width and a.y + a.height > b.y and a.y < b.y + b.height then
        return true --they are colliding 
    else 
        return false --they aren't colliding 
    end
end
