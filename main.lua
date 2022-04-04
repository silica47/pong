-- Written with LOVE

--import files for game 
require("player")
require("nuts") --deezzz nuts 
require("bot")

function love.load()
    player:load()
    ball:load()
    bot:load()
    score = {player = 0, bot = 0}
    font = love.graphics.newFont(50)
end

function love.update(dt)
    player:update(dt)
    ball:update(dt)
    bot:update(dt)
end

function love.draw()
    player:draw()
    ball:draw()
    bot:draw()
    love.graphics.print("Score: "..score.player, 50,50)
    love.graphics.print("Score: "..score.bot, 1000,50)
end

--checking collision between bodies
function collision(a, b)
    if a.x + a.width > b.x and a.x < b.x + b.width and a.y + a.height > b.y and a.y < b.y + b.height then
        return true --they are colliding 
    else 
        return false --they aren't colliding 
    end
end
