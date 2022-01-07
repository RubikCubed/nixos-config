import XMonad
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.Spacing

myLayout = smartSpacingWithEdge 8 $ Tall 1 (3 / 100) (2 / 3)

main = xmonad . ewmh $ def
    { modMask    = mod4Mask
    , terminal   = "alacritty"
    , layoutHook = myLayout
    }
