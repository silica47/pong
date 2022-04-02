player = {

}

function player:load()
    --dimensions of the player brick 
    self.x = 40
    self.y = love.graphics.getHeight()/2
    self.width = 15
    self.height = 50
    self.speed = 550
end

function player:update(dt)
    --keyboard
    if love.keyboard.isDown("up") then
        self.y = self.y - self.speed*dt
    elseif love.keyboard.isDown("down") then
        self.y = self.y + self.speed*dt
    end

    --ensure player doesn't get out of the window
    if self.y < 0 then
        self.y = 0
    elseif self.y+self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
    end
end

function player:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end