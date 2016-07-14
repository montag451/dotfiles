import XMonad
import qualified Data.Map as M

--defaultConfigKeys = keys defaultConfig

myKeys :: XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
myKeys conf@(XConfig{modMask = modMask}) = M.union myBindings defaultBindings
  where
    defaultBindings = keys defaultConfig conf
    myBindings =
        M.fromList
            [ ((modMask, xK_semicolon), sendMessage (IncMasterN (-1)))
            , ((modMask .|. shiftMask, xK_l), spawn "slock")]

main :: IO ()
main =
    xmonad
        defaultConfig
        { modMask = mod4Mask
        , terminal = "uxterm"
        , borderWidth = 3
        , keys = myKeys
        }
