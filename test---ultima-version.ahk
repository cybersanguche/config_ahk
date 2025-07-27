#MaxHotkeysPerInterval 1000
#NoEnv
SendMode Input
SetBatchLines, -1

; ====== Variables de estado ======
NavLayer := false
Level2 := false
Level3 := false

; ====== Función para resetear niveles ======
DesactivarTodo() {
    global NavLayer, Level2, Level3
    NavLayer := false
    Level2 := false
    Level3 := false
    SetCapsLockState, Off
    ToolTip, TODOS LOS NIVELES DESACTIVADOS
    SetTimer, ClearTip, -1000
}

; ====== Limpieza de ToolTip ======
ClearTip:
ToolTip
return

; ====== Activar niveles con ALT ======
!1::
    DesactivarTodo()
    NavLayer := true
    SetCapsLockState, On
    ToolTip, NAVEGACIÓN ACTIVADA
    SetTimer, ClearTip, -1000
return

!2::
    DesactivarTodo()
    Level2 := true
    SetCapsLockState, On
    ToolTip, NUMPAD (BLENDER) ACTIVADO
    SetTimer, ClearTip, -1000
return

!3::
    DesactivarTodo()
    Level3 := true
    SetCapsLockState, On
    ToolTip, MODO MOUSE ACTIVADO
    SetTimer, ClearTip, -1000
return

; ====== Salida global con SHIFT ======
~LShift::
~RShift::
    if (NavLayer || Level2 || Level3)
        DesactivarTodo()
return

; ====== NIVEL 1: Navegación general ======
#If (NavLayer)

q::SendInput !{F4}
t::SendInput #{1}
c::SendInput #{2}
f::Run, "C:\Program Files\Mozilla Firefox\firefox.exe"
b::Run, D:\PROGRAMAS\blender4.5\blender-launcher.exe
V::Run, "D:\PROGRAMAS\Microsoft VS Code\Code.exe"
d::Run, D:\

o::Run, D:\PROGRAMAS\obsidian\Obsidian.exe

r::
    MsgBox, 4,, ¿Querés suspender la PC? (Enter = Sí, Esc = No)
    IfMsgBox, Yes
        DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)
return

*i::SendInput {Up}
*j::SendInput {Left}
*k::SendInput {Down}
*l::SendInput {Right}

#If

; ====== NIVEL 2: Numpad emulado (Blender) ======
#If (Level2 && WinActive("ahk_exe blender.exe"))

w::Send {Numpad7}
e::Send {Numpad8}
r::Send {Numpad9}
s::Send {Numpad4}
d::Send {Numpad5}
f::Send {Numpad6}
x::Send {Numpad1}
c::Send {Numpad2}
v::Send {Numpad3}
a::Send {Numpad0}
g::Send {NumpadDot}

^w::Send {Numpad1}
^e::Send {Numpad2}
^r::Send {Numpad3}
^s::Send {Numpad6}
^d::Send {Numpad5}
^f::Send {Numpad4}
^x::Send {Numpad7}
^c::Send {Numpad8}
^v::Send {Numpad9}
^a::Send {Numpad0}
^g::Send {NumpadDot}

#If

#If Level3

; ===== Movimiento rápido (J I L K) =====
j::
    While GetKeyState("j", "P") {
        MouseMove, -20, 0, 0, R
        Sleep, 15
    }
return

l::
    While GetKeyState("l", "P") {
        MouseMove, 20, 0, 0, R
        Sleep, 15
    }
return

i::
    While GetKeyState("i", "P") {
        MouseMove, 0, -20, 0, R
        Sleep, 15
    }
return

k::
    While GetKeyState("k", "P") {
        MouseMove, 0, 20, 0, R
        Sleep, 15
    }
return

; ===== Movimiento fino (W A S D) =====
w::
    While GetKeyState("w", "P") {
        MouseMove, 0, -5, 0, R
        Sleep, 15
    }
return

a::
    While GetKeyState("a", "P") {
        MouseMove, -5, 0, 0, R
        Sleep, 15
    }
return

s::
    While GetKeyState("s", "P") {
        MouseMove, 0, 5, 0, R
        Sleep, 15
    }
return

d::
    While GetKeyState("d", "P") {
        MouseMove, 5, 0, 0, R
        Sleep, 15
    }
return

; ===== Scroll con C, V, M, N =====
c::
    While GetKeyState("c", "P") {
        MouseClick, WheelUp
        Sleep, 100
    }
return

v::
    While GetKeyState("v", "P") {
        MouseClick, WheelDown
        Sleep, 100
    }
return

n::
    While GetKeyState("n", "P") {
        MouseClick, WheelLeft
        Sleep, 100
    }
return

m::
    While GetKeyState("m", "P") {
        MouseClick, WheelRight
        Sleep, 100
    }
return

; ===== Click izquierdo (drag and drop con E y U) =====
e::
u::
    MouseClick, left, , , , D
    While GetKeyState(A_ThisHotkey, "P")
        Sleep, 10
    MouseClick, left, , , , U
return

; ===== Click derecho (drag and drop con Q) =====
q::
    MouseClick, right, , , , D
    While GetKeyState("q", "P")
        Sleep, 10
    MouseClick, right, , , , U
return

; ===== Click medio (drag and drop con P) =====
p::
    MouseClick, middle, , , , D
    While GetKeyState("p", "P")
        Sleep, 10
    MouseClick, middle, , , , U
return

#If


