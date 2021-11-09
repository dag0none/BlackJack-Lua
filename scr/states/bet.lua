bet = {}

function bet:enter()
end

function bet:update(dt)
    
end

function bet:draw()
    love.graphics.printf("place your bet", 0, 15, 128, "center")
    love.graphics.printf("player's hand", 0, 113, 128, "center")
end