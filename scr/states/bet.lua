Bet = {}

function Bet:enter()
    buttonsBET = {
        createButton(56, 55, assets.plus, function() if coins > 0 then bet = bet + 1 coins = coins - 1 end end),
        createButton(64, 55, assets.minus, function() if bet > 0 then bet = bet - 1 coins = coins + 1 end end)
    }
end

function Bet:update(dt)
    updateButton()
end


function Bet:draw()
    love.graphics.printf("place your bet", 0, 15, 128, "center")
    drawCoin(coins, 64, 101)
    drawButton()
end