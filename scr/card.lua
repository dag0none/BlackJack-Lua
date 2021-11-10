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
        value = _value
    }
    return this
end

function buyCard(_who)
    local s = love.math.random(#cards)
    local v = love.math.random(#cards[s])
    local card = cards[s][v]
    table.insert(_who.hand, card)
    table.remove(cards[s], v)
end

function drawCards(_who, _x, _y)
    for i, card in ipairs(_who) do
        gap = (i - 1) * (26 / (#_who - 1))
        love.graphics.draw(assets.card_front, _x + gap, _y)
        love.graphics.print(tostring(card.value), _x + 3 + gap, _y + 3)
        love.graphics.print(tostring(card.suit), _x + 3 + gap, _y + 9)
    end
end
