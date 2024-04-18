#Persistent  ; Keep the script running
SetKeyDelay, 50  ; Set the delay between key presses (in milliseconds)

; Initialize variables
cycleIndex := 1


; Define the hotkey for pressing g
g::
    ; Press and hold h for half a second
    SendInput, {h down}
    Sleep, 97
    SendInput, {h up}

    ; Cycle through r, t, and y (Siren)
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
	
return