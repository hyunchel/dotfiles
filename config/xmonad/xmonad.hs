import XMonad
import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Magnifier
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Util.Loggers

main :: IO ()
main = xmonad
     . withEasySB (statusBarProp "xmobar ~/.config/xmonad/xmobarrc" (pure myXmobarPP)) defToggleStrutsKey
     $ myConfig

myConfig = def
    { terminal = "alacritty" -- use alacritty as default terminal
    , modMask = mod4Mask  -- Rebind Mod to the Super key
    , layoutHook = myLayout -- Use Custom layouts
    , startupHook = myStartupHook
    }
    `additionalKeysP`
    [ ("M-S-z", spawn "xscreensaver-command -lock")
    , ("M-C-s", unGrab *> spawn "scrot -s" )
    , ("M-f", spawn "firefox")
    ]

myLayout = tiled ||| Mirror tiled ||| Full ||| threeCol
  where
    threeCol = magnifiercz' 1.0 $ ThreeColMid nmaster delta ratio
    tiled = Tall nmaster delta ratio
    nmaster = 1 -- Default number of windows in the master pane
    ratio = 5/12 -- Default proportion of screen occupied by master pane
    delta = 3/100 -- Percent of screen to increment by when resizing panes

myStartupHook :: X ()
myStartupHook = do
    spawn "fcitx5 -d" 
    spawn "pulseaudio --start"
    spawn "firefox"

myXmobarPP :: PP
myXmobarPP = def
    { ppSep = magenta " . "
    , ppTitleSanitize = xmobarStrip
    , ppCurrent = wrap " " "" . xmobarBorder "Top" "#8be9fd" 2
    , ppHidden = white . wrap " " ""
    , ppHiddenNoWindows = lowWhite . wrap " " ""
    , ppUrgent = red . wrap (yellow "!") (yellow "!")
    , ppOrder = \[ws, l, _, wins] -> [ws, l, wins]
    , ppExtras = [logTitles formatFocused formatUnfocused]
    }
  where
    formatFocused = wrap (white "[") (white "]") . magenta . ppWindow
    formatUnfocused = wrap (lowWhite "[") (lowWhite "]") . blue . ppWindow

    -- | Windows should have *some* title, which should not not exceed a same length
    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 30
    
    blue, lowWhite, magenta, red, white, yellow :: String -> String
    magenta = xmobarColor "#ff79c6" ""
    blue = xmobarColor "#bd93f9" ""
    white = xmobarColor "#f8f8f2" ""
    yellow = xmobarColor "#f1fa8c" ""
    red = xmobarColor "#ff5555" ""
    lowWhite = xmobarColor "#bbbbbb" ""
