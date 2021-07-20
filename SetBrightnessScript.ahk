#SingleInstance, force  ;Reload without popup message
dimmed := 0
GroupAdd, highBrightness, ahk_exe Code.exe
GroupAdd, highBrightness, ahk_exe Postman.exe
GroupAdd, highBrightness, ahk_exe Tableplus.exe
GroupAdd, highBrightness, ahk_exe Spotify.exe

Loop
{
    sleep 50  # run loop every 50ms
    IfWinActive ahk_group highBrightness
    {
        if (dimmed = 0)
        {
            dimmed = 1
            Run, C:\Program Files (x86)\ClickMonitorDDC\ClickMonitorDDC_7_2.exe 1 b 95
        }
    } else {
        if (dimmed = 1)
        {
            dimmed = 0
            Run, C:\Program Files (x86)\ClickMonitorDDC\ClickMonitorDDC_7_2.exe 1 b 45
        }
    }
}