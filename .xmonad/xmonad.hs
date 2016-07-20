import qualified Data.Map as M

import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Util.Run

myKeys :: XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
myKeys conf@(XConfig { modMask = modMask }) = M.union myBindings defaultBindings
  where
    defaultBindings = keys def conf
    myBindings = M.fromList [ ((modMask, xK_semicolon), sendMessage (IncMasterN (-1)))
                            , ((modMask .|. shiftMask, xK_l), spawn "slock")
                            ]

main :: IO ()
main = do
  h <- spawnPipe "xmobar"
  xmonad def { modMask = mod4Mask
             , terminal = "uxterm"
             , borderWidth = 3
             , keys = myKeys
             , manageHook = manageHook def <+> manageDocks
             , layoutHook = avoidStruts $ layoutHook def
             , handleEventHook = handleEventHook def <+> docksEventHook
             , logHook = dynamicLogWithPP $ xmobarPP { ppOutput = hPutStrLn h }
             }
