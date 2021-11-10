function createButton(_x, _y, _spr, _func)
    local this = {
        spr = _spr,
        click = _func,
        x = _x,
        y = _y,
        w = _spr:getWidth() - 2,
        h = _spr:getHeight()
    }

    return this
end

function updateButton()
    for i, button in pairs(buttonsBET) do
        if onMouseOver(button) and mousePressed == 1 then
            button.click()
        end
    end
end

function drawButton()
    for i, button in pairs(buttonsBET) do
        love.graphics.draw(button.spr, button.x, button.y)
    end
end