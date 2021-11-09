function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    require "scr/requires"

    -- Window Setup
    win_w = 128
    win_h = 128
    scale = 5
    love.window.setMode(win_w * scale, win_h * scale)

    -- Game States
    GameState.registerEvents()
    GameState.switch(bet)

    -- Assets
    assets = {
        back = love.graphics.newImage("assets/Back.png"),
        frame = love.graphics.newImage("assets/Frame.png"),
        card_back = love.graphics.newImage("assets/Card_Back.png"),
        card_front = love.graphics.newImage("assets/Card_front.png"),
        coin_base = love.graphics.newImage("assets/Coin_Back.png"),
        coin_top = love.graphics.newImage("assets/Coin_Top.png"),
        minus = love.graphics.newImage("assets/Minus_Icon.png"),
        plus = love.graphics.newImage("assets/Plus_Icon.png")
    }

    -- Font
    PICO8 = love.graphics.newFont("font/PICO-8.ttf", 5)
    love.graphics.setFont(PICO8)
end

function love.update(dt)
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end

function love.draw()
    love.graphics.scale(scale, scale)
    love.graphics.draw(assets.back, 0, 0)
    love.graphics.draw(assets.frame, 0, 0)
end