Ball = Class{}

-- Initialise function for ball object --
function Ball:init(x, y, width, height)
	self.x = x
	self.y = y
	self.width = width
	self.height = height
	self.dy = math.random(2) == 1 and 75 or -75
	self.dx = math.random(-100, 100)
end

-- Function to reset ball to centre of pong screen --
function Ball:reset()
	self.x = VIRTUAL_WIDTH / 2 - 2
	self.y = VIRTUAL_HEIGHT / 2 + 10
	self.dy = math.random(2) == 1 and 75 or -75 --giving ball a random angle
	self.dx = math.random(-100, 100) --giving ball a random speed
end

-- Collision function to check if ball collied with a paddle --
function Ball:collides(paddle)
	if self.x > paddle.x + paddle.width or paddle.x > self.x + self.width then
        return false
    end
	if self.y > paddle.y + paddle.height or paddle.y > self.y + self.height then
        return false
    end
	return true
end

-- Function that updates position of the ball based on delta time --
function Ball:update(dt)
	self.x = self.x + self.dx * dt
	self.y = self.y + self.dy * dt
end

-- Function to render ball onto the screen --
function Ball:render()
	love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end
