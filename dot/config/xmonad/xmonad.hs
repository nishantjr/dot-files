import XMonad hiding (modMask, keys, workspaces, terminal)
import qualified XMonad as XMonad
import qualified XMonad.StackSet as StackSet

import XMonad.Actions.UpdatePointer
import XMonad.Hooks.WorkspaceHistory
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Layout.NoFrillsDecoration
import XMonad.Layout.Columns
import XMonad.Util.EZConfig
import XMonad.Util.SpawnOnce

modm = mod4Mask
shiftm = shiftMask
ctrlm = controlMask

main :: IO ()
main = xmonad . xmobarProp $ def
    { XMonad.modMask = modm
    , XMonad.layoutHook = layout
    , XMonad.workspaces = map fst workspaces
    , XMonad.focusFollowsMouse = False
    , XMonad.logHook = centerOnFocuced >> workspaceHistoryHook
    , XMonad.startupHook = startup
    } `additionalKeys` keys
  where
    centerOnFocuced = updatePointer (0.5, 0.5) (0, 0)

layout = (decorate $ Columns 1 []) ||| Full
  where
    decorate layout = noFrillsDeco shrinkText def layout


keys :: [((KeyMask, KeySym), X ())]
keys = [ ((modm, xK_d),                     spawn "dmenu_run")
       , ((modm, xK_Return),                spawn terminal)

       , ((modm, xK_Tab),                   viewLastWorkSpace)
       --- Columns Layout
       -- move
       , ((modm .|. shiftm, xK_l),          sendMessage MoveRight)
       , ((modm .|. shiftm, xK_h),          sendMessage MoveLeft)
       , ((modm .|. shiftm, xK_k),          sendMessage MoveUp)
       , ((modm .|. shiftm, xK_j),          sendMessage MoveDown)
       -- resize
       , ((modm .|. ctrlm, xK_l),           sendMessage HorizontalExpand)
       , ((modm .|. ctrlm, xK_h),           sendMessage HorizontalShrink)
       , ((modm .|. ctrlm, xK_k),           sendMessage VerticalExpand)
       , ((modm .|. ctrlm, xK_j),           sendMessage VerticalShrink)
       ] ++ wspace_keys
         ++ thinkpad_fkeys
    where
        -- mod-KEY       %! Switch to workspace N
        -- mod-shift-KEY %! Move client to workspace N
        wspace_keys = [((m .|. modm, k), windows $ f i)
                      | (i, k) <- workspaces
                      , (f, m) <- [(StackSet.greedyView, 0), (StackSet.shift, shiftMask)]]
        thinkpad_fkeys =
             [ ((0, xK_F5), spawn "brightnessctl s  2%-")
             , ((0, xK_F6), spawn "brightnessctl s +2%")
             , ((0, xK_F1), spawn "pactl set-sink-mute 0 toggle")
             , ((0, xK_F2), spawn "pactl set-sink-volume 0 -5%")
             , ((0, xK_F3), spawn "pactl set-sink-volume 0 +5%")
             , ((0, xK_Print), spawn "scrot")
             ]

workspaces = [ ( "1", xK_1)
             , ( "2", xK_2)
             , ( "3", xK_3)
             , ( "4", xK_4)
             , ( "5", xK_5)
             , ( "6", xK_6)
             , ( "7", xK_7)
             , ( "8", xK_8)
             , ( "9", xK_9)
             , ("10", xK_0)
             , ("11", xK_minus)
             , ("12", xK_equal)]

viewLastWorkSpace :: X ()
viewLastWorkSpace = do
    history <- workspaceHistory
    case history of
        _:w:_ -> windows $ StackSet.greedyView w
        _     -> pure ()

terminal = "alacritty"

startup :: X ()
startup = do
    spawnOnce "feh --bg-fill --no-fehbg ~/.config/sway/background.jpg"
    spawnOnce "xmobar ~/.config/xmobar/xmobar.conf"

