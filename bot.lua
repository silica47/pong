bot = {}

function bot:load()
    --dimensions of opponent brick
    self.width = 15
    self.height = 50
    self.x = love.graphics.getWidth() - self.width - 50
    self.y = love.graphics.getHeight() / 2
    self.yVelocity = 0
    self.speed = 500

    --variables for delay
    self.timer = 0
    self.rate = 0.5 
end

function bot:update(dt)
    --for moving the brick
    bot:move(dt)
    --for delay
    self.timer = self.timer + dt
    if self.timer > self.rate then
        self.timer = 0
        self:logic()
    end
    --the acutal logic
    bot:logic()
end

function bot:move(dt)
    self.y = self.y + self.yVelocity * dt
end

--logic for bot
function bot:logic()
    if ball.y + ball.height < self.y then
        self.yVelocity = -self.speed
    elseif ball.y > self.y + self.height then
        self.yVelocity = self.speed
    else
        self.yVelocity = 0
    end
end

function bot:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end