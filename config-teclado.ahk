#MaxHotkeysPerInterval 1000  ; Evita saturación de hotkeys

; ====== Variables de estado ======
NavLayer := false
Level2 := false
Level3 := false

; ====== ACTIVAR niveles con ALT ======
!1::  ; Alt + 1 = Nivel 1
    NavLayer := true
    SetCapsLockState, On
    ToolTip, NAVEGACION
    SetTimer, ClearTip, -1000
return

!2::  ; Alt + 2 = Nivel 2
    Level2 := true
    ToolTip, NUMpad (BLENDER)
    SetTimer, ClearTip, -1000
return

!3::  ; Alt + 3 = Nivel 3
    Level3 := true
    ToolTip, Nivel 3 ACTIVADO
    SetTimer, ClearTip, -1000
return

ClearTip:
    ToolTip
return

; ====== NIVEL 1: Navegación con IJKL y modificadores ======
#If NavLayer
Tab::  ; Salida desde cualquier nivel
    NavLayer := false
    Level2 := false
    Level3 := false
    SetCapsLockState, Off
    ToolTip, Todos los niveles desactivados
    SetTimer, ClearTip, -1000
return
; CIERRA TOOD PROGRAMA DE MIERDA
q::SendInput !{F4}  ; Cierra ventana activa (Alt+F4)

;ACCESO DIRECTO
t::SendInput #{1}   ; Simula Win + 2 → Terminal (Windows Terminal)
c::SendInput #{2}   ; Simula Win + 3 → ChatGPT app o navegador
f::Run, "C:\Program Files\Mozilla Firefox\firefox.exe" ; Simula Win + 1 → Firefox
b::Run, D:\blender\blender-launcher.exe ; Simula Win + 3 → blender
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

; ====== NIVEL 2: NUMPAD EMULADO (ZURDO) ======
#If Level2

Tab::  ; Salida desde cualquier nivel
    NavLayer := false
    Level2 := false
    Level3 := false
    SetCapsLockState, Off
    ToolTip, Todos los niveles desactivados
    SetTimer, ClearTip, -1000
return
#IfWinActive ahk_exe blender.exe
a::Send ^{NumpadAdd}
z::Send ^{NumpadSub}
#IfWinActive
w::SendInput {Numpad7}      ; Vista superior
e::SendInput {Numpad1}      ; Vista frontal
r::SendInput {Numpad3}      ; Vista lateral derecha
s::SendInput ^{Numpad7}     ; Vista inferior
d::SendInput ^{Numpad1}     ; Vista trasera
f::SendInput ^{Numpad3}     ; Vista lateral izquierda
x::SendInput {Numpad5}      ; Perspectiva / Orto
c::SendInput {Numpad0}      ; Cámara
v::SendInput {NumpadDot}    ; Centrar objeto
#If

; ====== NIVEL 3: Vacío (con salida) ======
#If Level3

Tab::  ; Salida desde cualquier nivel
    NavLayer := false
    Level2 := false
    Level3 := false
    SetCapsLockState, Off
    ToolTip, Todos los niveles desactivados
    SetTimer, ClearTip, -1000
return
#If

