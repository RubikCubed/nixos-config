import XMonad
import XMonad.Hooks.EwmhDesktops (ewmh)
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks (avoidStruts, docks)
import XMonad.Layout.Spacing (smartSpacingWithEdge)
import XMonad.Util.Run (spawnPipe, hPutStrLn)

myLayout = avoidStruts . smartSpacingWithEdge 8 $ Tall 1 (3 / 100) (2 / 3)

main :: IO ()
main = do
    h <- spawnPipe "xmobar -x 0 ~/.config/xmobar/xmobarrc"
    xmonad . ewmh . docks $ myConfig h

myConfig h = def
  { modMask            = mod4Mask
  , terminal           = "alacritty"
  , layoutHook         = myLayout
  , workspaces         = myWorkspaces
  , borderWidth        = 3
  , normalBorderColor  = "#928374"
  , focusedBorderColor = "#ebdbb2"
  , logHook = dynamicLogWithPP $ xmobarPP
    {
      ppCurrent = xmobarColor "#ebdbb2" "" . wrap "[" "]"
    , ppOutput = hPutStrLn h
    }
  }

myWorkspaces :: [String]
myWorkspaces = ["dev", "www", "chat", "game", "music", "misc"]
