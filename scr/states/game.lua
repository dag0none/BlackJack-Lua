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
        createButton(64, 62, assets.minus, function() drawFase = false end)
    }

    drawFase = true
end

function Game:update(dt)
    if drawFase == true then
        updateButton(buttonsGAME)
    end
    getScore(player)
    getScore(dealer)
end

function Game:draw()    
    love.graphics.print("bet", 11, 81)
    love.graphics.printf("dealer's hand", 1, 12, 127, "center")
    printScore(player, 93, 88)
    drawCoin(bet, 17, 104, 5)

    drawCards(dealer.hand, 38, 22)
    drawCards(player.hand, 38, 76)

    if drawFase == true then
        love.graphics.draw(assets.card_back, 38, 22)
        drawButton(buttonsGAME)
    end
end 

