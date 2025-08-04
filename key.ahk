#Requires AutoHotkey v2.0

IsKeyPressed(keyName) {
    return GetKeyState(keyName, "P")
}

; Example usage - show message box when F1 is pressed
F1::
{
    if (IsKeyPressed("F1")) {
        MsgBox("F1 key is pressed!", "Key Status", "OK")
    }
}

; You can also test other keys - uncomment the line below to test
; MsgBox("Testing key function: " . IsKeyPressed("Ctrl"), "Test", "OK")
