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

-- URLs
hs.urlevent.bind("pomodoro", function(eventName, params)
    hs.notify.new({
        title="Starting pomodoro now.",
        informativeText="[pomodoro] 25 min session."
    }):send()
    hs.timer.doAfter(3, function()
        hs.notify.new({
            title="Time's up!",
            informativeText="[pomodoro] Take a break."
        }):send()
    end)
end)

hs.urlevent.bind("reminder", function(eventName, params)
    what = params["what"]
    minutes = params["minutes"]
    notifyItem = {
        title='I will remind you soon',
        informativeText="Counting " .. minutes .. " min now",
    }
    hs.notify.new(notifyItem):send()

    hs.timer.doAfter(tonumber(minutes) * 60, function()
        notifyItem = {
            title=what,
            informativeText=minutes .. " min past!",
        }
        hs.notify.new(notifyItem):send()
    end)
end)
