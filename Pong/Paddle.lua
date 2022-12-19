Paddle = Class{}

-- Initialise function for paddle object --
function Paddle:init(x, y, width, height)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.dy = 27
end

-- Function that updates position of the paddle based on delta time --
function Paddle:update(dt)
    if self.dy < 27 then
        self.y = math.max(27, self.y + self.dy * dt)
    else
        self.y = math.min(VIRTUAL_HEIGHT - 22, self.y + self.dy * dt)
    end
end

-- Function to render paddle onto the screen --
function Paddle:render()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end
