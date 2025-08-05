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

; Window focus navigation functions
GetVisibleWindows() {
    windows := []
    windowList := WinGetList()

    for hwnd in windowList {
        ; Skip if window is minimized or not visible
        if (WinGetMinMax(hwnd) == -1 || !WinExist(hwnd))
            continue

        ; Get window position and size
        WinGetPos(&x, &y, &width, &height, hwnd)

        ; Skip windows with invalid dimensions
        if (width <= 0 || height <= 0)
            continue

        ; Get window title for debugging
        title := WinGetTitle(hwnd)

        ; Skip windows without titles (usually system windows)
        if (title == "")
            continue

        windows.Push({
            hwnd: hwnd,
            x: x,
            y: y,
            width: width,
            height: height,
            title: title,
            right: x + width,
            bottom: y + height
        })
    }

    return windows
}

GetCurrentWindow() {
    hwnd := WinGetID("A")
    if (!hwnd)
        return ""

    WinGetPos(&x, &y, &width, &height, hwnd)
    title := WinGetTitle(hwnd)

    return {
        hwnd: hwnd,
        x: x,
        y: y,
        width: width,
        height: height,
        title: title,
        right: x + width,
        bottom: y + height
    }
}

FindWindowInDirection(direction) {
    current := GetCurrentWindow()
    if (!current)
        return ""

    windows := GetVisibleWindows()
    bestWindow := ""
    bestDistance := 999999

    for window in windows {
        ; Skip current window
        if (window.hwnd == current.hwnd)
            continue

        distance := 999999

        switch direction {
            case "left":
                ; Find window to the left (compare left edges)
                if (window.x < current.x) {
                    hDistance := current.x - window.x
                    vOverlap := Max(0, Min(current.bottom, window.bottom) - Max(current.y, window.y))
                    vPenalty := vOverlap > 0 ? 0 : Min(Abs(current.y - window.bottom), Abs(current.bottom - window.y))
                    distance := hDistance + vPenalty
                }

            case "right":
                ; Find window to the right (compare left edges)
                if (window.x > current.x) {
                    hDistance := window.x - current.x
                    vOverlap := Max(0, Min(current.bottom, window.bottom) - Max(current.y, window.y))
                    vPenalty := vOverlap > 0 ? 0 : Min(Abs(current.y - window.bottom), Abs(current.bottom - window.y))
                    distance := hDistance + vPenalty
                }

            case "up":
                ; Find window above (compare top edges)
                if (window.y < current.y) {
                    vDistance := current.y - window.y
                    hOverlap := Max(0, Min(current.right, window.right) - Max(current.x, window.x))
                    hPenalty := hOverlap > 0 ? 0 : Min(Abs(current.x - window.right), Abs(current.right - window.x))
                    distance := vDistance + hPenalty
                }

            case "down":
                ; Find window below (compare top edges)
                if (window.y > current.y) {
                    vDistance := window.y - current.y
                    hOverlap := Max(0, Min(current.right, window.right) - Max(current.x, window.x))
                    hPenalty := hOverlap > 0 ? 0 : Min(Abs(current.x - window.right), Abs(current.right - window.x))
                    distance := vDistance + hPenalty
                }
        }

        if (distance < bestDistance) {
            bestDistance := distance
            bestWindow := window
        }
    }

    return bestWindow
}

; Window focus navigation with Win+hjkl
#h::  ; Win+h - focus left window
{
    window := FindWindowInDirection("left")
    if (window && window.hwnd) {
        WinActivate(window.hwnd)
    }
}

#j::  ; Win+j - focus down window
{
    window := FindWindowInDirection("down")
    if (window && window.hwnd) {
        WinActivate(window.hwnd)
    }
}

#k::  ; Win+k - focus up window
{
    window := FindWindowInDirection("up")
    if (window && window.hwnd) {
        WinActivate(window.hwnd)
    }
}

#l::  ; Win+l - focus right window
{
    window := FindWindowInDirection("right")
    if (window && window.hwnd) {
        WinActivate(window.hwnd)
    }
}
