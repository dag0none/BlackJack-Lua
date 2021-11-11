Result = {}

function Result:enter() 
    buttonsRESULT = {
        createButton(61, 66, assets.arrow, function() GameState.switch(Bet) end)
    }

    resultText = ""
    checkResult()
end

function Result:update(dt)  
    updateButton(buttonsRESULT)
end

function Result:draw()
    love.graphics.printf("dealer's hand", 1, 12, 127, "center")
    love.graphics.printf(resultText, 1, 58, 127, "center")
    printScore(player, 93, 88)
    if drawFase == true then
        love.graphics.draw(assets.card_back, 38, 22)
        love.graphics.print("?", 93, 33)
    else 
        printScore(dealer, 93, 33)
    end

    drawCards(dealer.hand, 38, 22)
    drawCards(player.hand, 38, 76)

    if drawFase == true then
        love.graphics.draw(assets.card_back, 38, 22)
    end

    drawButton(buttonsRESULT)
end

function checkResult()
    if player.score[1] > 21 then
        bet = 0
        resultText = "you burst"
    elseif dealer.score[1] > 21 then
        coins = coins + bet * 2
        bet = 0
        resultText = "dealer burst"
    elseif player.score[1] < dealer.score[1] then
        bet = 0
        resultText = "dealer wins"
    elseif player.score[1] > dealer.score[1] then
        coins = coins + bet * 2
        bet = 0
        resultText = "player wins"
    else
        resultText = "tie"
    end
end