function loadCards()
    cards = {}
    suits = {"heart","spade","club","diamond"}
    values = {"a","2","3","4","5","6","7","8","9","10","j","q","k"}

    for i, suit in ipairs(suits) do
        cards[i] = {}
        for j, value in ipairs(values) do
            cards[i][j] = createCard(suit, value)
        end
    end
end

function createCard(_suit, _value)
    local this = {
        suit = _suit,
        value = _value,
        y = 0,
        x = 140,
        xTo = 0,
        yTo = 0
    }
    return this
end

function buyCard(_who)
    sound.card:stop()
    sound.card:play()
    local s = love.math.random(#cards)
    local v = love.math.random(#cards[s])
    local card = cards[s][v]
    table.insert(_who.hand, card)
    table.remove(cards[s], v)
end

function updateCards(_who)
    for i, card in ipairs(_who) do
        card.x = smoothApproach(card.x, card.xTo, 0.2)
    end
end

function drawCards(_who, _x, _y)
    for i, card in ipairs(_who) do
        gap = (i - 1) * (26 / (#_who - 1))
        card.xTo = _x + gap
        love.graphics.draw(assets.card_front, card.x, _y)
        love.graphics.draw(assets[card.suit], card.x + 9, _y + 13)
        love.graphics.print(tostring(card.value), card.x + 3, _y + 3)
    end
end