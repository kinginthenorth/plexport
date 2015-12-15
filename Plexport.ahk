#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode 2 ; Sets the title match mode to "contains" rather than "starts with"
#NoTrayIcon


; For the sake of file management, I've split the script into several horcruxes. It's just a lot
; easier to flip between tabs than to keep scrolling up and down this enormous single file. Most
; if not all of these scripts will bomb if you try to run them directly, because they all use
; references that are defined in a separate file. In other words, these files aren't separate
; objects at all; they're just parts of a single script, split up into parts.

#Include %A_ScriptDir%
#Include Inc/AllSettings.ahk
#Include Inc/BuildGui.ahk
#Include Inc/ImportFile.ahk
#Include Inc/QueryDB.ahk
#Include Inc/NameFile.ahk
#Include Inc/Rock.ahk
#Include Inc/Settings.ahk
#Include Inc/ErrorBomb!.ahk
#Include Inc/WTF.ahk

Mod:
    Run %A_ScriptDir%
	Run notepad++.exe Settings.ini
    If Not A_IsCompiled
    {   ; We're running off the script file and not the exe, so these are available
        Run notepad++.exe Plexport.ahk
        Run notepad++.exe inc\AllSettings.ahk
        Run notepad++.exe inc\BuildGui.ahk
        Run notepad++.exe inc\ImportFile.ahk
        Run notepad++.exe inc\QueryDB.ahk
        Run notepad++.exe inc\NameFile.ahk
        Run notepad++.exe inc\ErrorBomb!.ahk
        Run notepad++.exe inc\Rock.ahk
        Run notepad++.exe inc\Settings.ahk
        Run notepad++.exe inc\WTF.ahk
    }
	ExitApp
Return
