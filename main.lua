function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    love.math.setRandomSeed(os.time())
    require "scr/requires"

    -- Window Setup
    scale = 5
   -- win_w = 128
    --win_h = 128
    --love.window.setMode(win_w * scale, win_h * scale)
    love.window.setTitle("PixelJack")
    love.window.setIcon(love.image.newImageData("assets/Icon.png"))

    -- Global Variables
    bet = 0
    coins = 5
    mousePressed = {}

    -- Assets
    assets = {
        back = love.graphics.newImage("assets/Back.png"),
        frame = love.graphics.newImage("assets/Frame.png"),
        card_back = love.graphics.newImage("assets/CardBack.png"),
        card_front = love.graphics.newImage("assets/CardFront.png"),
        coin_base = love.graphics.newImage("assets/CoinBack.png"),
        coin_top = love.graphics.newImage("assets/CoinTop.png"),
        diamond = love.graphics.newImage("assets/Diamond.png"),
        club = love.graphics.newImage("assets/Club.png"),
        spade = love.graphics.newImage("assets/Spade.png"),
        heart = love.graphics.newImage("assets/Heart.png"),
        logo = love.graphics.newImage("assets/Logo.png"),
        transition = love.graphics.newImage("assets/Transition.png"),
        minus = {
            love.graphics.newImage("assets/MinusIcon.png"),
            love.graphics.newImage("assets/MinusIconHigh.png")
        },
        plus = {
            love.graphics.newImage("assets/PlusIcon.png"),
            love.graphics.newImage("assets/PlusIconHigh.png")
        },
        arrow = {
            love.graphics.newImage("assets/Arrow.png"),
            love.graphics.newImage("assets/ArrowHigh.png"),
        },
        restart = {
            love.graphics.newImage("assets/Restart.png"),
            love.graphics.newImage("assets/RestartHigh.png"),
        },
        all = {
            love.graphics.newImage("assets/All.png"),
            love.graphics.newImage("assets/AllHigh.png"),
        },
        half = {
            love.graphics.newImage("assets/Half.png"),
            love.graphics.newImage("assets/HalfHigh.png"),
        }
    }

    -- Musics and sfx
    sound = {
        music = love.audio.newSource("music/Music.ogg", "static"),
        coin = love.audio.newSource("music/Coin.ogg", "static"),
        card = love.audio.newSource("music/Card.ogg", "static"),
        win = love.audio.newSource("music/Win.ogg", "static"),
        fail = love.audio.newSource("music/Fail.ogg", "static")
    }
    sound.music:setLooping(true)
    sound.music:setVolume(0.1)
    sound.music:play()
    sound.fail:setVolume(0.3)
    sound.card:setVolume(0.5)

    -- Font
    PICO8 = love.graphics.newFont("font/PICO-8.ttf", 5)
    love.graphics.setFont(PICO8)

    -- Game States
    GameState.registerEvents{"update"}
    GameState.switch(Menu)
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
    if key == "x" and GameState.current() == Menu then
        GameState.switch(Bet)
    end
end

function love.draw()
    mousePressed = {}
    love.graphics.scale(scale, scale)
    love.graphics.draw(assets.back, 0, 0)
    love.graphics.draw(assets.frame, 0, 0)
    GameState.draw()
end

function love.mousepressed(mouseX, mouseY, button)
    if button == 1 then
        mousePressed = 1
    end
end

function onMouseOver(obj)
    return not (mouseX < obj.x or mouseY < obj.y or mouseX > obj.x + obj.w or mouseY > obj.y + obj.h)
end