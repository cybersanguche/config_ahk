; ====== Variables de estado ======
NavLayer := false
Level2 := false
Level3 := false

; ====== ACTIVAR niveles ======
^+1::  ; Activar Nivel 1
    NavLayer := true
    ; SoundBeep, 750, 150
    SetCapsLockState, On
    ToolTip, Nivel 1 (NAV) ACTIVADO
    SetTimer, ClearTip, -1000
return

^+2::  ; Activar Nivel 2
    Level2 := true
    ; SoundBeep, 1000, 150
    ToolTip, Nivel 2 ACTIVADO
    SetTimer, ClearTip, -1000
return

^+3::  ; Activar Nivel 3
    Level3 := true
    ; SoundBeep, 1250, 150
    ToolTip, Nivel 3 ACTIVADO
    SetTimer, ClearTip, -1000
return

; ====== SALIDA GLOBAL con ESC ======
; === si no esta en algun nivel solo funciona como exit
Esc::
    if (NavLayer || Level2 || Level3) {
        NavLayer := false
        Level2 := false
        Level3 := false
        ; SoundBeep, 500, 100
        SetCapsLockState, Off
        ToolTip, Todos los niveles desactivados
        SetTimer, ClearTip, -1000
    } else {
        SendInput {Esc}  ; Comportamiento normal de Escape
    }
return

ClearTip:
    ToolTip
return

; ====== NIVEL 1: Navegación con IJKL y modificadores ======
#If NavLayer
*i::
    if GetKeyState("Ctrl", "P") && GetKeyState("Shift", "P") {
        SendInput ^+{Up}
    } else if GetKeyState("Ctrl", "P") {
        SendInput ^{Up}
    } else if GetKeyState("Shift", "P") {
        SendInput +{Up}
    } else {
        SendInput {Up}
    }
return

*j::
    if GetKeyState("Ctrl", "P") && GetKeyState("Shift", "P") {
        SendInput ^+{Left}
    } else if GetKeyState("Ctrl", "P") {
        SendInput ^{Left}
    } else if GetKeyState("Shift", "P") {
        SendInput +{Left}
    } else {
        SendInput {Left}
    }
return

*k::
    if GetKeyState("Ctrl", "P") && GetKeyState("Shift", "P") {
        SendInput ^+{Down}
    } else if GetKeyState("Ctrl", "P") {
        SendInput ^{Down}
    } else if GetKeyState("Shift", "P") {
        SendInput +{Down}
    } else {
        SendInput {Down}
    }
return

*l::
    if GetKeyState("Ctrl", "P") && GetKeyState("Shift", "P") {
        SendInput ^+{Right}
    } else if GetKeyState("Ctrl", "P") {
        SendInput ^{Right}
    } else if GetKeyState("Shift", "P") {
        SendInput +{Right}
    } else {
        SendInput {Right}
    }
return
#If

; ====== NIVEL 2 y 3 (vacíos por ahora) ======

; ====== NIVEL 2 numpad para blender ======
#If Level2
q::SendInput {Numpad7}
w::SendInput {Numpad1}
e::SendInput {Numpad3}
a::SendInput ^{Numpad7}
s::SendInput ^{Numpad1}
d::SendInput ^{Numpad3}
z::SendInput {Numpad5}
x::SendInput {Numpad0}
c::SendInput {NumpadDot}
#If


#If Level3
    ; Acciones para Nivel 3
#If

