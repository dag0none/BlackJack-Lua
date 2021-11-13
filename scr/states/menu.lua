Menu = {}

function Menu:enter()
    a = 1
    loY = -20
    teY = 130
end

function Menu:update(dt)
    a = a + dt * 5
    if mousePressed == 1 then
        GameState.switch(Bet)
    end
    loY = smoothApproach(loY, 30, 0.2)
    teY = smoothApproach(teY, 85, 0.2)
end

function Menu:draw()
    love.graphics.draw(assets.logo, 12, loY)
    love.graphics.setColor(1, 1, 1, math.sin(a))
    love.graphics.printf("press x", 0, teY, 128, "center")
    love.graphics.setColor(1, 1, 1)
end