# 🔀 Layered Keyboard with AutoHotkey

An AutoHotkey script that adds **keyboard modes** for seamless context switching — optimized for productivity, Blender workflows, and keyboard-only navigation.

## 🧠 Mantra

Three layers, one keyboard. Change mental mode without changing tools.

---

## 🎮 Modes Overview

| Layer | Shortcut        | Main Purpose                     |
|-------|------------------|----------------------------------|
| 1     | `ALT + 1`        | General navigation (IJKL, apps) |
| 2     | `ALT + 2`        | NumPad emulation for **Blender**|
| 3     | `ALT + 3`        | Custom (free to configure)      |
| 🔚    | `SHIFT (L/R)`    | Exit all layers                 |

Each layer shows a temporary tooltip on activation.

---

## 🧭 Layer 1 – General Navigation

> Use `IJKL` as a smart directional pad.

- `i/j/k/l`: Move ↑ ← ↓ →  
  Also supports `Ctrl`, `Shift`, or both modifiers.
- Quick shortcuts:
  - `q`: Close active window
  - `t`: `Win + 1` (e.g. Firefox)
  - `c`: `Win + 2` (e.g. ChatGPT)
  - `f`: Launch Firefox
  - `b`: Launch Blender
  - `d`: Open D:\ drive

---

## 🎨 Layer 2 – Blender Without NumPad

> Emulates NumPad shortcuts for Blender when it's the active window.

| Key | Function               |
|-----|------------------------|
| `p` | Search (F3)            |
| `w` | Top View (Numpad 7)    |
| `e` | Front View (Numpad 1)  |
| `r` | Right View (Numpad 3)  |
| `s` | Bottom View (Ctrl+7)   |
| `d` | Back View (Ctrl+1)     |
| `f` | Left View (Ctrl+3)     |
| `x` | Toggle Perspective     |
| `c` | Camera View            |
| `v` | Center Object          |

---

## 🧪 Layer 3 – Experimental / Custom

Currently empty. Use this for anything you want to test or automate in the future.

---

## ⏹ Global Exit Shortcut

Press **either left or right `Shift`** to exit all layers and return to default keyboard behavior.

---

## 🛠 Requirements

- Windows
- [AutoHotkey v1.x](https://www.autohotkey.com/)

---

## 📁 File structure

This script is designed to be used as part of a larger dotfiles setup, but can also run standalone.

---

## 📌 Tip

CapsLock is used as an indicator (ON = navigation layer active). You can customize this behavior inside the script.


