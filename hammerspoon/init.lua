-- spoons
hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

-- resize window to left/right half.
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "h", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "l", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

-- moods
-- main
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "m", function()
    local laptopScreen = "LG HDR 4K"
    local windowLayout = {
        {"Chrome", nil, laptopScreen, hs.layout.left50, nil, nil},
        {"Terminal", nil, laptopScreen, hs.layout.right50, nil, nil},
        {"Spotify", nil, laptopScreen, hs.layout.maximized, nil, nil},
        {"Leaf", nil, laptopScreen, hs.layout.maximized, nil, nil},
    }
    hs.layout.apply(windowLayout)
end)
