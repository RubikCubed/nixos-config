import XMonad
import XMonad.Hooks.EwmhDesktops (ewmh)
import XMonad.Hooks.DynamicLog
import XMonad.Layout.Spacing (smartSpacingWithEdge)

myLayout = smartSpacingWithEdge 8 $ Tall 1 (3 / 100) (2 / 3)

main :: IO ()
main = xmonad . ewmh =<< xmobar myConfig

myConfig = def
    { modMask    = mod4Mask
    , terminal   = "alacritty"
    , layoutHook = myLayout
    , workspaces = myWorkspaces
    }

myWorkspaces :: [String]
myWorkspaces = ["dev", "www", "chat", "game", "music", "misc"]
