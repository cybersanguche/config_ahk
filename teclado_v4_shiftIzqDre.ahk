#MaxHotkeysPerInterval 1000  ; Evita saturación de hotkeys

; ====== VARIABLES GLOBALES ======
NavLayer := false
Level2 := false
Level3 := false
currentLevel := 0  ; 0 = desactivado, 1 = Nav, 2 = Blender, 3 = Extra
shiftState := {L:false, R:false}
modoNivelesActivo := false

; ====== FUNCIONES ======
ClearTip:
    ToolTip
return

SetLevel(nivel) {
    global NavLayer, Level2, Level3, currentLevel
    NavLayer := (nivel = 1)
    Level2 := (nivel = 2)
    Level3 := (nivel = 3)
    currentLevel := nivel

    if nivel = 1
        ToolTip, NIVEL 1 ACTIVADO
    else if nivel = 2
        ToolTip, NIVEL 2 ACTIVADO
    else if nivel = 3
        ToolTip, NIVEL 3 ACTIVADO

    SetTimer, ClearTip, -1000
}

ResetLevels() {
    global NavLayer, Level2, Level3, currentLevel, modoNivelesActivo
    NavLayer := false
    Level2 := false
    Level3 := false
    currentLevel := 0
    modoNivelesActivo := false
    ToolTip, MODO NIVELES DESACTIVADO
    SetTimer, ClearTip, -1000
}

SendDirection(dir) {
    if GetKeyState("Ctrl", "P") && GetKeyState("Shift", "P")
        SendInput ^+{%dir%}
    else if GetKeyState("Ctrl", "P")
        SendInput ^{%dir%}
    else if GetKeyState("Shift", "P")
        SendInput +{%dir%}
    else
        SendInput {%dir%}
}

; ====== SHIFT COMBINADOS PARA ENTRAR Y SALIR DE MODO NIVELES ======
~LShift::
    shiftState.L := true
    if (shiftState.R && !modoNivelesActivo) {
        modoNivelesActivo := true
        SetLevel(1)
    }
return

~LShift up::
    shiftState.L := false
    if modoNivelesActivo
        ResetLevels()
return

~RShift::
    shiftState.R := true
    if (shiftState.L && !modoNivelesActivo) {
        modoNivelesActivo := true
        SetLevel(1)
    }
return

~RShift up::
    shiftState.R := false
    if modoNivelesActivo
        ResetLevels()
return

; ====== CAMBIAR NIVELES DENTRO DEL MODO ======
~LShift & a::
    if modoNivelesActivo {
        newLevel := (currentLevel = 1) ? 3 : currentLevel - 1
        SetLevel(newLevel)
    }
return

~RShift & d::
    if modoNivelesActivo {
        newLevel := (currentLevel = 3) ? 1 : currentLevel + 1
        SetLevel(newLevel)
    }
return

; ====== NIVEL 1: NAVEGACIÓN GENERAL ======
#If NavLayer
q::SendInput !{F4}  ; Cierra ventana activa
t::SendInput #{1}   ; Win + 1 → Firefox
c::SendInput #{2}   ; Win + 2 → ChatGPT app
f::Run, "C:\Program Files\Mozilla Firefox\firefox.exe"
b::Run, D:\blender\blender-launcher.exe
d::Run, D:\  ; Abrir disco D
o::Run, D:\PROGRAMAS\obsidian\Obsidian.exe  ; Abrir Obsidian
*i::SendDirection("Up")
*j::SendDirection("Left")
*k::SendDirection("Down")
*l::SendDirection("Right")
#If

; ====== NIVEL 2: NUMPAD PARA BLENDER ======
#If (Level2 && WinActive("ahk_exe blender.exe"))
p::Send {F3}
w::Send {Numpad7}
e::Send {Numpad1}
r::Send {Numpad3}
s::Send ^{Numpad7}
d::Send ^{Numpad1}
f::Send ^{Numpad3}
x::Send {Numpad5}
c::Send {Numpad0}
v::Send {NumpadDot}
#If

; ====== NIVEL 3: EXPERIMENTAL (vacío por ahora) ======
#If Level3
; Agregá funciones especiales si querés
#If

