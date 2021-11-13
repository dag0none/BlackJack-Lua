Bet = {}

function Bet:enter()
    buttonsBET = {
        createButton(51, 55, assets.plus, function() if #coins > 0 then moveCoin(coins, bet) end end),
        createButton(58, 55, assets.minus, function() if #bet > 0 then moveCoin(bet, coins) end end),
        createButton(65, 55, assets.half, function() if #coins > 0 then for i = 0, math.floor(#coins/2 - 1) do moveCoin(coins, bet) end end end),
        createButton(72, 55, assets.all, function() if #coins > 0 then for i = 0, (#coins - 1) do moveCoin(coins, bet) end end end),
        createButton(61, 68, assets.arrow, function() if #bet > 0 then GameState.switch(Game) end end)
    }

    buttonRESTART = {
        createButton(60, 60, assets.restart, function() coins = instantiateCoins(5, 128/2, 140) GameState.switch(Menu) end)
    }

    te1 = -20
    te2 = 150
    te3 = -20
    coP = 150
end

function Bet:update(dt)
    updateButton(buttonsBET)
    if #coins <= 0 and #bet == 0 then
        updateButton(buttonRESTART)
    end
    updateCoin(coins)
    updateCoin(bet)
    coP = smoothApproach(coP, 101, 0.2)
    te1 = smoothApproach(te1, 15, 0.2)
    te2 = smoothApproach(te2, 113, 0.2)
    te3 = smoothApproach(te3, 50, 0.2)
end


function Bet:draw()
    if #coins <= 0 and #bet == 0 then
        love.graphics.printf("no coins left, you lose", 0, te3, 128, "center")
        drawButton(buttonRESTART)
    else
        love.graphics.printf("place your bet", 0, te1, 128, "center")
        love.graphics.printf("player's hand", 0, te2, 128, "center")
        drawCoin(coins, 64, coP, 20)
        drawCoin(bet, 64, 47, 20)
        drawButton(buttonsBET)
    end
end