#Persistent  ; Keep the script running
SetKeyDelay, 50  ; Set the delay between key presses (in milliseconds)

; Initialize variables
cycleIndex := 1
cycleMode := true  ; Flag to toggle between cycle mode and normal mode

HideTrayTip() {
    TrayTip  ; Attempt to hide it the normal way.
    if SubStr(A_OSVersion,1,3) = "10." {
        Menu Tray, NoIcon
        Sleep 200  ; It may be necessary to adjust this sleep.
        Menu Tray, Icon
    }
}

; Define the hotkey for pressing Left ALT
LAlt::
    if (cycleMode) {
        ; Press and hold h for 110 milliseconds
        SendInput, {h down}
        Sleep, 110
        SendInput, {h up}

        ; Cycle through r, t, and y
        if (cycleIndex = 1) {
            SendInput, {r down}{r up}
            cycleIndex := 2
        }
        else if (cycleIndex = 2) {
            SendInput, {t down}{t up}
            cycleIndex := 3
        }
        else if (cycleIndex = 3) {
            SendInput, {y down}{y up}
            cycleIndex := 1
        }
    }
    else {
        g::g  ; Send 'g' as a normal typeable key
    }
return

; Define the hotkey for pressing Shift + Left ALT
+LAlt::
    if (cycleMode) {
        ; Press and hold h for 110 milliseconds
        SendInput, {h down}
        Sleep, 110
        SendInput, {h up}
		Sleep, 50
		SendInput, {h down}
        Sleep, 110
        SendInput, {h up}

        ; Cycle through r, t, and y
        if (cycleIndex = 2) {
            SendInput, {r down}{r up}
			cycleIndex := 1
        }
        else if (cycleIndex = 3) {
            SendInput, {t down}{t up}
			cycleIndex := 1
        }
        else if (cycleIndex = 1) {
            SendInput, {y down}{y up}
			cycleIndex := 1
        }
    }
    else {
        +g::+g  ; Send 'Shift + G' as a normal typeable key
    }
return

; Define the hotkey for toggling cycle mode
F10::
    cycleMode := !cycleMode  ; Toggle the flag
    if (cycleMode) {
        TrayTip Siren mode enabled,  This is siren mode
		Sleep 2500
		HideTrayTip()
		}
    else {
        TrayTip Normal mode enabled, This is typing mode
		Sleep 2500
		HideTrayTip()
		}
return

