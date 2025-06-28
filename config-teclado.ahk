; Variables de estado para niveles
NavLayer := false
Level2 := false
Level3 := false

; Toggle niveles con combinaciones específicas
^+1::  ; Ctrl+Shift+1 toggle nivel 1
    NavLayer := !NavLayer
    ; SoundBeep, 750, 150
    if (NavLayer) {
        ToolTip, Nivel 1 ACTIVADO
        SetCapsLockState, On
    } else {
        ToolTip, Nivel 1 DESACTIVADO
        SetCapsLockState, Off
    }
    SetTimer, ClearTip, -1000
return

^+2::  ; Ctrl+Shift+2 toggle nivel 2
    Level2 := !Level2
    ; SoundBeep, 1000, 150
    if (Level2) {
        ToolTip, Nivel 2 ACTIVADO
    } else {
        ToolTip, Nivel 2 DESACTIVADO
    }
    SetTimer, ClearTip, -1000
return

^+3::  ; Ctrl+Shift+3 toggle nivel 3
    Level3 := !Level3
    ; SoundBeep, 1250, 150
    if (Level3) {
        ToolTip, Nivel 3 ACTIVADO
    } else {
        ToolTip, Nivel 3 DESACTIVADO
    }
    SetTimer, ClearTip, -1000
return

ClearTip:
    ToolTip
return

; Comportamiento de teclas en función del nivel activo
#If NavLayer
    i::SendInput {Up}
    j::SendInput {Left}
    k::SendInput {Down}
    l::SendInput {Right}
#If

#If Level2
    ; Aquí podés definir otros remapeos para nivel 2
#If

#If Level3
    ; Aquí podés definir otros remapeos para nivel 3
#If

