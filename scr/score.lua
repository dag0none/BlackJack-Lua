function updateScore(_who)
    _who.score[1], _who.score[2] = 0, 0
    for i, card in ipairs(_who.hand) do
        _who.score[1] = _who.score[1] + getValue(card, _who, true)
        _who.score[2] = _who.score[2] + getValue(card, _who, false)
    end
    if _who.score[2] > _who.score[1] and _who.score[2] <= 21 then
        _who.score[1] = _who.score[2]
    end
end

function getValue(_card, _who, _a)
    if _card.value == "k" or _card.value == "q" or _card.value == "j" then
        return 10
    elseif _card.value == "a" then
            if _a == false then
                return 11
            else return 1 end
    else 
        return _card.value 
    end
end

function printScore(_who, _x, _y)
    if _who.score[1] ~= _who.score[2] and _who.score[2] <= 21 then
        love.graphics.print(tostring(_who.score[2]), _x, _y)
    else
        love.graphics.print(tostring(_who.score[1]), _x, _y)
    end
end