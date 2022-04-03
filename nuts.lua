ball = {}

function ball:load()
    --dimension of the ball
    self.x = love.graphics.getWidth()/2
    self.y = love.graphics.getHeight()/2
    self.width = 10
    self.height = 10
    self.speed = 250
    self.xVelocity = -self.speed
    self.yVelocity = 0
end

function ball:update(dt)
    -- physics of the ball
    self.x = self.x + self.xVelocity*dt
    self.y = self.y + self.yVelocity*dt

    --checking collison
    self:collide()
end

function ball:collide()
    --checks collision for player 
    if collision(self, player) then
        self.xVelocity = self.speed
        local middle_ball = self.y + self.height/2 --middle point of the ball
        local middle_player = player.y + player.height/2 --middle point of the player
        local collision_position = middle_ball - middle_player 
        self.yVelocity = collision_position * 7
    end

    --check colision for bot
    if collision(self, bot) then
        self.xVelocity = -self.speed
        local middle_ball = self.y + self.height/2 --middle point of the ball
        local middle_bot = bot.y + bot.height/2 --middle point of the player
        local collision_position = middle_ball - middle_bot
        self.yVelocity = collision_position * 7
    end

    --ensures ball doesn't leave the window
    if self.y < 0 then
        self.y = 0
        self.yVelocity = -self.yVelocity
    elseif self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
        self.yVelocity = -self.yVelocity
    end

    --put ball to the middle after someone score
    if self.x < 0 then
        self.x = love.graphics.getWidth() / 2 - self.width / 2
        self.y = love.graphics.getHeight() / 2 - self.height / 2
        self.yVelocity = 0
        self.xVelocity = self.speed
    end

    if self.x + self.width > love.graphics.getWidth() then
        self.x = love.graphics.getWidth() /2 - self.width / 2
        self.y = love.graphics.getHeight() / 2 - self.height / 2
        self.yVelocity = 0
        self.xVelocity = -self.speed
    end
end

function ball:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end