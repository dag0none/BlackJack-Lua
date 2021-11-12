Menu = {}

function Menu:enter()
    a = 1
end

function Menu:update(dt)
    a = a + dt * 5
    if mousePressed == 1 then
        GameState.switch(Bet)
    end
end

function Menu:draw()
    love.graphics.draw(assets.logo, 12, 30)
    love.graphics.setColor(1, 1, 1, math.sin(a))
    love.graphics.printf("press x", 0, 85, 128, "center")
    love.graphics.setColor(1, 1, 1)
end