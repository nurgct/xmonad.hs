    -- Imports.
    import XMonad
    import XMonad.Hooks.DynamicLog
    import XMonad.Hooks.ManageDocks
    import XMonad.Util.EZConfig(additionalKeys)
    import System.IO
    import Graphics.X11.ExtraTypes.XF86

    -- The main function.
    main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

    -- Command to launch the bar.
    myBar = "xmobar"

    -- Custom PP, configure it as you like. It determines what is being written to the bar.
    myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }
    
    --Custom Terminal--
    myTerminal = "sakura"
    
    -- Key binding to toggle the gap for the bar.
    toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

    -- Main configuration, override the defaults to your liking.
    myConfig = defaultConfig { modMask = mod4Mask } `additionalKeys` 
													[ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock"),
                                                      ((0, 0x1008FF11), spawn "amixer -q sset Master 2%-"),
                                                      ((0, 0x1008FF13), spawn "amixer -q sset Master 2%+"),
                                                      ((0, 0x1008FF02), spawn "lux -a 10%"), --increases the monitor brightness--
                                                      ((0, 0x1008FF03), spawn "lux -s 10%") --decrease the monitor brightness--
                                                    ]
	
