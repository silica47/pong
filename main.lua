-- written in love by love :) -Surya

window_width = 1280
window_height = 720

function love.load()
    love.window.setMode(window_width, window_height,
    {
        fullscreen = flase,
        resizable = flase,
        vsync = true
    }
)
end

-- function love.draw()
--     love.graphics.printf(
--         "Pong",
--         0,
--         window_height/2-6,
--         window_width,
--         'center'
--     )
-- end
