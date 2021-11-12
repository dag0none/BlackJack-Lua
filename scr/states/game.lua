Game = {}

function Game:enter()
    loadCards()

    player = {
        hand = {},
        score = {
            0,
            0
        }
    }
    dealer = {
        hand = {},
        score = {
            0,  
            0
        }
    }

    buyCard(dealer)
    buyCard(dealer)
    buyCard(player)
    buyCard(player)

    buttonsGAME = {
        createButton(56, 62, assets.plus, function() buyCard(player) end),
        createButton(64, 62, assets.minus, function() drawFase = false end),
    }

    drawFase = true
    t = 0
end

function Game:update(dt)
    updateScore(player)
    updateScore(dealer)
    
    if drawFase == true then
        updateButton(buttonsGAME)
    else
        if dealer.score[1] < 17 then
             t = t + dt
             if t > 0.7 then
                 buyCard(dealer)
                 t = 0
             end
        else
            GameState.switch(Result) 
        end
    end
    

    if player.score[1] > 21 then
        GameState.switch(Result)
    end
end

function Game:draw()    
    love.graphics.print("bet", 10, 81)
    love.graphics.printf("dealer's hand", 1, 12, 127, "center")
    love.graphics.printf("player's hand", 0, 113, 128, "center")
    printScore(player, 93, 88)
    drawCoin(bet, 16, 104, 5)

    drawCards(dealer.hand, 38, 22)
    drawCards(player.hand, 38, 76)

    if drawFase == true then
        love.graphics.draw(assets.card_back, 38, 22)
        drawButton(buttonsGAME)
        love.graphics.print("?", 93, 33)
    else 
        printScore(dealer, 93, 33)
    end
end 
