-- Set up hotkey combinations
local cmdAltCtrl = {"cmd", "alt", "ctrl"}
local cmdAlt = {"cmd", "alt"}
local cmdCtrl = {"cmd", "ctrl"}


hs.hotkey.bind(cmdAltCtrl, "R", function()
    hs.reload()
end)
hs.notify.new({title="Hammerspoon", informativeText="Config loaded"}):send()


-- ---------------------------
-- -- Window positions
-- ---------------------------
hs.hotkey.bind(cmdCtrl, "Left", function()
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

hs.hotkey.bind(cmdCtrl, "Right", function()
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

hs.hotkey.bind(cmdCtrl, "Up", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
  
    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h
    win:setFrame(f)
end)

----------
-- adapted from https://github.com/Linell/hammerspoon-config/blob/master/init.lua
----------

-- Set grid size.
hs.grid.setGrid('4x2')
hs.grid.setMargins(hs.geometry(0, 0))

hs.hotkey.bind(cmdAltCtrl, "space", function()
    hs.grid.show()
end)

-- Set window animation off. It's much smoother.
hs.window.animationDuration = 0

hs.hotkey.bind(cmdAltCtrl, 'F', function() hs.window.focusedWindow():toggleFullScreen() end)

hs.hotkey.bind(cmdAltCtrl, 'N', hs.grid.pushWindowNextScreen)
hs.hotkey.bind(cmdAltCtrl, 'P', hs.grid.pushWindowPrevScreen)

hs.hotkey.bind(cmdAltCtrl, 'S', function()
    hs.grid.snap(hs.window.focusedWindow())
end)

hs.hotkey.bind(cmdAltCtrl, 'down', hs.grid.pushWindowDown)
hs.hotkey.bind(cmdAltCtrl, 'up', hs.grid.pushWindowUp)
hs.hotkey.bind(cmdAltCtrl, 'left', hs.grid.pushWindowLeft)
hs.hotkey.bind(cmdAltCtrl, 'right', hs.grid.pushWindowRight)

hs.hotkey.bind(cmdAlt, 'up', hs.grid.resizeWindowTaller)
hs.hotkey.bind(cmdAlt, 'right', hs.grid.resizeWindowWider)
hs.hotkey.bind(cmdAlt, 'left', hs.grid.resizeWindowThinner)
hs.hotkey.bind(cmdAlt, 'down', hs.grid.resizeWindowShorter)
