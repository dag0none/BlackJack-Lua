function drawCoin(_coin, _x, _y, _limit)
    -- Take the rest if the coins exceds 20
    local rest = 0
    if _coin > _limit then
        rest = _coin - _limit
        _coin = _limit
    end
    _x = _x - math.ceil(_coin / 5) * 7 -- Decrease the x based on how much stacks do you have
    -- Draw the coins
    for x = 0, _coin - 1 do 
        if x % _coin == _coin - 1 or (x + 1) % 5 == 0 then
            love.graphics.draw(assets.coin_top, _x + math.floor(x/5) * 14, _y - (x % 5 * 2 + 8))
        else
            love.graphics.draw(assets.coin_base, _x + math.floor(x/5) * 14, _y - (x % 5 * 2))
        end
    end
    -- Draw the text coins
    if rest > 0 then
        love.graphics.print("+" .. tostring(rest), _x + math.ceil(_coin / 5) * 14, _y - 8)
    end
end