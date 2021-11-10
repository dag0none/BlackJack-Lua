Bet = {}

function Bet:enter()
    buttonsBET = {
        createButton(56, 55, assets.plus, function() if coins > 0 then bet = bet + 1 coins = coins - 1 end end),
        createButton(64, 55, assets.minus, function() if bet > 0 then bet = bet - 1 coins = coins + 1 end end),
        createButton(61, 68, assets.arrow, function() if bet > 0 then GameState.switch(Game) end end)
    }
end

function Bet:update(dt)
    updateButton(buttonsBET)
end


function Bet:draw()
    love.graphics.printf("place your bet", 0, 15, 128, "center")
    drawCoin(coins, 64, 101, 20)
    drawCoin(bet, 64, 47, 20)
    drawButton(buttonsBET)
end