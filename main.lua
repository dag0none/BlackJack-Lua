function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    require "scr/requires"

    -- Window Setup
    win_w = 128
    win_h = 128
    scale = 5
    love.window.setMode(win_w * scale, win_h * scale)

    -- Global Variables
    bet = 0
    coins = 10
    mousePressed = {}

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

    -- Game States
    GameState.registerEvents()
    GameState.switch(Bet)
end

function love.update(dt)
    mouseX, mouseY = love.mouse.getPosition()
    mouseX = mouseX / scale
    mouseY = mouseY / scale
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end

function love.draw()
    mousePressed = {}
    love.graphics.scale(scale, scale)
    love.graphics.draw(assets.back, 0, 0)
    love.graphics.draw(assets.frame, 0, 0)
    love.graphics.printf("player's hand", 0, 113, 128, "center")
    drawCoin(bet, 64, 47)
    GameState:draw()
end

function love.mousepressed(mouseX, mouseY, button)
    if button == 1 then
        mousePressed = 1
    end
end

function onMouseOver(obj)
    return not (mouseX < obj.x or mouseY < obj.y or mouseX > obj.x + obj.w or mouseY > obj.y + obj.h)
end