Bet = {}

function Bet:enter()
    buttonsBET = {
        createButton(53, 55, assets.plus, function() if coins > 0 then bet = bet + 1 coins = coins - 1 sound.coin:stop() sound.coin:play() end end),
        createButton(61, 55, assets.minus, function() if bet > 0 then bet = bet - 1 coins = coins + 1 sound.coin:stop() sound.coin:play() end end),
        createButton(69, 55, assets.all, function() bet = bet + coins coins = 0 sound.coin:play() end),
        createButton(61, 68, assets.arrow, function() if bet > 0 then GameState.switch(Game) end end)
    }

    buttonRESTART = {
        createButton(60, 60, assets.restart, function() coins = 5 end)
    }
end

function Bet:update(dt)
    updateButton(buttonsBET)
    if coins <= 0 and bet == 0 then
        updateButton(buttonRESTART)
    end
end


function Bet:draw()
    if coins <= 0 and bet == 0 then
        love.graphics.printf("no coins left, you lose", 0, 50, 128, "center")
        drawButton(buttonRESTART)
    else
        love.graphics.printf("place your bet", 0, 15, 128, "center")
        love.graphics.printf("player's hand", 0, 113, 128, "center")
        drawCoin(coins, 64, 101, 20)
        drawCoin(bet, 64, 47, 20)
        drawButton(buttonsBET)
    end
end