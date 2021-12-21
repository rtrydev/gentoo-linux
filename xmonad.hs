import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Layout.Spacing
import XMonad.Layout.Gaps

main :: IO ()
main = xmonad =<< xmobar myConfig

myConfig = def
       	{
		layoutHook = gaps [(U,5), (R,5), (L,5), (D,5)] $ spacing 5 $ Tall 1 (6/100) (1/2),
		terminal = "alacritty",
		modMask = mod4Mask,
		focusedBorderColor = "#444444",
		normalBorderColor = "#222222"
	}
