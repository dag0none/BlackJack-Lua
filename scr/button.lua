function createButton(_x, _y, _spr, _func)
    local this = {
        index = 1,
        spr = _spr,
        click = _func,
        x = _x,
        y = _y,
        w = _spr[1]:getWidth(),
        h = _spr[2]:getHeight()
    }

    return this
end

function updateButton(_set)
    for i, button in pairs(_set) do
        if onMouseOver(button) then
            button.index = 2
            if mousePressed == 1 then
                button.click()
            end
        else button.index = 1 end
    end
end

function drawButton(_set)
    for i, button in pairs(_set) do
        love.graphics.draw(button.spr[button.index], button.x, button.y)
        love.graphics.setColor(1, 1, 1)
    end
end