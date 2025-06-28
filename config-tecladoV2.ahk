#MaxHotkeysPerInterval 1000  ; Evita saturación de hotkeys

; ====== Variables de estado ======
NavLayer := false
Level2 := false
Level3 := false

; ====== Activar niveles con ALT ======
!1::  ; ALT + 1 → Nivel 1: Navegación general
    NavLayer := true
    Level2 := false
    Level3 := false
    SetCapsLockState, On
    ToolTip, NAVEGACION ACTIVADA
    SetTimer, ClearTip, -1000
return

!2::  ; ALT + 2 → Nivel 2: NumPad emulado para Blender
    NavLayer := false
    Level2 := true
    Level3 := false
    ToolTip, NUMPAD (BLENDER) ACTIVADO
    SetTimer, ClearTip, -1000
return

!3::  ; ALT + 3 → Nivel 3: Libre para otros usos
    NavLayer := false
    Level2 := false
    Level3 := true
    ToolTip, NIVEL 3 ACTIVADO
    SetTimer, ClearTip, -1000
return

ClearTip:
    ToolTip
return

; ====== SALIDA global con TAB (en cualquier nivel) ======
#If (NavLayer || Level2 || Level3)
Tab::
    NavLayer := false
    Level2 := false
    Level3 := false
    SetCapsLockState, Off
    ToolTip, Todos los niveles DESACTIVADOS
    SetTimer, ClearTip, -1000
return
#If

; ====== NIVEL 1: Navegación general con IJKL ======
#If NavLayer
q::SendInput !{F4}  ; Cierra ventana activa
t::SendInput #{1}   ; Win + 1 → Firefox
c::SendInput #{2}   ; Win + 2 → ChatGPT app
f::Run, "C:\Program Files\Mozilla Firefox\firefox.exe"
b::Run, D:\blender\blender-launcher.exe
p::Run, D:\ ; ABRIR DISCO D 

*i::
    if GetKeyState("Ctrl", "P") && GetKeyState("Shift", "P")
        SendInput ^+{Up}
    else if GetKeyState("Ctrl", "P")
        SendInput ^{Up}
    else if GetKeyState("Shift", "P")
        SendInput +{Up}
    else
        SendInput {Up}
return

*j::
    if GetKeyState("Ctrl", "P") && GetKeyState("Shift", "P")
        SendInput ^+{Left}
    else if GetKeyState("Ctrl", "P")
        SendInput ^{Left}
    else if GetKeyState("Shift", "P")
        SendInput +{Left}
    else
        SendInput {Left}
return

*k::
    if GetKeyState("Ctrl", "P") && GetKeyState("Shift", "P")
        SendInput ^+{Down}
    else if GetKeyState("Ctrl", "P")
        SendInput ^{Down}
    else if GetKeyState("Shift", "P")
        SendInput +{Down}
    else
        SendInput {Down}
return

*l::
    if GetKeyState("Ctrl", "P") && GetKeyState("Shift", "P")
        SendInput ^+{Right}
    else if GetKeyState("Ctrl", "P")
        SendInput ^{Right}
    else if GetKeyState("Shift", "P")
        SendInput +{Right}
    else
        SendInput {Right}
return
#If

; ====== NIVEL 2: Numpad emulado para Blender ======
#If (Level2 && WinActive("ahk_exe blender.exe"))
;a::Send ^{WheelUp}     ; Zoom In
;z::Send ^{WheelDown}   ; Zoom Out
p::Send {F3}
w::Send {Numpad7}          ; Vista superior
e::Send {Numpad1}          ; Vista frontal
r::Send {Numpad3}          ; Vista lateral derecha
s::Send ^{Numpad7}         ; Vista inferior
d::Send ^{Numpad1}         ; Vista trasera
f::Send ^{Numpad3}         ; Vista lateral izquierda
x::Send {Numpad5}          ; Perspectiva / Orto
c::Send {Numpad0}          ; Cámara
v::Send {NumpadDot}        ; Centrar objeto
#If

; ====== NIVEL 3: Personalizado, por ahora vacío ======
#If Level3
; Acá podés definir funciones especiales o experimentales
#If

