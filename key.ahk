#Requires AutoHotkey v2.0

IsKeyPressed(keyName) {
    return GetKeyState(keyName, "P")
}

; Example usage - show message box when F1 is pressed
F1::
{
    if (IsKeyPressed("F1")) {
        MsgBox("key is run normal!", "Key Status", "OK")
    }
}

; You can also test other keys - uncomment the line below to test
; MsgBox("Testing key function: " . IsKeyPressed("Ctrl"), "Test", "OK")

; Window focus navigation with Win+hjkl
#h::  ; Win+h - focus left window
{
    MsgBox("Custom key binding for Win+h")
}

#j::  ; Win+j - focus down window
{
    MsgBox("Custom key binding for Win+j")
}

#k::  ; Win+k - focus up window
{
    MsgBox("Custom key binding for Win+k")
}

#l::  ; Win+l - focus right window
{
    MsgBox("Custom key binding for Win+l")
}
