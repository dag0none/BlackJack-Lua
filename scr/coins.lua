--[[function drawCoin(_coin, _x, _y, _limit)
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
            _Y = _y - (x % 5 * 2 + 8)
            love.graphics.draw(assets.coin_top, _x + math.floor(x/5) * 14, _Y)
        else
            _Y = _y - (x % 5 * 2)
            love.graphics.draw(assets.coin_base, _x + math.floor(x/5) * 14, _Y)
        end
    end
    -- Draw the text coins
    if rest > 0 then
        love.graphics.print("+" .. tostring(rest), _x + math.ceil(_coin / 5) * 14, _y - 8)
    end
end]]

function createCoin(_x, _y)
    if _x == nil then
        _x = 0
    end
    if _y == nil then
        _y = 0
    end
    local this = {spr = 0, x = _x, y = _y, xTo = 0, yTo = 0}
    return this
end

function instantiateCoins(_value, _x, _y)
    local coins = {}
    for i = 0, (_value - 1) do
        table.insert(coins, createCoin(_x, _y))
    end
    return coins
end

function updateCoin(_tbl)
    for i, coin in pairs(_tbl) do
        coin.x = smoothApproach(coin.x, coin.xTo, 0.1)
        coin.y = smoothApproach(coin.y, coin.yTo, 0.1)
    end
end

function drawCoin(_coin, _x, _y, _limit)
    -- Take the rest if the coins exceds 20
    local rest = 0
    if #_coin > _limit then
        rest = #_coin - _limit
    end

    -- Draw the coins
    if #_coin < _limit then
        _x = _x - math.ceil(#_coin / 5) * 7 -- Decrease the x based on how much stacks do you have
    else
        _x = _x - math.ceil(_limit / 5) * 7 -- Decrease the x based on how much stacks do you have
    end

    for i, coin in pairs(_coin) do
        i = i - 1
        if i < _limit then
            coin.yTo = _y - (i % 5 * 2 + 8)
            coin.xTo = _x + math.floor(i/5) * 14
            coin.spr = assets.coin_top
            love.graphics.draw(coin.spr, coin.x, coin.y)
        else
            coin.yTo = _y - ((_limit - 1)% 5 * 2 + 8)
            coin.xTo = _x + math.floor((_limit - 1)/5) * 14
            coin.spr = assets.coin_top
            love.graphics.draw(coin.spr, coin.x, coin.y)
        end
    end

    -- Draw the text coins
    if rest > 0 then
        love.graphics.print("+" .. tostring(rest), _x + math.ceil(_limit / 5) * 14, _y - 8)
    end
end

function moveCoin(_from, _to)
    if #_from > 20 then
        table.insert(_to, createCoin(_from[20].x + 8, _from[20].y + 16)) 
        table.remove(_from, #_from) 
        sound.coin:stop() 
        sound.coin:play()
    else
        table.insert(_to, createCoin(_from[#_from].x + 8, _from[#_from].y + 16)) 
        table.remove(_from, #_from) 
        sound.coin:stop() 
        sound.coin:play()
    end
    
end