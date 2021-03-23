; PT_Fancyfonter.ahk:
; AutoHotkey script that allows you to type different styled text.
; Author: The Cornois <cornoishelp@outlook.com>
; Copyright 2021 The Cornois
; License: Apache License, Version 2.0

#Persistent
#SingleInstance,Force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;Default Status
font = Default
modifier = Default
history = nothing
RunOnStartUp = 0
Show = 1
global CurrentCursor := 0

;Default Hotkeys
OldPreferencesPath := A_ScriptDir . "\Preferences.ini"
PreferencesPath := A_Appdata . "\PTFancyFonter\Preferences.ini"

IfExist, %A_ScriptDir%\Preferences.ini
;If old preferences exist, transfer to new
{
    IniRead, Startedupfirst, %A_ScriptDir%\Preferences.ini, Preferences, FirstStartUp
    IniRead, HotkeyBold, %A_ScriptDir%\Preferences.ini, Hotkeys, HotkeyBold
    IniRead, HotkeyItalics, %A_ScriptDir%\Preferences.ini, Hotkeys, HotkeyItalics
    IniRead, HotkeyUnderline, %A_ScriptDir%\Preferences.ini, Hotkeys, HotkeyUnderline
    IniRead, HotkeyStrikethrough, %A_ScriptDir%\Preferences.ini, Hotkeys, HotkeyStrikethrough
    IniRead, HotkeyDefault, %A_ScriptDir%\Preferences.ini, Hotkeys, HotkeyDefault
    IniRead, HotkeyTNR, %A_ScriptDir%\Preferences.ini, Hotkeys, HotkeyTNR
    IniRead, HotkeyCursive, %A_ScriptDir%\Preferences.ini, Hotkeys, HotkeyCursive
    IniRead, HotkeyFraktur, %A_ScriptDir%\Preferences.ini, Hotkeys, HotkeyFraktur
    IniRead, HotkeyCN, %A_ScriptDir%\Preferences.ini, Hotkeys, HotkeyCN
    IniRead, HotkeyDS, %A_ScriptDir%\Preferences.ini, Hotkeys, HotkeyDS
    FileCreateDir, %A_Appdata%\PTFancyFonter
    IniWrite, 1, %A_Appdata%\PTFancyFonter\Preferences.ini, Preferences, FirstStartUp
    IniWrite, "%RunOnStartUp%", %A_Appdata%\PTFancyFonter\Preferences.ini, Preferences, RunOnStartUp
    IniWrite, "%HotkeyBold%", %A_Appdata%\PTFancyFonter\Preferences.ini, Hotkeys, HotkeyBold
    IniWrite, "%HotkeyItalics%", %A_Appdata%\PTFancyFonter\Preferences.ini, Hotkeys, HotkeyItalics
    IniWrite, "%HotkeyUnderline%", %A_Appdata%\PTFancyFonter\Preferences.ini, Hotkeys, HotkeyUnderline
    IniWrite, "%HotkeyStrikethrough%", %A_Appdata%\PTFancyFonter\Preferences.ini, Hotkeys, HotkeyStrikethrough
    IniWrite, "%HotkeyDefault%", %A_Appdata%\PTFancyFonter\Preferences.ini, Hotkeys, HotkeyDefault
    IniWrite, "%HotkeyTNR%", %A_Appdata%\PTFancyFonter\Preferences.ini, Hotkeys, HotkeyTNR
    IniWrite, "%HotkeyCursive%", %A_Appdata%\PTFancyFonter\Preferences.ini, Hotkeys, HotkeyCursive
    IniWrite, "%HotkeyFraktur%", %A_Appdata%\PTFancyFonter\Preferences.ini, Hotkeys, HotkeyFraktur
    IniWrite, "%HotkeyCN%", %A_Appdata%\PTFancyFonter\Preferences.ini, Hotkeys, HotkeyCN
    IniWrite, "%HotkeyCN%", %A_Appdata%\PTFancyFonter\Preferences.ini, Hotkeys, HotkeyDS
    FileDelete, %A_ScriptDir%\Preferences.ini
}
else IfExist, %A_Appdata%\PTFancyFonter\Preferences.ini
;If new preferences exist, read them instead
{
    IniRead, Startedupfirst, %A_Appdata%\PTFancyFonter\Preferences.ini, Preferences, FirstStartUp
    IniRead, RunOnStartUp, %A_Appdata%\PTFancyFonter\Preferences.ini, Preferences, RunOnStartUp
    IniRead, HotkeyBold, %A_Appdata%\PTFancyFonter\Preferences.ini, Hotkeys, HotkeyBold
    IniRead, HotkeyItalics, %A_Appdata%\PTFancyFonter\Preferences.ini, Hotkeys, HotkeyItalics
    IniRead, HotkeyUnderline, %A_Appdata%\PTFancyFonter\Preferences.ini, Hotkeys, HotkeyUnderline
    IniRead, HotkeyStrikethrough, %A_Appdata%\PTFancyFonter\Preferences.ini, Hotkeys, HotkeyStrikethrough
    IniRead, HotkeyDefault, %A_Appdata%\PTFancyFonter\Preferences.ini, Hotkeys, HotkeyDefault
    IniRead, HotkeyTNR, %A_Appdata%\PTFancyFonter\Preferences.ini, Hotkeys, HotkeyTNR
    IniRead, HotkeyCursive, %A_Appdata%\PTFancyFonter\Preferences.ini, Hotkeys, HotkeyCursive
    IniRead, HotkeyFraktur, %A_Appdata%\PTFancyFonter\Preferences.ini, Hotkeys, HotkeyFraktur
    IniRead, HotkeyCN, %A_Appdata%\PTFancyFonter\Preferences.ini, Hotkeys, HotkeyCN
    IniRead, HotkeyDS, %A_Appdata%\PTFancyFonter\Preferences.ini, Hotkeys, HotkeyDS
}
IfNotExist, %A_Appdata%\PTFancyFonter\Preferences.ini
;If none exist, write to new preference
{
    IfNotExist, %A_ScriptDir%\Preferences.ini
    {
        IniWrite, "%Startedupfirst%", %A_Appdata%\PTFancyFonter\Preferences.ini, Preferences, FirstStartUp
        IniWrite, 1 %A_Appdata%\PTFancyFonter\Preferences.ini, Preferences, RunOnStartUp
        IniWrite, "!b", %A_Appdata%\PTFancyFonter\Preferences.ini, Hotkeys, HotkeyBold
        IniWrite, "!i", %A_Appdata%\PTFancyFonter\Preferences.ini, Hotkeys, HotkeyItalics
        IniWrite, "!u", %A_Appdata%\PTFancyFonter\Preferences.ini, Hotkeys, HotkeyUnderline
        IniWrite, "!s", %A_Appdata%\PTFancyFonter\Preferences.ini, Hotkeys, HotkeyStrikethrough
        IniWrite, "+Escape", %A_Appdata%\PTFancyFonter\Preferences.ini, Hotkeys, HotkeyDefault
        IniWrite, "", %A_Appdata%\PTFancyFonter\Preferences.ini, Hotkeys, HotkeyTNR
        IniWrite, "", %A_Appdata%\PTFancyFonter\Preferences.ini, Hotkeys, HotkeyCursive
        IniWrite, "", %A_Appdata%\PTFancyFonter\Preferences.ini, Hotkeys, HotkeyFraktur
        IniWrite, "", %A_Appdata%\PTFancyFonter\Preferences.ini, Hotkeys, HotkeyCN
        IniWrite, "", %A_Appdata%\PTFancyFonter\Preferences.ini, Hotkeys, HotkeyDS
    }
}

if (RunOnStartUp = 1)
{
    IniWrite, "%RunOnStartUp%", %A_Appdata%\PTFancyFonter\Preferences.ini, Preferences, RunOnStartUp
    ifExist, %A_Appdata%\Microsoft\Windows\Start Menu\Programs\Startup\PT Fancyfonter.lnk
    {
        Nonsense = 1
    }
    else
    {
        FileCreateShortcut, %A_ScriptFullPath%, %A_Appdata%\Microsoft\Windows\Start Menu\Programs\Startup\PT Fancyfonter.lnk,,, Startup shortcut for PT Fancyfonter, %A_ScriptDir%\Assets\Icon.ico, 
    }
}

if (HotkeyItalics != "")
{
    Hotkey, If
    Hotkey, %HotkeyItalics% , Italics_Checked
}
else
{
    Nonsense = 1
}

if (HotkeyUnderline != "")
{
    Hotkey, If
    Hotkey, %HotkeyUnderline% , Underline_Checked
}
else
{
    Nonsense = 1
}

if (HotkeyStrikethrough != "")
{
    Hotkey, If
    Hotkey, %HotkeyStrikethrough% , Strikethrough_Checked
}
else
{
    Nonsense = 1
}

if (HotkeyDefault != "")
{
    Hotkey, If
    Hotkey, %HotkeyDefault% , Default_Checked
}
else
{
    Nonsense = 1
}

if (HotkeyTNR != "")
{
    Hotkey, If
    Hotkey, %HotkeyTNR% , TNR_Checked
}
else
{
    Nonsense = 1
}

if (HotkeyCursive != "")
{
    Hotkey, If
    Hotkey, %HotkeyCursive% , Cursive_Checked
}
else
{
    Nonsense = 1
}

if (HotkeyFraktur != "")
{
    Hotkey, If
    Hotkey, %HotkeyFraktur% , Fraktur_Checked
}
else
{
    Nonsense = 1
}

if (HotkeyCN != "")
{
    Hotkey, If
    Hotkey, %HotkeyCN% , CN_Checked
}
else
{
    Nonsense = 1
}

if (HotkeyDS != "")
{
    Hotkey, If
    Hotkey, %HotkeyDS% , DS_Checked
}
else
{
    Nonsense = 1
}


;Capslock
SetCapsLockState, Off
Caps = Off

;Modifiers
Bold_M = 0
Italics_M = 0
Underline_M = 0
Strikethrough_M = 0

;Simplification Variables:
TNR_F:= % chr(0x1D413)chr(0x1D422)chr(0x1D426)chr(0x1D41E)chr(0x1D42C)chr(0x2004)chr(0x1D40D)chr(0x1D41E)chr(0x1D430)chr(0x2004)chr(0x1D411)chr(0x1D428)chr(0x1D426)chr(0x1D41A)chr(0x1D427)

Cursive_F:= % chr(0x1D49E)chr(0x1D4CA)chr(0x1D4C7)chr(0x1D4C8)chr(0x1D4BE)chr(0x1D4CB)chr(0x1D452)

Fraktur_F:= % chr(0x1D509)chr(0x1D52F)chr(0x1D51E)chr(0x1D528)chr(0x1D531)chr(0x1D532)chr(0x1D52F)

CN_F:= % chr(0x1D672)chr(0x1D698)chr(0x1D69E)chr(0x1D69B)chr(0x1D692)chr(0x1D68E)chr(0x1D69B)chr(0x2004)chr(0x1D67D)chr(0x1D68E)chr(0x1D6A0)

DS_F:= % chr(0x1D53B)chr(0x1D560)chr(0x1D566)chr(0x1D553)chr(0x1D55D)chr(0x1D556)chr(0x002D)chr(0x1D564)chr(0x1D565)chr(0x1D563)chr(0x1D566)chr(0x1D554)chr(0x1D55C)

Bolded_M := % chr(0x1D5EF)chr(0x1D5FC)chr(0x1D5F9)chr(0x1D5F1)chr(0x1D5F2)chr(0x1D5F1)

Italicized_M := % chr(0x1D62A)chr(0x1D635)chr(0x1D622)chr(0x1D62D)chr(0x1D62A)chr(0x1D624)chr(0x1D62A)chr(0x1D63B)chr(0x1D626)chr(0x1D625)

Bold_Fraktur_F := % chr(0x1D571)chr(0x1D597)chr(0x1D586)chr(0x1D590)chr(0x1D599)chr(0x1D59A)chr(0x1D597)

Bold_Cursive_F := % chr(0x1D4D2)chr(0x1D4FE)chr(0x1D4FB)chr(0x1D4FC)chr(0x1D4F2)chr(0x1D4FF)chr(0x1D4EE)

Sleep, 500

;===================================================================;

;Main Gui Window

;===================================================================;
Gui, +AlwaysOnTop
Gui, Font, S12 CDefault Bold Underline, Segoe UI
Gui, Add, Text, x12 y55 w180 h24 , Fonts:
Gui, Add, Text, x51 y1 w180 h24 , Modifiers:

Gui, Font, , 
Gui, Font, S20, Calibri, ,

;Info Button
Gui, Font, , 
Gui, Font, S20 C78a7c4, Calibri, ,
Gui, Add, Text, x160 y-8 w30 h30 vInfo gOpenInfo, % chr(0x1F6C8)
Gui, Font, , 
Gui, Font, S20, Calibri, ,

;Bold Checkbox
Gui, Add, Picture, x15 y26 w28 h28 hwndh1 vBold_Checked gBold_Checked, %A_ScriptDir%\Assets\Buttons\Bold.png
Gui, Submit, NoHide
Bold_Checked_TT := "Bold"

;Italic Checkbox
Gui, Add, Picture, x55 y26 w28 h28 hwndh2 vItalics_Checked gItalics_Checked, %A_ScriptDir%\Assets\Buttons\Italics.png
Gui, Submit, NoHide
Italics_Checked_TT := "Italics"

;Underline Checkbox
Gui, Add, Picture, x95 y26 w28 h28 hwndh3 vUnderline_Checked gUnderline_Checked, %A_ScriptDir%\Assets\Buttons\Underline.png
Gui, Submit, NoHide
Underline_Checked_TT := "Underline"

;Strikethrough Button
Gui, Add, Picture, x135 y26 w28 h28 hwndh4 vStrikethrough_Checked gStrikethrough_Checked, %A_ScriptDir%\Assets\Buttons\Strikethrough.png
Gui, Submit, NoHide
Strikethrough_Checked_TT := "Strikethrough"

;Default Radio
Gui, Font, , 
Gui, Font, S13, Calibri
Gui, Add, Radio, x12 y80 w144 h15 hwndh5 Checked vDefault gDefault_Checked, Default

;Times New Roman Radio
Gui, Font, S13 CDefault, Times New Roman
Gui, Add, Radio, x12 y103 w180 h15 hwndh6 vTNR gTNR_Checked , %TNR_F%
Gui, Submit, NoHide

;Cursive Radio
Gui, Font, S14 CDefault, Times New Roman
Gui, Add, Radio, x12 y126 w144 h15 hwndh7 vCursive gCursive_Checked , %Cursive_F%

;Fraktur Radio
Gui, Add, Radio, x12 y149 w144 h15 hwndh8 vFraktur gFraktur_Checked, %Fraktur_F%

;Courier New Radio
Gui, Add, Radio, x12 y172 w144 h15 hwndh9 vCN gCN_Checked, %CN_F%

;Double-struck Radio
Gui, Add, Radio, x12 y195 w144 h15 hwndh10 vDS gDS_Checked, %DS_F%

if (Startedupfirst != 1)
{
    Gui 2: Show, w690 h490, Help
    Startedupfirst = 1
    IniWrite, "%Startedupfirst%", %A_Appdata%\PTFancyFonter\Preferences.ini, Preferences, FirstStartUp
}
if (Startedupfirst == 1)
{
    Gui, Show, w180 h220, % chr(0x0020)
}

if (HotkeyBold != "")
{
    Hotkey, If
    Hotkey, %HotkeyBold% , Bold_Checked
}
else
{
    Nonsense = 1
}

OnMessage(0x200, "WM_MOUSEMOVE")
OnMessage(0x20,  "WM_SETCURSOR")

;Tray Icon
#Persistent
SetTitleMatchMode, 2
Menu, Tray, NoStandard
Menu, Tray, Icon, %A_ScriptDir%\Assets\Icon.ico

Menu, Tray, Add, &Toggle Popup On/Off, Show
Menu, Tray, Click, 1

Menu, Tray, Add, &About, OpenAbout
Menu, Tray, Add, &Exit, Exit

Menu, Tray, Default, &Toggle Popup On/Off
Menu, Tray, Add,

;===================================================================;

;Help Contents Window

;===================================================================;

Gui 2:+AlwaysOnTop
Gui 2:Font, s35 w600, Tahoma
Gui 2:Add, Text, x80 y24 w609 h74 +0x200, Welcome!
Gui 2:Font
Gui 2:Add, Text, x8 y104 w784 h2 +0x10
Gui 2:Font, s12, Segoe UI
Gui 2:Add, Text, x79 y130 w609 h25 +0x200, Welcome to PT Fancyfonter!
Gui 2:Font
Gui 2:Font, s12, Segoe UI
Gui 2:Add, Text, x80 y160 w615 h38 +0x200, This is the help page.
Gui 2:Font
Gui 2:Font, s20 Underline q5, Segoe UI
Gui 2:Add, Text, x80 y200 w244 h51 +0x200, Contents:

;Icon
Gui 2:Font
Gui 2:Font, s15 w500, Segoe UI
Gui 2:Add, Picture, x440 y165 w180 h180, %A_ScriptDir%\Assets\Icon.ico
Gui 2:Add, Button, x455 y385 w150 h35 gOpenMenu1, Use the tool!

;Run on Startedup
Gui 2:Font, s11 w500, Segoe UI
Gui 2:Add, Checkbox, x467 y350 w150 h35 Checked%RunOnStartUp% vRunOnStartUp gRunOnStartUp, Run on start-up

;Usage Button
Gui 2:Font
Gui 2:Font, s16 c1e83d8, Segoe Ui
Gui 2:Add, Text, x80 y250 w100 h40 vUsage gOpenUsage, % chr(0x1F852) "  Usage"
Usage_TT := ""

;Hotkeys Button
Gui 2:Add, Text, x80 y300 w120 h40 vHotkeys gOpenHotkeys, % chr(0x1F852) "  Hotkeys"
Hotkeys_TT := ""

;Limitations Button
Gui 2:Add, Text, x80 y350 w145 h40 vLimitations gOpenLimitations, % chr(0x1F852) "  Limitations"
Limitations_TT := ""

;About Button
Gui 2:Add, Text, x80 y400 w240 h40 vAbout gOpenAbout, % chr(0x1F852) "  About PT Fancyfonter"
About_TT := ""
Gui 2:Font

;Copyright
Gui 2:Font, s8 c737373, Segoe Ui
Gui 2: Add, StatusBar, , % " Copyright " chr(0x00A9) " 2021 The Cornois                                                                                                  Available under the Apache License, Version 2.0"
;===================================================================;

;Help Usage Window

;===================================================================;

;Title
Gui 3:+AlwaysOnTop
Gui 3:Font, s35 w600, Tahoma
Gui 3:Add, Text, x64 y5 w604 h74 +0x200, Usage
Gui 3:Add, Text, x8 y80 w784 h2 +0x10

;Back to Contents
Gui 3:Font
Gui 3:Font, s15 c1e83d8, Segoe UI
Gui 3:Add, Text, x40 y85 w200 h34 gOpenInfoUsage, % chr(0x1F850) " Back to Contents"

; Applying fonts and modifiers
Gui 3:Font, 
Gui 3:Font, s16 w600, Tahoma
Gui 3:Add, Text, x70 y115 w609 h34 +0x200, Applying fonts and modifiers:
Gui 3:Font, 
Gui 3:Font, s12, Segoe UI
Gui 3:Add, Text, x70 y145 w608 h30 +0x200, You can apply a modifier by clicking on it, click it again to unapply it.
Gui 3:Add, Text, x70 y170 w608 h30 +0x200, You can click on a font to apply it, click a different font to switch to it.

;Pop-up
Gui 3:Font
Gui 3:Font, s16 w600, Tahoma
Gui 3:Add, Text, x70 y210 w609 h34 +0x200, Showing the Popup:
Gui 3:Font
Gui 3:Font, s12, Segoe UI
Gui 3:Add, Text, x70 y240 w608 h30 +0x200, Click on the icon in the tray to show the popup menu.
Gui 3:Add, Picture, x72 y275 w503 h47, %A_ScriptDir%\Assets\Tray.png
Gui 3:Add, Text, x70 y320 w588 h35 +0x200, If you do not see it, click the arrow in the tray to show all hidden icons.
Gui 3:Font

;Hotkeys
;Pop-up
Gui 3:Font
Gui 3:Font, s16 w600, Tahoma
Gui 3:Add, Text, x70 y355 w609 h34 +0x200, Customizing Hotkeys:
Gui 3:Font
Gui 3:Font, s12, Segoe UI
Gui 3:Add, Text, x70 y385 w620 h24 +0x200, Click on the hotkey you want to change, and type your key combination.
Gui 3:Add, Text, x70 y410 w620 h24 +0x200, If you made a mistake, click the reset button.
Gui 3:Add, Text, x70 y440 w620 h24 +0x200, Remember to click the save button!
Gui 3:Font

Gui 3:Hide

;===================================================================;

;Help Hotkeys Window

;===================================================================;

;Title
Gui 4:+AlwaysOnTop
Gui 4:Font, s35 w600, Tahoma
Gui 4:Add, Text, x64 y14 w604 h74, Hotkeys
Gui 4:Font
Gui 4:Add, Text, x8 y110 w784 h2 +0x10

;Modifiers Title
Gui 4:Font
Gui 4:Font, s18 Bold Underline, Segoe UI
Gui 4:Add, Text, x56 y116 w285 h34 +0x200, Toggling Modifiers:

;Back to Contents
Gui 4:Font
Gui 4:Font, s15 c1e83d8, Segoe UI
Gui 4:Add, Text, x40 y75 w200 h24 gOpenInfoHotkeys, % chr(0x1F850) " Back to Contents"

;Bold Hotkey
Gui 4:Font
Gui 4:Font, s14 w600, Segoe UI
Gui 4:Add, Text, x56 y150 w285 h40 +0x200, Toggling Bold:
Gui 4:Font
Gui 4:Font, s10, Calibri
Gui 4:Add, Hotkey, x56 y182 w194 h22 vHotkeyBold, %HotkeyBold%
Gui 4:Add, Button, x250 y182 w80 h22 vResetBold gResetBold, Reset

;Italics Hotkey
Gui 4:Font
Gui 4:Font, s14 w600, Segoe UI
Gui 4:Add, Text, x56 y214 w285 h40 +0x200, Toggling Italics:
Gui 4:Font
Gui 4:Font, s10, Calibri
Gui 4:Add, Hotkey, x56 y246 w194 h22 vHotkeyItalics, %HotkeyItalics%
Gui 4:Add, Button, x250 y246 w80 h22 vResetItalics gResetItalics, Reset

;Underline Hotkey
Gui 4:Font
Gui 4:Font, s14 w600, Segoe UI
Gui 4:Add, Text, x56 y278 w285 h40 +0x200, Toggling Underline:
Gui 4:Font
Gui 4:Font, s10, Calibri
Gui 4:Add, Hotkey, x56 y310 w194 h22 vHotkeyUnderline, %HotkeyUnderline%
Gui 4:Add, Button, x250 y310 w80 h22 gResetUnderline, Reset

;Strikethrough Hotkey
Gui 4:Font
Gui 4:Font, s14 w600, Segoe UI
Gui 4:Add, Text, x56 y342 w285 h40 +0x200, Toggling Strikethrough:
Gui 4:Font
Gui 4:Font, s10, Calibri
Gui 4:Add, Hotkey, x56 y374 w194 h22 vHotkeyStrikethrough, %HotkeyStrikethrough%
Gui 4:Add, Button, x250 y374 w80 h22 gResetStrikethrough, Reset

;Vertical Split
Gui 4:Add, Text, x345 y120 w2 h325 +0x1 +0x10

;Fonts Title
Gui 4:Font, s18 Bold Underline, Segoe UI
Gui 4:Add, Text, x376 y113 w285 h34 +0x200, Switching Fonts:

;Default Font
Gui 4:Font
Gui 4:Font, s12 w600, Segoe UI
Gui 4:Add, Text, x376 y146 w285 h24 +0x200, Default Font:
Gui 4:Font
Gui 4:Font, s10, Calibri
Gui 4:Add, Hotkey, x376 y170 w204 h22 vHotkeyDefault, %HotkeyDefault%
Gui 4:Add, Button, x580 y170 w80 h22 gResetDefault, Reset

;Times New Roman Font
Gui 4:Font
Gui 4:Font, s12 , Segoe UI
Gui 4:Add, Text, x376 y194 w285 h24 +0x200 , %TNR_F%:
Gui 4:Font
Gui 4:Font, s10, Calibri
Gui 4:Add, Hotkey, x376 y218 w204 h22 vHotkeyTNR, %HotkeyTNR%
Gui 4:Add, Button, x580 y218 w80 h22 gResetTNR, Reset

;Cursive Font
Gui 4:Font, s12 , Segoe UI
Gui 4:Add, Text, x376 y242 w285 h24 +0x200 , %Bold_Cursive_F%:
Gui 4:Font
Gui 4:Font, s10, Calibri
Gui 4:Add, Hotkey, x376 y266 w204 h22 vHotkeyCursive, %HotkeyCursive%
Gui 4:Add, Button, x580 y266 w80 h22 gResetCursive, Reset

;Fraktur Font
Gui 4:Font, s12, Segoe UI
Gui 4:Add, Text, x376 y290 w285 h24 +0x200 , %Bold_Fraktur_F%:
Gui 4:Font
Gui 4:Font, s10, Calibri
Gui 4:Add, Hotkey, x376 y314 w204 h22 vHotkeyFraktur, %HotkeyFraktur%
Gui 4:Add, Button, x580 y314 w80 h22 gResetFraktur, Reset

;Courier New Font
Gui 4:Font, s12 w600, Segoe UI
Gui 4:Add, Text, x376 y338 w285 h24 +0x200 , %CN_F%:
Gui 4:Font
Gui 4:Font, s10, Calibri
Gui 4:Add, Hotkey, x376 y362 w204 h22 vHotkeyCN, %HotkeyCN%
Gui 4:Add, Button, x580 y362 w80 h22 gResetCN, Reset

;Double-struck Font
Gui 4:Font, s12 , Segoe UI
Gui 4:Add, Text, x376 y386 w285 h24 +0x200 , %DS_F%:
Gui 4:Font
Gui 4:Font, s10, Calibri
Gui 4:Add, Hotkey, x376 y410 w204 h22 vHotkeyDS, %HotkeyDS%
Gui 4:Add, Button, x580 y410 w80 h22 gResetDS, Reset

;SaveButton
Gui 4:Font, s15 , Segoe UI
Gui 4:Add, Button, x250 y445 w190 h40 gSaveChanges, Save Changes

Gui 4:Hide

;===================================================================;

;Help Limitations Window

;===================================================================;
;Title
Gui 5:+AlwaysOnTop
Gui 5:Font, s35 w600, Tahoma
Gui 5:Add, Text, x64 y5 w604 h74 +0x200, Limitations
Gui 5:Add, Text, x8 y80 w784 h2 +0x10

;Back to Contents
Gui 5:Font
Gui 5:Font, s14 c1e83d8, Segoe UI
Gui 5:Add, Text, x70 y85 w200 h34 gOpenInfoLimitations, % chr(0x1F850) " Back to Contents"

; Applying fonts and modifiers
Gui 5:Font, 
Gui 5:Font, s16 w650, Segoe UI
Gui 5:Add, Text, x75 y107 w609 h34 +0x200, Why are there limitations?
Gui 5:Font, 
Gui 5:Font, s12, Segoe UI
Gui 5:Add, Text, x75 y138 w600 h400, There are limitations for modifiers that you can toggle for certain fonts. `nThis is because each letter of a different combination of font and modifier is its own separate Unicode character (a symbol, basically) and not all characters for every combination of font and modifier exist.
Gui 5:Font, s16 w650 Underline, Segoe UI
Gui 5:Add, Text, x75 y235 w608 h25 +0x200, Here is a list of all of the limitations:
Gui 5:Font,
Gui 5:Font, s12, Segoe UI
Gui 5:Add, Picture, x82 y270 w332 h195, %A_ScriptDir%\Assets\Limitations Chart.png

;===================================================================;

;About Window

;===================================================================;
;Title
Gui 6:+AlwaysOnTop
Gui 6:Font, s35 w600, Tahoma
Gui 6:Add, Text, x64 y15 w604 h74 +0x200, About PT Fancyfonter
Gui 6:Add, Text, x8 y95 w784 h2 +0x10

;Back to Contents
Gui 6:Font
Gui 6:Font, s15 c1e83d8, Segoe UI
Gui 6:Add, Text, x70 y100 w200 h34 gOpenInfoAbout, % chr(0x1F850) " Back to Contents"

;Version Number and Updates
Gui 6:Add, Picture, x85 y150 w145 h145, %A_ScriptDir%\Assets\Icon.ico
Gui 6:Font, 
Gui 6:Font, s16 w650, Segoe UI
Gui 6:Add, Text, x250 y145 w300 h34 +0x200, PT Fancyfonter:
Gui 6:Font, 
Gui 6:Font, s14, Segoe UI
Gui 6:Add, Text, x250 y180 w300 h24 +0x200, Version: 3.4
Gui 6:Add, Text, x250 y209 w300 h24 +0x200, You can check for updates at:
Gui 6:Font, s11, Segoe UI
Gui 6:Add, Link, x250 y230 w400 h24 +0x200, <a href="https://thecornois.weebly.com">https://thecornois.weebly.com</a>
Gui 6:Font, s14, Segoe UI
Gui 6:Add, Text, x250 y255 w125 h24 +0x200, Github Repo: 
Gui 6:Font, s11, Segoe UI
Gui 6:Add, Link, x250 y278 w300 h20 +0x200, <a href="https://github.com/thecornois/pt-fancyfonter">https://github.com/thecornois/pt-fancyfonter</a>at:


;Name Origin
Gui 6:Font, 
Gui 6:Font, s16 w650, Segoe UI
Gui 6:Add, Text, x75 y340 w609 h34 +0x200, What does the "PT" stand for in PT Fancyfonter?
Gui 6:Font, 
Gui 6:Font, s12, Segoe UI
Gui 6:Add, Text, x75 y375 w608 h25 +0x200, The "PT" in PT Fancyfonter stands for plain text because this desktop application
Gui 6:Add, Text, x75 y400 w608 h25 +0x200, was designed to be an alternative to RTF (Rich Text Formatting) for plain text.
Gui 6:Add, Text, x75 y425 w608 h25 +0x200, characters for every combination of font and modifier exist.

;Copyright
Gui 6:Font, s8 c737373, Segoe Ui
Gui 6: Add, StatusBar, , % " Copyright " chr(0x00A9) " 2021 The Cornois                                                                                                  Available under the Apache License, Version 2.0"
return

;gLabels for Gui
OpenInfo:
Gui 2:Show, w690 h490, Help
return

OpenInfoUsage:
WinGetPos, X, Y,,, Usage
Gui 2:Show, x%X% y%Y% w690 h490, Help
Gui 3:Hide
return

OpenInfoHotkeys:
WinGetPos, X, Y,,, Hotkey
Gui 2:Show, x%X% y%Y% w690 h490, Help
Gui 4:Hide
return

OpenInfoLimitations:
WinGetPos, X, Y,,, Limitations
Gui 2:Show, x%X% y%Y% w690 h490, Help
Gui 5:Hide
return

OpenInfoAbout:
WinGetPos, X, Y,,, About
Gui 2:Show, x%X% y%Y% w690 h490, Help
Gui 6:Hide
return

OpenUsage:
IfWinExist, Help
{
    WinGetPos, X, Y,,, Help
    Gui 3: Show, x%X% y%Y% w690 h490, Usage
}else{
    Gui 3: Show, x%X% y%Y% w690 h490, Usage
}
Gui 2: Hide
return

OpenHotkeys:
IfWinExist, Help
{
    WinGetPos, X, Y,,, Help
    Gui 4: Show, x%X% y%Y% w690 h490, Hotkeys
}else{
    Gui 4: Show, x%X% y%Y% w690 h490, Hotkeys
}
Gui 2: Hide
return

OpenLimitations:
IfWinExist, Help
{
    WinGetPos, X, Y,,, Help
    Gui 5: Show, x%X% y%Y% w690 h490, Limitations
}else{
    Gui 5: Show, x%X% y%Y% w690 h490, Limitations
}
Gui 2: Hide
return

OpenAbout:
IfWinExist, Help
{
    WinGetPos, X, Y,,, Help
    Gui 6: Show, x%X% y%Y% w690 h490, About
}else{
    Gui 6: Show, w690 h490, About
}
Gui 2: Hide
return

OpenMenu1:
Gui 2: Hide
Gui 1: Show, w180 h220, % chr(0x0020)
return

SubmitAll:
Gui, Submit, NoHide
return

RunOnStartUp:
RunOnStartUp := !RunOnStartUp
if (RunOnStartUp = 1){
    IniWrite, "%RunOnStartUp%", %A_Appdata%\PTFancyFonter\Preferences.ini, Preferences, RunOnStartUp
    FileCreateShortcut, %A_ScriptFullPath%, %A_Appdata%\Microsoft\Windows\Start Menu\Programs\Startup\PT Fancyfonter.lnk,,, Startup shortcut for PT Fancyfonter, %A_ScriptDir%\Assets\Icon.ico, 
}
else if (RunOnStartup = 0){
    IniWrite, "%RunOnStartUp%", %A_Appdata%\PTFancyFonter\Preferences.ini, Preferences, RunOnStartUp
    FileDelete, %A_Appdata%\Microsoft\Windows\Start Menu\Programs\Startup\PT Fancyfonter.lnk
}
return

F9::
Tooltip, Run on start up: %RunOnStartUp%
return

#s::
Show:
Show := !Show

if (Show == 1)
{
    Gui, Hide
}
else
   Gui, Show, w180 h220, % chr(0x0020)
Return

Exit:
    ExitApp
return

;gLabels for Hotkeys

SaveChanges:
    ;Bold Hotkey Update System
    GuiControlGet, Temp_HotkeyBold, 4:, HotkeyBold
    if (Temp_HotkeyBold != "")
    {
        HotkeyBold := Temp_HotkeyBold
        Hotkey, %HotkeyBold% , Bold_Checked,on
        if(Temp_HotkeyBold != HotkeyBold)
        {
            Hotkey, %HotkeyBold% , Bold_Checked,off
            HotkeyBold := Temp_HotkeyBold
            Hotkey, %HotkeyBold% , Bold_Checked,on
        }
        else
        {
            Nonsense = 1
        }
    }
    if (Temp_HotkeyBold = "")
    {
        HotkeyBold :=
    }
    ;Italics Hotkey Update System
    GuiControlGet, Temp_HotkeyItalics, 4:, HotkeyItalics
    if (Temp_HotkeyItalics != "")
    {
        HotkeyItalics := Temp_HotkeyItalics
        Hotkey, %HotkeyItalics% , Italics_Checked,on
        if(Temp_HotkeyItalics != HotkeyItalics)
        {
            Hotkey, %HotkeyItalics% , Italics_Checked,off
            HotkeyItalics := Temp_HotkeyItalics
            Hotkey, %HotkeyItalics% , Italics_Checked,on
        }
        else
        {
            Nonsense = 1
        }
    }
    if (Temp_HotkeyItalics = "")
    {
        HotkeyItalics :=
    }

    ;Underline Hotkey Update System
    GuiControlGet, Temp_HotkeyUnderline, 4:, HotkeyUnderline
    if (Temp_HotkeyUnderline != "")
    {
        HotkeyUnderline := Temp_HotkeyUnderline
        Hotkey, %HotkeyUnderline% , Underline_Checked,on
        if(Temp_HotkeyUnderline != HotkeyUnderline)
        {
            Hotkey, %HotkeyUnderline% , Underline_Checked,off
            HotkeyUnderline := Temp_HotkeyUnderline
            Hotkey, %HotkeyUnderline% , Underline_Checked,on
        }
        else
        {
            Nonsense = 1
        }
    }
    if (Temp_HotkeyUnderline = "")
    {
        HotkeyUnderline :=
    }

    ;Strikethrough Hotkey Update System
    GuiControlGet, Temp_HotkeyStrikethrough, 4:, HotkeyStrikethrough
    if (Temp_HotkeyStrikethrough != "")
    {
        HotkeyStrikethrough := Temp_HotkeyStrikethrough
        Hotkey, %HotkeyStrikethrough% , Strikethrough_Checked,on
        if(Temp_HotkeyStrikethrough != HotkeyStrikethrough)
        {
            Hotkey, %HotkeyStrikethrough% , Strikethrough_Checked,off
            HotkeyStrikethrough := Temp_HotkeyStrikethrough
            Hotkey, %HotkeyStrikethrough% , Strikethrough_Checked,on
        }
        else
        {
            Nonsense = 1
        }
    }
    if (Temp_HotkeyStrikethrough = "")
    {
        HotkeyStrikethrough :=
    }

    ;Default Hotkey Update System
    GuiControlGet, Temp_HotkeyDefault, 4:, HotkeyDefault
    if (Temp_HotkeyDefault != "")
    {
        HotkeyDefault := Temp_HotkeyDefault
        Hotkey, %HotkeyDefault% , Default_Checked,on
        if(Temp_HotkeyDefault != HotkeyDefault)
        {
            Hotkey, %HotkeyDefault% , Default_Checked,off
            HotkeyDefault := Temp_HotkeyDefault
            Hotkey, %HotkeyDefault% , Default_Checked,on
        }
        else
        {
            Nonsense = 1
        }
    }
    if (Temp_HotkeyDefault = "")
    {
        HotkeyDefault :=
    }

    ;TNR Hotkey Update System
    GuiControlGet, Temp_HotkeyTNR, 4:, HotkeyTNR
    if (Temp_HotkeyTNR != "")
    {
        HotkeyTNR := Temp_HotkeyTNR
        Hotkey, %HotkeyTNR% , TNR_Checked,on
        if(Temp_HotkeyTNR != HotkeyTNR)
        {
            Hotkey, %HotkeyTNR% , TNR_Checked,off
            HotkeyTNR := Temp_HotkeyTNR
            Hotkey, %HotkeyTNR% , TNR_Checked,on
        }
        else
        {
            Nonsense = 1
        }
    }
    if (Temp_HotkeyUnderline = "")
    {
        HotkeyUnderline :=
    }
    ;Cursive Hotkey Update System
    GuiControlGet, Temp_HotkeyCursive, 4:, HotkeyCursive
    if (Temp_HotkeyCursive != "")
    {
        HotkeyCursive := Temp_HotkeyCursive
        Hotkey, %HotkeyCursive% , Cursive_Checked,on
        if(Temp_HotkeyCursive != HotkeyCursive)
        {
            Hotkey, %HotkeyCursive% , Cursive_Checked,off
            HotkeyCursive := Temp_HotkeyCursive
            Hotkey, %HotkeyCursive% , Cursive_Checked,on
        }
        else
        {
            Nonsense = 1
        }
    }
    if (Temp_HotkeyCursive = "")
    {
        HotkeyCursive :=
    }

    ;Fraktur Hotkey Update System
    GuiControlGet, Temp_HotkeyFraktur, 4:, HotkeyFraktur
    if (Temp_HotkeyFraktur != "")
    {
        HotkeyFraktur := Temp_HotkeyFraktur
        Hotkey, %HotkeyFraktur% , Fraktur_Checked,on
        if(Temp_HotkeyFraktur != HotkeyFraktur)
        {
            Hotkey, %HotkeyFraktur% , Fraktur_Checked,off
            HotkeyFraktur := Temp_HotkeyFraktur
            Hotkey, %HotkeyFraktur% , Fraktur_Checked,on
        }
        else
        {
            Nonsense = 1
        }
    }
    if (Temp_HotkeyFraktur = "")
    {
        HotkeyFraktur :=
    }

    ;CN Hotkey Update System
    GuiControlGet, Temp_HotkeyCN, 4:, HotkeyCN
    if (Temp_HotkeyCN != "")
    {
        HotkeyCN := Temp_HotkeyCN
        Hotkey, %HotkeyCN% , CN_Checked,on
        if(Temp_HotkeyCN != HotkeyCN)
        {
            Hotkey, %HotkeyCN% , CN_Checked,off
            HotkeyCN := Temp_HotkeyCN
            Hotkey, %HotkeyCN% , CN_Checked,on
        }
        else
        {
            Nonsense = 1
        }
    }
    if (Temp_HotkeyCN = "")
    {
        HotkeyCN :=
    }

    ;DS Hotkey Update System
    GuiControlGet, Temp_HotkeyDS, 4:, HotkeyDS
    if (Temp_HotkeyDS != "")
    {
        HotkeyDS := Temp_HotkeyDS
        Hotkey, %HotkeyDS% , DS_Checked,on
        if(Temp_HotkeyDS != HotkeyDS)
        {
            Hotkey, %HotkeyDS% , DS_Checked,off
            HotkeyDS := Temp_HotkeyDS
            Hotkey, %HotkeyDS% , DS_Checked,on
        }
        else
        {
            Nonsense = 1
        }
    }
    if (Temp_HotkeyDS = "")
    {
        HotkeyDS :=
    }
    IniWrite, "%HotkeyBold%", %A_Appdata%\PTFancyFonter\Preferences.ini, Hotkeys, HotkeyBold
    IniWrite, "%HotkeyItalics%", %A_Appdata%\PTFancyFonter\Preferences.ini, Hotkeys, HotkeyItalics
    IniWrite, "%HotkeyUnderline%", %A_Appdata%\PTFancyFonter\Preferences.ini, Hotkeys, HotkeyUnderline
    IniWrite, "%HotkeyStrikethrough%", %A_Appdata%\PTFancyFonter\Preferences.ini, Hotkeys, HotkeyStrikethrough
    IniWrite, "%HotkeyDefault%", %A_Appdata%\PTFancyFonter\Preferences.ini, Hotkeys, HotkeyDefault
    IniWrite, "%HotkeyTNR%", %A_Appdata%\PTFancyFonter\Preferences.ini, Hotkeys, HotkeyTNR
    IniWrite, "%HotkeyCursive%", %A_Appdata%\PTFancyFonter\Preferences.ini, Hotkeys, HotkeyCursive
    IniWrite, "%HotkeyFraktur%", %A_Appdata%\PTFancyFonter\Preferences.ini, Hotkeys, HotkeyFraktur
    IniWrite, "%HotkeyCN%", %A_Appdata%\PTFancyFonter\Preferences.ini, Hotkeys, HotkeyCN
    IniWrite, "%HotkeyCN%", %A_Appdata%\PTFancyFonter\Preferences.ini, Hotkeys, HotkeyDS
    Sleep 10
    Reload
return

WM_SETCURSOR(wParam, lParam)
{
    IfWinExist, 
    {
        HitTest := lParam & 0xFFFF
        if (HitTest = 1 && CurrentCursor != 0)
        {
            DllCall("SetCursor", "ptr", CurrentCursor)
            return true
        }
    }
    IfWinExist, Info
    {
        HitTest := lParam & 0xFFFF
        if (HitTest = 1 && CurrentCursor != 0)
        {
            DllCall("SetCursor", "ptr", CurrentCursor)
            return true
        }
    }
}
return

WM_MOUSEMOVE()
{
    ;Cursor
    MouseGetPos, xpos, ypos
    static Hand := DllCall("LoadCursor", "ptr", 0, "ptr", 32649)
    if (A_GuiControl = "Bold_Checked" or A_GuiControl = "Italics_Checked" or A_GuiControl = "Underline_Checked" or A_GuiControl = "Strikethrough_Checked" or A_GuiControl = "Info" or A_GuiControl = "Usage" or A_GuiControl = "Hotkeys" or A_GuiControl = "Limitations" or A_GuiControl = "About"){
        CurrentCursor := Hand
    }
    else{
        CurrentCursor := 0
    }
    ;Tooltip
    static CurrControl, PrevControl, _TT
    CurrControl := A_GuiControl
    If (CurrControl <> PrevControl and not InStr(CurrControl, " "))
    {
        ToolTip
        SetTimer, DisplayToolTip, 750
        PrevControl := CurrControl
    }
    return

    DisplayToolTip:
    ifWinActive, 
    {
        SetTimer, DisplayToolTip, Off
        ToolTip % %CurrControl%_TT
        SetTimer, RemoveToolTip, 3000
    }
    return
    RemoveToolTip:
    ifWinActive, 
    {
        SetTimer, RemoveToolTip, Off
        ToolTip
    }
    return
}

ShowTT:
    ToolTip, %A_GuiControl%
    return

RemoveTT:
    ToolTip,
    return

Submit_All:
    Gui, Submit, NoHide
    return

Reload:
Reload
return

;Reseting gLabels
ResetBold:
    GuiControl, , HotkeyBold, !b
    HotkeyBold := "!b"
return

ResetItalics:
    GuiControl, , HotkeyItalics, !i
    HotkeyItalics := "!i"
return

ResetUnderline:
    GuiControl, , HotkeyUnderline, !u
    HotkeyUnderline := "!u"
return

ResetStrikethrough:
    GuiControl, , HotkeyStrikethrough, !s
    HotkeyStrikethrough := "!s"
return

ResetDefault:
    GuiControl, , HotkeyDefault, +Esc
    HotkeyDefault := "+Esc"
return

ResetTNR:
    GuiControl, , HotkeyTNR
    HotkeyTNR := ""
return

ResetCursive:
    GuiControl, , HotkeyCursive
    HotkeyCursive := ""
return

ResetFraktur:
    GuiControl, , HotkeyFraktur
    HotkeyFraktur := ""
return

ResetCN:
    GuiControl, , HotkeyCN
    HotkeyCN := ""
return

ResetDS:
    GuiControl, , HotkeyDS
    HotkeyDS := ""
return

Default_Checked:
    Default = 1
    TNR = 0
    Cursive = 0
    Fraktur = 0
    CN = 0
    DS = 0
    GuiControl, , Default, 1
    if (Default == 1)
    {
        Font = Default
        Modifier = Default
        Bold_M = 0
        Bold_Checked = 0
        GuiControl, , Bold_Checked, %A_ScriptDir%\Assets\Buttons\Bold.png

        Italics_M = 0
        Italics_Checked = 0
        GuiControl, , Italics_Checked, %A_ScriptDir%\Assets\Buttons\Italics.png

        Underline_M = 0
        Underline_Checked = 0
        GuiControl, , Underline_Checked, %A_ScriptDir%\Assets\Buttons\Underline.png

        Strikethrough_M = 0
        Strikethrough_Checked = 0
        GuiControl, , Strikethrough_Checked, %A_ScriptDir%\Assets\Buttons\Strikethrough.png
    }
Tooltip, % "Font: " . Font . "`nModifier: " . Modifier . "`nCapsLock: " . Caps
SetTimer, RemoveTT, -4000
return

TNR_Checked:
    Default = 0
    TNR = 1
    Cursive = 0
    Fraktur = 0
    CN = 0
    DS = 0
    GuiControl, , TNR, 1
    if (TNR == 1)
    {
        Font = %TNR_F%
        Modifier = Bold
        Bold_M = 1
        Bold_Checked = 1
        GuiControl, , Bold_Checked, %A_ScriptDir%\Assets\Buttons\Bold_Pressed.png

        Italics_M = 0
        Italics_Checked = 0
        GuiControl, , Italics_Checked, %A_ScriptDir%\Assets\Buttons\Italics.png

        Underline_M = 0
        Underline_Checked = 0
        GuiControl, , Underline_Checked, %A_ScriptDir%\Assets\Buttons\Underline.png

        Strikethrough_M = 0
        Strikethrough_Checked = 0
        GuiControl, , Strikethrough_Checked, %A_ScriptDir%\Assets\Buttons\Strikethrough.png
    }
Tooltip, % "Font: " . Font . "`nModifier: " . Modifier . "`nCapsLock: " . Caps
SetTimer, RemoveTT, -4000
return

Cursive_Checked:
    Default = 0
    TNR = 0
    Cursive = 1
    Fraktur = 0
    CN = 0
    DS = 0
    GuiControl, , Cursive, 1
    if (Cursive == 1)
    {
        Font = %Cursive_F%
        Modifier = Italics
        Bold_M = 0
        Bold_Checked = 0
        GuiControl, , Bold_Checked, %A_ScriptDir%\Assets\Buttons\Bold.png

        Italics_M = 1
        Italics_Checked = 1
        GuiControl, , Italics_Checked, %A_ScriptDir%\Assets\Buttons\Italics_Pressed_Gray.png

        Underline_M = 0
        Underline_Checked = 0
        GuiControl, , Underline_Checked, %A_ScriptDir%\Assets\Buttons\Underline.png

        Strikethrough_M = 0
        Strikethrough_Checked = 0
        GuiControl, , Strikethrough_Checked, %A_ScriptDir%\Assets\Buttons\Strikethrough.png
    }
Tooltip, % "Font: " . Font . "`nModifier: " . Modifier . "`nCapsLock: " . Caps
SetTimer, RemoveTT, -4000
return

Fraktur_Checked:
    Default = 0
    TNR = 0
    Cursive = 0
    Fraktur = 1
    CN = 0
    DS = 0
    GuiControl, , Fraktur, 1
    if (Fraktur == 1)
    {
        Font = %Fraktur_F%
        Modifier = Default
        Bold_M = 0
        Bold_Checked = 0
        GuiControl, , Bold_Checked, %A_ScriptDir%\Assets\Buttons\Bold.png

        Italics_M = 0
        Italics_Checked = 0
        GuiControl, , Italics_Checked, %A_ScriptDir%\Assets\Buttons\Italics_Gray.png

        Underline_M = 0
        Underline_Checked = 0
        GuiControl, , Underline_Checked, %A_ScriptDir%\Assets\Buttons\Underline.png

        Strikethrough_M = 0
        Strikethrough_Checked = 0
        GuiControl, , Strikethrough_Checked, %A_ScriptDir%\Assets\Buttons\Strikethrough.png
    }
Tooltip, % "Font: " . Font . "`nModifier: " . Modifier . "`nCapsLock: " . Caps
SetTimer, RemoveTT, -4000
return

CN_Checked:
    Default = 0
    TNR = 0
    Cursive = 0
    Fraktur = 0
    CN = 1
    DS = 0
    GuiControl, , CN, 1
    if (CN == 1)
    {
        Font = %CN_F%
        Modifier = Default
        Bold_M = 0
        Bold_Checked = 0
        GuiControl, , Bold_Checked, %A_ScriptDir%\Assets\Buttons\Bold_Gray.png

        Italics_M = 0
        Italics_Checked = 0
        GuiControl, , Italics_Checked, %A_ScriptDir%\Assets\Buttons\Italics_Gray.png

        Underline_M = 0
        Underline_Checked = 0
        GuiControl, , Underline_Checked, %A_ScriptDir%\Assets\Buttons\Underline.png

        Strikethrough_M = 0
        Strikethrough_Checked = 0
        GuiControl, , Strikethrough_Checked, %A_ScriptDir%\Assets\Buttons\Strikethrough.png
    }
Tooltip, % "Font: " . Font . "`nModifier: " . Modifier . "`nCapsLock: " . Caps
SetTimer, RemoveTT, -4000
return

DS_Checked:
    Default = 0
    TNR = 0
    Cursive = 0
    Fraktur = 0
    CN = 0
    DS = 1
    GuiControl, , DS, 1
    if (DS == 1)
    {
        Font = %DS_F%
        Modifier = Bold
        Bold_M = 1
        Bold_Checked = 1
        GuiControl, , Bold_Checked, %A_ScriptDir%\Assets\Buttons\Bold_Pressed_Gray.png

        Italics_M = 0
        Italics_Checked = 0
        GuiControl, , Italics_Checked, %A_ScriptDir%\Assets\Buttons\Italics_Gray.png

        Underline_M = 0
        Underline_Checked = 0
        GuiControl, , Underline_Checked, %A_ScriptDir%\Assets\Buttons\Underline.png

        Strikethrough_M = 0
        Strikethrough_Checked = 0
        GuiControl, , Strikethrough_Checked, %A_ScriptDir%\Assets\Buttons\Strikethrough.png
    }
Tooltip, % "Font: " . Font . "`nModifier: " . Modifier . "`nCapsLock: " . Caps
SetTimer, RemoveTT, -4000
return

Bold_Checked:
Bold_M := !Bold_M
if (Bold_M == 1)
{
    GuiControl, , Bold_Checked, %A_ScriptDir%\Assets\Buttons\Bold_Pressed.png
}
if (Bold_M == 0)
GuiControl, , Bold_Checked, %A_ScriptDir%\Assets\Buttons\Bold.png

CurrentCursor := 0

if (Default == 1 or Cursive == 1 or Fraktur == 1)
{
    if (Bold_M == true and Italics_M == false and Underline_M == false and Strikethrough_M == false)
    {
        Modifier := "Bold"
    }
    if (Bold_M == true and Italics_M == false and Underline_M == false and Strikethrough_M == true)
    {
        Modifier := "Bold, Strikethrough"
    }
    if (Bold_M == true and Italics_M == false and Underline_M == true and Strikethrough_M == false)
    {
        Modifier := "Bold, Underline"
    }
    if (Bold_M == true and Italics_M == false and Underline_M == true and Strikethrough_M == true)
    {
        Modifier := "Bold, Underline, Strikethrough"
    }
    if (Bold_M == true and Italics_M == false and Underline_M == false and Strikethrough_M == false)
    {
        Modifier := "Bold"
    }
    if (Bold_M == true and Italics_M == false and Underline_M == false and Strikethrough_M == true)
    {
        Modifier := "Bold, Strikethrough"
    }
    if (Bold_M == false and Italics_M == true and Underline_M == false and Strikethrough_M == false)
    {
        Modifier := "Italics"
    }
    if (Bold_M == false and Italics_M == true and Underline_M == false and Strikethrough_M == true)
    {
        Modifier := "Italics, Strikethrough"
    }
    if (Bold_M == false and Italics_M == true and Underline_M == true and Strikethrough_M == false)
    {
        Modifier := "Italics, Underline"
    }
    if (Bold_M == false and Italics_M == true and Underline_M == true and Strikethrough_M == true)
    {
        Modifier := "Italics, Underline, Strikethrough"
    }
    if (Bold_M == true and Italics_M == true and Underline_M == false and Strikethrough_M == false)
    {
        Modifier := "Bold, Italics"
    }
    if (Bold_M == true and Italics_M == true and Underline_M == false and Strikethrough_M == true)
    {
        Modifier := "Bold, Italics, Strikethrough"
    }
    if (Bold_M == true and Italics_M == true and Underline_M == true and Strikethrough_M == false)
    {
        Modifier := "Bold, Italics, Underline"
    }
    if (Bold_M == true and Italics_M == true and Underline_M == true and Strikethrough_M == true)
    {
        Modifier := "Bold, Italics, Underline, Strikethrough"
    }
    if (Italics_M == false and Bold_M = false and Underline_M == true and Strikethrough_M == false)
    {
        Modifier := "Underline"
    }
    if (Italics_M == false and Bold_M = false and Underline_M == true and Strikethrough_M == true)
    {
        Modifier := "Underline, Strikethrough"
    }
    if (Italics_M == false and Bold_M = false and Underline_M == false and Strikethrough_M == false)
    {
        Modifier := "Default"
    }
    if (Italics_M == false and Bold_M = false and Underline_M == false and Strikethrough_M == true)
    {
        Modifier := "Strikethrough"
    }
}
if (TNR == 1)
{
    if (Bold_M == 1)
    {
        GuiControl, , Bold_Checked, %A_ScriptDir%\Assets\Buttons\Bold_Pressed.png
    }
    if (Bold_M = 0)
    {
        GuiControl, , Bold_Checked, %A_ScriptDir%\Assets\Buttons\Bold.png
    }

    if (Bold_M == false and Italics_M == false and Underline_M == false and Strikethrough_M == false)
    {
        Modifier := "Bold"
        Bold_M := 1
        GuiControl, , Bold_Checked, %A_ScriptDir%\Assets\Buttons\Bold_Pressed.png
        MsgBox, 262160, Error, This font must be bolded and/or italicized due to technical limitations.
    }
    if (Bold_M == false and Italics_M == false and Underline_M == false and Strikethrough_M == true)
    {
        Modifier := "Bold, Strikethrough"
        Bold_M := 1
        GuiControl, , Bold_Checked, %A_ScriptDir%\Assets\Buttons\Bold_Pressed.png
        MsgBox, 262160, Error, This font must be bolded and/or italicized due to technical limitations.
    }
    if (Bold_M == false and Italics_M == false and Underline_M == true and Strikethrough_M == false)
    {
        Modifier := "Bold, Underline"
        Bold_M := 1
        GuiControl, , Bold_Checked, %A_ScriptDir%\Assets\Buttons\Bold_Pressed.png
        MsgBox, 262160, Error, This font must be bolded and/or italicized due to technical limitations.
    }
    if (Bold_M == false and Italics_M == false and Underline_M == true and Strikethrough_M == true)
    {
        Modifier := "Bold, Underline, Strikethrough"
        Bold_M := 1
        GuiControl, , Bold_Checked, %A_ScriptDir%\Assets\Buttons\Bold_Pressed.png
        MsgBox, 262160, Error, This font must be bolded and/or italicized due to technical limitations.
    }
    if (Bold_M == false and Italics_M == true and Underline_M == false and Strikethrough_M == false)
    {
        Modifier := "Italics"
    }
    if (Bold_M == false and Italics_M == true and Underline_M == false and Strikethrough_M == true)
    {
        Modifier := "Italics, Strikethrough"
    }
    if (Bold_M == false and Italics_M == true and Underline_M == true and Strikethrough_M == false)
    {
        Modifier := "Italics, Underline"
    }
    if (Bold_M == false and Italics_M == true and Underline_M == true and Strikethrough_M == true)
    {
        Modifier := "Italics, Underline, Strikethrough"
    }
    if (Bold_M == true and Italics_M == true and Underline_M == false and Strikethrough_M == false)
    {
        Modifier := "Bold, Italics"
    }
    if (Bold_M == true and Italics_M == true and Underline_M == false and Strikethrough_M == true)
    {
        Modifier := "Bold, Italics, Strikethrough"
    }
    if (Bold_M == true and Italics_M == true and Underline_M == true and Strikethrough_M == false)
    {
        Modifier := "Bold, Italics, Underline"
    }
    if (Bold_M == true and Italics_M == true and Underline_M == true and Strikethrough_M == true)
    {
        Modifier := "Bold, Italics, Underline, Strikethrough"
    }
}
if (CN == 1)
{
    if (Bold_M == 1)
    {
    GuiControl, , Bold_Checked, %A_ScriptDir%\Assets\Buttons\Bold_Gray.png
    Bold_M := 0
    MsgBox, 262160, Error, This font cannot be bolded due to technical limitations.
    }
    else if (Bold_M == 0)
    {
    GuiControl, , Bold_Checked, %A_ScriptDir%\Assets\Buttons\Bold_Gray.png
    }
        if (Italics_M == false and Bold_M = false and Underline_M == true and Strikethrough_M == false)
        {
            Modifier := "Underline"
        }
        if (Italics_M == false and Bold_M = false and Underline_M == true and Strikethrough_M == true)
        {
            Modifier := "Underline, Strikethrough"
        }
        if (Italics_M == false and Bold_M = false and Underline_M == false and Strikethrough_M == false)
        {
            Modifier := "Default"
        }
        if (Italics_M == false and Bold_M = false and Underline_M == false and Strikethrough_M == true)
        {
            Modifier := "Strikethrough"
        }
}
if (DS == 1)
{
    if (Bold_M == 1)
    {
        GuiControl, , Bold_Checked, %A_ScriptDir%\Assets\Buttons\Bold_Pressed_Gray.png
    }
    if (Bold_M == 0)
    {
        MsgBox, 262160, Error, This font cannot be unbolded due to technical limitations.
        GuiControl, , Bold_Checked, %A_ScriptDir%\Assets\Buttons\Bold_Pressed_Gray.png
        Bold_M := 1
    }

    if (Bold_M == true and Italics_M == false and Underline_M == false and Strikethrough_M == false)
    {
        Modifier := "Bold"
    }
    if (Bold_M == true and Italics_M == false and Underline_M == false and Strikethrough_M == true)
    {
        Modifier := "Bold, Strikethrough"
    }
    if (Bold_M == true and Italics_M == false and Underline_M == true and Strikethrough_M == false)
    {
        Modifier := "Bold, Underline"
    }
    if (Bold_M == true and Italics_M == false and Underline_M == true and Strikethrough_M == true)
    {
        Modifier := "Bold, Underline, Strikethrough"
    }
}
Tooltip, % "Font: " . Font . "`nModifier: " . Modifier . "`nCapsLock: " . Caps
SetTimer, RemoveTT, -4000
return

Italics_Checked:
Italics_M := !Italics_M
if (Default == 1)
{
    if (Italics_M == 1)
    {
        GuiControl, , Italics_Checked, %A_ScriptDir%\Assets\Buttons\Italics_Pressed.png
    }
    if (Italics_M = 0)
    GuiControl, , Italics_Checked, %A_ScriptDir%\Assets\Buttons\Italics.png

CurrentCursor := 0
    
    if (Bold_M == true and Italics_M == false and Underline_M == false and Strikethrough_M == false)
    {
        Modifier := "Bold"
    }
    if (Bold_M == true and Italics_M == false and Underline_M == false and Strikethrough_M == true)
    {
        Modifier := "Bold, Strikethrough"
    }
    if (Bold_M == true and Italics_M == false and Underline_M == true and Strikethrough_M == false)
    {
        Modifier := "Bold, Underline"
    }
    if (Bold_M == true and Italics_M == false and Underline_M == true and Strikethrough_M == true)
    {
        Modifier := "Bold, Underline, Strikethrough"
    }
    if (Bold_M == true and Italics_M == false and Underline_M == false and Strikethrough_M == false)
    {
        Modifier := "Bold"
    }
    if (Bold_M == true and Italics_M == false and Underline_M == false and Strikethrough_M == true)
    {
        Modifier := "Bold, Strikethrough"
    }
    if (Bold_M == false and Italics_M == true and Underline_M == false and Strikethrough_M == false)
    {
        Modifier := "Italics"
    }
    if (Bold_M == false and Italics_M == true and Underline_M == false and Strikethrough_M == true)
    {
        Modifier := "Italics, Strikethrough"
    }
    if (Bold_M == false and Italics_M == true and Underline_M == true and Strikethrough_M == false)
    {
        Modifier := "Italics, Underline"
    }
    if (Bold_M == false and Italics_M == true and Underline_M == true and Strikethrough_M == true)
    {
        Modifier := "Italics, Underline, Strikethrough"
    }
    if (Bold_M == true and Italics_M == true and Underline_M == false and Strikethrough_M == false)
    {
        Modifier := "Bold, Italics"
    }
    if (Bold_M == true and Italics_M == true and Underline_M == false and Strikethrough_M == true)
    {
        Modifier := "Bold, Italics, Strikethrough"
    }
    if (Bold_M == true and Italics_M == true and Underline_M == true and Strikethrough_M == false)
    {
        Modifier := "Bold, Italics, Underline"
    }
    if (Bold_M == true and Italics_M == true and Underline_M == true and Strikethrough_M == true)
    {
        Modifier := "Bold, Italics, Underline, Strikethrough"
    }
    if (Italics_M == false and Bold_M = false and Underline_M == true and Strikethrough_M == false)
    {
    Modifier := "Underline"
    }
    if (Italics_M == false and Bold_M = false and Underline_M == true and Strikethrough_M == true)
    {
    Modifier := "Underline, Strikethrough"
    }
    if (Italics_M == false and Bold_M = false and Underline_M == false and Strikethrough_M == false)
    {
    Modifier := "Default"
    }
    if (Italics_M == false and Bold_M = false and Underline_M == false and Strikethrough_M == true)
    {
    Modifier := "Strikethrough"
    }
}
if (TNR == 1)
{
    if (Italics_M == 1)
    {
        GuiControl, , Italics_Checked, %A_ScriptDir%\Assets\Buttons\Italics_Pressed.png
    }
    if (Italics_M == 0)
    {
        GuiControl, , Italics_Checked, %A_ScriptDir%\Assets\Buttons\Italics.png
    }

    if (Bold_M == false and Italics_M == false and Underline_M == false and Strikethrough_M == false)
    {
        Modifier := "Italics"
        Italics_M := 1
        GuiControl, , Italics_Checked, %A_ScriptDir%\Assets\Buttons\Italics_Pressed.png
        MsgBox, 262160, Error, This font must be bolded and/or italicized due to technical limitations.
    }
    if (Bold_M == false and Italics_M == false and Underline_M == false and Strikethrough_M == true)
    {
        Modifier := "Italics, Strikethrough"
        Italics_M := 1
        GuiControl, , Italics_Checked, %A_ScriptDir%\Assets\Buttons\Italics_Pressed.png
        MsgBox, 262160, Error, This font must be bolded and/or italicized due to technical limitations.
    }
    if (Bold_M == false and Italics_M == false and Underline_M == true and Strikethrough_M == false)
    {
        Modifier := "Italics, Underline"
        Italics_M := 1
        GuiControl, , Italics_Checked, %A_ScriptDir%\Assets\Buttons\Italics_Pressed.png
        MsgBox, 262160, Error, This font must be bolded and/or italicized due to technical limitations.
    }
    if (Bold_M == false and Italics_M == false and Underline_M == true and Strikethrough_M == true)
    {
        Modifier := "Italics, Underline, Strikethrough"
        Italics_M := 1
        GuiControl, , Italics_Checked, %A_ScriptDir%\Assets\Buttons\Italics_Pressed.png
        MsgBox, 262160, Error, This font must be bolded and/or italicized due to technical limitations.
    }
    if (Bold_M == true and Italics_M == true and Underline_M == false and Strikethrough_M == false)
    {
        Modifier := "Bold, Italics"
        Italics_M := 1
        GuiControl, , Italics_Checked, %A_ScriptDir%\Assets\Buttons\Italics_Pressed.png
    }
    if (Bold_M == true and Italics_M == true and Underline_M == false and Strikethrough_M == true)
    {
        Modifier := "Bold, Italics, Strikethrough"
        Italics_M := 1
        GuiControl, , Italics_Checked, %A_ScriptDir%\Assets\Buttons\Italics_Pressed.png
    }
    if (Bold_M == true and Italics_M == true and Underline_M == true and Strikethrough_M == false)
    {
        Modifier := "Bold, Italics, Underline"
        Italics_M := 1
        GuiControl, , Italics_Checked, %A_ScriptDir%\Assets\Buttons\Italics_Pressed.png
    }
    if (Bold_M == true and Italics_M == true and Underline_M == true and Strikethrough_M == true)
    {
        Modifier := "Bold, Italics, Underline, Strikethrough"
        Italics_M := 1
        GuiControl, , Italics_Checked, %A_ScriptDir%\Assets\Buttons\Italics_Pressed.png
    }
    if (Bold_M == true and Italics_M == false and Underline_M == false and Strikethrough_M == false)
    {
        Modifier := "Bold"
        Italics_M := 0
        GuiControl, , Italics_Checked, %A_ScriptDir%\Assets\Buttons\Italics.png
    }
    if (Bold_M == true and Italics_M == false and Underline_M == true and Strikethrough_M == false)
    {
        Modifier := "Bold, Underline"
        Italics_M := 0
        GuiControl, , Italics_Checked, %A_ScriptDir%\Assets\Buttons\Italics.png
    }
    if (Bold_M == true and Italics_M == false and Underline_M == false and Strikethrough_M == true)
    {
        Modifier := "Bold, Strikethrough"
        Italics_M := 0
        GuiControl, , Italics_Checked, %A_ScriptDir%\Assets\Buttons\Italics.png
    }
    if (Bold_M == true and Italics_M == false and Underline_M == true and Strikethrough_M == true)
    {
        Modifier := "Bold, Underline, Strikethrough"
        Italics_M := 0
        GuiControl, , Italics_Checked, %A_ScriptDir%\Assets\Buttons\Italics.png
    }
}
if (Cursive == 1)
{
    if (Italics_M == 1)
    {
        GuiControl, , Italics_Checked, %A_ScriptDir%\Assets\Buttons\Italics_Pressed_Gray.png
    }
    if (Italics_M == 0)
    {
        GuiControl, , Italics_Checked, %A_ScriptDir%\Assets\Buttons\Italics_Pressed_Gray.png
    }

    if (Bold_M == false and Italics_M == false and Underline_M == false and Strikethrough_M == false)
    {
        Modifier := "Italics"
        MsgBox, 262160, Error, This font cannot be unitalicized due to technical limitations.
        GuiControl, , Italics_Checked, %A_ScriptDir%\Assets\Buttons\Italics_Pressed_Gray.png
        Italics_M := 1
    }
    if (Bold_M == false and Italics_M == false and Underline_M == false and Strikethrough_M == true)
    {
        Modifier := "Italics, Strikethrough"
        MsgBox, 262160, Error, This font cannot be unitalicized due to technical limitations.
        GuiControl, , Italics_Checked, %A_ScriptDir%\Assets\Buttons\Italics_Pressed_Gray.png
        Italics_M := 1
    }
    if (Bold_M == false and Italics_M == false and Underline_M == true and Strikethrough_M == false)
    {
        Modifier := "Italics, Underline"
        MsgBox, 262160, Error, This font cannot be unitalicized due to technical limitations.
        GuiControl, , Italics_Checked, %A_ScriptDir%\Assets\Buttons\Italics_Pressed_Gray.png
        Italics_M := 1
    }
    if (Bold_M == false and Italics_M == false and Underline_M == true and Strikethrough_M == true)
    {
        Modifier := "Italics, Underline, Strikethrough"
        MsgBox, 262160, Error, This font cannot be unitalicized due to technical limitations.
        GuiControl, , Italics_Checked, %A_ScriptDir%\Assets\Buttons\Italics_Pressed_Gray.png
        Italics_M := 1
    }
    if (Bold_M == true and Italics_M == false and Underline_M == false and Strikethrough_M == false)
    {
        Modifier := "Bold, Italics"
        MsgBox, 262160, Error, This font cannot be unitalicized due to technical limitations.
        GuiControl, , Italics_Checked, %A_ScriptDir%\Assets\Buttons\Italics_Pressed_Gray.png
        Italics_M := 1
    }
    if (Bold_M == true and Italics_M == false and Underline_M == false and Strikethrough_M == true)
    {
        Modifier := "Bold, Italics, Strikethrough"
        MsgBox, 262160, Error, This font cannot be unitalicized due to technical limitations.
        GuiControl, , Italics_Checked, %A_ScriptDir%\Assets\Buttons\Italics_Pressed_Gray.png
        Italics_M := 1
    }
    if (Bold_M == true and Italics_M == false and Underline_M == true and Strikethrough_M == false)
    {
        Modifier := "Bold, Italics, Underline"
        MsgBox, 262160, Error, This font cannot be unitalicized due to technical limitations.
        GuiControl, , Italics_Checked, %A_ScriptDir%\Assets\Buttons\Italics_Pressed_Gray.png
        Italics_M := 1
    }
    if (Bold_M == true and Italics_M == false and Underline_M == true and Strikethrough_M == true)
    {
        Modifier := "Bold, Italics, Underline, Strikethrough"
        MsgBox, 262160, Error, This font cannot be unitalicized due to technical limitations.
        GuiControl, , Italics_Checked, %A_ScriptDir%\Assets\Buttons\Italics_Pressed_Gray.png
        Italics_M := 1
    }
}

if (Fraktur == 1 or CN == 1 or DS == 1)
{
    if (Italics_M == 1)
    {
        MsgBox, 262160, Error, This font cannot be italicized due to technical limitations.
        GuiControl, , Italics_Checked, %A_ScriptDir%\Assets\Buttons\Italics_Gray.png
        Italics_M := 0
    }
    if (Italics_M == 0)
    {
        GuiControl, , Italics_Checked, %A_ScriptDir%\Assets\Buttons\Italics_Gray.png
    }

    if (Bold_M == false and Italics_M == false and Underline_M == false and Strikethrough_M == false)
    {
        Modifier := "Default"
    }
    if (Bold_M == false and Italics_M == false and Underline_M == false and Strikethrough_M == true)
    {
        Modifier := "Strikethrough"
    }
    if (Bold_M == false and Italics_M == false and Underline_M == true and Strikethrough_M == false)
    {
        Modifier := "Underline"
    }
    if (Bold_M == false and Italics_M == false and Underline_M == true and Strikethrough_M == true)
    {
        Modifier := "Underline, Strikethrough"
    }
    if (Bold_M == true and Italics_M == false and Underline_M == false and Strikethrough_M == false)
    {
        Modifier := "Bold"
    }
    if (Bold_M == true and Italics_M == false and Underline_M == false and Strikethrough_M == true)
    {
        Modifier := "Bold, Strikethrough"
    }
    if (Bold_M == true and Italics_M == false and Underline_M == true and Strikethrough_M == false)
    {
        Modifier := "Bold, Underline"
    }
    if (Bold_M == true and Italics_M == false and Underline_M == true and Strikethrough_M == true)
    {
        Modifier := "Bold, Underline, Strikethrough"
    }
}

Tooltip, % "Font: " . Font . "`nModifier: " . Modifier . "`nCapsLock: " . Caps
SetTimer, RemoveTT, -4000
return

Underline_Checked:
Underline_M := !Underline_M
if (Underline_M == 1)
{
    GuiControl, , Underline_Checked, %A_ScriptDir%\Assets\Buttons\Underline_Pressed.png
}
else
GuiControl, , Underline_Checked, %A_ScriptDir%\Assets\Buttons\Underline.png

CurrentCursor := 0

if (Bold_M == true and Italics_M == false and Underline_M == false and Strikethrough_M == false)
{
    Modifier := "Bold"
}
if (Bold_M == true and Italics_M == false and Underline_M == false and Strikethrough_M == true)
{
    Modifier := "Bold, Strikethrough"
}
if (Bold_M == true and Italics_M == false and Underline_M == true and Strikethrough_M == false)
{
    Modifier := "Bold, Underline"
}
if (Bold_M == true and Italics_M == false and Underline_M == true and Strikethrough_M == true)
{
    Modifier := "Bold, Underline, Strikethrough"
}
if (Bold_M == true and Italics_M == false and Underline_M == false and Strikethrough_M == false)
{
    Modifier := "Bold"
}
if (Bold_M == true and Italics_M == false and Underline_M == false and Strikethrough_M == true)
{
    Modifier := "Bold, Strikethrough"
}
if (Bold_M == false and Italics_M == true and Underline_M == false and Strikethrough_M == false)
{
    Modifier := "Italics"
}
if (Bold_M == false and Italics_M == true and Underline_M == false and Strikethrough_M == true)
{
    Modifier := "Italics, Strikethrough"
}
if (Bold_M == false and Italics_M == true and Underline_M == true and Strikethrough_M == false)
{
    Modifier := "Italics, Underline"
}
if (Bold_M == false and Italics_M == true and Underline_M == true and Strikethrough_M == true)
{
    Modifier := "Italics, Underline, Strikethrough"
}
if (Bold_M == true and Italics_M == true and Underline_M == false and Strikethrough_M == false)
{
    Modifier := "Bold, Italics"
}
if (Bold_M == true and Italics_M == true and Underline_M == false and Strikethrough_M == true)
{
    Modifier := "Bold, Italics, Strikethrough"
}
if (Bold_M == true and Italics_M == true and Underline_M == true and Strikethrough_M == false)
{
    Modifier := "Bold, Italics, Underline"
}
if (Bold_M == true and Italics_M == true and Underline_M == true and Strikethrough_M == true)
{
    Modifier := "Bold, Italics, Underline, Strikethrough"
}
if (Italics_M == false and Bold_M = false and Underline_M == true and Strikethrough_M == false)
{
    Modifier := "Underline"
}
if (Italics_M == false and Bold_M = false and Underline_M == true and Strikethrough_M == true)
{
    Modifier := "Underline, Strikethrough"
}
if (Italics_M == false and Bold_M = false and Underline_M == false and Strikethrough_M == false)
{
    Modifier := "Default"
}
if (Italics_M == false and Bold_M = false and Underline_M == false and Strikethrough_M == true)
{
    Modifier := "Strikethrough"
}
Tooltip, % "Font: " . Font . "`nModifier: " . Modifier . "`nCapsLock: " . Caps
SetTimer, RemoveTT, -4000
return

Strikethrough_Checked:
Strikethrough_M := !Strikethrough_M
if (Strikethrough_M == 1)
{
    GuiControl, , Strikethrough_Checked, %A_ScriptDir%\Assets\Buttons\Strikethrough_Pressed.png
}
else
GuiControl, , Strikethrough_Checked, %A_ScriptDir%\Assets\Buttons\Strikethrough.png

CurrentCursor := 0

if (Bold_M == true and Italics_M == false and Underline_M == false and Strikethrough_M == false)
{
    Modifier := "Bold"
}
if (Bold_M == true and Italics_M == false and Underline_M == false and Strikethrough_M == true)
{
    Modifier := "Bold, Strikethrough"
}
if (Bold_M == true and Italics_M == false and Underline_M == true and Strikethrough_M == false)
{
    Modifier := "Bold, Underline"
}
if (Bold_M == true and Italics_M == false and Underline_M == true and Strikethrough_M == true)
{
    Modifier := "Bold, Underline, Strikethrough"
}
if (Bold_M == true and Italics_M == false and Underline_M == false and Strikethrough_M == false)
{
    Modifier := "Bold"
}
if (Bold_M == true and Italics_M == false and Underline_M == false and Strikethrough_M == true)
{
    Modifier := "Bold, Strikethrough"
}
if (Bold_M == false and Italics_M == true and Underline_M == false and Strikethrough_M == false)
{
    Modifier := "Italics"
}
if (Bold_M == false and Italics_M == true and Underline_M == false and Strikethrough_M == true)
{
    Modifier := "Italics, Strikethrough"
}
if (Bold_M == false and Italics_M == true and Underline_M == true and Strikethrough_M == false)
{
    Modifier := "Italics, Underline"
}
if (Bold_M == false and Italics_M == true and Underline_M == true and Strikethrough_M == true)
{
    Modifier := "Italics, Underline, Strikethrough"
}
if (Bold_M == true and Italics_M == true and Underline_M == false and Strikethrough_M == false)
{
    Modifier := "Bold, Italics"
}
if (Bold_M == true and Italics_M == true and Underline_M == false and Strikethrough_M == true)
{
    Modifier := "Bold, Italics, Strikethrough"
}
if (Bold_M == true and Italics_M == true and Underline_M == true and Strikethrough_M == false)
{
    Modifier := "Bold, Italics, Underline"
}
if (Bold_M == true and Italics_M == true and Underline_M == true and Strikethrough_M == true)
{
    Modifier := "Bold, Italics, Underline, Strikethrough"
}
if (Italics_M == false and Bold_M = false and Underline_M == true and Strikethrough_M == false)
{
    Modifier := "Underline"
}
if (Italics_M == false and Bold_M = false and Underline_M == true and Strikethrough_M == true)
{
    Modifier := "Underline, Strikethrough"
}
if (Italics_M == false and Bold_M = false and Underline_M == false and Strikethrough_M == false)
{
    Modifier := "Default"
}
if (Italics_M == false and Bold_M = false and Underline_M == false and Strikethrough_M == true)
{
    Modifier := "Strikethrough"
}
Tooltip, % "Font: " . Font . "`nModifier: " . Modifier . "`nCapsLock: " . Caps
SetTimer, RemoveTT, -4000
return

CapsLock::
if (Caps = "Off")
{
    Caps = On
    SetCapsLockState, On
}
else if (Caps = "On")
{
    Caps = Off
    SetCapsLockState, Off
}
Tooltip, % "Font: " . Font . "`nModifier: " . Modifier . "`nCapsLock: " . Caps
SetTimer, RemoveTT, -4000
return

;List of Letters

;------------------------------------------------------------------------------------------------;

; Default Font

;------------------------------------------------------------------------------------------------;

#If font = "Default" and modifier = "Default"
return

;Original Modifiers
#If font = "Default" and modifier = "Bold" and Caps = "Off"
{
    $a::Send, {U+1D5EE}
    $b::Send, {U+1D5EF}
    $c::Send, {U+1D5F0}
    $d::Send, {U+1D5F1}
    $e::Send, {U+1D5F2}
    $f::Send, {U+1D5F3}
    $g::Send, {U+1D5F4}
    $h::Send, {U+1D5F5}
    $i::Send, {U+1D5F6}
    $j::Send, {U+1D5F7}
    $k::Send, {U+1D5F8}
    $l::Send, {U+1D5F9}
    $m::Send, {U+1D5FA}
    $n::Send, {U+1D5FB}
    $o::Send, {U+1D5FC}
    $p::Send, {U+1D5FD}
    $q::Send, {U+1D5FE}
    $r::Send, {U+1D5FF}
    $s::Send, {U+1D600}
    $t::Send, {U+1D601}
    $u::Send, {U+1D602}
    $v::Send, {U+1D603}
    $w::Send, {U+1D604}
    $x::Send, {U+1D605}
    $y::Send, {U+1D606}
    $z::Send, {U+1D607}
    
    $+a::Send, {U+1D5D4}
    $+b::Send, {U+1D5D5}
    $+c::Send, {U+1D5D6}
    $+d::Send, {U+1D5D7}
    $+e::Send, {U+1D5D8}
    $+f::Send, {U+1D5D9}
    $+g::Send, {U+1D5DA}
    $+h::Send, {U+1D5DB}
    $+i::Send, {U+1D5DC}
    $+j::Send, {U+1D5DD}
    $+k::Send, {U+1D5DE}
    $+l::Send, {U+1D5DF}
    $+m::Send, {U+1D5E0}
    $+n::Send, {U+1D5E1}
    $+o::Send, {U+1D5E2}
    $+p::Send, {U+1D5E3}
    $+q::Send, {U+1D5E4}
    $+r::Send, {U+1D5E5}
    $+s::Send, {U+1D5E6}
    $+t::Send, {U+1D5E7}
    $+u::Send, {U+1D5E8}
    $+v::Send, {U+1D5E9}
    $+w::Send, {U+1D5EA}
    $+x::Send, {U+1D5EB}
    $+y::Send, {U+1D5EC}
    $+z::Send, {U+1D5ED}
    
    $0::Send, {U+1D7EC}
    $1::Send, {U+1D7ED}
    $2::Send, {U+1D7EE}
    $3::Send, {U+1D7EF}
    $4::Send, {U+1D7F0}
    $5::Send, {U+1D7F1}
    $6::Send, {U+1D7F2}
    $7::Send, {U+1D7F3}
    $8::Send, {U+1D7F4}
    $9::Send, {U+1D7F5}
}
return

#If font = "Default" and modifier = "Bold" and Caps = "On"
{
    $a::Send, {U+1D5D4}
    $b::Send, {U+1D5D5}
    $c::Send, {U+1D5D6}
    $d::Send, {U+1D5D7}
    $e::Send, {U+1D5D8}
    $f::Send, {U+1D5D9}
    $g::Send, {U+1D5DA}
    $h::Send, {U+1D5DB}
    $i::Send, {U+1D5DC}
    $j::Send, {U+1D5DD}
    $k::Send, {U+1D5DE}
    $l::Send, {U+1D5DF}
    $m::Send, {U+1D5E0}
    $n::Send, {U+1D5E1}
    $o::Send, {U+1D5E2}
    $p::Send, {U+1D5E3}
    $q::Send, {U+1D5E4}
    $r::Send, {U+1D5E5}
    $s::Send, {U+1D5E6}
    $t::Send, {U+1D5E7}
    $u::Send, {U+1D5E8}
    $v::Send, {U+1D5E9}
    $w::Send, {U+1D5EA}
    $x::Send, {U+1D5EB}
    $y::Send, {U+1D5EC}
    $z::Send, {U+1D5ED}

    $+a::Send, {U+1D5EE}
    $+b::Send, {U+1D5EF}
    $+c::Send, {U+1D5F0}
    $+d::Send, {U+1D5F1}
    $+e::Send, {U+1D5F2}
    $+f::Send, {U+1D5F3}
    $+g::Send, {U+1D5F4}
    $+h::Send, {U+1D5F5}
    $+i::Send, {U+1D5F6}
    $+j::Send, {U+1D5F7}
    $+k::Send, {U+1D5F8}
    $+l::Send, {U+1D5F9}
    $+m::Send, {U+1D5FA}
    $+n::Send, {U+1D5FB}
    $+o::Send, {U+1D5FC}
    $+p::Send, {U+1D5FD}
    $+q::Send, {U+1D5FE}
    $+r::Send, {U+1D5FF}
    $+s::Send, {U+1D600}
    $+t::Send, {U+1D601}
    $+u::Send, {U+1D602}
    $+v::Send, {U+1D603}
    $+w::Send, {U+1D604}
    $+x::Send, {U+1D605}
    $+y::Send, {U+1D606}
    $+z::Send, {U+1D607}

    $0::Send, {U+1D7EC}
    $1::Send, {U+1D7ED}
    $2::Send, {U+1D7EE}
    $3::Send, {U+1D7EF}
    $4::Send, {U+1D7F0}
    $5::Send, {U+1D7F1}
    $6::Send, {U+1D7F2}
    $7::Send, {U+1D7F3}
    $8::Send, {U+1D7F4}
    $9::Send, {U+1D7F5}
}
return

#If font = "Default" and modifier = "Italics" and Caps = "Off"
{
    $a::Send, {U+1D622}
    $b::Send, {U+1D623}
    $c::Send, {U+1D624}
    $d::Send, {U+1D625}
    $e::Send, {U+1D626}
    $f::Send, {U+1D627}
    $g::Send, {U+1D628}
    $h::Send, {U+1D629}
    $i::Send, {U+1D62A}
    $j::Send, {U+1D62B}
    $k::Send, {U+1D62C}
    $l::Send, {U+1D62D}
    $m::Send, {U+1D62E}
    $n::Send, {U+1D62F}
    $o::Send, {U+1D630}
    $p::Send, {U+1D631}
    $q::Send, {U+1D632}
    $r::Send, {U+1D633}
    $s::Send, {U+1D634}
    $t::Send, {U+1D635}
    $u::Send, {U+1D636}
    $v::Send, {U+1D637}
    $w::Send, {U+1D638}
    $x::Send, {U+1D639}
    $y::Send, {U+1D63A}
    $z::Send, {U+1D63B}

    $+a::Send, {U+1D608}
    $+b::Send, {U+1D609}
    $+c::Send, {U+1D60A}
    $+d::Send, {U+1D60B}
    $+e::Send, {U+1D60C}
    $+f::Send, {U+1D60D}
    $+g::Send, {U+1D60E}
    $+h::Send, {U+1D60F}
    $+i::Send, {U+1D610}
    $+j::Send, {U+1D611}
    $+k::Send, {U+1D612}
    $+l::Send, {U+1D613}
    $+m::Send, {U+1D614}
    $+n::Send, {U+1D615}
    $+o::Send, {U+1D616}
    $+p::Send, {U+1D617}
    $+q::Send, {U+1D618}
    $+r::Send, {U+1D619}
    $+s::Send, {U+1D61A}
    $+t::Send, {U+1D61B}
    $+u::Send, {U+1D61C}
    $+v::Send, {U+1D61D}
    $+w::Send, {U+1D61E}
    $+x::Send, {U+1D61F}
    $+y::Send, {U+1D620}
    $+z::Send, {U+1D621}
}
return

#If font = "Default" and modifier = "Italics" and Caps = "On"
{
    $a::Send, {U+1D608}
    $b::Send, {U+1D609}
    $c::Send, {U+1D60A}
    $d::Send, {U+1D60B}
    $e::Send, {U+1D60C}
    $f::Send, {U+1D60D}
    $g::Send, {U+1D60E}
    $h::Send, {U+1D60F}
    $i::Send, {U+1D610}
    $j::Send, {U+1D611}
    $k::Send, {U+1D612}
    $l::Send, {U+1D613}
    $m::Send, {U+1D614}
    $n::Send, {U+1D615}
    $o::Send, {U+1D616}
    $p::Send, {U+1D617}
    $q::Send, {U+1D618}
    $r::Send, {U+1D619}
    $s::Send, {U+1D61A}
    $t::Send, {U+1D61B}
    $u::Send, {U+1D61C}
    $v::Send, {U+1D61D}
    $w::Send, {U+1D61E}
    $x::Send, {U+1D61F}
    $y::Send, {U+1D620}
    $z::Send, {U+1D621}

    $+a::Send, {U+1D622}
    $+b::Send, {U+1D623}
    $+c::Send, {U+1D624}
    $+d::Send, {U+1D625}
    $+e::Send, {U+1D626}
    $+f::Send, {U+1D627}
    $+g::Send, {U+1D628}
    $+h::Send, {U+1D629}
    $+i::Send, {U+1D62A}
    $+j::Send, {U+1D62B}
    $+k::Send, {U+1D62C}
    $+l::Send, {U+1D62D}
    $+m::Send, {U+1D62E}
    $+n::Send, {U+1D62F}
    $+o::Send, {U+1D630}
    $+p::Send, {U+1D631}
    $+q::Send, {U+1D632}
    $+r::Send, {U+1D633}
    $+s::Send, {U+1D634}
    $+t::Send, {U+1D635}
    $+u::Send, {U+1D636}
    $+v::Send, {U+1D637}
    $+w::Send, {U+1D638}
    $+x::Send, {U+1D639}
    $+y::Send, {U+1D63A}
    $+z::Send, {U+1D63B}
}
return

#If font = "Default" and modifier = "Bold, Italics" and Caps = "Off"
{
    $a::Send, {U+1D656}
    $b::Send, {U+1D657}
    $c::Send, {U+1D658}
    $d::Send, {U+1D659}
    $e::Send, {U+1D65A}
    $f::Send, {U+1D65B}
    $g::Send, {U+1D65C}
    $h::Send, {U+1D65D}
    $i::Send, {U+1D65E}
    $j::Send, {U+1D65F}
    $k::Send, {U+1D660}
    $l::Send, {U+1D661}
    $m::Send, {U+1D662}
    $n::Send, {U+1D663}
    $o::Send, {U+1D664}
    $p::Send, {U+1D665}
    $q::Send, {U+1D666}
    $r::Send, {U+1D667}
    $s::Send, {U+1D668}
    $t::Send, {U+1D669}
    $u::Send, {U+1D66A}
    $v::Send, {U+1D66B}
    $w::Send, {U+1D66C}
    $x::Send, {U+1D66D}
    $y::Send, {U+1D66E}
    $z::Send, {U+1D66F}

    $+a::Send, {U+1D63C}
    $+b::Send, {U+1D63D}
    $+c::Send, {U+1D63E}
    $+d::Send, {U+1D63F}
    $+e::Send, {U+1D640}
    $+f::Send, {U+1D641}
    $+g::Send, {U+1D642}
    $+h::Send, {U+1D643}
    $+i::Send, {U+1D644}
    $+j::Send, {U+1D645}
    $+k::Send, {U+1D646}
    $+l::Send, {U+1D647}
    $+m::Send, {U+1D648}
    $+n::Send, {U+1D649}
    $+o::Send, {U+1D64A}
    $+p::Send, {U+1D64B}
    $+q::Send, {U+1D64C}
    $+r::Send, {U+1D64D}
    $+s::Send, {U+1D64E}
    $+t::Send, {U+1D64F}
    $+u::Send, {U+1D650}
    $+v::Send, {U+1D651}
    $+w::Send, {U+1D652}
    $+x::Send, {U+1D653}
    $+y::Send, {U+1D654}
    $+z::Send, {U+1D655}

    $0::Send, {U+1D7EC}
    $1::Send, {U+1D7ED}
    $2::Send, {U+1D7EE}
    $3::Send, {U+1D7EF}
    $4::Send, {U+1D7F0}
    $5::Send, {U+1D7F1}
    $6::Send, {U+1D7F2}
    $7::Send, {U+1D7F3}
    $8::Send, {U+1D7F4}
    $9::Send, {U+1D7F5}
}
return

#If font = "Default" and modifier = "Bold, Italics" and Caps = "On"
{
    $a::Send, {U+1D63C}
    $b::Send, {U+1D63D}
    $c::Send, {U+1D63E}
    $d::Send, {U+1D63F}
    $e::Send, {U+1D640}
    $f::Send, {U+1D641}
    $g::Send, {U+1D642}
    $h::Send, {U+1D643}
    $i::Send, {U+1D644}
    $j::Send, {U+1D645}
    $k::Send, {U+1D646}
    $l::Send, {U+1D647}
    $m::Send, {U+1D648}
    $n::Send, {U+1D649}
    $o::Send, {U+1D64A}
    $p::Send, {U+1D64B}
    $q::Send, {U+1D64C}
    $r::Send, {U+1D64D}
    $s::Send, {U+1D64E}
    $t::Send, {U+1D64F}
    $u::Send, {U+1D650}
    $v::Send, {U+1D651}
    $w::Send, {U+1D652}
    $x::Send, {U+1D653}
    $y::Send, {U+1D654}
    $z::Send, {U+1D655}

    $+a::Send, {U+1D656}
    $+b::Send, {U+1D657}
    $+c::Send, {U+1D658}
    $+d::Send, {U+1D659}
    $+e::Send, {U+1D65A}
    $+f::Send, {U+1D65B}
    $+g::Send, {U+1D65C}
    $+h::Send, {U+1D65D}
    $+i::Send, {U+1D65E}
    $+j::Send, {U+1D65F}
    $+k::Send, {U+1D660}
    $+l::Send, {U+1D661}
    $+m::Send, {U+1D662}
    $+n::Send, {U+1D663}
    $+o::Send, {U+1D664}
    $+p::Send, {U+1D665}
    $+q::Send, {U+1D666}
    $+r::Send, {U+1D667}
    $+s::Send, {U+1D668}
    $+t::Send, {U+1D669}
    $+u::Send, {U+1D66A}
    $+v::Send, {U+1D66B}
    $+w::Send, {U+1D66C}
    $+x::Send, {U+1D66D}
    $+y::Send, {U+1D66E}
    $+z::Send, {U+1D66F}

    $0::Send, {U+1D7EC}
    $1::Send, {U+1D7ED}
    $2::Send, {U+1D7EE}
    $3::Send, {U+1D7EF}
    $4::Send, {U+1D7F0}
    $5::Send, {U+1D7F1}
    $6::Send, {U+1D7F2}
    $7::Send, {U+1D7F3}
    $8::Send, {U+1D7F4}
    $9::Send, {U+1D7F5}
}
return

;Underline Modifiers
#If font = "Default" and modifier = "Underline" and Caps = "Off"
{
    ~$a::Send, {U+0332}
    ~$b::Send, {U+0332}
    ~$c::Send, {U+0332}
    ~$d::Send, {U+0332}
    ~$e::Send, {U+0332}
    ~$f::Send, {U+0332}
    ~$g::return
    ~$h::Send, {U+0332}
    ~$i::Send, {U+0332}
    ~$j::return
    ~$k::Send, {U+0332}
    ~$l::Send, {U+0332}
    ~$m::Send, {U+0332}
    ~$n::Send, {U+0332}
    ~$o::Send, {U+0332}
    ~$p::return
    ~$q::return
    ~$r::Send, {U+0332}
    ~$s::Send, {U+0332}
    ~$t::Send, {U+0332}
    ~$u::Send, {U+0332}
    ~$v::Send, {U+0332}
    ~$w::Send, {U+0332}
    ~$x::Send, {U+0332}
    ~$y::return
    ~$z::Send, {U+0332}

    ~$+a::Send, {U+0332}
    ~$+b::Send, {U+0332}
    ~$+c::Send, {U+0332}
    ~$+d::Send, {U+0332}
    ~$+e::Send, {U+0332}
    ~$+f::Send, {U+0332}
    ~$+g::Send, {U+0332}
    ~$+h::Send, {U+0332}
    ~$+i::Send, {U+0332}
    ~$+j::Send, {U+0332}
    ~$+k::Send, {U+0332}
    ~$+l::Send, {U+0332}
    ~$+m::Send, {U+0332}
    ~$+n::Send, {U+0332}
    ~$+o::Send, {U+0332}
    ~$+p::Send, {U+0332}
    ~$+q::Send, {U+0332}
    ~$+r::Send, {U+0332}
    ~$+s::Send, {U+0332}
    ~$+t::Send, {U+0332}
    ~$+u::Send, {U+0332}
    ~$+v::Send, {U+0332}
    ~$+w::Send, {U+0332}
    ~$+x::Send, {U+0332}
    ~$+y::Send, {U+0332}
    ~$+z::Send, {U+0332}

    ~$1::Send, {U+0332}
    ~$2::Send, {U+0332}
    ~$3::Send, {U+0332}
    ~$4::Send, {U+0332}
    ~$5::Send, {U+0332}
    ~$6::Send, {U+0332}
    ~$7::Send, {U+0332}
    ~$8::Send, {U+0332}
    ~$9::Send, {U+0332}
    ~$0::Send, {U+0332}

    ~Space::Send, {U+0332}

    ~SC029::Send, {U+0332}
    ~+SC029::Send, {U+0332}
    ~+SC002::Send, {U+0332}
    ~+SC003::Send, {U+0332}
    ~+SC004::Send, {U+0332}
    ~+SC005::Send, {U+0332}
    ~+SC006::Send, {U+0332}
    ~+SC007::Send, {U+0332}
    ~+SC008::Send, {U+0332}
    ~+SC009::Send, {U+0332}
    ~+SC00a::Send, {U+0332}
    ~+SC00b::Send, {U+0332}
    ~SC00c::Send, {U+0332}
    ~+SC00c::Send, {U+0332}
    ~SC00d::Send, {U+0332}
    ~+SC00d::Send, {U+0332}
    ~SC01a::Send, {U+0332}
    ~+SC01a::Send, {U+0332}
    ~SC01b::Send, {U+0332}
    ~+SC01b::Send, {U+0332}
    ~SC027::Send, {U+0332}
    ~+SC027::Send, {U+0332}
    ~SC028::Send, {U+0332}
    ~+SC028::Send, {U+0332}
    ~SC02b::Send, {U+0332}
    ~+SC02b::Send, {U+0332}
    ~SC033::Send, {U+0332}
    ~+SC033::Send, {U+0332}
    ~SC034::Send, {U+0332}
    ~+SC034::Send, {U+0332}
    ~SC035::Send, {U+0332}
    ~+SC035::Send, {U+0332}
    ~SC037::Send, {U+0332}
    ~SC04a::Send, {U+0332}
    ~SC04e::Send, {U+0332}
    ~SC053::Send, {U+0332}
}
return

#If font = "Default" and modifier = "Underline" and Caps = "On"
{
    ~$a::Send, {U+0332}
    ~$b::Send, {U+0332}
    ~$c::Send, {U+0332}
    ~$d::Send, {U+0332}
    ~$e::Send, {U+0332}
    ~$f::Send, {U+0332}
    ~$g::Send, {U+0332}
    ~$h::Send, {U+0332}
    ~$i::Send, {U+0332}
    ~$j::Send, {U+0332}
    ~$k::Send, {U+0332}
    ~$l::Send, {U+0332}
    ~$m::Send, {U+0332}
    ~$n::Send, {U+0332}
    ~$o::Send, {U+0332}
    ~$p::Send, {U+0332}
    ~$q::Send, {U+0332}
    ~$r::Send, {U+0332}
    ~$s::Send, {U+0332}
    ~$t::Send, {U+0332}
    ~$u::Send, {U+0332}
    ~$v::Send, {U+0332}
    ~$w::Send, {U+0332}
    ~$x::Send, {U+0332}
    ~$y::Send, {U+0332}
    ~$z::Send, {U+0332}

    ~$+a::Send, {U+0332}
    ~$+b::Send, {U+0332}
    ~$+c::Send, {U+0332}
    ~$+d::Send, {U+0332}
    ~$+e::Send, {U+0332}
    ~$+f::Send, {U+0332}
    ~$+g::return
    ~$+h::Send, {U+0332}
    ~$+i::Send, {U+0332}
    ~$+j::return
    ~$+k::Send, {U+0332}
    ~$+l::Send, {U+0332}
    ~$+m::Send, {U+0332}
    ~$+n::Send, {U+0332}
    ~$+o::Send, {U+0332}
    ~$+p::return
    ~$+q::return
    ~$+r::Send, {U+0332}
    ~$+s::Send, {U+0332}
    ~$+t::Send, {U+0332}
    ~$+u::Send, {U+0332}
    ~$+v::Send, {U+0332}
    ~$+w::Send, {U+0332}
    ~$+x::Send, {U+0332}
    ~$+y::return
    ~$+z::Send, {U+0332}

    ~$0::Send, {U+0332}
    ~$1::Send, {U+0332}
    ~$2::Send, {U+0332}
    ~$3::Send, {U+0332}
    ~$4::Send, {U+0332}
    ~$5::Send, {U+0332}
    ~$6::Send, {U+0332}
    ~$7::Send, {U+0332}
    ~$8::Send, {U+0332}
    ~$9::Send, {U+0332}

    ~Space::Send, {U+0332}

    ~SC029::Send, {U+0332}
    ~+SC029::Send, {U+0332}
    ~+SC002::Send, {U+0332}
    ~+SC003::Send, {U+0332}
    ~+SC004::Send, {U+0332}
    ~+SC005::Send, {U+0332}
    ~+SC006::Send, {U+0332}
    ~+SC007::Send, {U+0332}
    ~+SC008::Send, {U+0332}
    ~+SC009::Send, {U+0332}
    ~+SC00a::Send, {U+0332}
    ~+SC00b::Send, {U+0332}
    ~SC00c::Send, {U+0332}
    ~+SC00c::Send, {U+0332}
    ~SC00d::Send, {U+0332}
    ~+SC00d::Send, {U+0332}
    ~SC01a::Send, {U+0332}
    ~+SC01a::Send, {U+0332}
    ~SC01b::Send, {U+0332}
    ~+SC01b::Send, {U+0332}
    ~SC027::Send, {U+0332}
    ~+SC027::Send, {U+0332}
    ~SC028::Send, {U+0332}
    ~+SC028::Send, {U+0332}
    ~SC02b::Send, {U+0332}
    ~+SC02b::Send, {U+0332}
    ~SC033::Send, {U+0332}
    ~+SC033::Send, {U+0332}
    ~SC034::Send, {U+0332}
    ~+SC034::Send, {U+0332}
    ~SC035::Send, {U+0332}
    ~+SC035::Send, {U+0332}
    ~SC037::Send, {U+0332}
    ~SC04a::Send, {U+0332}
    ~SC04e::Send, {U+0332}
    ~SC053::Send, {U+0332}
}
return

#If font = "Default" and modifier = "Bold, Underline" and Caps = "Off"
{
    $a::Send, {U+1D5EE}{U+0332}
    $b::Send, {U+1D5EF}{U+0332}
    $c::Send, {U+1D5F0}{U+0332}
    $d::Send, {U+1D5F1}{U+0332}
    $e::Send, {U+1D5F2}{U+0332}
    $f::Send, {U+1D5F3}{U+0332}
    $g::Send, {U+1D5F4}
    $h::Send, {U+1D5F5}{U+0332}
    $i::Send, {U+1D5F6}{U+0332}
    $j::Send, {U+1D5F7}
    $k::Send, {U+1D5F8}{U+0332}
    $l::Send, {U+1D5F9}{U+0332}
    $m::Send, {U+1D5FA}{U+0332}
    $n::Send, {U+1D5FB}{U+0332}
    $o::Send, {U+1D5FC}{U+0332}
    $p::Send, {U+1D5FD}
    $q::Send, {U+1D5FE}
    $r::Send, {U+1D5FF}{U+0332}
    $s::Send, {U+1D600}{U+0332}
    $t::Send, {U+1D601}{U+0332}
    $u::Send, {U+1D602}{U+0332}
    $v::Send, {U+1D603}{U+0332}
    $w::Send, {U+1D604}{U+0332}
    $x::Send, {U+1D605}{U+0332}
    $y::Send, {U+1D606}
    $z::Send, {U+1D607}{U+0332}

    $+a::Send, {U+1D5D4}{U+0332}
    $+b::Send, {U+1D5D5}{U+0332}
    $+c::Send, {U+1D5D6}{U+0332}
    $+d::Send, {U+1D5D7}{U+0332}
    $+e::Send, {U+1D5D8}{U+0332}
    $+f::Send, {U+1D5D9}{U+0332}
    $+g::Send, {U+1D5DA}{U+0332}
    $+h::Send, {U+1D5DB}{U+0332}
    $+i::Send, {U+1D5DC}{U+0332}
    $+j::Send, {U+1D5DD}{U+0332}
    $+k::Send, {U+1D5DE}{U+0332}
    $+l::Send, {U+1D5DF}{U+0332}
    $+m::Send, {U+1D5E0}{U+0332}
    $+n::Send, {U+1D5E1}{U+0332}
    $+o::Send, {U+1D5E2}{U+0332}
    $+p::Send, {U+1D5E3}{U+0332}
    $+q::Send, {U+1D5E4}{U+0332}
    $+r::Send, {U+1D5E5}{U+0332}
    $+s::Send, {U+1D5E6}{U+0332}
    $+t::Send, {U+1D5E7}{U+0332}
    $+u::Send, {U+1D5E8}{U+0332}
    $+v::Send, {U+1D5E9}{U+0332}
    $+w::Send, {U+1D5EA}{U+0332}
    $+x::Send, {U+1D5EB}{U+0332}
    $+y::Send, {U+1D5EC}{U+0332}
    $+z::Send, {U+1D5ED}{U+0332}

    $0::Send, {U+1D7EC}{U+0332}
    $1::Send, {U+1D7ED}{U+0332}
    $2::Send, {U+1D7EE}{U+0332}
    $3::Send, {U+1D7EF}{U+0332}
    $4::Send, {U+1D7F0}{U+0332}
    $5::Send, {U+1D7F1}{U+0332}
    $6::Send, {U+1D7F2}{U+0332}
    $7::Send, {U+1D7F3}{U+0332}
    $8::Send, {U+1D7F4}{U+0332}
    $9::Send, {U+1D7F5}{U+0332}

    ~Space::Send, {U+0332}

    ~SC029::Send, {U+0332}
    ~+SC029::Send, {U+0332}
    ~+SC002::Send, {U+0332}
    ~+SC003::Send, {U+0332}
    ~+SC004::Send, {U+0332}
    ~+SC005::Send, {U+0332}
    ~+SC006::Send, {U+0332}
    ~+SC007::Send, {U+0332}
    ~+SC008::Send, {U+0332}
    ~+SC009::Send, {U+0332}
    ~+SC00a::Send, {U+0332}
    ~+SC00b::Send, {U+0332}
    ~SC00c::Send, {U+0332}
    ~+SC00c::Send, {U+0332}
    ~SC00d::Send, {U+0332}
    ~+SC00d::Send, {U+0332}
    ~SC01a::Send, {U+0332}
    ~+SC01a::Send, {U+0332}
    ~SC01b::Send, {U+0332}
    ~+SC01b::Send, {U+0332}
    ~SC027::Send, {U+0332}
    ~+SC027::Send, {U+0332}
    ~SC028::Send, {U+0332}
    ~+SC028::Send, {U+0332}
    ~SC02b::Send, {U+0332}
    ~+SC02b::Send, {U+0332}
    ~SC033::Send, {U+0332}
    ~+SC033::Send, {U+0332}
    ~SC034::Send, {U+0332}
    ~+SC034::Send, {U+0332}
    ~SC035::Send, {U+0332}
    ~+SC035::Send, {U+0332}
    ~SC037::Send, {U+0332}
    ~SC04a::Send, {U+0332}
    ~SC04e::Send, {U+0332}
    ~SC053::Send, {U+0332}
}
return

#If font = "Default" and modifier = "Bold, Underline" and Caps = "On"
{
    $a::Send, {U+1D5D4}{U+0332}
    $b::Send, {U+1D5D5}{U+0332}
    $c::Send, {U+1D5D6}{U+0332}
    $d::Send, {U+1D5D7}{U+0332}
    $e::Send, {U+1D5D8}{U+0332}
    $f::Send, {U+1D5D9}{U+0332}
    $g::Send, {U+1D5DA}{U+0332}
    $h::Send, {U+1D5DB}{U+0332}
    $i::Send, {U+1D5DC}{U+0332}
    $j::Send, {U+1D5DD}{U+0332}
    $k::Send, {U+1D5DE}{U+0332}
    $l::Send, {U+1D5DF}{U+0332}
    $m::Send, {U+1D5E0}{U+0332}
    $n::Send, {U+1D5E1}{U+0332}
    $o::Send, {U+1D5E2}{U+0332}
    $p::Send, {U+1D5E3}{U+0332}
    $q::Send, {U+1D5E4}{U+0332}
    $r::Send, {U+1D5E5}{U+0332}
    $s::Send, {U+1D5E6}{U+0332}
    $t::Send, {U+1D5E7}{U+0332}
    $u::Send, {U+1D5E8}{U+0332}
    $v::Send, {U+1D5E9}{U+0332}
    $w::Send, {U+1D5EA}{U+0332}
    $x::Send, {U+1D5EB}{U+0332}
    $y::Send, {U+1D5EC}{U+0332}
    $z::Send, {U+1D5ED}{U+0332}

    $+a::Send, {U+1D5EE}{U+0332}
    $+b::Send, {U+1D5EF}{U+0332}
    $+c::Send, {U+1D5F0}{U+0332}
    $+d::Send, {U+1D5F1}{U+0332}
    $+e::Send, {U+1D5F2}{U+0332}
    $+f::Send, {U+1D5F3}{U+0332}
    $+g::Send, {U+1D5F4}
    $+h::Send, {U+1D5F5}{U+0332}
    $+i::Send, {U+1D5F6}{U+0332}
    $+j::Send, {U+1D5F7}
    $+k::Send, {U+1D5F8}{U+0332}
    $+l::Send, {U+1D5F9}{U+0332}
    $+m::Send, {U+1D5FA}{U+0332}
    $+n::Send, {U+1D5FB}{U+0332}
    $+o::Send, {U+1D5FC}{U+0332}
    $+p::Send, {U+1D5FD}
    $+q::Send, {U+1D5FE}
    $+r::Send, {U+1D5FF}{U+0332}
    $+s::Send, {U+1D600}{U+0332}
    $+t::Send, {U+1D601}{U+0332}
    $+u::Send, {U+1D602}{U+0332}
    $+v::Send, {U+1D603}{U+0332}
    $+w::Send, {U+1D604}{U+0332}
    $+x::Send, {U+1D605}{U+0332}
    $+y::Send, {U+1D606}
    $+z::Send, {U+1D607}{U+0332}

    $0::Send, {U+1D7EC}{U+0332}
    $1::Send, {U+1D7ED}{U+0332}
    $2::Send, {U+1D7EE}{U+0332}
    $3::Send, {U+1D7EF}{U+0332}
    $4::Send, {U+1D7F0}{U+0332}
    $5::Send, {U+1D7F1}{U+0332}
    $6::Send, {U+1D7F2}{U+0332}
    $7::Send, {U+1D7F3}{U+0332}
    $8::Send, {U+1D7F4}{U+0332}
    $9::Send, {U+1D7F5}{U+0332}

    ~Space::Send, {U+0332}

    ~SC029::Send, {U+0332}
    ~+SC029::Send, {U+0332}
    ~+SC002::Send, {U+0332}
    ~+SC003::Send, {U+0332}
    ~+SC004::Send, {U+0332}
    ~+SC005::Send, {U+0332}
    ~+SC006::Send, {U+0332}
    ~+SC007::Send, {U+0332}
    ~+SC008::Send, {U+0332}
    ~+SC009::Send, {U+0332}
    ~+SC00a::Send, {U+0332}
    ~+SC00b::Send, {U+0332}
    ~SC00c::Send, {U+0332}
    ~+SC00c::Send, {U+0332}
    ~SC00d::Send, {U+0332}
    ~+SC00d::Send, {U+0332}
    ~SC01a::Send, {U+0332}
    ~+SC01a::Send, {U+0332}
    ~SC01b::Send, {U+0332}
    ~+SC01b::Send, {U+0332}
    ~SC027::Send, {U+0332}
    ~+SC027::Send, {U+0332}
    ~SC028::Send, {U+0332}
    ~+SC028::Send, {U+0332}
    ~SC02b::Send, {U+0332}
    ~+SC02b::Send, {U+0332}
    ~SC033::Send, {U+0332}
    ~+SC033::Send, {U+0332}
    ~SC034::Send, {U+0332}
    ~+SC034::Send, {U+0332}
    ~SC035::Send, {U+0332}
    ~+SC035::Send, {U+0332}
    ~SC037::Send, {U+0332}
    ~SC04a::Send, {U+0332}
    ~SC04e::Send, {U+0332}
    ~SC053::Send, {U+0332}
}
return

#If font = "Default" and modifier = "Italics, Underline" and Caps = "Off"
{
    $a::Send, {U+1D622}{U+0332}
    $b::Send, {U+1D623}{U+0332}
    $c::Send, {U+1D624}{U+0332}
    $d::Send, {U+1D625}{U+0332}
    $e::Send, {U+1D626}{U+0332}
    $f::Send, {U+1D627}{U+0332}
    $g::Send, {U+1D628}
    $h::Send, {U+1D629}{U+0332}
    $i::Send, {U+1D62A}{U+0332}
    $j::Send, {U+1D62B}
    $k::Send, {U+1D62C}{U+0332}
    $l::Send, {U+1D62D}{U+0332}
    $m::Send, {U+1D62E}{U+0332}
    $n::Send, {U+1D62F}{U+0332}
    $o::Send, {U+1D630}{U+0332}
    $p::Send, {U+1D631}
    $q::Send, {U+1D632}
    $r::Send, {U+1D633}{U+0332}
    $s::Send, {U+1D634}{U+0332}
    $t::Send, {U+1D635}{U+0332}
    $u::Send, {U+1D636}{U+0332}
    $v::Send, {U+1D637}{U+0332}
    $w::Send, {U+1D638}{U+0332}
    $x::Send, {U+1D639}{U+0332}
    $y::Send, {U+1D63A}
    $z::Send, {U+1D63B}{U+0332}

    $+a::Send, {U+1D608}{U+0332}
    $+b::Send, {U+1D609}{U+0332}
    $+c::Send, {U+1D60A}{U+0332}
    $+d::Send, {U+1D60B}{U+0332}
    $+e::Send, {U+1D60C}{U+0332}
    $+f::Send, {U+1D60D}{U+0332}
    $+g::Send, {U+1D60E}{U+0332}
    $+h::Send, {U+1D60F}{U+0332}
    $+i::Send, {U+1D610}{U+0332}
    $+j::Send, {U+1D611}{U+0332}
    $+k::Send, {U+1D612}{U+0332}
    $+l::Send, {U+1D613}{U+0332}
    $+m::Send, {U+1D614}{U+0332}
    $+n::Send, {U+1D615}{U+0332}
    $+o::Send, {U+1D616}{U+0332}
    $+p::Send, {U+1D617}{U+0332}
    $+q::Send, {U+1D618}{U+0332}
    $+r::Send, {U+1D619}{U+0332}
    $+s::Send, {U+1D61A}{U+0332}
    $+t::Send, {U+1D61B}{U+0332}
    $+u::Send, {U+1D61C}{U+0332}
    $+v::Send, {U+1D61D}{U+0332}
    $+w::Send, {U+1D61E}{U+0332}
    $+x::Send, {U+1D61F}{U+0332}
    $+y::Send, {U+1D620}{U+0332}
    $+z::Send, {U+1D621}{U+0332}

    ~Space::Send, {U+0332}

    ~SC029::Send, {U+0332}
    ~+SC029::Send, {U+0332}
    ~+SC002::Send, {U+0332}
    ~+SC003::Send, {U+0332}
    ~+SC004::Send, {U+0332}
    ~+SC005::Send, {U+0332}
    ~+SC006::Send, {U+0332}
    ~+SC007::Send, {U+0332}
    ~+SC008::Send, {U+0332}
    ~+SC009::Send, {U+0332}
    ~+SC00a::Send, {U+0332}
    ~+SC00b::Send, {U+0332}
    ~SC00c::Send, {U+0332}
    ~+SC00c::Send, {U+0332}
    ~SC00d::Send, {U+0332}
    ~+SC00d::Send, {U+0332}
    ~SC01a::Send, {U+0332}
    ~+SC01a::Send, {U+0332}
    ~SC01b::Send, {U+0332}
    ~+SC01b::Send, {U+0332}
    ~SC027::Send, {U+0332}
    ~+SC027::Send, {U+0332}
    ~SC028::Send, {U+0332}
    ~+SC028::Send, {U+0332}
    ~SC02b::Send, {U+0332}
    ~+SC02b::Send, {U+0332}
    ~SC033::Send, {U+0332}
    ~+SC033::Send, {U+0332}
    ~SC034::Send, {U+0332}
    ~+SC034::Send, {U+0332}
    ~SC035::Send, {U+0332}
    ~+SC035::Send, {U+0332}
    ~SC037::Send, {U+0332}
    ~SC04a::Send, {U+0332}
    ~SC04e::Send, {U+0332}
    ~SC053::Send, {U+0332}
}
return

#If font = "Default" and modifier = "Italics, Underline" and Caps = "On"
{
    $a::Send, {U+1D608}{U+0332}
    $b::Send, {U+1D609}{U+0332}
    $c::Send, {U+1D60A}{U+0332}
    $d::Send, {U+1D60B}{U+0332}
    $e::Send, {U+1D60C}{U+0332}
    $f::Send, {U+1D60D}{U+0332}
    $g::Send, {U+1D60E}{U+0332}
    $h::Send, {U+1D60F}{U+0332}
    $i::Send, {U+1D610}{U+0332}
    $j::Send, {U+1D611}{U+0332}
    $k::Send, {U+1D612}{U+0332}
    $l::Send, {U+1D613}{U+0332}
    $m::Send, {U+1D614}{U+0332}
    $n::Send, {U+1D615}{U+0332}
    $o::Send, {U+1D616}{U+0332}
    $p::Send, {U+1D617}{U+0332}
    $q::Send, {U+1D618}{U+0332}
    $r::Send, {U+1D619}{U+0332}
    $s::Send, {U+1D61A}{U+0332}
    $t::Send, {U+1D61B}{U+0332}
    $u::Send, {U+1D61C}{U+0332}
    $v::Send, {U+1D61D}{U+0332}
    $w::Send, {U+1D61E}{U+0332}
    $x::Send, {U+1D61F}{U+0332}
    $y::Send, {U+1D620}{U+0332}
    $z::Send, {U+1D621}{U+0332}

    $+a::Send, {U+1D622}{U+0332}
    $+b::Send, {U+1D623}{U+0332}
    $+c::Send, {U+1D624}{U+0332}
    $+d::Send, {U+1D625}{U+0332}
    $+e::Send, {U+1D626}{U+0332}
    $+f::Send, {U+1D627}{U+0332}
    $+g::Send, {U+1D628}
    $+h::Send, {U+1D629}{U+0332}
    $+i::Send, {U+1D62A}{U+0332}
    $+j::Send, {U+1D62B}
    $+k::Send, {U+1D62C}{U+0332}
    $+l::Send, {U+1D62D}{U+0332}
    $+m::Send, {U+1D62E}{U+0332}
    $+n::Send, {U+1D62F}{U+0332}
    $+o::Send, {U+1D630}{U+0332}
    $+p::Send, {U+1D631}
    $+q::Send, {U+1D632}
    $+r::Send, {U+1D633}{U+0332}
    $+s::Send, {U+1D634}{U+0332}
    $+t::Send, {U+1D635}{U+0332}
    $+u::Send, {U+1D636}{U+0332}
    $+v::Send, {U+1D637}{U+0332}
    $+w::Send, {U+1D638}{U+0332}
    $+x::Send, {U+1D639}{U+0332}
    $+y::Send, {U+1D63A}
    $+z::Send, {U+1D63B}{U+0332}

    ~Space::Send, {U+0332}

    ~SC029::Send, {U+0332}
    ~+SC029::Send, {U+0332}
    ~+SC002::Send, {U+0332}
    ~+SC003::Send, {U+0332}
    ~+SC004::Send, {U+0332}
    ~+SC005::Send, {U+0332}
    ~+SC006::Send, {U+0332}
    ~+SC007::Send, {U+0332}
    ~+SC008::Send, {U+0332}
    ~+SC009::Send, {U+0332}
    ~+SC00a::Send, {U+0332}
    ~+SC00b::Send, {U+0332}
    ~SC00c::Send, {U+0332}
    ~+SC00c::Send, {U+0332}
    ~SC00d::Send, {U+0332}
    ~+SC00d::Send, {U+0332}
    ~SC01a::Send, {U+0332}
    ~+SC01a::Send, {U+0332}
    ~SC01b::Send, {U+0332}
    ~+SC01b::Send, {U+0332}
    ~SC027::Send, {U+0332}
    ~+SC027::Send, {U+0332}
    ~SC028::Send, {U+0332}
    ~+SC028::Send, {U+0332}
    ~SC02b::Send, {U+0332}
    ~+SC02b::Send, {U+0332}
    ~SC033::Send, {U+0332}
    ~+SC033::Send, {U+0332}
    ~SC034::Send, {U+0332}
    ~+SC034::Send, {U+0332}
    ~SC035::Send, {U+0332}
    ~+SC035::Send, {U+0332}
    ~SC037::Send, {U+0332}
    ~SC04a::Send, {U+0332}
    ~SC04e::Send, {U+0332}
    ~SC053::Send, {U+0332}
}
return

#If font = "Default" and modifier = "Bold, Italics, Underline" and Caps = "Off"
{
    $a::Send, {U+1D656}{U+0332}
    $b::Send, {U+1D657}{U+0332}
    $c::Send, {U+1D658}{U+0332}
    $d::Send, {U+1D659}{U+0332}
    $e::Send, {U+1D65A}{U+0332}
    $f::Send, {U+1D65B}{U+0332}
    $g::Send, {U+1D65C}
    $h::Send, {U+1D65D}{U+0332}
    $i::Send, {U+1D65E}{U+0332}
    $j::Send, {U+1D65F}
    $k::Send, {U+1D660}{U+0332}
    $l::Send, {U+1D661}{U+0332}
    $m::Send, {U+1D662}{U+0332}
    $n::Send, {U+1D663}{U+0332}
    $o::Send, {U+1D664}{U+0332}
    $p::Send, {U+1D665}
    $q::Send, {U+1D666}
    $r::Send, {U+1D667}{U+0332}
    $s::Send, {U+1D668}{U+0332}
    $t::Send, {U+1D669}{U+0332}
    $u::Send, {U+1D66A}{U+0332}
    $v::Send, {U+1D66B}{U+0332}
    $w::Send, {U+1D66C}{U+0332}
    $x::Send, {U+1D66D}{U+0332}
    $y::Send, {U+1D66E}
    $z::Send, {U+1D66F}{U+0332}

    $+a::Send, {U+1D63C}{U+0332}
    $+b::Send, {U+1D63D}{U+0332}
    $+c::Send, {U+1D63E}{U+0332}
    $+d::Send, {U+1D63F}{U+0332}
    $+e::Send, {U+1D640}{U+0332}
    $+f::Send, {U+1D641}{U+0332}
    $+g::Send, {U+1D642}{U+0332}
    $+h::Send, {U+1D643}{U+0332}
    $+i::Send, {U+1D644}{U+0332}
    $+j::Send, {U+1D645}{U+0332}
    $+k::Send, {U+1D646}{U+0332}
    $+l::Send, {U+1D647}{U+0332}
    $+m::Send, {U+1D648}{U+0332}
    $+n::Send, {U+1D649}{U+0332}
    $+o::Send, {U+1D64A}{U+0332}
    $+p::Send, {U+1D64B}{U+0332}
    $+q::Send, {U+1D64C}{U+0332}
    $+r::Send, {U+1D64D}{U+0332}
    $+s::Send, {U+1D64E}{U+0332}
    $+t::Send, {U+1D64F}{U+0332}
    $+u::Send, {U+1D650}{U+0332}
    $+v::Send, {U+1D651}{U+0332}
    $+w::Send, {U+1D652}{U+0332}
    $+x::Send, {U+1D653}{U+0332}
    $+y::Send, {U+1D654}{U+0332}
    $+z::Send, {U+1D655}{U+0332}

    $0::Send, {U+1D7EC}{U+0332}
    $1::Send, {U+1D7ED}{U+0332}
    $2::Send, {U+1D7EE}{U+0332}
    $3::Send, {U+1D7EF}{U+0332}
    $4::Send, {U+1D7F0}{U+0332}
    $5::Send, {U+1D7F1}{U+0332}
    $6::Send, {U+1D7F2}{U+0332}
    $7::Send, {U+1D7F3}{U+0332}
    $8::Send, {U+1D7F4}{U+0332}
    $9::Send, {U+1D7F5}{U+0332}

    ~Space::Send, {U+0332}

    ~SC029::Send, {U+0332}
    ~+SC029::Send, {U+0332}
    ~+SC002::Send, {U+0332}
    ~+SC003::Send, {U+0332}
    ~+SC004::Send, {U+0332}
    ~+SC005::Send, {U+0332}
    ~+SC006::Send, {U+0332}
    ~+SC007::Send, {U+0332}
    ~+SC008::Send, {U+0332}
    ~+SC009::Send, {U+0332}
    ~+SC00a::Send, {U+0332}
    ~+SC00b::Send, {U+0332}
    ~SC00c::Send, {U+0332}
    ~+SC00c::Send, {U+0332}
    ~SC00d::Send, {U+0332}
    ~+SC00d::Send, {U+0332}
    ~SC01a::Send, {U+0332}
    ~+SC01a::Send, {U+0332}
    ~SC01b::Send, {U+0332}
    ~+SC01b::Send, {U+0332}
    ~SC027::Send, {U+0332}
    ~+SC027::Send, {U+0332}
    ~SC028::Send, {U+0332}
    ~+SC028::Send, {U+0332}
    ~SC02b::Send, {U+0332}
    ~+SC02b::Send, {U+0332}
    ~SC033::Send, {U+0332}
    ~+SC033::Send, {U+0332}
    ~SC034::Send, {U+0332}
    ~+SC034::Send, {U+0332}
    ~SC035::Send, {U+0332}
    ~+SC035::Send, {U+0332}
    ~SC037::Send, {U+0332}
    ~SC04a::Send, {U+0332}
    ~SC04e::Send, {U+0332}
    ~SC053::Send, {U+0332}
}
return

#If font = "Default" and modifier = "Bold, Italics, Underline" and Caps = "On"
{
    $a::Send, {U+1D63C}{U+0332}
    $b::Send, {U+1D63D}{U+0332}
    $c::Send, {U+1D63E}{U+0332}
    $d::Send, {U+1D63F}{U+0332}
    $e::Send, {U+1D640}{U+0332}
    $f::Send, {U+1D641}{U+0332}
    $g::Send, {U+1D642}{U+0332}
    $h::Send, {U+1D643}{U+0332}
    $i::Send, {U+1D644}{U+0332}
    $j::Send, {U+1D645}{U+0332}
    $k::Send, {U+1D646}{U+0332}
    $l::Send, {U+1D647}{U+0332}
    $m::Send, {U+1D648}{U+0332}
    $n::Send, {U+1D649}{U+0332}
    $o::Send, {U+1D64A}{U+0332}
    $p::Send, {U+1D64B}{U+0332}
    $q::Send, {U+1D64C}{U+0332}
    $r::Send, {U+1D64D}{U+0332}
    $s::Send, {U+1D64E}{U+0332}
    $t::Send, {U+1D64F}{U+0332}
    $u::Send, {U+1D650}{U+0332}
    $v::Send, {U+1D651}{U+0332}
    $w::Send, {U+1D652}{U+0332}
    $x::Send, {U+1D653}{U+0332}
    $y::Send, {U+1D654}{U+0332}
    $z::Send, {U+1D655}{U+0332}

    $+a::Send, {U+1D656}{U+0332}
    $+b::Send, {U+1D657}{U+0332}
    $+c::Send, {U+1D658}{U+0332}
    $+d::Send, {U+1D659}{U+0332}
    $+e::Send, {U+1D65A}{U+0332}
    $+f::Send, {U+1D65B}{U+0332}
    $+g::Send, {U+1D65C}
    $+h::Send, {U+1D65D}{U+0332}
    $+i::Send, {U+1D65E}{U+0332}
    $+j::Send, {U+1D65F}
    $+k::Send, {U+1D660}{U+0332}
    $+l::Send, {U+1D661}{U+0332}
    $+m::Send, {U+1D662}{U+0332}
    $+n::Send, {U+1D663}{U+0332}
    $+o::Send, {U+1D664}{U+0332}
    $+p::Send, {U+1D665}
    $+q::Send, {U+1D666}
    $+r::Send, {U+1D667}{U+0332}
    $+s::Send, {U+1D668}{U+0332}
    $+t::Send, {U+1D669}{U+0332}
    $+u::Send, {U+1D66A}{U+0332}
    $+v::Send, {U+1D66B}{U+0332}
    $+w::Send, {U+1D66C}{U+0332}
    $+x::Send, {U+1D66D}{U+0332}
    $+y::Send, {U+1D66E}
    $+z::Send, {U+1D66F}{U+0332}

    $0::Send, {U+1D7EC}{U+0332}
    $1::Send, {U+1D7ED}{U+0332}
    $2::Send, {U+1D7EE}{U+0332}
    $3::Send, {U+1D7EF}{U+0332}
    $4::Send, {U+1D7F0}{U+0332}
    $5::Send, {U+1D7F1}{U+0332}
    $6::Send, {U+1D7F2}{U+0332}
    $7::Send, {U+1D7F3}{U+0332}
    $8::Send, {U+1D7F4}{U+0332}
    $9::Send, {U+1D7F5}{U+0332}

    ~Space::Send, {U+0332}

    ~SC029::Send, {U+0332}
    ~+SC029::Send, {U+0332}
    ~+SC002::Send, {U+0332}
    ~+SC003::Send, {U+0332}
    ~+SC004::Send, {U+0332}
    ~+SC005::Send, {U+0332}
    ~+SC006::Send, {U+0332}
    ~+SC007::Send, {U+0332}
    ~+SC008::Send, {U+0332}
    ~+SC009::Send, {U+0332}
    ~+SC00a::Send, {U+0332}
    ~+SC00b::Send, {U+0332}
    ~SC00c::Send, {U+0332}
    ~+SC00c::Send, {U+0332}
    ~SC00d::Send, {U+0332}
    ~+SC00d::Send, {U+0332}
    ~SC01a::Send, {U+0332}
    ~+SC01a::Send, {U+0332}
    ~SC01b::Send, {U+0332}
    ~+SC01b::Send, {U+0332}
    ~SC027::Send, {U+0332}
    ~+SC027::Send, {U+0332}
    ~SC028::Send, {U+0332}
    ~+SC028::Send, {U+0332}
    ~SC02b::Send, {U+0332}
    ~+SC02b::Send, {U+0332}
    ~SC033::Send, {U+0332}
    ~+SC033::Send, {U+0332}
    ~SC034::Send, {U+0332}
    ~+SC034::Send, {U+0332}
    ~SC035::Send, {U+0332}
    ~+SC035::Send, {U+0332}
    ~SC037::Send, {U+0332}
    ~SC04a::Send, {U+0332}
    ~SC04e::Send, {U+0332}
    ~SC053::Send, {U+0332}
}
return

;Strikethrough Modifiers
#If font = "Default" and modifier = "Strikethrough" and Caps = "Off"
{
    ~$a::Send, {U+0336}
    ~$b::Send, {U+0336}
    ~$c::Send, {U+0336}
    ~$d::Send, {U+0336}
    ~$e::Send, {U+0336}
    ~$f::Send, {U+0336}
    ~$g::return
    ~$h::Send, {U+0336}
    ~$i::Send, {U+0336}
    ~$j::return
    ~$k::Send, {U+0336}
    ~$l::Send, {U+0336}
    ~$m::Send, {U+0336}
    ~$n::Send, {U+0336}
    ~$o::Send, {U+0336}
    ~$p::return
    ~$q::return
    ~$r::Send, {U+0336}
    ~$s::Send, {U+0336}
    ~$t::Send, {U+0336}
    ~$u::Send, {U+0336}
    ~$v::Send, {U+0336}
    ~$w::Send, {U+0336}
    ~$x::Send, {U+0336}
    ~$y::return
    ~$z::Send, {U+0336}

    ~$+a::Send, {U+0336}
    ~$+b::Send, {U+0336}
    ~$+c::Send, {U+0336}
    ~$+d::Send, {U+0336}
    ~$+e::Send, {U+0336}
    ~$+f::Send, {U+0336}
    ~$+g::Send, {U+0336}
    ~$+h::Send, {U+0336}
    ~$+i::Send, {U+0336}
    ~$+j::Send, {U+0336}
    ~$+k::Send, {U+0336}
    ~$+l::Send, {U+0336}
    ~$+m::Send, {U+0336}
    ~$+n::Send, {U+0336}
    ~$+o::Send, {U+0336}
    ~$+p::Send, {U+0336}
    ~$+q::Send, {U+0336}
    ~$+r::Send, {U+0336}
    ~$+s::Send, {U+0336}
    ~$+t::Send, {U+0336}
    ~$+u::Send, {U+0336}
    ~$+v::Send, {U+0336}
    ~$+w::Send, {U+0336}
    ~$+x::Send, {U+0336}
    ~$+y::Send, {U+0336}
    ~$+z::Send, {U+0336}

    ~$0::Send, {U+0336}
    ~$1::Send, {U+0336}
    ~$2::Send, {U+0336}
    ~$3::Send, {U+0336}
    ~$4::Send, {U+0336}
    ~$5::Send, {U+0336}
    ~$6::Send, {U+0336}
    ~$7::Send, {U+0336}
    ~$8::Send, {U+0336}
    ~$9::Send, {U+0336}

    ~Space::Send, {U+0332}

    ~SC029::Send, {U+0336}
    ~+SC029::Send, {U+0336}
    ~+SC002::Send, {U+0336}
    ~+SC003::Send, {U+0336}
    ~+SC004::Send, {U+0336}
    ~+SC005::Send, {U+0336}
    ~+SC006::Send, {U+0336}
    ~+SC007::Send, {U+0336}
    ~+SC008::Send, {U+0336}
    ~+SC009::Send, {U+0336}
    ~+SC00a::Send, {U+0336}
    ~+SC00b::Send, {U+0336}
    ~SC00c::Send, {U+0336}
    ~+SC00c::Send, {U+0336}
    ~SC00d::Send, {U+0336}
    ~+SC00d::Send, {U+0336}
    ~SC01a::Send, {U+0336}
    ~+SC01a::Send, {U+0336}
    ~SC01b::Send, {U+0336}
    ~+SC01b::Send, {U+0336}
    ~SC027::Send, {U+0336}
    ~+SC027::Send, {U+0336}
    ~SC028::Send, {U+0336}
    ~+SC028::Send, {U+0336}
    ~SC02b::Send, {U+0336}
    ~+SC02b::Send, {U+0336}
    ~SC033::Send, {U+0336}
    ~+SC033::Send, {U+0336}
    ~SC034::Send, {U+0336}
    ~+SC034::Send, {U+0336}
    ~SC035::Send, {U+0336}
    ~+SC035::Send, {U+0336}
    ~SC037::Send, {U+0336}
    ~SC04a::Send, {U+0336}
    ~SC04e::Send, {U+0336}
    ~SC053::Send, {U+0336}
}
return

#If font = "Default" and modifier = "Strikethrough" and Caps = "On"
{
    ~$a::Send, {U+0336}
    ~$b::Send, {U+0336}
    ~$c::Send, {U+0336}
    ~$d::Send, {U+0336}
    ~$e::Send, {U+0336}
    ~$f::Send, {U+0336}
    ~$g::Send, {U+0336}
    ~$h::Send, {U+0336}
    ~$i::Send, {U+0336}
    ~$j::Send, {U+0336}
    ~$k::Send, {U+0336}
    ~$l::Send, {U+0336}
    ~$m::Send, {U+0336}
    ~$n::Send, {U+0336}
    ~$o::Send, {U+0336}
    ~$p::Send, {U+0336}
    ~$q::Send, {U+0336}
    ~$r::Send, {U+0336}
    ~$s::Send, {U+0336}
    ~$t::Send, {U+0336}
    ~$u::Send, {U+0336}
    ~$v::Send, {U+0336}
    ~$w::Send, {U+0336}
    ~$x::Send, {U+0336}
    ~$y::Send, {U+0336}
    ~$z::Send, {U+0336}

    ~$+a::Send, {U+0336}
    ~$+b::Send, {U+0336}
    ~$+c::Send, {U+0336}
    ~$+d::Send, {U+0336}
    ~$+e::Send, {U+0336}
    ~$+f::Send, {U+0336}
    ~$+g::return
    ~$+h::Send, {U+0336}
    ~$+i::Send, {U+0336}
    ~$+j::return
    ~$+k::Send, {U+0336}
    ~$+l::Send, {U+0336}
    ~$+m::Send, {U+0336}
    ~$+n::Send, {U+0336}
    ~$+o::Send, {U+0336}
    ~$+p::return
    ~$+q::return
    ~$+r::Send, {U+0336}
    ~$+s::Send, {U+0336}
    ~$+t::Send, {U+0336}
    ~$+u::Send, {U+0336}
    ~$+v::Send, {U+0336}
    ~$+w::Send, {U+0336}
    ~$+x::Send, {U+0336}
    ~$+y::return
    ~$+z::Send, {U+0336}

    ~$0::Send, {U+0336}
    ~$1::Send, {U+0336}
    ~$2::Send, {U+0336}
    ~$3::Send, {U+0336}
    ~$4::Send, {U+0336}
    ~$5::Send, {U+0336}
    ~$6::Send, {U+0336}
    ~$7::Send, {U+0336}
    ~$8::Send, {U+0336}
    ~$9::Send, {U+0336}

    ~Space::Send, {U+0336}

    ~SC029::Send, {U+0336}
    ~+SC029::Send, {U+0336}
    ~+SC002::Send, {U+0336}
    ~+SC003::Send, {U+0336}
    ~+SC004::Send, {U+0336}
    ~+SC005::Send, {U+0336}
    ~+SC006::Send, {U+0336}
    ~+SC007::Send, {U+0336}
    ~+SC008::Send, {U+0336}
    ~+SC009::Send, {U+0336}
    ~+SC00a::Send, {U+0336}
    ~+SC00b::Send, {U+0336}
    ~SC00c::Send, {U+0336}
    ~+SC00c::Send, {U+0336}
    ~SC00d::Send, {U+0336}
    ~+SC00d::Send, {U+0336}
    ~SC01a::Send, {U+0336}
    ~+SC01a::Send, {U+0336}
    ~SC01b::Send, {U+0336}
    ~+SC01b::Send, {U+0336}
    ~SC027::Send, {U+0336}
    ~+SC027::Send, {U+0336}
    ~SC028::Send, {U+0336}
    ~+SC028::Send, {U+0336}
    ~SC02b::Send, {U+0336}
    ~+SC02b::Send, {U+0336}
    ~SC033::Send, {U+0336}
    ~+SC033::Send, {U+0336}
    ~SC034::Send, {U+0336}
    ~+SC034::Send, {U+0336}
    ~SC035::Send, {U+0336}
    ~+SC035::Send, {U+0336}
    ~SC037::Send, {U+0336}
    ~SC04a::Send, {U+0336}
    ~SC04e::Send, {U+0336}
    ~SC053::Send, {U+0336}
}
return

#If font = "Default" and modifier = "Bold, Strikethrough" and Caps = "Off"
{
    $a::Send, {U+1D5EE}{U+0336}
    $b::Send, {U+1D5EF}{U+0336}
    $c::Send, {U+1D5F0}{U+0336}
    $d::Send, {U+1D5F1}{U+0336}
    $e::Send, {U+1D5F2}{U+0336}
    $f::Send, {U+1D5F3}{U+0336}
    $g::Send, {U+1D5F4}
    $h::Send, {U+1D5F5}{U+0336}
    $i::Send, {U+1D5F6}{U+0336}
    $j::Send, {U+1D5F7}
    $k::Send, {U+1D5F8}{U+0336}
    $l::Send, {U+1D5F9}{U+0336}
    $m::Send, {U+1D5FA}{U+0336}
    $n::Send, {U+1D5FB}{U+0336}
    $o::Send, {U+1D5FC}{U+0336}
    $p::Send, {U+1D5FD}
    $q::Send, {U+1D5FE}
    $r::Send, {U+1D5FF}{U+0336}
    $s::Send, {U+1D600}{U+0336}
    $t::Send, {U+1D601}{U+0336}
    $u::Send, {U+1D602}{U+0336}
    $v::Send, {U+1D603}{U+0336}
    $w::Send, {U+1D604}{U+0336}
    $x::Send, {U+1D605}{U+0336}
    $y::Send, {U+1D606}
    $z::Send, {U+1D607}{U+0336}

    $+a::Send, {U+1D5D4}{U+0336}
    $+b::Send, {U+1D5D5}{U+0336}
    $+c::Send, {U+1D5D6}{U+0336}
    $+d::Send, {U+1D5D7}{U+0336}
    $+e::Send, {U+1D5D8}{U+0336}
    $+f::Send, {U+1D5D9}{U+0336}
    $+g::Send, {U+1D5DA}{U+0336}
    $+h::Send, {U+1D5DB}{U+0336}
    $+i::Send, {U+1D5DC}{U+0336}
    $+j::Send, {U+1D5DD}{U+0336}
    $+k::Send, {U+1D5DE}{U+0336}
    $+l::Send, {U+1D5DF}{U+0336}
    $+m::Send, {U+1D5E0}{U+0336}
    $+n::Send, {U+1D5E1}{U+0336}
    $+o::Send, {U+1D5E2}{U+0336}
    $+p::Send, {U+1D5E3}{U+0336}
    $+q::Send, {U+1D5E4}{U+0336}
    $+r::Send, {U+1D5E5}{U+0336}
    $+s::Send, {U+1D5E6}{U+0336}
    $+t::Send, {U+1D5E7}{U+0336}
    $+u::Send, {U+1D5E8}{U+0336}
    $+v::Send, {U+1D5E9}{U+0336}
    $+w::Send, {U+1D5EA}{U+0336}
    $+x::Send, {U+1D5EB}{U+0336}
    $+y::Send, {U+1D5EC}{U+0336}
    $+z::Send, {U+1D5ED}{U+0336}

    $0::Send, {U+1D7EC}{U+0336}
    $1::Send, {U+1D7ED}{U+0336}
    $2::Send, {U+1D7EE}{U+0336}
    $3::Send, {U+1D7EF}{U+0336}
    $4::Send, {U+1D7F0}{U+0336}
    $5::Send, {U+1D7F1}{U+0336}
    $6::Send, {U+1D7F2}{U+0336}
    $7::Send, {U+1D7F3}{U+0336}
    $8::Send, {U+1D7F4}{U+0336}
    $9::Send, {U+1D7F5}{U+0336}

    ~Space::Send, {U+0336}

    ~SC029::Send, {U+0336}
    ~+SC029::Send, {U+0336}
    ~+SC002::Send, {U+0336}
    ~+SC003::Send, {U+0336}
    ~+SC004::Send, {U+0336}
    ~+SC005::Send, {U+0336}
    ~+SC006::Send, {U+0336}
    ~+SC007::Send, {U+0336}
    ~+SC008::Send, {U+0336}
    ~+SC009::Send, {U+0336}
    ~+SC00a::Send, {U+0336}
    ~+SC00b::Send, {U+0336}
    ~SC00c::Send, {U+0336}
    ~+SC00c::Send, {U+0336}
    ~SC00d::Send, {U+0336}
    ~+SC00d::Send, {U+0336}
    ~SC01a::Send, {U+0336}
    ~+SC01a::Send, {U+0336}
    ~SC01b::Send, {U+0336}
    ~+SC01b::Send, {U+0336}
    ~SC027::Send, {U+0336}
    ~+SC027::Send, {U+0336}
    ~SC028::Send, {U+0336}
    ~+SC028::Send, {U+0336}
    ~SC02b::Send, {U+0336}
    ~+SC02b::Send, {U+0336}
    ~SC033::Send, {U+0336}
    ~+SC033::Send, {U+0336}
    ~SC034::Send, {U+0336}
    ~+SC034::Send, {U+0336}
    ~SC035::Send, {U+0336}
    ~+SC035::Send, {U+0336}
    ~SC037::Send, {U+0336}
    ~SC04a::Send, {U+0336}
    ~SC04e::Send, {U+0336}
    ~SC053::Send, {U+0336}
}
return

#If font = "Default" and modifier = "Bold, Strikethrough" and Caps = "On"
{
    $a::Send, {U+1D5D4}{U+0336}
    $b::Send, {U+1D5D5}{U+0336}
    $c::Send, {U+1D5D6}{U+0336}
    $d::Send, {U+1D5D7}{U+0336}
    $e::Send, {U+1D5D8}{U+0336}
    $f::Send, {U+1D5D9}{U+0336}
    $g::Send, {U+1D5DA}{U+0336}
    $h::Send, {U+1D5DB}{U+0336}
    $i::Send, {U+1D5DC}{U+0336}
    $j::Send, {U+1D5DD}{U+0336}
    $k::Send, {U+1D5DE}{U+0336}
    $l::Send, {U+1D5DF}{U+0336}
    $m::Send, {U+1D5E0}{U+0336}
    $n::Send, {U+1D5E1}{U+0336}
    $o::Send, {U+1D5E2}{U+0336}
    $p::Send, {U+1D5E3}{U+0336}
    $q::Send, {U+1D5E4}{U+0336}
    $r::Send, {U+1D5E5}{U+0336}
    $s::Send, {U+1D5E6}{U+0336}
    $t::Send, {U+1D5E7}{U+0336}
    $u::Send, {U+1D5E8}{U+0336}
    $v::Send, {U+1D5E9}{U+0336}
    $w::Send, {U+1D5EA}{U+0336}
    $x::Send, {U+1D5EB}{U+0336}
    $y::Send, {U+1D5EC}{U+0336}
    $z::Send, {U+1D5ED}{U+0336}

    $+a::Send, {U+1D5EE}{U+0336}
    $+b::Send, {U+1D5EF}{U+0336}
    $+c::Send, {U+1D5F0}{U+0336}
    $+d::Send, {U+1D5F1}{U+0336}
    $+e::Send, {U+1D5F2}{U+0336}
    $+f::Send, {U+1D5F3}{U+0336}
    $+g::Send, {U+1D5F4}
    $+h::Send, {U+1D5F5}{U+0336}
    $+i::Send, {U+1D5F6}{U+0336}
    $+j::Send, {U+1D5F7}
    $+k::Send, {U+1D5F8}{U+0336}
    $+l::Send, {U+1D5F9}{U+0336}
    $+m::Send, {U+1D5FA}{U+0336}
    $+n::Send, {U+1D5FB}{U+0336}
    $+o::Send, {U+1D5FC}{U+0336}
    $+p::Send, {U+1D5FD}
    $+q::Send, {U+1D5FE}
    $+r::Send, {U+1D5FF}{U+0336}
    $+s::Send, {U+1D600}{U+0336}
    $+t::Send, {U+1D601}{U+0336}
    $+u::Send, {U+1D602}{U+0336}
    $+v::Send, {U+1D603}{U+0336}
    $+w::Send, {U+1D604}{U+0336}
    $+x::Send, {U+1D605}{U+0336}
    $+y::Send, {U+1D606}
    $+z::Send, {U+1D607}{U+0336}

    $0::Send, {U+1D7EC}{U+0336}
    $1::Send, {U+1D7ED}{U+0336}
    $2::Send, {U+1D7EE}{U+0336}
    $3::Send, {U+1D7EF}{U+0336}
    $4::Send, {U+1D7F0}{U+0336}
    $5::Send, {U+1D7F1}{U+0336}
    $6::Send, {U+1D7F2}{U+0336}
    $7::Send, {U+1D7F3}{U+0336}
    $8::Send, {U+1D7F4}{U+0336}
    $9::Send, {U+1D7F5}{U+0336}

    ~Space::Send, {U+0336}

    ~SC029::Send, {U+0336}
    ~+SC029::Send, {U+0336}
    ~+SC002::Send, {U+0336}
    ~+SC003::Send, {U+0336}
    ~+SC004::Send, {U+0336}
    ~+SC005::Send, {U+0336}
    ~+SC006::Send, {U+0336}
    ~+SC007::Send, {U+0336}
    ~+SC008::Send, {U+0336}
    ~+SC009::Send, {U+0336}
    ~+SC00a::Send, {U+0336}
    ~+SC00b::Send, {U+0336}
    ~SC00c::Send, {U+0336}
    ~+SC00c::Send, {U+0336}
    ~SC00d::Send, {U+0336}
    ~+SC00d::Send, {U+0336}
    ~SC01a::Send, {U+0336}
    ~+SC01a::Send, {U+0336}
    ~SC01b::Send, {U+0336}
    ~+SC01b::Send, {U+0336}
    ~SC027::Send, {U+0336}
    ~+SC027::Send, {U+0336}
    ~SC028::Send, {U+0336}
    ~+SC028::Send, {U+0336}
    ~SC02b::Send, {U+0336}
    ~+SC02b::Send, {U+0336}
    ~SC033::Send, {U+0336}
    ~+SC033::Send, {U+0336}
    ~SC034::Send, {U+0336}
    ~+SC034::Send, {U+0336}
    ~SC035::Send, {U+0336}
    ~+SC035::Send, {U+0336}
    ~SC037::Send, {U+0336}
    ~SC04a::Send, {U+0336}
    ~SC04e::Send, {U+0336}
    ~SC053::Send, {U+0336}
}
return

#If font = "Default" and modifier = "Italics, Strikethrough" and Caps = "Off"
{
    $a::Send, {U+1D622}{U+0336}
    $b::Send, {U+1D623}{U+0336}
    $c::Send, {U+1D624}{U+0336}
    $d::Send, {U+1D625}{U+0336}
    $e::Send, {U+1D626}{U+0336}
    $f::Send, {U+1D627}{U+0336}
    $g::Send, {U+1D628}
    $h::Send, {U+1D629}{U+0336}
    $i::Send, {U+1D62A}{U+0336}
    $j::Send, {U+1D62B}
    $k::Send, {U+1D62C}{U+0336}
    $l::Send, {U+1D62D}{U+0336}
    $m::Send, {U+1D62E}{U+0336}
    $n::Send, {U+1D62F}{U+0336}
    $o::Send, {U+1D630}{U+0336}
    $p::Send, {U+1D631}
    $q::Send, {U+1D632}
    $r::Send, {U+1D633}{U+0336}
    $s::Send, {U+1D634}{U+0336}
    $t::Send, {U+1D635}{U+0336}
    $u::Send, {U+1D636}{U+0336}
    $v::Send, {U+1D637}{U+0336}
    $w::Send, {U+1D638}{U+0336}
    $x::Send, {U+1D639}{U+0336}
    $y::Send, {U+1D63A}
    $z::Send, {U+1D63B}{U+0336}

    $+a::Send, {U+1D608}{U+0336}
    $+b::Send, {U+1D609}{U+0336}
    $+c::Send, {U+1D60A}{U+0336}
    $+d::Send, {U+1D60B}{U+0336}
    $+e::Send, {U+1D60C}{U+0336}
    $+f::Send, {U+1D60D}{U+0336}
    $+g::Send, {U+1D60E}{U+0336}
    $+h::Send, {U+1D60F}{U+0336}
    $+i::Send, {U+1D610}{U+0336}
    $+j::Send, {U+1D611}{U+0336}
    $+k::Send, {U+1D612}{U+0336}
    $+l::Send, {U+1D613}{U+0336}
    $+m::Send, {U+1D614}{U+0336}
    $+n::Send, {U+1D615}{U+0336}
    $+o::Send, {U+1D616}{U+0336}
    $+p::Send, {U+1D617}{U+0336}
    $+q::Send, {U+1D618}{U+0336}
    $+r::Send, {U+1D619}{U+0336}
    $+s::Send, {U+1D61A}{U+0336}
    $+t::Send, {U+1D61B}{U+0336}
    $+u::Send, {U+1D61C}{U+0336}
    $+v::Send, {U+1D61D}{U+0336}
    $+w::Send, {U+1D61E}{U+0336}
    $+x::Send, {U+1D61F}{U+0336}
    $+y::Send, {U+1D620}{U+0336}
    $+z::Send, {U+1D621}{U+0336}

    ~Space::Send, {U+0336}

    ~SC029::Send, {U+0336}
    ~+SC029::Send, {U+0336}
    ~+SC002::Send, {U+0336}
    ~+SC003::Send, {U+0336}
    ~+SC004::Send, {U+0336}
    ~+SC005::Send, {U+0336}
    ~+SC006::Send, {U+0336}
    ~+SC007::Send, {U+0336}
    ~+SC008::Send, {U+0336}
    ~+SC009::Send, {U+0336}
    ~+SC00a::Send, {U+0336}
    ~+SC00b::Send, {U+0336}
    ~SC00c::Send, {U+0336}
    ~+SC00c::Send, {U+0336}
    ~SC00d::Send, {U+0336}
    ~+SC00d::Send, {U+0336}
    ~SC01a::Send, {U+0336}
    ~+SC01a::Send, {U+0336}
    ~SC01b::Send, {U+0336}
    ~+SC01b::Send, {U+0336}
    ~SC027::Send, {U+0336}
    ~+SC027::Send, {U+0336}
    ~SC028::Send, {U+0336}
    ~+SC028::Send, {U+0336}
    ~SC02b::Send, {U+0336}
    ~+SC02b::Send, {U+0336}
    ~SC033::Send, {U+0336}
    ~+SC033::Send, {U+0336}
    ~SC034::Send, {U+0336}
    ~+SC034::Send, {U+0336}
    ~SC035::Send, {U+0336}
    ~+SC035::Send, {U+0336}
    ~SC037::Send, {U+0336}
    ~SC04a::Send, {U+0336}
    ~SC04e::Send, {U+0336}
    ~SC053::Send, {U+0336}
}
return

#If font = "Default" and modifier = "Italics, Strikethrough" and Caps = "On"
{
    $a::Send, {U+1D608}{U+0336}
    $b::Send, {U+1D609}{U+0336}
    $c::Send, {U+1D60A}{U+0336}
    $d::Send, {U+1D60B}{U+0336}
    $e::Send, {U+1D60C}{U+0336}
    $f::Send, {U+1D60D}{U+0336}
    $g::Send, {U+1D60E}{U+0336}
    $h::Send, {U+1D60F}{U+0336}
    $i::Send, {U+1D610}{U+0336}
    $j::Send, {U+1D611}{U+0336}
    $k::Send, {U+1D612}{U+0336}
    $l::Send, {U+1D613}{U+0336}
    $m::Send, {U+1D614}{U+0336}
    $n::Send, {U+1D615}{U+0336}
    $o::Send, {U+1D616}{U+0336}
    $p::Send, {U+1D617}{U+0336}
    $q::Send, {U+1D618}{U+0336}
    $r::Send, {U+1D619}{U+0336}
    $s::Send, {U+1D61A}{U+0336}
    $t::Send, {U+1D61B}{U+0336}
    $u::Send, {U+1D61C}{U+0336}
    $v::Send, {U+1D61D}{U+0336}
    $w::Send, {U+1D61E}{U+0336}
    $x::Send, {U+1D61F}{U+0336}
    $y::Send, {U+1D620}{U+0336}
    $z::Send, {U+1D621}{U+0336}

    $+a::Send, {U+1D622}{U+0336}
    $+b::Send, {U+1D623}{U+0336}
    $+c::Send, {U+1D624}{U+0336}
    $+d::Send, {U+1D625}{U+0336}
    $+e::Send, {U+1D626}{U+0336}
    $+f::Send, {U+1D627}{U+0336}
    $+g::Send, {U+1D628}
    $+h::Send, {U+1D629}{U+0336}
    $+i::Send, {U+1D62A}{U+0336}
    $+j::Send, {U+1D62B}
    $+k::Send, {U+1D62C}{U+0336}
    $+l::Send, {U+1D62D}{U+0336}
    $+m::Send, {U+1D62E}{U+0336}
    $+n::Send, {U+1D62F}{U+0336}
    $+o::Send, {U+1D630}{U+0336}
    $+p::Send, {U+1D631}
    $+q::Send, {U+1D632}
    $+r::Send, {U+1D633}{U+0336}
    $+s::Send, {U+1D634}{U+0336}
    $+t::Send, {U+1D635}{U+0336}
    $+u::Send, {U+1D636}{U+0336}
    $+v::Send, {U+1D637}{U+0336}
    $+w::Send, {U+1D638}{U+0336}
    $+x::Send, {U+1D639}{U+0336}
    $+y::Send, {U+1D63A}
    $+z::Send, {U+1D63B}{U+0336}

    ~Space::Send, {U+0336}

    ~SC029::Send, {U+0336}
    ~+SC029::Send, {U+0336}
    ~+SC002::Send, {U+0336}
    ~+SC003::Send, {U+0336}
    ~+SC004::Send, {U+0336}
    ~+SC005::Send, {U+0336}
    ~+SC006::Send, {U+0336}
    ~+SC007::Send, {U+0336}
    ~+SC008::Send, {U+0336}
    ~+SC009::Send, {U+0336}
    ~+SC00a::Send, {U+0336}
    ~+SC00b::Send, {U+0336}
    ~SC00c::Send, {U+0336}
    ~+SC00c::Send, {U+0336}
    ~SC00d::Send, {U+0336}
    ~+SC00d::Send, {U+0336}
    ~SC01a::Send, {U+0336}
    ~+SC01a::Send, {U+0336}
    ~SC01b::Send, {U+0336}
    ~+SC01b::Send, {U+0336}
    ~SC027::Send, {U+0336}
    ~+SC027::Send, {U+0336}
    ~SC028::Send, {U+0336}
    ~+SC028::Send, {U+0336}
    ~SC02b::Send, {U+0336}
    ~+SC02b::Send, {U+0336}
    ~SC033::Send, {U+0336}
    ~+SC033::Send, {U+0336}
    ~SC034::Send, {U+0336}
    ~+SC034::Send, {U+0336}
    ~SC035::Send, {U+0336}
    ~+SC035::Send, {U+0336}
    ~SC037::Send, {U+0336}
    ~SC04a::Send, {U+0336}
    ~SC04e::Send, {U+0336}
    ~SC053::Send, {U+0336}
}
return

#If font = "Default" and modifier = "Bold, Italics, Strikethrough" and Caps = "Off"
{
    $a::Send, {U+1D656}{U+0336}
    $b::Send, {U+1D657}{U+0336}
    $c::Send, {U+1D658}{U+0336}
    $d::Send, {U+1D659}{U+0336}
    $e::Send, {U+1D65A}{U+0336}
    $f::Send, {U+1D65B}{U+0336}
    $g::Send, {U+1D65C}
    $h::Send, {U+1D65D}{U+0336}
    $i::Send, {U+1D65E}{U+0336}
    $j::Send, {U+1D65F}
    $k::Send, {U+1D660}{U+0336}
    $l::Send, {U+1D661}{U+0336}
    $m::Send, {U+1D662}{U+0336}
    $n::Send, {U+1D663}{U+0336}
    $o::Send, {U+1D664}{U+0336}
    $p::Send, {U+1D665}
    $q::Send, {U+1D666}
    $r::Send, {U+1D667}{U+0336}
    $s::Send, {U+1D668}{U+0336}
    $t::Send, {U+1D669}{U+0336}
    $u::Send, {U+1D66A}{U+0336}
    $v::Send, {U+1D66B}{U+0336}
    $w::Send, {U+1D66C}{U+0336}
    $x::Send, {U+1D66D}{U+0336}
    $y::Send, {U+1D66E}
    $z::Send, {U+1D66F}{U+0336}

    $+a::Send, {U+1D63C}{U+0336}
    $+b::Send, {U+1D63D}{U+0336}
    $+c::Send, {U+1D63E}{U+0336}
    $+d::Send, {U+1D63F}{U+0336}
    $+e::Send, {U+1D640}{U+0336}
    $+f::Send, {U+1D641}{U+0336}
    $+g::Send, {U+1D642}{U+0336}
    $+h::Send, {U+1D643}{U+0336}
    $+i::Send, {U+1D644}{U+0336}
    $+j::Send, {U+1D645}{U+0336}
    $+k::Send, {U+1D646}{U+0336}
    $+l::Send, {U+1D647}{U+0336}
    $+m::Send, {U+1D648}{U+0336}
    $+n::Send, {U+1D649}{U+0336}
    $+o::Send, {U+1D64A}{U+0336}
    $+p::Send, {U+1D64B}{U+0336}
    $+q::Send, {U+1D64C}{U+0336}
    $+r::Send, {U+1D64D}{U+0336}
    $+s::Send, {U+1D64E}{U+0336}
    $+t::Send, {U+1D64F}{U+0336}
    $+u::Send, {U+1D650}{U+0336}
    $+v::Send, {U+1D651}{U+0336}
    $+w::Send, {U+1D652}{U+0336}
    $+x::Send, {U+1D653}{U+0336}
    $+y::Send, {U+1D654}{U+0336}
    $+z::Send, {U+1D655}{U+0336}

    $0::Send, {U+1D7EC}{U+0336}
    $1::Send, {U+1D7ED}{U+0336}
    $2::Send, {U+1D7EE}{U+0336}
    $3::Send, {U+1D7EF}{U+0336}
    $4::Send, {U+1D7F0}{U+0336}
    $5::Send, {U+1D7F1}{U+0336}
    $6::Send, {U+1D7F2}{U+0336}
    $7::Send, {U+1D7F3}{U+0336}
    $8::Send, {U+1D7F4}{U+0336}
    $9::Send, {U+1D7F5}{U+0336}

    ~Space::Send, {U+0336}

    ~SC029::Send, {U+0336}
    ~+SC029::Send, {U+0336}
    ~+SC002::Send, {U+0336}
    ~+SC003::Send, {U+0336}
    ~+SC004::Send, {U+0336}
    ~+SC005::Send, {U+0336}
    ~+SC006::Send, {U+0336}
    ~+SC007::Send, {U+0336}
    ~+SC008::Send, {U+0336}
    ~+SC009::Send, {U+0336}
    ~+SC00a::Send, {U+0336}
    ~+SC00b::Send, {U+0336}
    ~SC00c::Send, {U+0336}
    ~+SC00c::Send, {U+0336}
    ~SC00d::Send, {U+0336}
    ~+SC00d::Send, {U+0336}
    ~SC01a::Send, {U+0336}
    ~+SC01a::Send, {U+0336}
    ~SC01b::Send, {U+0336}
    ~+SC01b::Send, {U+0336}
    ~SC027::Send, {U+0336}
    ~+SC027::Send, {U+0336}
    ~SC028::Send, {U+0336}
    ~+SC028::Send, {U+0336}
    ~SC02b::Send, {U+0336}
    ~+SC02b::Send, {U+0336}
    ~SC033::Send, {U+0336}
    ~+SC033::Send, {U+0336}
    ~SC034::Send, {U+0336}
    ~+SC034::Send, {U+0336}
    ~SC035::Send, {U+0336}
    ~+SC035::Send, {U+0336}
    ~SC037::Send, {U+0336}
    ~SC04a::Send, {U+0336}
    ~SC04e::Send, {U+0336}
    ~SC053::Send, {U+0336}
}
return

#If font = "Default" and modifier = "Bold, Italics, Strikethrough" and Caps = "On"
{
    $a::Send, {U+1D63C}{U+0336}
    $b::Send, {U+1D63D}{U+0336}
    $c::Send, {U+1D63E}{U+0336}
    $d::Send, {U+1D63F}{U+0336}
    $e::Send, {U+1D640}{U+0336}
    $f::Send, {U+1D641}{U+0336}
    $g::Send, {U+1D642}{U+0336}
    $h::Send, {U+1D643}{U+0336}
    $i::Send, {U+1D644}{U+0336}
    $j::Send, {U+1D645}{U+0336}
    $k::Send, {U+1D646}{U+0336}
    $l::Send, {U+1D647}{U+0336}
    $m::Send, {U+1D648}{U+0336}
    $n::Send, {U+1D649}{U+0336}
    $o::Send, {U+1D64A}{U+0336}
    $p::Send, {U+1D64B}{U+0336}
    $q::Send, {U+1D64C}{U+0336}
    $r::Send, {U+1D64D}{U+0336}
    $s::Send, {U+1D64E}{U+0336}
    $t::Send, {U+1D64F}{U+0336}
    $u::Send, {U+1D650}{U+0336}
    $v::Send, {U+1D651}{U+0336}
    $w::Send, {U+1D652}{U+0336}
    $x::Send, {U+1D653}{U+0336}
    $y::Send, {U+1D654}{U+0336}
    $z::Send, {U+1D655}{U+0336}

    $+a::Send, {U+1D656}{U+0336}
    $+b::Send, {U+1D657}{U+0336}
    $+c::Send, {U+1D658}{U+0336}
    $+d::Send, {U+1D659}{U+0336}
    $+e::Send, {U+1D65A}{U+0336}
    $+f::Send, {U+1D65B}{U+0336}
    $+g::Send, {U+1D65C}
    $+h::Send, {U+1D65D}{U+0336}
    $+i::Send, {U+1D65E}{U+0336}
    $+j::Send, {U+1D65F}
    $+k::Send, {U+1D660}{U+0336}
    $+l::Send, {U+1D661}{U+0336}
    $+m::Send, {U+1D662}{U+0336}
    $+n::Send, {U+1D663}{U+0336}
    $+o::Send, {U+1D664}{U+0336}
    $+p::Send, {U+1D665}
    $+q::Send, {U+1D666}
    $+r::Send, {U+1D667}{U+0336}
    $+s::Send, {U+1D668}{U+0336}
    $+t::Send, {U+1D669}{U+0336}
    $+u::Send, {U+1D66A}{U+0336}
    $+v::Send, {U+1D66B}{U+0336}
    $+w::Send, {U+1D66C}{U+0336}
    $+x::Send, {U+1D66D}{U+0336}
    $+y::Send, {U+1D66E}
    $+z::Send, {U+1D66F}{U+0336}

    $0::Send, {U+1D7EC}{U+0336}
    $1::Send, {U+1D7ED}{U+0336}
    $2::Send, {U+1D7EE}{U+0336}
    $3::Send, {U+1D7EF}{U+0336}
    $4::Send, {U+1D7F0}{U+0336}
    $5::Send, {U+1D7F1}{U+0336}
    $6::Send, {U+1D7F2}{U+0336}
    $7::Send, {U+1D7F3}{U+0336}
    $8::Send, {U+1D7F4}{U+0336}
    $9::Send, {U+1D7F5}{U+0336}

    ~Space::Send, {U+0336}

    ~SC029::Send, {U+0336}
    ~+SC029::Send, {U+0336}
    ~+SC002::Send, {U+0336}
    ~+SC003::Send, {U+0336}
    ~+SC004::Send, {U+0336}
    ~+SC005::Send, {U+0336}
    ~+SC006::Send, {U+0336}
    ~+SC007::Send, {U+0336}
    ~+SC008::Send, {U+0336}
    ~+SC009::Send, {U+0336}
    ~+SC00a::Send, {U+0336}
    ~+SC00b::Send, {U+0336}
    ~SC00c::Send, {U+0336}
    ~+SC00c::Send, {U+0336}
    ~SC00d::Send, {U+0336}
    ~+SC00d::Send, {U+0336}
    ~SC01a::Send, {U+0336}
    ~+SC01a::Send, {U+0336}
    ~SC01b::Send, {U+0336}
    ~+SC01b::Send, {U+0336}
    ~SC027::Send, {U+0336}
    ~+SC027::Send, {U+0336}
    ~SC028::Send, {U+0336}
    ~+SC028::Send, {U+0336}
    ~SC02b::Send, {U+0336}
    ~+SC02b::Send, {U+0336}
    ~SC033::Send, {U+0336}
    ~+SC033::Send, {U+0336}
    ~SC034::Send, {U+0336}
    ~+SC034::Send, {U+0336}
    ~SC035::Send, {U+0336}
    ~+SC035::Send, {U+0336}
    ~SC037::Send, {U+0336}
    ~SC04a::Send, {U+0336}
    ~SC04e::Send, {U+0336}
    ~SC053::Send, {U+0336}
}
return

;Underline and Strikethrough Modifiers
#If font = "Default" and modifier = "Underline, Strikethrough" and Caps = "Off"
{
    ~$a::Send, {U+0332}{U+0336}
    ~$b::Send, {U+0332}{U+0336}
    ~$c::Send, {U+0332}{U+0336}
    ~$d::Send, {U+0332}{U+0336}
    ~$e::Send, {U+0332}{U+0336}
    ~$f::Send, {U+0332}{U+0336}
    ~$g::return
    ~$h::Send, {U+0332}{U+0336}
    ~$i::Send, {U+0332}{U+0336}
    ~$j::return
    ~$k::Send, {U+0332}{U+0336}
    ~$l::Send, {U+0332}{U+0336}
    ~$m::Send, {U+0332}{U+0336}
    ~$n::Send, {U+0332}{U+0336}
    ~$o::Send, {U+0332}{U+0336}
    ~$p::return
    ~$q::return
    ~$r::Send, {U+0332}{U+0336}
    ~$s::Send, {U+0332}{U+0336}
    ~$t::Send, {U+0332}{U+0336}
    ~$u::Send, {U+0332}{U+0336}
    ~$v::Send, {U+0332}{U+0336}
    ~$w::Send, {U+0332}{U+0336}
    ~$x::Send, {U+0332}{U+0336}
    ~$y::return
    ~$z::Send, {U+0332}{U+0336}

    ~$+a::Send, {U+0332}{U+0336}
    ~$+b::Send, {U+0332}{U+0336}
    ~$+c::Send, {U+0332}{U+0336}
    ~$+d::Send, {U+0332}{U+0336}
    ~$+e::Send, {U+0332}{U+0336}
    ~$+f::Send, {U+0332}{U+0336}
    ~$+g::Send, {U+0332}{U+0336}
    ~$+h::Send, {U+0332}{U+0336}
    ~$+i::Send, {U+0332}{U+0336}
    ~$+j::Send, {U+0332}{U+0336}
    ~$+k::Send, {U+0332}{U+0336}
    ~$+l::Send, {U+0332}{U+0336}
    ~$+m::Send, {U+0332}{U+0336}
    ~$+n::Send, {U+0332}{U+0336}
    ~$+o::Send, {U+0332}{U+0336}
    ~$+p::Send, {U+0332}{U+0336}
    ~$+q::Send, {U+0332}{U+0336}
    ~$+r::Send, {U+0332}{U+0336}
    ~$+s::Send, {U+0332}{U+0336}
    ~$+t::Send, {U+0332}{U+0336}
    ~$+u::Send, {U+0332}{U+0336}
    ~$+v::Send, {U+0332}{U+0336}
    ~$+w::Send, {U+0332}{U+0336}
    ~$+x::Send, {U+0332}{U+0336}
    ~$+y::Send, {U+0332}{U+0336}
    ~$+z::Send, {U+0332}{U+0336}

    ~$1::Send, {U+0332}{U+0336}
    ~$2::Send, {U+0332}{U+0336}
    ~$3::Send, {U+0332}{U+0336}
    ~$4::Send, {U+0332}{U+0336}
    ~$5::Send, {U+0332}{U+0336}
    ~$6::Send, {U+0332}{U+0336}
    ~$7::Send, {U+0332}{U+0336}
    ~$8::Send, {U+0332}{U+0336}
    ~$9::Send, {U+0332}{U+0336}
    ~$0::Send, {U+0332}{U+0336}

    ~Space::Send, {U+0332}{U+0336}

    ~SC029::Send, {U+0332}{U+0336}
    ~+SC029::Send, {U+0332}{U+0336}
    ~+SC002::Send, {U+0332}{U+0336}
    ~+SC003::Send, {U+0332}{U+0336}
    ~+SC004::Send, {U+0332}{U+0336}
    ~+SC005::Send, {U+0332}{U+0336}
    ~+SC006::Send, {U+0332}{U+0336}
    ~+SC007::Send, {U+0332}{U+0336}
    ~+SC008::Send, {U+0332}{U+0336}
    ~+SC009::Send, {U+0332}{U+0336}
    ~+SC00a::Send, {U+0332}{U+0336}
    ~+SC00b::Send, {U+0332}{U+0336}
    ~SC00c::Send, {U+0332}{U+0336}
    ~+SC00c::Send, {U+0332}{U+0336}
    ~SC00d::Send, {U+0332}{U+0336}
    ~+SC00d::Send, {U+0332}{U+0336}
    ~SC01a::Send, {U+0332}{U+0336}
    ~+SC01a::Send, {U+0332}{U+0336}
    ~SC01b::Send, {U+0332}{U+0336}
    ~+SC01b::Send, {U+0332}{U+0336}
    ~SC027::Send, {U+0332}{U+0336}
    ~+SC027::Send, {U+0332}{U+0336}
    ~SC028::Send, {U+0332}{U+0336}
    ~+SC028::Send, {U+0332}{U+0336}
    ~SC02b::Send, {U+0332}{U+0336}
    ~+SC02b::Send, {U+0332}{U+0336}
    ~SC033::Send, {U+0332}{U+0336}
    ~+SC033::Send, {U+0332}{U+0336}
    ~SC034::Send, {U+0332}{U+0336}
    ~+SC034::Send, {U+0332}{U+0336}
    ~SC035::Send, {U+0332}{U+0336}
    ~+SC035::Send, {U+0332}{U+0336}
    ~SC037::Send, {U+0332}{U+0336}
    ~SC04a::Send, {U+0332}{U+0336}
    ~SC04e::Send, {U+0332}{U+0336}
    ~SC053::Send, {U+0332}{U+0336}
}
return

#If font = "Default" and modifier = "Underline, Strikethrough" and Caps = "On"
{
    ~$a::Send, {U+0332}{U+0336}
    ~$b::Send, {U+0332}{U+0336}
    ~$c::Send, {U+0332}{U+0336}
    ~$d::Send, {U+0332}{U+0336}
    ~$e::Send, {U+0332}{U+0336}
    ~$f::Send, {U+0332}{U+0336}
    ~$g::Send, {U+0332}{U+0336}
    ~$h::Send, {U+0332}{U+0336}
    ~$i::Send, {U+0332}{U+0336}
    ~$j::Send, {U+0332}{U+0336}
    ~$k::Send, {U+0332}{U+0336}
    ~$l::Send, {U+0332}{U+0336}
    ~$m::Send, {U+0332}{U+0336}
    ~$n::Send, {U+0332}{U+0336}
    ~$o::Send, {U+0332}{U+0336}
    ~$p::Send, {U+0332}{U+0336}
    ~$q::Send, {U+0332}{U+0336}
    ~$r::Send, {U+0332}{U+0336}
    ~$s::Send, {U+0332}{U+0336}
    ~$t::Send, {U+0332}{U+0336}
    ~$u::Send, {U+0332}{U+0336}
    ~$v::Send, {U+0332}{U+0336}
    ~$w::Send, {U+0332}{U+0336}
    ~$x::Send, {U+0332}{U+0336}
    ~$y::Send, {U+0332}{U+0336}
    ~$z::Send, {U+0332}{U+0336}

    ~$+a::Send, {U+0332}{U+0336}
    ~$+b::Send, {U+0332}{U+0336}
    ~$+c::Send, {U+0332}{U+0336}
    ~$+d::Send, {U+0332}{U+0336}
    ~$+e::Send, {U+0332}{U+0336}
    ~$+f::Send, {U+0332}{U+0336}
    ~$+g::return
    ~$+h::Send, {U+0332}{U+0336}
    ~$+i::Send, {U+0332}{U+0336}
    ~$+j::return
    ~$+k::Send, {U+0332}{U+0336}
    ~$+l::Send, {U+0332}{U+0336}
    ~$+m::Send, {U+0332}{U+0336}
    ~$+n::Send, {U+0332}{U+0336}
    ~$+o::Send, {U+0332}{U+0336}
    ~$+p::return
    ~$+q::return
    ~$+r::Send, {U+0332}{U+0336}
    ~$+s::Send, {U+0332}{U+0336}
    ~$+t::Send, {U+0332}{U+0336}
    ~$+u::Send, {U+0332}{U+0336}
    ~$+v::Send, {U+0332}{U+0336}
    ~$+w::Send, {U+0332}{U+0336}
    ~$+x::Send, {U+0332}{U+0336}
    ~$+y::return
    ~$+z::Send, {U+0332}{U+0336}

    ~$0::Send, {U+0332}{U+0336}
    ~$1::Send, {U+0332}{U+0336}
    ~$2::Send, {U+0332}{U+0336}
    ~$3::Send, {U+0332}{U+0336}
    ~$4::Send, {U+0332}{U+0336}
    ~$5::Send, {U+0332}{U+0336}
    ~$6::Send, {U+0332}{U+0336}
    ~$7::Send, {U+0332}{U+0336}
    ~$8::Send, {U+0332}{U+0336}
    ~$9::Send, {U+0332}{U+0336}

    ~Space::Send, {U+0332}{U+0336}

    ~SC029::Send, {U+0332}{U+0336}
    ~+SC029::Send, {U+0332}{U+0336}
    ~+SC002::Send, {U+0332}{U+0336}
    ~+SC003::Send, {U+0332}{U+0336}
    ~+SC004::Send, {U+0332}{U+0336}
    ~+SC005::Send, {U+0332}{U+0336}
    ~+SC006::Send, {U+0332}{U+0336}
    ~+SC007::Send, {U+0332}{U+0336}
    ~+SC008::Send, {U+0332}{U+0336}
    ~+SC009::Send, {U+0332}{U+0336}
    ~+SC00a::Send, {U+0332}{U+0336}
    ~+SC00b::Send, {U+0332}{U+0336}
    ~SC00c::Send, {U+0332}{U+0336}
    ~+SC00c::Send, {U+0332}{U+0336}
    ~SC00d::Send, {U+0332}{U+0336}
    ~+SC00d::Send, {U+0332}{U+0336}
    ~SC01a::Send, {U+0332}{U+0336}
    ~+SC01a::Send, {U+0332}{U+0336}
    ~SC01b::Send, {U+0332}{U+0336}
    ~+SC01b::Send, {U+0332}{U+0336}
    ~SC027::Send, {U+0332}{U+0336}
    ~+SC027::Send, {U+0332}{U+0336}
    ~SC028::Send, {U+0332}{U+0336}
    ~+SC028::Send, {U+0332}{U+0336}
    ~SC02b::Send, {U+0332}{U+0336}
    ~+SC02b::Send, {U+0332}{U+0336}
    ~SC033::Send, {U+0332}{U+0336}
    ~+SC033::Send, {U+0332}{U+0336}
    ~SC034::Send, {U+0332}{U+0336}
    ~+SC034::Send, {U+0332}{U+0336}
    ~SC035::Send, {U+0332}{U+0336}
    ~+SC035::Send, {U+0332}{U+0336}
    ~SC037::Send, {U+0332}{U+0336}
    ~SC04a::Send, {U+0332}{U+0336}
    ~SC04e::Send, {U+0332}{U+0336}
    ~SC053::Send, {U+0332}{U+0336}
}
return

#If font = "Default" and modifier = "Bold, Underline, Strikethrough" and Caps = "Off"
{
    $a::Send, {U+1D5EE}{U+0332}{U+0336}
    $b::Send, {U+1D5EF}{U+0332}{U+0336}
    $c::Send, {U+1D5F0}{U+0332}{U+0336}
    $d::Send, {U+1D5F1}{U+0332}{U+0336}
    $e::Send, {U+1D5F2}{U+0332}{U+0336}
    $f::Send, {U+1D5F3}{U+0332}{U+0336}
    $g::Send, {U+1D5F4}{U+0336}
    $h::Send, {U+1D5F5}{U+0332}{U+0336}
    $i::Send, {U+1D5F6}{U+0332}{U+0336}
    $j::Send, {U+1D5F7}{U+0336}
    $k::Send, {U+1D5F8}{U+0332}{U+0336}
    $l::Send, {U+1D5F9}{U+0332}{U+0336}
    $m::Send, {U+1D5FA}{U+0332}{U+0336}
    $n::Send, {U+1D5FB}{U+0332}{U+0336}
    $o::Send, {U+1D5FC}{U+0332}{U+0336}
    $p::Send, {U+1D5FD}{U+0336}
    $q::Send, {U+1D5FE}{U+0336}
    $r::Send, {U+1D5FF}{U+0332}{U+0336}
    $s::Send, {U+1D600}{U+0332}{U+0336}
    $t::Send, {U+1D601}{U+0332}{U+0336}
    $u::Send, {U+1D602}{U+0332}{U+0336}
    $v::Send, {U+1D603}{U+0332}{U+0336}
    $w::Send, {U+1D604}{U+0332}{U+0336}
    $x::Send, {U+1D605}{U+0332}{U+0336}
    $y::Send, {U+1D606}{U+0336}
    $z::Send, {U+1D607}{U+0332}{U+0336}

    $+b::Send, {U+1D5D5}{U+0332}{U+0336}
    $+c::Send, {U+1D5D6}{U+0332}{U+0336}
    $+d::Send, {U+1D5D7}{U+0332}{U+0336}
    $+e::Send, {U+1D5D8}{U+0332}{U+0336}
    $+f::Send, {U+1D5D9}{U+0332}{U+0336}
    $+g::Send, {U+1D5DA}{U+0332}{U+0336}
    $+h::Send, {U+1D5DB}{U+0332}{U+0336}
    $+i::Send, {U+1D5DC}{U+0332}{U+0336}
    $+j::Send, {U+1D5DD}{U+0332}{U+0336}
    $+k::Send, {U+1D5DE}{U+0332}{U+0336}
    $+l::Send, {U+1D5DF}{U+0332}{U+0336}
    $+m::Send, {U+1D5E0}{U+0332}{U+0336}
    $+n::Send, {U+1D5E1}{U+0332}{U+0336}
    $+o::Send, {U+1D5E2}{U+0332}{U+0336}
    $+p::Send, {U+1D5E3}{U+0332}{U+0336}
    $+q::Send, {U+1D5E4}{U+0332}{U+0336}
    $+r::Send, {U+1D5E5}{U+0332}{U+0336}
    $+s::Send, {U+1D5E6}{U+0332}{U+0336}
    $+t::Send, {U+1D5E7}{U+0332}{U+0336}
    $+u::Send, {U+1D5E8}{U+0332}{U+0336}
    $+v::Send, {U+1D5E9}{U+0332}{U+0336}
    $+w::Send, {U+1D5EA}{U+0332}{U+0336}
    $+x::Send, {U+1D5EB}{U+0332}{U+0336}
    $+y::Send, {U+1D5EC}{U+0332}{U+0336}
    $+z::Send, {U+1D5ED}{U+0332}{U+0336}
    
    $0::Send, {U+1D7EC}{U+0332}{U+0336}
    $1::Send, {U+1D7ED}{U+0332}{U+0336}
    $2::Send, {U+1D7EE}{U+0332}{U+0336}
    $3::Send, {U+1D7EF}{U+0332}{U+0336}
    $4::Send, {U+1D7F0}{U+0332}{U+0336}
    $5::Send, {U+1D7F1}{U+0332}{U+0336}
    $6::Send, {U+1D7F2}{U+0332}{U+0336}
    $7::Send, {U+1D7F3}{U+0332}{U+0336}
    $8::Send, {U+1D7F4}{U+0332}{U+0336}
    $9::Send, {U+1D7F5}{U+0332}{U+0336}

    ~Space::Send, {U+0332}{U+0336}

    ~SC029::Send, {U+0336}
    ~+SC029::Send, {U+0336}
    ~+SC002::Send, {U+0336}
    ~+SC003::Send, {U+0336}
    ~+SC004::Send, {U+0336}
    ~+SC005::Send, {U+0336}
    ~+SC006::Send, {U+0336}
    ~+SC007::Send, {U+0336}
    ~+SC008::Send, {U+0336}
    ~+SC009::Send, {U+0336}
    ~+SC00a::Send, {U+0336}
    ~+SC00b::Send, {U+0336}
    ~SC00c::Send, {U+0336}
    ~+SC00c::Send, {U+0336}
    ~SC00d::Send, {U+0336}
    ~+SC00d::Send, {U+0336}
    ~SC01a::Send, {U+0336}
    ~+SC01a::Send, {U+0336}
    ~SC01b::Send, {U+0336}
    ~+SC01b::Send, {U+0336}
    ~SC027::Send, {U+0336}
    ~+SC027::Send, {U+0336}
    ~SC028::Send, {U+0336}
    ~+SC028::Send, {U+0336}
    ~SC02b::Send, {U+0336}
    ~+SC02b::Send, {U+0336}
    ~SC033::Send, {U+0336}
    ~+SC033::Send, {U+0336}
    ~SC034::Send, {U+0336}
    ~+SC034::Send, {U+0336}
    ~SC035::Send, {U+0336}
    ~+SC035::Send, {U+0336}
    ~SC037::Send, {U+0336}
    ~SC04a::Send, {U+0336}
    ~SC04e::Send, {U+0336}
    ~SC053::Send, {U+0336}
}
return

#If font = "Default" and modifier = "Bold, Underline, Strikethrough" and Caps = "On"
{
    $a::Send, {U+1D5D4}{U+0332}{U+0336}
    $b::Send, {U+1D5D5}{U+0332}{U+0336}
    $c::Send, {U+1D5D6}{U+0332}{U+0336}
    $d::Send, {U+1D5D7}{U+0332}{U+0336}
    $e::Send, {U+1D5D8}{U+0332}{U+0336}
    $f::Send, {U+1D5D9}{U+0332}{U+0336}
    $g::Send, {U+1D5DA}{U+0332}{U+0336}
    $h::Send, {U+1D5DB}{U+0332}{U+0336}
    $i::Send, {U+1D5DC}{U+0332}{U+0336}
    $j::Send, {U+1D5DD}{U+0332}{U+0336}
    $k::Send, {U+1D5DE}{U+0332}{U+0336}
    $l::Send, {U+1D5DF}{U+0332}{U+0336}
    $m::Send, {U+1D5E0}{U+0332}{U+0336}
    $n::Send, {U+1D5E1}{U+0332}{U+0336}
    $o::Send, {U+1D5E2}{U+0332}{U+0336}
    $p::Send, {U+1D5E3}{U+0332}{U+0336}
    $q::Send, {U+1D5E4}{U+0332}{U+0336}
    $r::Send, {U+1D5E5}{U+0332}{U+0336}
    $s::Send, {U+1D5E6}{U+0332}{U+0336}
    $t::Send, {U+1D5E7}{U+0332}{U+0336}
    $u::Send, {U+1D5E8}{U+0332}{U+0336}
    $v::Send, {U+1D5E9}{U+0332}{U+0336}
    $w::Send, {U+1D5EA}{U+0332}{U+0336}
    $x::Send, {U+1D5EB}{U+0332}{U+0336}
    $y::Send, {U+1D5EC}{U+0332}{U+0336}
    $z::Send, {U+1D5ED}{U+0332}{U+0336}

    $+a::Send, {U+1D5EE}{U+0332}{U+0336}
    $+b::Send, {U+1D5EF}{U+0332}{U+0336}
    $+c::Send, {U+1D5F0}{U+0332}{U+0336}
    $+d::Send, {U+1D5F1}{U+0332}{U+0336}
    $+e::Send, {U+1D5F2}{U+0332}{U+0336}
    $+f::Send, {U+1D5F3}{U+0332}{U+0336}
    $+g::Send, {U+1D5F4}{U+0336}
    $+h::Send, {U+1D5F5}{U+0332}{U+0336}
    $+i::Send, {U+1D5F6}{U+0332}{U+0336}
    $+j::Send, {U+1D5F7}{U+0336}
    $+k::Send, {U+1D5F8}{U+0332}{U+0336}
    $+l::Send, {U+1D5F9}{U+0332}{U+0336}
    $+m::Send, {U+1D5FA}{U+0332}{U+0336}
    $+n::Send, {U+1D5FB}{U+0332}{U+0336}
    $+o::Send, {U+1D5FC}{U+0332}{U+0336}
    $+p::Send, {U+1D5FD}{U+0336}
    $+q::Send, {U+1D5FE}{U+0336}
    $+r::Send, {U+1D5FF}{U+0332}{U+0336}
    $+s::Send, {U+1D600}{U+0332}{U+0336}
    $+t::Send, {U+1D601}{U+0332}{U+0336}
    $+u::Send, {U+1D602}{U+0332}{U+0336}
    $+v::Send, {U+1D603}{U+0332}{U+0336}
    $+w::Send, {U+1D604}{U+0332}{U+0336}
    $+x::Send, {U+1D605}{U+0332}{U+0336}
    $+y::Send, {U+1D606}{U+0336}
    $+z::Send, {U+1D607}{U+0332}{U+0336}

    $0::Send, {U+1D7EC}{U+0332}{U+0336}
    $1::Send, {U+1D7ED}{U+0332}{U+0336}
    $2::Send, {U+1D7EE}{U+0332}{U+0336}
    $3::Send, {U+1D7EF}{U+0332}{U+0336}
    $4::Send, {U+1D7F0}{U+0332}{U+0336}
    $5::Send, {U+1D7F1}{U+0332}{U+0336}
    $6::Send, {U+1D7F2}{U+0332}{U+0336}
    $7::Send, {U+1D7F3}{U+0332}{U+0336}
    $8::Send, {U+1D7F4}{U+0332}{U+0336}
    $9::Send, {U+1D7F5}{U+0332}{U+0336}

    ~Space::Send, {U+0332}{U+0336}

    ~SC029::Send, {U+0332}{U+0336}
    ~+SC029::Send, {U+0332}{U+0336}
    ~+SC002::Send, {U+0332}{U+0336}
    ~+SC003::Send, {U+0332}{U+0336}
    ~+SC004::Send, {U+0332}{U+0336}
    ~+SC005::Send, {U+0332}{U+0336}
    ~+SC006::Send, {U+0332}{U+0336}
    ~+SC007::Send, {U+0332}{U+0336}
    ~+SC008::Send, {U+0332}{U+0336}
    ~+SC009::Send, {U+0332}{U+0336}
    ~+SC00a::Send, {U+0332}{U+0336}
    ~+SC00b::Send, {U+0332}{U+0336}
    ~SC00c::Send, {U+0332}{U+0336}
    ~+SC00c::Send, {U+0332}{U+0336}
    ~SC00d::Send, {U+0332}{U+0336}
    ~+SC00d::Send, {U+0332}{U+0336}
    ~SC01a::Send, {U+0332}{U+0336}
    ~+SC01a::Send, {U+0332}{U+0336}
    ~SC01b::Send, {U+0332}{U+0336}
    ~+SC01b::Send, {U+0332}{U+0336}
    ~SC027::Send, {U+0332}{U+0336}
    ~+SC027::Send, {U+0332}{U+0336}
    ~SC028::Send, {U+0332}{U+0336}
    ~+SC028::Send, {U+0332}{U+0336}
    ~SC02b::Send, {U+0332}{U+0336}
    ~+SC02b::Send, {U+0332}{U+0336}
    ~SC033::Send, {U+0332}{U+0336}
    ~+SC033::Send, {U+0332}{U+0336}
    ~SC034::Send, {U+0332}{U+0336}
    ~+SC034::Send, {U+0332}{U+0336}
    ~SC035::Send, {U+0332}{U+0336}
    ~+SC035::Send, {U+0332}{U+0336}
    ~SC037::Send, {U+0332}{U+0336}
    ~SC04a::Send, {U+0332}{U+0336}
    ~SC04e::Send, {U+0332}{U+0336}
    ~SC053::Send, {U+0332}{U+0336}
}
return

#If font = "Default" and modifier = "Italics, Underline, Strikethrough" and Caps = "Off"
{
    $a::Send, {U+1D622}{U+0332}{U+0336}
    $b::Send, {U+1D623}{U+0332}{U+0336}
    $c::Send, {U+1D624}{U+0332}{U+0336}
    $d::Send, {U+1D625}{U+0332}{U+0336}
    $e::Send, {U+1D626}{U+0332}{U+0336}
    $f::Send, {U+1D627}{U+0332}{U+0336}
    $g::Send, {U+1D628}{U+0336}
    $h::Send, {U+1D629}{U+0332}{U+0336}
    $i::Send, {U+1D62A}{U+0332}{U+0336}
    $j::Send, {U+1D62B}{U+0336}
    $k::Send, {U+1D62C}{U+0332}{U+0336}
    $l::Send, {U+1D62D}{U+0332}{U+0336}
    $m::Send, {U+1D62E}{U+0332}{U+0336}
    $n::Send, {U+1D62F}{U+0332}{U+0336}
    $o::Send, {U+1D630}{U+0332}{U+0336}
    $p::Send, {U+1D631}{U+0336}
    $q::Send, {U+1D632}{U+0336}
    $r::Send, {U+1D633}{U+0332}{U+0336}
    $s::Send, {U+1D634}{U+0332}{U+0336}
    $t::Send, {U+1D635}{U+0332}{U+0336}
    $u::Send, {U+1D636}{U+0332}{U+0336}
    $v::Send, {U+1D637}{U+0332}{U+0336}
    $w::Send, {U+1D638}{U+0332}{U+0336}
    $x::Send, {U+1D639}{U+0332}{U+0336}
    $y::Send, {U+1D63A}{U+0336}
    $z::Send, {U+1D63B}{U+0332}{U+0336}

    $+a::Send, {U+1D608}{U+0332}{U+0336}
    $+b::Send, {U+1D609}{U+0332}{U+0336}
    $+c::Send, {U+1D60A}{U+0332}{U+0336}
    $+d::Send, {U+1D60B}{U+0332}{U+0336}
    $+e::Send, {U+1D60C}{U+0332}{U+0336}
    $+f::Send, {U+1D60D}{U+0332}{U+0336}
    $+g::Send, {U+1D60E}{U+0332}{U+0336}
    $+h::Send, {U+1D60F}{U+0332}{U+0336}
    $+i::Send, {U+1D610}{U+0332}{U+0336}
    $+j::Send, {U+1D611}{U+0332}{U+0336}
    $+k::Send, {U+1D612}{U+0332}{U+0336}
    $+l::Send, {U+1D613}{U+0332}{U+0336}
    $+m::Send, {U+1D614}{U+0332}{U+0336}
    $+n::Send, {U+1D615}{U+0332}{U+0336}
    $+o::Send, {U+1D616}{U+0332}{U+0336}
    $+p::Send, {U+1D617}{U+0332}{U+0336}
    $+q::Send, {U+1D618}{U+0332}{U+0336}
    $+r::Send, {U+1D619}{U+0332}{U+0336}
    $+s::Send, {U+1D61A}{U+0332}{U+0336}
    $+t::Send, {U+1D61B}{U+0332}{U+0336}
    $+u::Send, {U+1D61C}{U+0332}{U+0336}
    $+v::Send, {U+1D61D}{U+0332}{U+0336}
    $+w::Send, {U+1D61E}{U+0332}{U+0336}
    $+x::Send, {U+1D61F}{U+0332}{U+0336}
    $+y::Send, {U+1D620}{U+0332}{U+0336}
    $+z::Send, {U+1D621}{U+0332}{U+0336}

    ~Space::Send, {U+0332}{U+0336}

    ~SC029::Send, {U+0332}{U+0336}
    ~+SC029::Send, {U+0332}{U+0336}
    ~+SC002::Send, {U+0332}{U+0336}
    ~+SC003::Send, {U+0332}{U+0336}
    ~+SC004::Send, {U+0332}{U+0336}
    ~+SC005::Send, {U+0332}{U+0336}
    ~+SC006::Send, {U+0332}{U+0336}
    ~+SC007::Send, {U+0332}{U+0336}
    ~+SC008::Send, {U+0332}{U+0336}
    ~+SC009::Send, {U+0332}{U+0336}
    ~+SC00a::Send, {U+0332}{U+0336}
    ~+SC00b::Send, {U+0332}{U+0336}
    ~SC00c::Send, {U+0332}{U+0336}
    ~+SC00c::Send, {U+0332}{U+0336}
    ~SC00d::Send, {U+0332}{U+0336}
    ~+SC00d::Send, {U+0332}{U+0336}
    ~SC01a::Send, {U+0332}{U+0336}
    ~+SC01a::Send, {U+0332}{U+0336}
    ~SC01b::Send, {U+0332}{U+0336}
    ~+SC01b::Send, {U+0332}{U+0336}
    ~SC027::Send, {U+0332}{U+0336}
    ~+SC027::Send, {U+0332}{U+0336}
    ~SC028::Send, {U+0332}{U+0336}
    ~+SC028::Send, {U+0332}{U+0336}
    ~SC02b::Send, {U+0332}{U+0336}
    ~+SC02b::Send, {U+0332}{U+0336}
    ~SC033::Send, {U+0332}{U+0336}
    ~+SC033::Send, {U+0332}{U+0336}
    ~SC034::Send, {U+0332}{U+0336}
    ~+SC034::Send, {U+0332}{U+0336}
    ~SC035::Send, {U+0332}{U+0336}
    ~+SC035::Send, {U+0332}{U+0336}
    ~SC037::Send, {U+0332}{U+0336}
    ~SC04a::Send, {U+0332}{U+0336}
    ~SC04e::Send, {U+0332}{U+0336}
    ~SC053::Send, {U+0332}{U+0336}
}
return

#If font = "Default" and modifier = "Italics, Underline, Strikethrough" and Caps = "On"
{
    $a::Send, {U+1D608}{U+0332}{U+0336}
    $b::Send, {U+1D609}{U+0332}{U+0336}
    $c::Send, {U+1D60A}{U+0332}{U+0336}
    $d::Send, {U+1D60B}{U+0332}{U+0336}
    $e::Send, {U+1D60C}{U+0332}{U+0336}
    $f::Send, {U+1D60D}{U+0332}{U+0336}
    $g::Send, {U+1D60E}{U+0332}{U+0336}
    $h::Send, {U+1D60F}{U+0332}{U+0336}
    $i::Send, {U+1D610}{U+0332}{U+0336}
    $j::Send, {U+1D611}{U+0332}{U+0336}
    $k::Send, {U+1D612}{U+0332}{U+0336}
    $l::Send, {U+1D613}{U+0332}{U+0336}
    $m::Send, {U+1D614}{U+0332}{U+0336}
    $n::Send, {U+1D615}{U+0332}{U+0336}
    $o::Send, {U+1D616}{U+0332}{U+0336}
    $p::Send, {U+1D617}{U+0332}{U+0336}
    $q::Send, {U+1D618}{U+0332}{U+0336}
    $r::Send, {U+1D619}{U+0332}{U+0336}
    $s::Send, {U+1D61A}{U+0332}{U+0336}
    $t::Send, {U+1D61B}{U+0332}{U+0336}
    $u::Send, {U+1D61C}{U+0332}{U+0336}
    $v::Send, {U+1D61D}{U+0332}{U+0336}
    $w::Send, {U+1D61E}{U+0332}{U+0336}
    $x::Send, {U+1D61F}{U+0332}{U+0336}
    $y::Send, {U+1D620}{U+0332}{U+0336}
    $z::Send, {U+1D621}{U+0332}{U+0336}

    $+a::Send, {U+1D622}{U+0332}{U+0336}
    $+b::Send, {U+1D623}{U+0332}{U+0336}
    $+c::Send, {U+1D624}{U+0332}{U+0336}
    $+d::Send, {U+1D625}{U+0332}{U+0336}
    $+e::Send, {U+1D626}{U+0332}{U+0336}
    $+f::Send, {U+1D627}{U+0332}{U+0336}
    $+g::Send, {U+1D628}{U+0336}
    $+h::Send, {U+1D629}{U+0332}{U+0336}
    $+i::Send, {U+1D62A}{U+0332}{U+0336}
    $+j::Send, {U+1D62B}{U+0336}
    $+k::Send, {U+1D62C}{U+0332}{U+0336}
    $+l::Send, {U+1D62D}{U+0332}{U+0336}
    $+m::Send, {U+1D62E}{U+0332}{U+0336}
    $+n::Send, {U+1D62F}{U+0332}{U+0336}
    $+o::Send, {U+1D630}{U+0332}{U+0336}
    $+p::Send, {U+1D631}{U+0336}
    $+q::Send, {U+1D632}{U+0336}
    $+r::Send, {U+1D633}{U+0332}{U+0336}
    $+s::Send, {U+1D634}{U+0332}{U+0336}
    $+t::Send, {U+1D635}{U+0332}{U+0336}
    $+u::Send, {U+1D636}{U+0332}{U+0336}
    $+v::Send, {U+1D637}{U+0332}{U+0336}
    $+w::Send, {U+1D638}{U+0332}{U+0336}
    $+x::Send, {U+1D639}{U+0332}{U+0336}
    $+y::Send, {U+1D63A}{U+0336}
    $+z::Send, {U+1D63B}{U+0332}{U+0336}

    ~Space::Send, {U+0332}{U+0336}

    ~SC029::Send, {U+0332}{U+0336}
    ~+SC029::Send, {U+0332}{U+0336}
    ~+SC002::Send, {U+0332}{U+0336}
    ~+SC003::Send, {U+0332}{U+0336}
    ~+SC004::Send, {U+0332}{U+0336}
    ~+SC005::Send, {U+0332}{U+0336}
    ~+SC006::Send, {U+0332}{U+0336}
    ~+SC007::Send, {U+0332}{U+0336}
    ~+SC008::Send, {U+0332}{U+0336}
    ~+SC009::Send, {U+0332}{U+0336}
    ~+SC00a::Send, {U+0332}{U+0336}
    ~+SC00b::Send, {U+0332}{U+0336}
    ~SC00c::Send, {U+0332}{U+0336}
    ~+SC00c::Send, {U+0332}{U+0336}
    ~SC00d::Send, {U+0332}{U+0336}
    ~+SC00d::Send, {U+0332}{U+0336}
    ~SC01a::Send, {U+0332}{U+0336}
    ~+SC01a::Send, {U+0332}{U+0336}
    ~SC01b::Send, {U+0332}{U+0336}
    ~+SC01b::Send, {U+0332}{U+0336}
    ~SC027::Send, {U+0332}{U+0336}
    ~+SC027::Send, {U+0332}{U+0336}
    ~SC028::Send, {U+0332}{U+0336}
    ~+SC028::Send, {U+0332}{U+0336}
    ~SC02b::Send, {U+0332}{U+0336}
    ~+SC02b::Send, {U+0332}{U+0336}
    ~SC033::Send, {U+0332}{U+0336}
    ~+SC033::Send, {U+0332}{U+0336}
    ~SC034::Send, {U+0332}{U+0336}
    ~+SC034::Send, {U+0332}{U+0336}
    ~SC035::Send, {U+0332}{U+0336}
    ~+SC035::Send, {U+0332}{U+0336}
    ~SC037::Send, {U+0332}{U+0336}
    ~SC04a::Send, {U+0332}{U+0336}
    ~SC04e::Send, {U+0332}{U+0336}
    ~SC053::Send, {U+0332}{U+0336}
}
return

#If font = "Default" and modifier = "Bold, Italics, Underline, Strikethrough" and Caps = "Off"
{
    $a::Send, {U+1D656}{U+0332}{U+0336}
    $b::Send, {U+1D657}{U+0332}{U+0336}
    $c::Send, {U+1D658}{U+0332}{U+0336}
    $d::Send, {U+1D659}{U+0332}{U+0336}
    $e::Send, {U+1D65A}{U+0332}{U+0336}
    $f::Send, {U+1D65B}{U+0332}{U+0336}
    $g::Send, {U+1D65C}{U+0336}
    $h::Send, {U+1D65D}{U+0332}{U+0336}
    $i::Send, {U+1D65E}{U+0332}{U+0336}
    $j::Send, {U+1D65F}{U+0336}
    $k::Send, {U+1D660}{U+0332}{U+0336}
    $l::Send, {U+1D661}{U+0332}{U+0336}
    $m::Send, {U+1D662}{U+0332}{U+0336}
    $n::Send, {U+1D663}{U+0332}{U+0336}
    $o::Send, {U+1D664}{U+0332}{U+0336}
    $p::Send, {U+1D665}{U+0336}
    $q::Send, {U+1D666}{U+0336}
    $r::Send, {U+1D667}{U+0332}{U+0336}
    $s::Send, {U+1D668}{U+0332}{U+0336}
    $t::Send, {U+1D669}{U+0332}{U+0336}
    $u::Send, {U+1D66A}{U+0332}{U+0336}
    $v::Send, {U+1D66B}{U+0332}{U+0336}
    $w::Send, {U+1D66C}{U+0332}{U+0336}
    $x::Send, {U+1D66D}{U+0332}{U+0336}
    $y::Send, {U+1D66E}{U+0336}
    $z::Send, {U+1D66F}{U+0332}{U+0336}

    $+a::Send, {U+1D63C}{U+0332}{U+0336}
    $+b::Send, {U+1D63D}{U+0332}{U+0336}
    $+c::Send, {U+1D63E}{U+0332}{U+0336}
    $+d::Send, {U+1D63F}{U+0332}{U+0336}
    $+e::Send, {U+1D640}{U+0332}{U+0336}
    $+f::Send, {U+1D641}{U+0332}{U+0336}
    $+g::Send, {U+1D642}{U+0332}{U+0336}
    $+h::Send, {U+1D643}{U+0332}{U+0336}
    $+i::Send, {U+1D644}{U+0332}{U+0336}
    $+j::Send, {U+1D645}{U+0332}{U+0336}
    $+k::Send, {U+1D646}{U+0332}{U+0336}
    $+l::Send, {U+1D647}{U+0332}{U+0336}
    $+m::Send, {U+1D648}{U+0332}{U+0336}
    $+n::Send, {U+1D649}{U+0332}{U+0336}
    $+o::Send, {U+1D64A}{U+0332}{U+0336}
    $+p::Send, {U+1D64B}{U+0332}{U+0336}
    $+q::Send, {U+1D64C}{U+0332}{U+0336}
    $+r::Send, {U+1D64D}{U+0332}{U+0336}
    $+s::Send, {U+1D64E}{U+0332}{U+0336}
    $+t::Send, {U+1D64F}{U+0332}{U+0336}
    $+u::Send, {U+1D650}{U+0332}{U+0336}
    $+v::Send, {U+1D651}{U+0332}{U+0336}
    $+w::Send, {U+1D652}{U+0332}{U+0336}
    $+x::Send, {U+1D653}{U+0332}{U+0336}
    $+y::Send, {U+1D654}{U+0332}{U+0336}
    $+z::Send, {U+1D655}{U+0332}{U+0336}

    $0::Send, {U+1D7EC}{U+0332}{U+0336}
    $1::Send, {U+1D7ED}{U+0332}{U+0336}
    $2::Send, {U+1D7EE}{U+0332}{U+0336}
    $3::Send, {U+1D7EF}{U+0332}{U+0336}
    $4::Send, {U+1D7F0}{U+0332}{U+0336}
    $5::Send, {U+1D7F1}{U+0332}{U+0336}
    $6::Send, {U+1D7F2}{U+0332}{U+0336}
    $7::Send, {U+1D7F3}{U+0332}{U+0336}
    $8::Send, {U+1D7F4}{U+0332}{U+0336}
    $9::Send, {U+1D7F5}{U+0332}{U+0336}

    ~Space::Send, {U+0332}{U+0336}

    ~SC029::Send, {U+0332}{U+0336}
    ~+SC029::Send, {U+0332}{U+0336}
    ~+SC002::Send, {U+0332}{U+0336}
    ~+SC003::Send, {U+0332}{U+0336}
    ~+SC004::Send, {U+0332}{U+0336}
    ~+SC005::Send, {U+0332}{U+0336}
    ~+SC006::Send, {U+0332}{U+0336}
    ~+SC007::Send, {U+0332}{U+0336}
    ~+SC008::Send, {U+0332}{U+0336}
    ~+SC009::Send, {U+0332}{U+0336}
    ~+SC00a::Send, {U+0332}{U+0336}
    ~+SC00b::Send, {U+0332}{U+0336}
    ~SC00c::Send, {U+0332}{U+0336}
    ~+SC00c::Send, {U+0332}{U+0336}
    ~SC00d::Send, {U+0332}{U+0336}
    ~+SC00d::Send, {U+0332}{U+0336}
    ~SC01a::Send, {U+0332}{U+0336}
    ~+SC01a::Send, {U+0332}{U+0336}
    ~SC01b::Send, {U+0332}{U+0336}
    ~+SC01b::Send, {U+0332}{U+0336}
    ~SC027::Send, {U+0332}{U+0336}
    ~+SC027::Send, {U+0332}{U+0336}
    ~SC028::Send, {U+0332}{U+0336}
    ~+SC028::Send, {U+0332}{U+0336}
    ~SC02b::Send, {U+0332}{U+0336}
    ~+SC02b::Send, {U+0332}{U+0336}
    ~SC033::Send, {U+0332}{U+0336}
    ~+SC033::Send, {U+0332}{U+0336}
    ~SC034::Send, {U+0332}{U+0336}
    ~+SC034::Send, {U+0332}{U+0336}
    ~SC035::Send, {U+0332}{U+0336}
    ~+SC035::Send, {U+0332}{U+0336}
    ~SC037::Send, {U+0332}{U+0336}
    ~SC04a::Send, {U+0332}{U+0336}
    ~SC04e::Send, {U+0332}{U+0336}
    ~SC053::Send, {U+0332}{U+0336}
}
return

#If font = "Default" and modifier = "Bold, Italics, Underline, Strikethrough" and Caps = "On"
{
    $a::Send, {U+1D63C}{U+0332}{U+0336}
    $b::Send, {U+1D63D}{U+0332}{U+0336}
    $c::Send, {U+1D63E}{U+0332}{U+0336}
    $d::Send, {U+1D63F}{U+0332}{U+0336}
    $e::Send, {U+1D640}{U+0332}{U+0336}
    $f::Send, {U+1D641}{U+0332}{U+0336}
    $g::Send, {U+1D642}{U+0332}{U+0336}
    $h::Send, {U+1D643}{U+0332}{U+0336}
    $i::Send, {U+1D644}{U+0332}{U+0336}
    $j::Send, {U+1D645}{U+0332}{U+0336}
    $k::Send, {U+1D646}{U+0332}{U+0336}
    $l::Send, {U+1D647}{U+0332}{U+0336}
    $m::Send, {U+1D648}{U+0332}{U+0336}
    $n::Send, {U+1D649}{U+0332}{U+0336}
    $o::Send, {U+1D64A}{U+0332}{U+0336}
    $p::Send, {U+1D64B}{U+0332}{U+0336}
    $q::Send, {U+1D64C}{U+0332}{U+0336}
    $r::Send, {U+1D64D}{U+0332}{U+0336}
    $s::Send, {U+1D64E}{U+0332}{U+0336}
    $t::Send, {U+1D64F}{U+0332}{U+0336}
    $u::Send, {U+1D650}{U+0332}{U+0336}
    $v::Send, {U+1D651}{U+0332}{U+0336}
    $w::Send, {U+1D652}{U+0332}{U+0336}
    $x::Send, {U+1D653}{U+0332}{U+0336}
    $y::Send, {U+1D654}{U+0332}{U+0336}
    $z::Send, {U+1D655}{U+0332}{U+0336}

    $+a::Send, {U+1D656}{U+0332}{U+0336}
    $+b::Send, {U+1D657}{U+0332}{U+0336}
    $+c::Send, {U+1D658}{U+0332}{U+0336}
    $+d::Send, {U+1D659}{U+0332}{U+0336}
    $+e::Send, {U+1D65A}{U+0332}{U+0336}
    $+f::Send, {U+1D65B}{U+0332}{U+0336}
    $+g::Send, {U+1D65C}{U+0336}
    $+h::Send, {U+1D65D}{U+0332}{U+0336}
    $+i::Send, {U+1D65E}{U+0332}{U+0336}
    $+j::Send, {U+1D65F}{U+0336}
    $+k::Send, {U+1D660}{U+0332}{U+0336}
    $+l::Send, {U+1D661}{U+0332}{U+0336}
    $+m::Send, {U+1D662}{U+0332}{U+0336}
    $+n::Send, {U+1D663}{U+0332}{U+0336}
    $+o::Send, {U+1D664}{U+0332}{U+0336}
    $+p::Send, {U+1D665}{U+0336}
    $+q::Send, {U+1D666}{U+0336}
    $+r::Send, {U+1D667}{U+0332}{U+0336}
    $+s::Send, {U+1D668}{U+0332}{U+0336}
    $+t::Send, {U+1D669}{U+0332}{U+0336}
    $+u::Send, {U+1D66A}{U+0332}{U+0336}
    $+v::Send, {U+1D66B}{U+0332}{U+0336}
    $+w::Send, {U+1D66C}{U+0332}{U+0336}
    $+x::Send, {U+1D66D}{U+0332}{U+0336}
    $+y::Send, {U+1D66E}{U+0336}
    $+z::Send, {U+1D66F}{U+0332}{U+0336}

    $0::Send, {U+1D7EC}
    $1::Send, {U+1D7ED}
    $2::Send, {U+1D7EE}
    $3::Send, {U+1D7EF}
    $4::Send, {U+1D7F0}
    $5::Send, {U+1D7F1}
    $6::Send, {U+1D7F2}
    $7::Send, {U+1D7F3}
    $8::Send, {U+1D7F4}
    $9::Send, {U+1D7F5}

    ~Space::Send, {U+0332}{U+0336}

    ~SC029::Send, {U+0332}{U+0336}
    ~+SC029::Send, {U+0332}{U+0336}
    ~+SC002::Send, {U+0332}{U+0336}
    ~+SC003::Send, {U+0332}{U+0336}
    ~+SC004::Send, {U+0332}{U+0336}
    ~+SC005::Send, {U+0332}{U+0336}
    ~+SC006::Send, {U+0332}{U+0336}
    ~+SC007::Send, {U+0332}{U+0336}
    ~+SC008::Send, {U+0332}{U+0336}
    ~+SC009::Send, {U+0332}{U+0336}
    ~+SC00a::Send, {U+0332}{U+0336}
    ~+SC00b::Send, {U+0332}{U+0336}
    ~SC00c::Send, {U+0332}{U+0336}
    ~+SC00c::Send, {U+0332}{U+0336}
    ~SC00d::Send, {U+0332}{U+0336}
    ~+SC00d::Send, {U+0332}{U+0336}
    ~SC01a::Send, {U+0332}{U+0336}
    ~+SC01a::Send, {U+0332}{U+0336}
    ~SC01b::Send, {U+0332}{U+0336}
    ~+SC01b::Send, {U+0332}{U+0336}
    ~SC027::Send, {U+0332}{U+0336}
    ~+SC027::Send, {U+0332}{U+0336}
    ~SC028::Send, {U+0332}{U+0336}
    ~+SC028::Send, {U+0332}{U+0336}
    ~SC02b::Send, {U+0332}{U+0336}
    ~+SC02b::Send, {U+0332}{U+0336}
    ~SC033::Send, {U+0332}{U+0336}
    ~+SC033::Send, {U+0332}{U+0336}
    ~SC034::Send, {U+0332}{U+0336}
    ~+SC034::Send, {U+0332}{U+0336}
    ~SC035::Send, {U+0332}{U+0336}
    ~+SC035::Send, {U+0332}{U+0336}
    ~SC037::Send, {U+0332}{U+0336}
    ~SC04a::Send, {U+0332}{U+0336}
    ~SC04e::Send, {U+0332}{U+0336}
    ~SC053::Send, {U+0332}{U+0336}
}
return

;------------------------------------------------------------------------------------------------;

; Times New Roman Font

;------------------------------------------------------------------------------------------------;

;Original Modifiers
#If TNR and modifier = "Bold" and Caps = "Off"
{
    $a::Send, {U+1D41A}
    $b::Send, {U+1D41B}
    $c::Send, {U+1D41C}
    $d::Send, {U+1D41D}
    $e::Send, {U+1D41E}
    $f::Send, {U+1D41F}
    $g::Send, {U+1D420}
    $h::Send, {U+1D421}
    $i::Send, {U+1D422}
    $j::Send, {U+1D423}
    $k::Send, {U+1D424}
    $l::Send, {U+1D425}
    $m::Send, {U+1D426}
    $n::Send, {U+1D427}
    $o::Send, {U+1D428}
    $p::Send, {U+1D429}
    $q::Send, {U+1D42A}
    $r::Send, {U+1D42B}
    $s::Send, {U+1D42C}
    $t::Send, {U+1D42D}
    $u::Send, {U+1D42E}
    $v::Send, {U+1D42F}
    $w::Send, {U+1D430}
    $x::Send, {U+1D431}
    $y::Send, {U+1D432}
    $z::Send, {U+1D433}

    $+a::Send, {U+1D400}
    $+b::Send, {U+1D401}
    $+c::Send, {U+1D402}
    $+d::Send, {U+1D403}
    $+e::Send, {U+1D404}
    $+f::Send, {U+1D405}
    $+g::Send, {U+1D406}
    $+h::Send, {U+1D407}
    $+i::Send, {U+1D408}
    $+j::Send, {U+1D409}
    $+k::Send, {U+1D40A}
    $+l::Send, {U+1D40B}
    $+m::Send, {U+1D40C}
    $+n::Send, {U+1D40D}
    $+o::Send, {U+1D40E}
    $+p::Send, {U+1D40F}
    $+q::Send, {U+1D410}
    $+r::Send, {U+1D411}
    $+s::Send, {U+1D412}
    $+t::Send, {U+1D413}
    $+u::Send, {U+1D414}
    $+v::Send, {U+1D415}
    $+w::Send, {U+1D416}
    $+x::Send, {U+1D417}
    $+y::Send, {U+1D418}
    $+z::Send, {U+1D419}

    $0::Send, {U+1D7CE}
    $1::Send, {U+1D7CF}
    $2::Send, {U+1D7D0}
    $3::Send, {U+1D7D1}
    $4::Send, {U+1D7D2}
    $5::Send, {U+1D7D3}
    $6::Send, {U+1D7D4}
    $7::Send, {U+1D7D5}
    $8::Send, {U+1D7D6}
    $9::Send, {U+1D7D7}
}
return

#If TNR and modifier = "Bold" and Caps = "On"
{
    $a::Send, {U+1D400}
    $b::Send, {U+1D401}
    $c::Send, {U+1D402}
    $d::Send, {U+1D403}
    $e::Send, {U+1D404}
    $f::Send, {U+1D405}
    $g::Send, {U+1D406}
    $h::Send, {U+1D407}
    $i::Send, {U+1D408}
    $j::Send, {U+1D409}
    $k::Send, {U+1D40A}
    $l::Send, {U+1D40B}
    $m::Send, {U+1D40C}
    $n::Send, {U+1D40D}
    $o::Send, {U+1D40E}
    $p::Send, {U+1D40F}
    $q::Send, {U+1D410}
    $r::Send, {U+1D411}
    $s::Send, {U+1D412}
    $t::Send, {U+1D413}
    $u::Send, {U+1D414}
    $v::Send, {U+1D415}
    $w::Send, {U+1D416}
    $x::Send, {U+1D417}
    $y::Send, {U+1D418}
    $z::Send, {U+1D419}

    $+a::Send, {U+1D41A}
    $+b::Send, {U+1D41B}
    $+c::Send, {U+1D41C}
    $+d::Send, {U+1D41D}
    $+e::Send, {U+1D41E}
    $+f::Send, {U+1D41F}
    $+g::Send, {U+1D420}
    $+h::Send, {U+1D421}
    $+i::Send, {U+1D422}
    $+j::Send, {U+1D423}
    $+k::Send, {U+1D424}
    $+l::Send, {U+1D425}
    $+m::Send, {U+1D426}
    $+n::Send, {U+1D427}
    $+o::Send, {U+1D428}
    $+p::Send, {U+1D429}
    $+q::Send, {U+1D42A}
    $+r::Send, {U+1D42B}
    $+s::Send, {U+1D42C}
    $+t::Send, {U+1D42D}
    $+u::Send, {U+1D42E}
    $+v::Send, {U+1D42F}
    $+w::Send, {U+1D430}
    $+x::Send, {U+1D431}
    $+y::Send, {U+1D432}
    $+z::Send, {U+1D433}
    $0::Send, {U+1D7CE}
    $1::Send, {U+1D7CF}
    $2::Send, {U+1D7D0}
    $3::Send, {U+1D7D1}
    $4::Send, {U+1D7D2}
    $5::Send, {U+1D7D3}
    $6::Send, {U+1D7D4}
    $7::Send, {U+1D7D5}
    $8::Send, {U+1D7D6}
    $9::Send, {U+1D7D7}
}
return

#If TNR and modifier = "Italics" and Caps = "Off"
{
    $a::Send, {U+1D44E}
    $b::Send, {U+1D44F}
    $c::Send, {U+1D450}
    $d::Send, {U+1D451}
    $e::Send, {U+1D452}
    $f::Send, {U+1D453}
    $g::Send, {U+1D454}
    $h::Send, {U+210E}
    $i::Send, {U+1D456}
    $j::Send, {U+1D457}
    $k::Send, {U+1D458}
    $l::Send, {U+1D459}
    $m::Send, {U+1D45A}
    $n::Send, {U+1D45B}
    $o::Send, {U+1D45C}
    $p::Send, {U+1D45D}
    $q::Send, {U+1D45E}
    $r::Send, {U+1D45F}
    $s::Send, {U+1D460}
    $t::Send, {U+1D461}
    $u::Send, {U+1D462}
    $v::Send, {U+1D463}
    $w::Send, {U+1D464}
    $x::Send, {U+1D465}
    $y::Send, {U+1D466}
    $z::Send, {U+1D467}

    $+a::Send, {U+1D434}
    $+b::Send, {U+1D435}
    $+c::Send, {U+1D436}
    $+d::Send, {U+1D437}
    $+e::Send, {U+1D438}
    $+f::Send, {U+1D439}
    $+g::Send, {U+1D43A}
    $+h::Send, {U+1D43B}
    $+i::Send, {U+1D43C}
    $+j::Send, {U+1D43D}
    $+k::Send, {U+1D43E}
    $+l::Send, {U+1D43F}
    $+m::Send, {U+1D440}
    $+n::Send, {U+1D441}
    $+o::Send, {U+1D442}
    $+p::Send, {U+1D443}
    $+q::Send, {U+1D444}
    $+r::Send, {U+1D445}
    $+s::Send, {U+1D446}
    $+t::Send, {U+1D447}
    $+u::Send, {U+1D448}
    $+v::Send, {U+1D449}
    $+w::Send, {U+1D44A}
    $+x::Send, {U+1D44B}
    $+y::Send, {U+1D44C}
    $+z::Send, {U+1D44D}
}
return

#If TNR and modifier = "Italics" and Caps = "On"
{
    $b::Send, {U+1D435}
    $c::Send, {U+1D436}
    $d::Send, {U+1D437}
    $e::Send, {U+1D438}
    $f::Send, {U+1D439}
    $g::Send, {U+1D43A}
    $h::Send, {U+1D43B}
    $i::Send, {U+1D43C}
    $j::Send, {U+1D43D}
    $k::Send, {U+1D43E}
    $l::Send, {U+1D43F}
    $m::Send, {U+1D440}
    $n::Send, {U+1D441}
    $o::Send, {U+1D442}
    $p::Send, {U+1D443}
    $q::Send, {U+1D444}
    $r::Send, {U+1D445}
    $s::Send, {U+1D446}
    $t::Send, {U+1D447}
    $u::Send, {U+1D448}
    $v::Send, {U+1D449}
    $w::Send, {U+1D44A}
    $x::Send, {U+1D44B}
    $y::Send, {U+1D44C}
    $z::Send, {U+1D44D}
    
    $+b::Send, {U+1D44F}
    $+c::Send, {U+1D450}
    $+d::Send, {U+1D451}
    $+e::Send, {U+1D452}
    $+f::Send, {U+1D453}
    $+g::Send, {U+1D454}
    $+h::Send, {U+210E}
    $+i::Send, {U+1D456}
    $+j::Send, {U+1D457}
    $+k::Send, {U+1D458}
    $+l::Send, {U+1D459}
    $+m::Send, {U+1D45A}
    $+n::Send, {U+1D45B}
    $+o::Send, {U+1D45C}
    $+p::Send, {U+1D45D}
    $+q::Send, {U+1D45E}
    $+r::Send, {U+1D45F}
    $+s::Send, {U+1D460}
    $+t::Send, {U+1D461}
    $+u::Send, {U+1D462}
    $+v::Send, {U+1D463}
    $+w::Send, {U+1D464}
    $+x::Send, {U+1D465}
    $+y::Send, {U+1D466}
    $+z::Send, {U+1D467}
}
return

#If TNR and modifier = "Bold, Italics" and Caps = "Off"
{
    $b::Send, {U+1D483}
    $c::Send, {U+1D484}
    $d::Send, {U+1D485}
    $e::Send, {U+1D486}
    $f::Send, {U+1D487}
    $g::Send, {U+1D488}
    $h::Send, {U+1D489}
    $i::Send, {U+1D48A}
    $j::Send, {U+1D482}
    $k::Send, {U+1D48C}
    $l::Send, {U+1D48D}
    $m::Send, {U+1D48E}
    $n::Send, {U+1D48F}
    $o::Send, {U+1D490}
    $p::Send, {U+1D491}
    $q::Send, {U+1D492}
    $r::Send, {U+1D493}
    $s::Send, {U+1D494}
    $t::Send, {U+1D495}
    $u::Send, {U+1D496}
    $v::Send, {U+1D497}
    $w::Send, {U+1D498}
    $x::Send, {U+1D499}
    $y::Send, {U+1D49A}
    $z::Send, {U+1D49B}
    
    $+a::Send, {U+1D468}
    $+b::Send, {U+1D469}
    $+c::Send, {U+1D46A}
    $+d::Send, {U+1D46B}
    $+e::Send, {U+1D46C}
    $+f::Send, {U+1D46D}
    $+g::Send, {U+1D46E}
    $+h::Send, {U+1D46F}
    $+i::Send, {U+1D470}
    $+j::Send, {U+1D471}
    $+k::Send, {U+1D472}
    $+l::Send, {U+1D473}
    $+m::Send, {U+1D474}
    $+n::Send, {U+1D475}
    $+o::Send, {U+1D476}
    $+p::Send, {U+1D477}
    $+q::Send, {U+1D478}
    $+r::Send, {U+1D479}
    $+s::Send, {U+1D47A}
    $+t::Send, {U+1D47B}
    $+u::Send, {U+1D47C}
    $+v::Send, {U+1D47D}
    $+w::Send, {U+1D47E}
    $+x::Send, {U+1D47F}
    $+y::Send, {U+1D480}
    $+z::Send, {U+1D481}

    $0::Send, {U+1D7CE}
    $1::Send, {U+1D7CF}
    $2::Send, {U+1D7D0}
    $3::Send, {U+1D7D1}
    $4::Send, {U+1D7D2}
    $5::Send, {U+1D7D3}
    $6::Send, {U+1D7D4}
    $7::Send, {U+1D7D5}
    $8::Send, {U+1D7D6}
    $9::Send, {U+1D7D7}
}
return

#If TNR and modifier = "Bold, Italics" and Caps = "On"
{
    $a::Send, {U+1D468}
    $b::Send, {U+1D469}
    $c::Send, {U+1D46A}
    $d::Send, {U+1D46B}
    $e::Send, {U+1D46C}
    $f::Send, {U+1D46D}
    $g::Send, {U+1D46E}
    $h::Send, {U+1D46F}
    $i::Send, {U+1D470}
    $j::Send, {U+1D471}
    $k::Send, {U+1D472}
    $l::Send, {U+1D473}
    $m::Send, {U+1D474}
    $n::Send, {U+1D475}
    $o::Send, {U+1D476}
    $p::Send, {U+1D477}
    $q::Send, {U+1D478}
    $r::Send, {U+1D479}
    $s::Send, {U+1D47A}
    $t::Send, {U+1D47B}
    $u::Send, {U+1D47C}
    $v::Send, {U+1D47D}
    $w::Send, {U+1D47E}
    $x::Send, {U+1D47F}
    $y::Send, {U+1D480}
    $z::Send, {U+1D481}

    $+a::Send, {U+1D482}
    $+b::Send, {U+1D483}
    $+c::Send, {U+1D484}
    $+d::Send, {U+1D485}
    $+e::Send, {U+1D486}
    $+f::Send, {U+1D487}
    $+g::Send, {U+1D488}
    $+h::Send, {U+1D489}
    $+i::Send, {U+1D48A}
    $+j::Send, {U+1D482}
    $+k::Send, {U+1D48C}
    $+l::Send, {U+1D48D}
    $+m::Send, {U+1D48E}
    $+n::Send, {U+1D48F}
    $+o::Send, {U+1D490}
    $+p::Send, {U+1D491}
    $+q::Send, {U+1D492}
    $+r::Send, {U+1D493}
    $+s::Send, {U+1D494}
    $+t::Send, {U+1D495}
    $+u::Send, {U+1D496}
    $+v::Send, {U+1D497}
    $+w::Send, {U+1D498}
    $+x::Send, {U+1D499}
    $+y::Send, {U+1D49A}
    $+z::Send, {U+1D49B}

    $0::Send, {U+1D7CE}
    $1::Send, {U+1D7CF}
    $2::Send, {U+1D7D0}
    $3::Send, {U+1D7D1}
    $4::Send, {U+1D7D2}
    $5::Send, {U+1D7D3}
    $6::Send, {U+1D7D4}
    $7::Send, {U+1D7D5}
    $8::Send, {U+1D7D6}
    $9::Send, {U+1D7D7}
}
return

;Underline Modifiers
#If TNR and modifier = "Bold, Underline" and Caps = "Off"
{
    $a::Send, {U+1D41A}{U+0332}
    $b::Send, {U+1D41B}{U+0332}
    $c::Send, {U+1D41C}{U+0332}
    $d::Send, {U+1D41D}{U+0332}
    $e::Send, {U+1D41E}{U+0332}
    $f::Send, {U+1D41F}{U+0332}
    $g::Send, {U+1D420}
    $h::Send, {U+1D421}{U+0332}
    $i::Send, {U+1D422}{U+0332}
    $j::Send, {U+1D423}
    $k::Send, {U+1D424}{U+0332}
    $l::Send, {U+1D425}{U+0332}
    $m::Send, {U+1D426}{U+0332}
    $n::Send, {U+1D427}{U+0332}
    $o::Send, {U+1D428}{U+0332}
    $p::Send, {U+1D429}
    $q::Send, {U+1D42A}
    $r::Send, {U+1D42B}{U+0332}
    $s::Send, {U+1D42C}{U+0332}
    $t::Send, {U+1D42D}{U+0332}
    $u::Send, {U+1D42E}{U+0332}
    $v::Send, {U+1D42F}{U+0332}
    $w::Send, {U+1D430}{U+0332}
    $x::Send, {U+1D431}{U+0332}
    $y::Send, {U+1D432}
    $z::Send, {U+1D433}{U+0332}

    $+a::Send, {U+1D400}{U+0332}
    $+b::Send, {U+1D401}{U+0332}
    $+c::Send, {U+1D402}{U+0332}
    $+d::Send, {U+1D403}{U+0332}
    $+e::Send, {U+1D404}{U+0332}
    $+f::Send, {U+1D405}{U+0332}
    $+g::Send, {U+1D406}{U+0332}
    $+h::Send, {U+1D407}{U+0332}
    $+i::Send, {U+1D408}{U+0332}
    $+j::Send, {U+1D409}{U+0332}
    $+k::Send, {U+1D40A}{U+0332}
    $+l::Send, {U+1D40B}{U+0332}
    $+m::Send, {U+1D40C}{U+0332}
    $+n::Send, {U+1D40D}{U+0332}
    $+o::Send, {U+1D40E}{U+0332}
    $+p::Send, {U+1D40F}{U+0332}
    $+q::Send, {U+1D410}{U+0332}
    $+r::Send, {U+1D411}{U+0332}
    $+s::Send, {U+1D412}{U+0332}
    $+t::Send, {U+1D413}{U+0332}
    $+u::Send, {U+1D414}{U+0332}
    $+v::Send, {U+1D415}{U+0332}
    $+w::Send, {U+1D416}{U+0332}
    $+x::Send, {U+1D417}{U+0332}
    $+y::Send, {U+1D418}{U+0332}
    $+z::Send, {U+1D419}{U+0332}

    $0::Send, {U+1D7CE}{U+0332}
    $1::Send, {U+1D7CF}{U+0332}
    $2::Send, {U+1D7D0}{U+0332}
    $3::Send, {U+1D7D1}{U+0332}
    $4::Send, {U+1D7D2}{U+0332}
    $5::Send, {U+1D7D3}{U+0332}
    $6::Send, {U+1D7D4}{U+0332}
    $7::Send, {U+1D7D5}{U+0332}
    $8::Send, {U+1D7D6}{U+0332}
    $9::Send, {U+1D7D7}{U+0332}

    ~Space::Send, {U+0332}

    ~SC029::Send, {U+0332}
    ~+SC029::Send, {U+0332}
    ~+SC002::Send, {U+0332}
    ~+SC003::Send, {U+0332}
    ~+SC004::Send, {U+0332}
    ~+SC005::Send, {U+0332}
    ~+SC006::Send, {U+0332}
    ~+SC007::Send, {U+0332}
    ~+SC008::Send, {U+0332}
    ~+SC009::Send, {U+0332}
    ~+SC00a::Send, {U+0332}
    ~+SC00b::Send, {U+0332}
    ~SC00c::Send, {U+0332}
    ~+SC00c::Send, {U+0332}
    ~SC00d::Send, {U+0332}
    ~+SC00d::Send, {U+0332}
    ~SC01a::Send, {U+0332}
    ~+SC01a::Send, {U+0332}
    ~SC01b::Send, {U+0332}
    ~+SC01b::Send, {U+0332}
    ~SC027::Send, {U+0332}
    ~+SC027::Send, {U+0332}
    ~SC028::Send, {U+0332}
    ~+SC028::Send, {U+0332}
    ~SC02b::Send, {U+0332}
    ~+SC02b::Send, {U+0332}
    ~SC033::Send, {U+0332}
    ~+SC033::Send, {U+0332}
    ~SC034::Send, {U+0332}
    ~+SC034::Send, {U+0332}
    ~SC035::Send, {U+0332}
    ~+SC035::Send, {U+0332}
    ~SC037::Send, {U+0332}
    ~SC04a::Send, {U+0332}
    ~SC04e::Send, {U+0332}
    ~SC053::Send, {U+0332}
}
return

#If TNR and modifier = "Bold, Underline" and Caps = "On"
{
    $a::Send, {U+1D400}{U+0332}
    $b::Send, {U+1D401}{U+0332}
    $c::Send, {U+1D402}{U+0332}
    $d::Send, {U+1D403}{U+0332}
    $e::Send, {U+1D404}{U+0332}
    $f::Send, {U+1D405}{U+0332}
    $g::Send, {U+1D406}{U+0332}
    $h::Send, {U+1D407}{U+0332}
    $i::Send, {U+1D408}{U+0332}
    $j::Send, {U+1D409}{U+0332}
    $k::Send, {U+1D40A}{U+0332}
    $l::Send, {U+1D40B}{U+0332}
    $m::Send, {U+1D40C}{U+0332}
    $n::Send, {U+1D40D}{U+0332}
    $o::Send, {U+1D40E}{U+0332}
    $p::Send, {U+1D40F}{U+0332}
    $q::Send, {U+1D410}{U+0332}
    $r::Send, {U+1D411}{U+0332}
    $s::Send, {U+1D412}{U+0332}
    $t::Send, {U+1D413}{U+0332}
    $u::Send, {U+1D414}{U+0332}
    $v::Send, {U+1D415}{U+0332}
    $w::Send, {U+1D416}{U+0332}
    $x::Send, {U+1D417}{U+0332}
    $y::Send, {U+1D418}{U+0332}
    $z::Send, {U+1D419}{U+0332}

    $+a::Send, {U+1D41A}{U+0332}
    $+b::Send, {U+1D41B}{U+0332}
    $+c::Send, {U+1D41C}{U+0332}
    $+d::Send, {U+1D41D}{U+0332}
    $+e::Send, {U+1D41E}{U+0332}
    $+f::Send, {U+1D41F}{U+0332}
    $+g::Send, {U+1D420}
    $+h::Send, {U+1D421}{U+0332}
    $+i::Send, {U+1D422}{U+0332}
    $+j::Send, {U+1D423}
    $+k::Send, {U+1D424}{U+0332}
    $+l::Send, {U+1D425}{U+0332}
    $+m::Send, {U+1D426}{U+0332}
    $+n::Send, {U+1D427}{U+0332}
    $+o::Send, {U+1D428}{U+0332}
    $+p::Send, {U+1D429}
    $+q::Send, {U+1D42A}
    $+r::Send, {U+1D42B}{U+0332}
    $+s::Send, {U+1D42C}{U+0332}
    $+t::Send, {U+1D42D}{U+0332}
    $+u::Send, {U+1D42E}{U+0332}
    $+v::Send, {U+1D42F}{U+0332}
    $+w::Send, {U+1D430}{U+0332}
    $+x::Send, {U+1D431}{U+0332}
    $+y::Send, {U+1D432}
    $+z::Send, {U+1D433}{U+0332}

    $0::Send, {U+1D7CE}{U+0332}
    $1::Send, {U+1D7CF}{U+0332}
    $2::Send, {U+1D7D0}{U+0332}
    $3::Send, {U+1D7D1}{U+0332}
    $4::Send, {U+1D7D2}{U+0332}
    $5::Send, {U+1D7D3}{U+0332}
    $6::Send, {U+1D7D4}{U+0332}
    $7::Send, {U+1D7D5}{U+0332}
    $8::Send, {U+1D7D6}{U+0332}
    $9::Send, {U+1D7D7}{U+0332}

    ~Space::Send, {U+0332}

    ~SC029::Send, {U+0332}
    ~+SC029::Send, {U+0332}
    ~+SC002::Send, {U+0332}
    ~+SC003::Send, {U+0332}
    ~+SC004::Send, {U+0332}
    ~+SC005::Send, {U+0332}
    ~+SC006::Send, {U+0332}
    ~+SC007::Send, {U+0332}
    ~+SC008::Send, {U+0332}
    ~+SC009::Send, {U+0332}
    ~+SC00a::Send, {U+0332}
    ~+SC00b::Send, {U+0332}
    ~SC00c::Send, {U+0332}
    ~+SC00c::Send, {U+0332}
    ~SC00d::Send, {U+0332}
    ~+SC00d::Send, {U+0332}
    ~SC01a::Send, {U+0332}
    ~+SC01a::Send, {U+0332}
    ~SC01b::Send, {U+0332}
    ~+SC01b::Send, {U+0332}
    ~SC027::Send, {U+0332}
    ~+SC027::Send, {U+0332}
    ~SC028::Send, {U+0332}
    ~+SC028::Send, {U+0332}
    ~SC02b::Send, {U+0332}
    ~+SC02b::Send, {U+0332}
    ~SC033::Send, {U+0332}
    ~+SC033::Send, {U+0332}
    ~SC034::Send, {U+0332}
    ~+SC034::Send, {U+0332}
    ~SC035::Send, {U+0332}
    ~+SC035::Send, {U+0332}
    ~SC037::Send, {U+0332}
    ~SC04a::Send, {U+0332}
    ~SC04e::Send, {U+0332}
    ~SC053::Send, {U+0332}
}
return

#If TNR and modifier = "Italics, Underline" and Caps = "Off"
{
    $a::Send, {U+1D44E}{U+0332}
    $b::Send, {U+1D44F}{U+0332}
    $c::Send, {U+1D450}{U+0332}
    $d::Send, {U+1D451}{U+0332}
    $e::Send, {U+1D452}{U+0332}
    $f::Send, {U+1D453}{U+0332}
    $g::Send, {U+1D454}
    $h::Send, {U+210E}{U+0332}
    $i::Send, {U+1D456}{U+0332}
    $j::Send, {U+1D457}
    $k::Send, {U+1D458}{U+0332}
    $l::Send, {U+1D459}{U+0332}
    $m::Send, {U+1D45A}{U+0332}
    $n::Send, {U+1D45B}{U+0332}
    $o::Send, {U+1D45C}{U+0332}
    $p::Send, {U+1D45D}
    $q::Send, {U+1D45E}
    $r::Send, {U+1D45F}{U+0332}
    $s::Send, {U+1D460}{U+0332}
    $t::Send, {U+1D461}{U+0332}
    $u::Send, {U+1D462}{U+0332}
    $v::Send, {U+1D463}{U+0332}
    $w::Send, {U+1D464}{U+0332}
    $x::Send, {U+1D465}{U+0332}
    $y::Send, {U+1D466}
    $z::Send, {U+1D467}{U+0332}

    $+a::Send, {U+1D434}{U+0332}
    $+b::Send, {U+1D435}{U+0332}
    $+c::Send, {U+1D436}{U+0332}
    $+d::Send, {U+1D437}{U+0332}
    $+e::Send, {U+1D438}{U+0332}
    $+f::Send, {U+1D439}{U+0332}
    $+g::Send, {U+1D43A}{U+0332}
    $+h::Send, {U+1D43B}{U+0332}
    $+i::Send, {U+1D43C}{U+0332}
    $+j::Send, {U+1D43D}{U+0332}
    $+k::Send, {U+1D43E}{U+0332}
    $+l::Send, {U+1D43F}{U+0332}
    $+m::Send, {U+1D440}{U+0332}
    $+n::Send, {U+1D441}{U+0332}
    $+o::Send, {U+1D442}{U+0332}
    $+p::Send, {U+1D443}{U+0332}
    $+q::Send, {U+1D444}{U+0332}
    $+r::Send, {U+1D445}{U+0332}
    $+s::Send, {U+1D446}{U+0332}
    $+t::Send, {U+1D447}{U+0332}
    $+u::Send, {U+1D448}{U+0332}
    $+v::Send, {U+1D449}{U+0332}
    $+w::Send, {U+1D44A}{U+0332}
    $+x::Send, {U+1D44B}{U+0332}
    $+y::Send, {U+1D44C}{U+0332}
    $+z::Send, {U+1D44D}{U+0332}

    ~Space::Send, {U+0332}

    ~SC029::Send, {U+0332}
    ~+SC029::Send, {U+0332}
    ~+SC002::Send, {U+0332}
    ~+SC003::Send, {U+0332}
    ~+SC004::Send, {U+0332}
    ~+SC005::Send, {U+0332}
    ~+SC006::Send, {U+0332}
    ~+SC007::Send, {U+0332}
    ~+SC008::Send, {U+0332}
    ~+SC009::Send, {U+0332}
    ~+SC00a::Send, {U+0332}
    ~+SC00b::Send, {U+0332}
    ~SC00c::Send, {U+0332}
    ~+SC00c::Send, {U+0332}
    ~SC00d::Send, {U+0332}
    ~+SC00d::Send, {U+0332}
    ~SC01a::Send, {U+0332}
    ~+SC01a::Send, {U+0332}
    ~SC01b::Send, {U+0332}
    ~+SC01b::Send, {U+0332}
    ~SC027::Send, {U+0332}
    ~+SC027::Send, {U+0332}
    ~SC028::Send, {U+0332}
    ~+SC028::Send, {U+0332}
    ~SC02b::Send, {U+0332}
    ~+SC02b::Send, {U+0332}
    ~SC033::Send, {U+0332}
    ~+SC033::Send, {U+0332}
    ~SC034::Send, {U+0332}
    ~+SC034::Send, {U+0332}
    ~SC035::Send, {U+0332}
    ~+SC035::Send, {U+0332}
    ~SC037::Send, {U+0332}
    ~SC04a::Send, {U+0332}
    ~SC04e::Send, {U+0332}
    ~SC053::Send, {U+0332}
}
return

#If TNR and modifier = "Italics, Underline" and Caps = "On"
{
    $a::Send, {U+1D434}{U+0332}
    $b::Send, {U+1D435}{U+0332}
    $c::Send, {U+1D436}{U+0332}
    $d::Send, {U+1D437}{U+0332}
    $e::Send, {U+1D438}{U+0332}
    $f::Send, {U+1D439}{U+0332}
    $g::Send, {U+1D43A}{U+0332}
    $h::Send, {U+1D43B}{U+0332}
    $i::Send, {U+1D43C}{U+0332}
    $j::Send, {U+1D43D}{U+0332}
    $k::Send, {U+1D43E}{U+0332}
    $l::Send, {U+1D43F}{U+0332}
    $m::Send, {U+1D440}{U+0332}
    $n::Send, {U+1D441}{U+0332}
    $o::Send, {U+1D442}{U+0332}
    $p::Send, {U+1D443}{U+0332}
    $q::Send, {U+1D444}{U+0332}
    $r::Send, {U+1D445}{U+0332}
    $s::Send, {U+1D446}{U+0332}
    $t::Send, {U+1D447}{U+0332}
    $u::Send, {U+1D448}{U+0332}
    $v::Send, {U+1D449}{U+0332}
    $w::Send, {U+1D44A}{U+0332}
    $x::Send, {U+1D44B}{U+0332}
    $y::Send, {U+1D44C}{U+0332}
    $z::Send, {U+1D44D}{U+0332}

    $+a::Send, {U+1D44E}{U+0332}
    $+b::Send, {U+1D44F}{U+0332}
    $+c::Send, {U+1D450}{U+0332}
    $+d::Send, {U+1D451}{U+0332}
    $+e::Send, {U+1D452}{U+0332}
    $+f::Send, {U+1D453}{U+0332}
    $+g::Send, {U+1D454}
    $+h::Send, {U+210E}{U+0332}
    $+i::Send, {U+1D456}{U+0332}
    $+j::Send, {U+1D457}
    $+k::Send, {U+1D458}{U+0332}
    $+l::Send, {U+1D459}{U+0332}
    $+m::Send, {U+1D45A}{U+0332}
    $+n::Send, {U+1D45B}{U+0332}
    $+o::Send, {U+1D45C}{U+0332}
    $+p::Send, {U+1D45D}
    $+q::Send, {U+1D45E}
    $+r::Send, {U+1D45F}{U+0332}
    $+s::Send, {U+1D460}{U+0332}
    $+t::Send, {U+1D461}{U+0332}
    $+u::Send, {U+1D462}{U+0332}
    $+v::Send, {U+1D463}{U+0332}
    $+w::Send, {U+1D464}{U+0332}
    $+x::Send, {U+1D465}{U+0332}
    $+y::Send, {U+1D466}
    $+z::Send, {U+1D467}{U+0332}

    ~Space::Send, {U+0332}

    ~SC029::Send, {U+0332}
    ~+SC029::Send, {U+0332}
    ~+SC002::Send, {U+0332}
    ~+SC003::Send, {U+0332}
    ~+SC004::Send, {U+0332}
    ~+SC005::Send, {U+0332}
    ~+SC006::Send, {U+0332}
    ~+SC007::Send, {U+0332}
    ~+SC008::Send, {U+0332}
    ~+SC009::Send, {U+0332}
    ~+SC00a::Send, {U+0332}
    ~+SC00b::Send, {U+0332}
    ~SC00c::Send, {U+0332}
    ~+SC00c::Send, {U+0332}
    ~SC00d::Send, {U+0332}
    ~+SC00d::Send, {U+0332}
    ~SC01a::Send, {U+0332}
    ~+SC01a::Send, {U+0332}
    ~SC01b::Send, {U+0332}
    ~+SC01b::Send, {U+0332}
    ~SC027::Send, {U+0332}
    ~+SC027::Send, {U+0332}
    ~SC028::Send, {U+0332}
    ~+SC028::Send, {U+0332}
    ~SC02b::Send, {U+0332}
    ~+SC02b::Send, {U+0332}
    ~SC033::Send, {U+0332}
    ~+SC033::Send, {U+0332}
    ~SC034::Send, {U+0332}
    ~+SC034::Send, {U+0332}
    ~SC035::Send, {U+0332}
    ~+SC035::Send, {U+0332}
    ~SC037::Send, {U+0332}
    ~SC04a::Send, {U+0332}
    ~SC04e::Send, {U+0332}
    ~SC053::Send, {U+0332}
}
return

#If TNR and modifier = "Bold, Italics, Underline" and Caps = "Off"
{
    $a::Send, {U+1D482}{U+0332}
    $b::Send, {U+1D483}{U+0332}
    $c::Send, {U+1D484}{U+0332}
    $d::Send, {U+1D485}{U+0332}
    $e::Send, {U+1D486}{U+0332}
    $f::Send, {U+1D487}{U+0332}
    $g::Send, {U+1D488}
    $h::Send, {U+1D489}{U+0332}
    $i::Send, {U+1D48A}{U+0332}
    $j::Send, {U+1D482}
    $k::Send, {U+1D48C}{U+0332}
    $l::Send, {U+1D48D}{U+0332}
    $m::Send, {U+1D48E}{U+0332}
    $n::Send, {U+1D48F}{U+0332}
    $o::Send, {U+1D490}{U+0332}
    $p::Send, {U+1D491}
    $q::Send, {U+1D492}
    $r::Send, {U+1D493}{U+0332}
    $s::Send, {U+1D494}{U+0332}
    $t::Send, {U+1D495}{U+0332}
    $u::Send, {U+1D496}{U+0332}
    $v::Send, {U+1D497}{U+0332}
    $w::Send, {U+1D498}{U+0332}
    $x::Send, {U+1D499}{U+0332}
    $y::Send, {U+1D49A}
    $z::Send, {U+1D49B}{U+0332}

    $+a::Send, {U+1D468}{U+0332}
    $+b::Send, {U+1D469}{U+0332}
    $+c::Send, {U+1D46A}{U+0332}
    $+d::Send, {U+1D46B}{U+0332}
    $+e::Send, {U+1D46C}{U+0332}
    $+f::Send, {U+1D46D}{U+0332}
    $+g::Send, {U+1D46E}{U+0332}
    $+h::Send, {U+1D46F}{U+0332}
    $+i::Send, {U+1D470}{U+0332}
    $+j::Send, {U+1D471}{U+0332}
    $+k::Send, {U+1D472}{U+0332}
    $+l::Send, {U+1D473}{U+0332}
    $+m::Send, {U+1D474}{U+0332}
    $+n::Send, {U+1D475}{U+0332}
    $+o::Send, {U+1D476}{U+0332}
    $+p::Send, {U+1D477}{U+0332}
    $+q::Send, {U+1D478}{U+0332}
    $+r::Send, {U+1D479}{U+0332}
    $+s::Send, {U+1D47A}{U+0332}
    $+t::Send, {U+1D47B}{U+0332}
    $+u::Send, {U+1D47C}{U+0332}
    $+v::Send, {U+1D47D}{U+0332}
    $+w::Send, {U+1D47E}{U+0332}
    $+x::Send, {U+1D47F}{U+0332}
    $+y::Send, {U+1D480}{U+0332}
    $+z::Send, {U+1D481}{U+0332}

    $0::Send, {U+1D7CE}{U+0332}
    $1::Send, {U+1D7CF}{U+0332}
    $2::Send, {U+1D7D0}{U+0332}
    $3::Send, {U+1D7D1}{U+0332}
    $4::Send, {U+1D7D2}{U+0332}
    $5::Send, {U+1D7D3}{U+0332}
    $6::Send, {U+1D7D4}{U+0332}
    $7::Send, {U+1D7D5}{U+0332}
    $8::Send, {U+1D7D6}{U+0332}
    $9::Send, {U+1D7D7}{U+0332}

    ~Space::Send, {U+0332}

    ~SC029::Send, {U+0332}
    ~+SC029::Send, {U+0332}
    ~+SC002::Send, {U+0332}
    ~+SC003::Send, {U+0332}
    ~+SC004::Send, {U+0332}
    ~+SC005::Send, {U+0332}
    ~+SC006::Send, {U+0332}
    ~+SC007::Send, {U+0332}
    ~+SC008::Send, {U+0332}
    ~+SC009::Send, {U+0332}
    ~+SC00a::Send, {U+0332}
    ~+SC00b::Send, {U+0332}
    ~SC00c::Send, {U+0332}
    ~+SC00c::Send, {U+0332}
    ~SC00d::Send, {U+0332}
    ~+SC00d::Send, {U+0332}
    ~SC01a::Send, {U+0332}
    ~+SC01a::Send, {U+0332}
    ~SC01b::Send, {U+0332}
    ~+SC01b::Send, {U+0332}
    ~SC027::Send, {U+0332}
    ~+SC027::Send, {U+0332}
    ~SC028::Send, {U+0332}
    ~+SC028::Send, {U+0332}
    ~SC02b::Send, {U+0332}
    ~+SC02b::Send, {U+0332}
    ~SC033::Send, {U+0332}
    ~+SC033::Send, {U+0332}
    ~SC034::Send, {U+0332}
    ~+SC034::Send, {U+0332}
    ~SC035::Send, {U+0332}
    ~+SC035::Send, {U+0332}
    ~SC037::Send, {U+0332}
    ~SC04a::Send, {U+0332}
    ~SC04e::Send, {U+0332}
    ~SC053::Send, {U+0332}
}
return

#If TNR and modifier = "Bold, Italics, Underline" and Caps = "On"
{
    $a::Send, {U+1D482}{U+0332}
    $b::Send, {U+1D483}{U+0332}
    $c::Send, {U+1D484}{U+0332}
    $d::Send, {U+1D485}{U+0332}
    $e::Send, {U+1D486}{U+0332}
    $f::Send, {U+1D487}{U+0332}
    $g::Send, {U+1D488}{U+0332}
    $h::Send, {U+1D489}{U+0332}
    $i::Send, {U+1D48A}{U+0332}
    $j::Send, {U+1D482}{U+0332}
    $k::Send, {U+1D48C}{U+0332}
    $l::Send, {U+1D48D}{U+0332}
    $m::Send, {U+1D48E}{U+0332}
    $n::Send, {U+1D48F}{U+0332}
    $o::Send, {U+1D490}{U+0332}
    $p::Send, {U+1D491}{U+0332}
    $q::Send, {U+1D492}{U+0332}
    $r::Send, {U+1D493}{U+0332}
    $s::Send, {U+1D494}{U+0332}
    $t::Send, {U+1D495}{U+0332}
    $u::Send, {U+1D496}{U+0332}
    $v::Send, {U+1D497}{U+0332}
    $w::Send, {U+1D498}{U+0332}
    $x::Send, {U+1D499}{U+0332}
    $y::Send, {U+1D49A}{U+0332}
    $z::Send, {U+1D49B}{U+0332}

    $+a::Send, {U+1D468}{U+0332}
    $+b::Send, {U+1D469}{U+0332}
    $+c::Send, {U+1D46A}{U+0332}
    $+d::Send, {U+1D46B}{U+0332}
    $+e::Send, {U+1D46C}{U+0332}
    $+f::Send, {U+1D46D}{U+0332}
    $+g::Send, {U+1D46E}
    $+h::Send, {U+1D46F}{U+0332}
    $+i::Send, {U+1D470}{U+0332}
    $+j::Send, {U+1D471}
    $+k::Send, {U+1D472}{U+0332}
    $+l::Send, {U+1D473}{U+0332}
    $+m::Send, {U+1D474}{U+0332}
    $+n::Send, {U+1D475}{U+0332}
    $+o::Send, {U+1D476}{U+0332}
    $+p::Send, {U+1D477}
    $+q::Send, {U+1D478}
    $+r::Send, {U+1D479}{U+0332}
    $+s::Send, {U+1D47A}{U+0332}
    $+t::Send, {U+1D47B}{U+0332}
    $+u::Send, {U+1D47C}{U+0332}
    $+v::Send, {U+1D47D}{U+0332}
    $+w::Send, {U+1D47E}{U+0332}
    $+x::Send, {U+1D47F}{U+0332}
    $+y::Send, {U+1D480}
    $+z::Send, {U+1D481}{U+0332}

    $0::Send, {U+1D7CE}{U+0332}
    $1::Send, {U+1D7CF}{U+0332}
    $2::Send, {U+1D7D0}{U+0332}
    $3::Send, {U+1D7D1}{U+0332}
    $4::Send, {U+1D7D2}{U+0332}
    $5::Send, {U+1D7D3}{U+0332}
    $6::Send, {U+1D7D4}{U+0332}
    $7::Send, {U+1D7D5}{U+0332}
    $8::Send, {U+1D7D6}{U+0332}
    $9::Send, {U+1D7D7}{U+0332}

    ~Space::Send, {U+0332}

    ~SC029::Send, {U+0332}
    ~+SC029::Send, {U+0332}
    ~+SC002::Send, {U+0332}
    ~+SC003::Send, {U+0332}
    ~+SC004::Send, {U+0332}
    ~+SC005::Send, {U+0332}
    ~+SC006::Send, {U+0332}
    ~+SC007::Send, {U+0332}
    ~+SC008::Send, {U+0332}
    ~+SC009::Send, {U+0332}
    ~+SC00a::Send, {U+0332}
    ~+SC00b::Send, {U+0332}
    ~SC00c::Send, {U+0332}
    ~+SC00c::Send, {U+0332}
    ~SC00d::Send, {U+0332}
    ~+SC00d::Send, {U+0332}
    ~SC01a::Send, {U+0332}
    ~+SC01a::Send, {U+0332}
    ~SC01b::Send, {U+0332}
    ~+SC01b::Send, {U+0332}
    ~SC027::Send, {U+0332}
    ~+SC027::Send, {U+0332}
    ~SC028::Send, {U+0332}
    ~+SC028::Send, {U+0332}
    ~SC02b::Send, {U+0332}
    ~+SC02b::Send, {U+0332}
    ~SC033::Send, {U+0332}
    ~+SC033::Send, {U+0332}
    ~SC034::Send, {U+0332}
    ~+SC034::Send, {U+0332}
    ~SC035::Send, {U+0332}
    ~+SC035::Send, {U+0332}
    ~SC037::Send, {U+0332}
    ~SC04a::Send, {U+0332}
    ~SC04e::Send, {U+0332}
    ~SC053::Send, {U+0332}
}
return

;Strikethrough Modifiers
#If TNR and modifier = "Bold, Strikethrough" and Caps = "Off"
{
    $a::Send, {U+1D41A}{U+0336}
    $b::Send, {U+1D41B}{U+0336}
    $c::Send, {U+1D41C}{U+0336}
    $d::Send, {U+1D41D}{U+0336}
    $e::Send, {U+1D41E}{U+0336}
    $f::Send, {U+1D41F}{U+0336}
    $g::Send, {U+1D420}{U+0336}
    $h::Send, {U+1D421}{U+0336}
    $i::Send, {U+1D422}{U+0336}
    $j::Send, {U+1D423}{U+0336}
    $k::Send, {U+1D424}{U+0336}
    $l::Send, {U+1D425}{U+0336}
    $m::Send, {U+1D426}{U+0336}
    $n::Send, {U+1D427}{U+0336}
    $o::Send, {U+1D428}{U+0336}
    $p::Send, {U+1D429}{U+0336}
    $q::Send, {U+1D42A}{U+0336}
    $r::Send, {U+1D42B}{U+0336}
    $s::Send, {U+1D42C}{U+0336}
    $t::Send, {U+1D42D}{U+0336}
    $u::Send, {U+1D42E}{U+0336}
    $v::Send, {U+1D42F}{U+0336}
    $w::Send, {U+1D430}{U+0336}
    $x::Send, {U+1D431}{U+0336}
    $y::Send, {U+1D432}{U+0336}
    $z::Send, {U+1D433}{U+0336}

    $+a::Send, {U+1D400}{U+0336}
    $+b::Send, {U+1D401}{U+0336}
    $+c::Send, {U+1D402}{U+0336}
    $+d::Send, {U+1D403}{U+0336}
    $+e::Send, {U+1D404}{U+0336}
    $+f::Send, {U+1D405}{U+0336}
    $+g::Send, {U+1D406}{U+0336}
    $+h::Send, {U+1D407}{U+0336}
    $+i::Send, {U+1D408}{U+0336}
    $+j::Send, {U+1D409}{U+0336}
    $+k::Send, {U+1D40A}{U+0336}
    $+l::Send, {U+1D40B}{U+0336}
    $+m::Send, {U+1D40C}{U+0336}
    $+n::Send, {U+1D40D}{U+0336}
    $+o::Send, {U+1D40E}{U+0336}
    $+p::Send, {U+1D40F}{U+0336}
    $+q::Send, {U+1D410}{U+0336}
    $+r::Send, {U+1D411}{U+0336}
    $+s::Send, {U+1D412}{U+0336}
    $+t::Send, {U+1D413}{U+0336}
    $+u::Send, {U+1D414}{U+0336}
    $+v::Send, {U+1D415}{U+0336}
    $+w::Send, {U+1D416}{U+0336}
    $+x::Send, {U+1D417}{U+0336}
    $+y::Send, {U+1D418}{U+0336}
    $+z::Send, {U+1D419}{U+0336}

    $0::Send, {U+1D7CE}{U+0336}
    $1::Send, {U+1D7CF}{U+0336}
    $2::Send, {U+1D7D0}{U+0336}
    $3::Send, {U+1D7D1}{U+0336}
    $4::Send, {U+1D7D2}{U+0336}
    $5::Send, {U+1D7D3}{U+0336}
    $6::Send, {U+1D7D4}{U+0336}
    $7::Send, {U+1D7D5}{U+0336}
    $8::Send, {U+1D7D6}{U+0336}
    $9::Send, {U+1D7D7}{U+0336}

    ~Space::Send, {U+0336}

    ~SC029::Send, {U+0336}
    ~+SC029::Send, {U+0336}
    ~+SC002::Send, {U+0336}
    ~+SC003::Send, {U+0336}
    ~+SC004::Send, {U+0336}
    ~+SC005::Send, {U+0336}
    ~+SC006::Send, {U+0336}
    ~+SC007::Send, {U+0336}
    ~+SC008::Send, {U+0336}
    ~+SC009::Send, {U+0336}
    ~+SC00a::Send, {U+0336}
    ~+SC00b::Send, {U+0336}
    ~SC00c::Send, {U+0336}
    ~+SC00c::Send, {U+0336}
    ~SC00d::Send, {U+0336}
    ~+SC00d::Send, {U+0336}
    ~SC01a::Send, {U+0336}
    ~+SC01a::Send, {U+0336}
    ~SC01b::Send, {U+0336}
    ~+SC01b::Send, {U+0336}
    ~SC027::Send, {U+0336}
    ~+SC027::Send, {U+0336}
    ~SC028::Send, {U+0336}
    ~+SC028::Send, {U+0336}
    ~SC02b::Send, {U+0336}
    ~+SC02b::Send, {U+0336}
    ~SC033::Send, {U+0336}
    ~+SC033::Send, {U+0336}
    ~SC034::Send, {U+0336}
    ~+SC034::Send, {U+0336}
    ~SC035::Send, {U+0336}
    ~+SC035::Send, {U+0336}
    ~SC037::Send, {U+0336}
    ~SC04a::Send, {U+0336}
    ~SC04e::Send, {U+0336}
    ~SC053::Send, {U+0336}
}
return

#If TNR and modifier = "Bold, Strikethrough" and Caps = "On"
{
    $a::Send, {U+1D400}{U+0336}
    $b::Send, {U+1D401}{U+0336}
    $c::Send, {U+1D402}{U+0336}
    $d::Send, {U+1D403}{U+0336}
    $e::Send, {U+1D404}{U+0336}
    $f::Send, {U+1D405}{U+0336}
    $g::Send, {U+1D406}{U+0336}
    $h::Send, {U+1D407}{U+0336}
    $i::Send, {U+1D408}{U+0336}
    $j::Send, {U+1D409}{U+0336}
    $k::Send, {U+1D40A}{U+0336}
    $l::Send, {U+1D40B}{U+0336}
    $m::Send, {U+1D40C}{U+0336}
    $n::Send, {U+1D40D}{U+0336}
    $o::Send, {U+1D40E}{U+0336}
    $p::Send, {U+1D40F}{U+0336}
    $q::Send, {U+1D410}{U+0336}
    $r::Send, {U+1D411}{U+0336}
    $s::Send, {U+1D412}{U+0336}
    $t::Send, {U+1D413}{U+0336}
    $u::Send, {U+1D414}{U+0336}
    $v::Send, {U+1D415}{U+0336}
    $w::Send, {U+1D416}{U+0336}
    $x::Send, {U+1D417}{U+0336}
    $y::Send, {U+1D418}{U+0336}
    $z::Send, {U+1D419}{U+0336}

    $+a::Send, {U+1D41A}{U+0336}
    $+b::Send, {U+1D41B}{U+0336}
    $+c::Send, {U+1D41C}{U+0336}
    $+d::Send, {U+1D41D}{U+0336}
    $+e::Send, {U+1D41E}{U+0336}
    $+f::Send, {U+1D41F}{U+0336}
    $+g::Send, {U+1D420}{U+0336}
    $+h::Send, {U+1D421}{U+0336}
    $+i::Send, {U+1D422}{U+0336}
    $+j::Send, {U+1D423}{U+0336}
    $+k::Send, {U+1D424}{U+0336}
    $+l::Send, {U+1D425}{U+0336}
    $+m::Send, {U+1D426}{U+0336}
    $+n::Send, {U+1D427}{U+0336}
    $+o::Send, {U+1D428}{U+0336}
    $+p::Send, {U+1D429}{U+0336}
    $+q::Send, {U+1D42A}{U+0336}
    $+r::Send, {U+1D42B}{U+0336}
    $+s::Send, {U+1D42C}{U+0336}
    $+t::Send, {U+1D42D}{U+0336}
    $+u::Send, {U+1D42E}{U+0336}
    $+v::Send, {U+1D42F}{U+0336}
    $+w::Send, {U+1D430}{U+0336}
    $+x::Send, {U+1D431}{U+0336}
    $+y::Send, {U+1D432}{U+0336}
    $+z::Send, {U+1D433}{U+0336}

    $0::Send, {U+1D7CE}{U+0336}
    $1::Send, {U+1D7CF}{U+0336}
    $2::Send, {U+1D7D0}{U+0336}
    $3::Send, {U+1D7D1}{U+0336}
    $4::Send, {U+1D7D2}{U+0336}
    $5::Send, {U+1D7D3}{U+0336}
    $6::Send, {U+1D7D4}{U+0336}
    $7::Send, {U+1D7D5}{U+0336}
    $8::Send, {U+1D7D6}{U+0336}
    $9::Send, {U+1D7D7}{U+0336}

    ~Space::Send, {U+0336}

    ~SC029::Send, {U+0336}
    ~+SC029::Send, {U+0336}
    ~+SC002::Send, {U+0336}
    ~+SC003::Send, {U+0336}
    ~+SC004::Send, {U+0336}
    ~+SC005::Send, {U+0336}
    ~+SC006::Send, {U+0336}
    ~+SC007::Send, {U+0336}
    ~+SC008::Send, {U+0336}
    ~+SC009::Send, {U+0336}
    ~+SC00a::Send, {U+0336}
    ~+SC00b::Send, {U+0336}
    ~SC00c::Send, {U+0336}
    ~+SC00c::Send, {U+0336}
    ~SC00d::Send, {U+0336}
    ~+SC00d::Send, {U+0336}
    ~SC01a::Send, {U+0336}
    ~+SC01a::Send, {U+0336}
    ~SC01b::Send, {U+0336}
    ~+SC01b::Send, {U+0336}
    ~SC027::Send, {U+0336}
    ~+SC027::Send, {U+0336}
    ~SC028::Send, {U+0336}
    ~+SC028::Send, {U+0336}
    ~SC02b::Send, {U+0336}
    ~+SC02b::Send, {U+0336}
    ~SC033::Send, {U+0336}
    ~+SC033::Send, {U+0336}
    ~SC034::Send, {U+0336}
    ~+SC034::Send, {U+0336}
    ~SC035::Send, {U+0336}
    ~+SC035::Send, {U+0336}
    ~SC037::Send, {U+0336}
    ~SC04a::Send, {U+0336}
    ~SC04e::Send, {U+0336}
    ~SC053::Send, {U+0336}
}
return

#If TNR and modifier = "Italics, Strikethrough" and Caps = "Off"
{
    $a::Send, {U+1D44E}{U+0336}
    $b::Send, {U+1D44F}{U+0336}
    $c::Send, {U+1D450}{U+0336}
    $d::Send, {U+1D451}{U+0336}
    $e::Send, {U+1D452}{U+0336}
    $f::Send, {U+1D453}{U+0336}
    $g::Send, {U+1D454}{U+0336}
    $h::Send, {U+210E}{U+0336}
    $i::Send, {U+1D456}{U+0336}
    $j::Send, {U+1D457}{U+0336}
    $k::Send, {U+1D458}{U+0336}
    $l::Send, {U+1D459}{U+0336}
    $m::Send, {U+1D45A}{U+0336}
    $n::Send, {U+1D45B}{U+0336}
    $o::Send, {U+1D45C}{U+0336}
    $p::Send, {U+1D45D}{U+0336}
    $q::Send, {U+1D45E}{U+0336}
    $r::Send, {U+1D45F}{U+0336}
    $s::Send, {U+1D460}{U+0336}
    $t::Send, {U+1D461}{U+0336}
    $u::Send, {U+1D462}{U+0336}
    $v::Send, {U+1D463}{U+0336}
    $w::Send, {U+1D464}{U+0336}
    $x::Send, {U+1D465}{U+0336}
    $y::Send, {U+1D466}{U+0336}
    $z::Send, {U+1D467}{U+0336}

    $+a::Send, {U+1D434}{U+0336}
    $+b::Send, {U+1D435}{U+0336}
    $+c::Send, {U+1D436}{U+0336}
    $+d::Send, {U+1D437}{U+0336}
    $+e::Send, {U+1D438}{U+0336}
    $+f::Send, {U+1D439}{U+0336}
    $+g::Send, {U+1D43A}{U+0336}
    $+h::Send, {U+1D43B}{U+0336}
    $+i::Send, {U+1D43C}{U+0336}
    $+j::Send, {U+1D43D}{U+0336}
    $+k::Send, {U+1D43E}{U+0336}
    $+l::Send, {U+1D43F}{U+0336}
    $+m::Send, {U+1D440}{U+0336}
    $+n::Send, {U+1D441}{U+0336}
    $+o::Send, {U+1D442}{U+0336}
    $+p::Send, {U+1D443}{U+0336}
    $+q::Send, {U+1D444}{U+0336}
    $+r::Send, {U+1D445}{U+0336}
    $+s::Send, {U+1D446}{U+0336}
    $+t::Send, {U+1D447}{U+0336}
    $+u::Send, {U+1D448}{U+0336}
    $+v::Send, {U+1D449}{U+0336}
    $+w::Send, {U+1D44A}{U+0336}
    $+x::Send, {U+1D44B}{U+0336}
    $+y::Send, {U+1D44C}{U+0336}
    $+z::Send, {U+1D44D}{U+0336}

    ~Space::Send, {U+0336}

    ~SC029::Send, {U+0336}
    ~+SC029::Send, {U+0336}
    ~+SC002::Send, {U+0336}
    ~+SC003::Send, {U+0336}
    ~+SC004::Send, {U+0336}
    ~+SC005::Send, {U+0336}
    ~+SC006::Send, {U+0336}
    ~+SC007::Send, {U+0336}
    ~+SC008::Send, {U+0336}
    ~+SC009::Send, {U+0336}
    ~+SC00a::Send, {U+0336}
    ~+SC00b::Send, {U+0336}
    ~SC00c::Send, {U+0336}
    ~+SC00c::Send, {U+0336}
    ~SC00d::Send, {U+0336}
    ~+SC00d::Send, {U+0336}
    ~SC01a::Send, {U+0336}
    ~+SC01a::Send, {U+0336}
    ~SC01b::Send, {U+0336}
    ~+SC01b::Send, {U+0336}
    ~SC027::Send, {U+0336}
    ~+SC027::Send, {U+0336}
    ~SC028::Send, {U+0336}
    ~+SC028::Send, {U+0336}
    ~SC02b::Send, {U+0336}
    ~+SC02b::Send, {U+0336}
    ~SC033::Send, {U+0336}
    ~+SC033::Send, {U+0336}
    ~SC034::Send, {U+0336}
    ~+SC034::Send, {U+0336}
    ~SC035::Send, {U+0336}
    ~+SC035::Send, {U+0336}
    ~SC037::Send, {U+0336}
    ~SC04a::Send, {U+0336}
    ~SC04e::Send, {U+0336}
    ~SC053::Send, {U+0336}
}
return

#If TNR and modifier = "Italics, Strikethrough" and Caps = "On"
{
    $a::Send, {U+1D434}{U+0336}
    $b::Send, {U+1D435}{U+0336}
    $c::Send, {U+1D436}{U+0336}
    $d::Send, {U+1D437}{U+0336}
    $e::Send, {U+1D438}{U+0336}
    $f::Send, {U+1D439}{U+0336}
    $g::Send, {U+1D43A}{U+0336}
    $h::Send, {U+1D43B}{U+0336}
    $i::Send, {U+1D43C}{U+0336}
    $j::Send, {U+1D43D}{U+0336}
    $k::Send, {U+1D43E}{U+0336}
    $l::Send, {U+1D43F}{U+0336}
    $m::Send, {U+1D440}{U+0336}
    $n::Send, {U+1D441}{U+0336}
    $o::Send, {U+1D442}{U+0336}
    $p::Send, {U+1D443}{U+0336}
    $q::Send, {U+1D444}{U+0336}
    $r::Send, {U+1D445}{U+0336}
    $s::Send, {U+1D446}{U+0336}
    $t::Send, {U+1D447}{U+0336}
    $u::Send, {U+1D448}{U+0336}
    $v::Send, {U+1D449}{U+0336}
    $w::Send, {U+1D44A}{U+0336}
    $x::Send, {U+1D44B}{U+0336}
    $y::Send, {U+1D44C}{U+0336}
    $z::Send, {U+1D44D}{U+0336}

    $+a::Send, {U+1D44E}{U+0336}
    $+b::Send, {U+1D44F}{U+0336}
    $+c::Send, {U+1D450}{U+0336}
    $+d::Send, {U+1D451}{U+0336}
    $+e::Send, {U+1D452}{U+0336}
    $+f::Send, {U+1D453}{U+0336}
    $+g::Send, {U+1D454}{U+0336}
    $+h::Send, {U+210E}{U+0336}
    $+i::Send, {U+1D456}{U+0336}
    $+j::Send, {U+1D457}{U+0336}
    $+k::Send, {U+1D458}{U+0336}
    $+l::Send, {U+1D459}{U+0336}
    $+m::Send, {U+1D45A}{U+0336}
    $+n::Send, {U+1D45B}{U+0336}
    $+o::Send, {U+1D45C}{U+0336}
    $+p::Send, {U+1D45D}{U+0336}
    $+q::Send, {U+1D45E}{U+0336}
    $+r::Send, {U+1D45F}{U+0336}
    $+s::Send, {U+1D460}{U+0336}
    $+t::Send, {U+1D461}{U+0336}
    $+u::Send, {U+1D462}{U+0336}
    $+v::Send, {U+1D463}{U+0336}
    $+w::Send, {U+1D464}{U+0336}
    $+x::Send, {U+1D465}{U+0336}
    $+y::Send, {U+1D466}{U+0336}
    $+z::Send, {U+1D467}{U+0336}

    ~Space::Send, {U+0336}

    ~SC029::Send, {U+0336}
    ~+SC029::Send, {U+0336}
    ~+SC002::Send, {U+0336}
    ~+SC003::Send, {U+0336}
    ~+SC004::Send, {U+0336}
    ~+SC005::Send, {U+0336}
    ~+SC006::Send, {U+0336}
    ~+SC007::Send, {U+0336}
    ~+SC008::Send, {U+0336}
    ~+SC009::Send, {U+0336}
    ~+SC00a::Send, {U+0336}
    ~+SC00b::Send, {U+0336}
    ~SC00c::Send, {U+0336}
    ~+SC00c::Send, {U+0336}
    ~SC00d::Send, {U+0336}
    ~+SC00d::Send, {U+0336}
    ~SC01a::Send, {U+0336}
    ~+SC01a::Send, {U+0336}
    ~SC01b::Send, {U+0336}
    ~+SC01b::Send, {U+0336}
    ~SC027::Send, {U+0336}
    ~+SC027::Send, {U+0336}
    ~SC028::Send, {U+0336}
    ~+SC028::Send, {U+0336}
    ~SC02b::Send, {U+0336}
    ~+SC02b::Send, {U+0336}
    ~SC033::Send, {U+0336}
    ~+SC033::Send, {U+0336}
    ~SC034::Send, {U+0336}
    ~+SC034::Send, {U+0336}
    ~SC035::Send, {U+0336}
    ~+SC035::Send, {U+0336}
    ~SC037::Send, {U+0336}
    ~SC04a::Send, {U+0336}
    ~SC04e::Send, {U+0336}
    ~SC053::Send, {U+0336}
}
return

#If TNR and modifier = "Bold, Italics, Strikethrough" and Caps = "Off"
{
    $a::Send, {U+1D482}{U+0336}
    $b::Send, {U+1D483}{U+0336}
    $c::Send, {U+1D484}{U+0336}
    $d::Send, {U+1D485}{U+0336}
    $e::Send, {U+1D486}{U+0336}
    $f::Send, {U+1D487}{U+0336}
    $g::Send, {U+1D488}{U+0336}
    $h::Send, {U+1D489}{U+0336}
    $i::Send, {U+1D48A}{U+0336}
    $j::Send, {U+1D482}{U+0336}
    $k::Send, {U+1D48C}{U+0336}
    $l::Send, {U+1D48D}{U+0336}
    $m::Send, {U+1D48E}{U+0336}
    $n::Send, {U+1D48F}{U+0336}
    $o::Send, {U+1D490}{U+0336}
    $p::Send, {U+1D491}{U+0336}
    $q::Send, {U+1D492}{U+0336}
    $r::Send, {U+1D493}{U+0336}
    $s::Send, {U+1D494}{U+0336}
    $t::Send, {U+1D495}{U+0336}
    $u::Send, {U+1D496}{U+0336}
    $v::Send, {U+1D497}{U+0336}
    $w::Send, {U+1D498}{U+0336}
    $x::Send, {U+1D499}{U+0336}
    $y::Send, {U+1D49A}{U+0336}
    $z::Send, {U+1D49B}{U+0336}

    $+a::Send, {U+1D468}{U+0336}
    $+b::Send, {U+1D469}{U+0336}
    $+c::Send, {U+1D46A}{U+0336}
    $+d::Send, {U+1D46B}{U+0336}
    $+e::Send, {U+1D46C}{U+0336}
    $+f::Send, {U+1D46D}{U+0336}
    $+g::Send, {U+1D46E}{U+0336}
    $+h::Send, {U+1D46F}{U+0336}
    $+i::Send, {U+1D470}{U+0336}
    $+j::Send, {U+1D471}{U+0336}
    $+k::Send, {U+1D472}{U+0336}
    $+l::Send, {U+1D473}{U+0336}
    $+m::Send, {U+1D474}{U+0336}
    $+n::Send, {U+1D475}{U+0336}
    $+o::Send, {U+1D476}{U+0336}
    $+p::Send, {U+1D477}{U+0336}
    $+q::Send, {U+1D478}{U+0336}
    $+r::Send, {U+1D479}{U+0336}
    $+s::Send, {U+1D47A}{U+0336}
    $+t::Send, {U+1D47B}{U+0336}
    $+u::Send, {U+1D47C}{U+0336}
    $+v::Send, {U+1D47D}{U+0336}
    $+w::Send, {U+1D47E}{U+0336}
    $+x::Send, {U+1D47F}{U+0336}
    $+y::Send, {U+1D480}{U+0336}
    $+z::Send, {U+1D481}{U+0336}

    $0::Send, {U+1D7CE}{U+0336}
    $1::Send, {U+1D7CF}{U+0336}
    $2::Send, {U+1D7D0}{U+0336}
    $3::Send, {U+1D7D1}{U+0336}
    $4::Send, {U+1D7D2}{U+0336}
    $5::Send, {U+1D7D3}{U+0336}
    $6::Send, {U+1D7D4}{U+0336}
    $7::Send, {U+1D7D5}{U+0336}
    $8::Send, {U+1D7D6}{U+0336}
    $9::Send, {U+1D7D7}{U+0336}

    ~Space::Send, {U+0336}

    ~SC029::Send, {U+0336}
    ~+SC029::Send, {U+0336}
    ~+SC002::Send, {U+0336}
    ~+SC003::Send, {U+0336}
    ~+SC004::Send, {U+0336}
    ~+SC005::Send, {U+0336}
    ~+SC006::Send, {U+0336}
    ~+SC007::Send, {U+0336}
    ~+SC008::Send, {U+0336}
    ~+SC009::Send, {U+0336}
    ~+SC00a::Send, {U+0336}
    ~+SC00b::Send, {U+0336}
    ~SC00c::Send, {U+0336}
    ~+SC00c::Send, {U+0336}
    ~SC00d::Send, {U+0336}
    ~+SC00d::Send, {U+0336}
    ~SC01a::Send, {U+0336}
    ~+SC01a::Send, {U+0336}
    ~SC01b::Send, {U+0336}
    ~+SC01b::Send, {U+0336}
    ~SC027::Send, {U+0336}
    ~+SC027::Send, {U+0336}
    ~SC028::Send, {U+0336}
    ~+SC028::Send, {U+0336}
    ~SC02b::Send, {U+0336}
    ~+SC02b::Send, {U+0336}
    ~SC033::Send, {U+0336}
    ~+SC033::Send, {U+0336}
    ~SC034::Send, {U+0336}
    ~+SC034::Send, {U+0336}
    ~SC035::Send, {U+0336}
    ~+SC035::Send, {U+0336}
    ~SC037::Send, {U+0336}
    ~SC04a::Send, {U+0336}
    ~SC04e::Send, {U+0336}
    ~SC053::Send, {U+0336}
}
return

#If TNR and modifier = "Bold, Italics, Strikethrough" and Caps = "On"
{
    $a::Send, {U+1D482}{U+0336}
    $b::Send, {U+1D483}{U+0336}
    $c::Send, {U+1D484}{U+0336}
    $d::Send, {U+1D485}{U+0336}
    $e::Send, {U+1D486}{U+0336}
    $f::Send, {U+1D487}{U+0336}
    $g::Send, {U+1D488}{U+0336}
    $h::Send, {U+1D489}{U+0336}
    $i::Send, {U+1D48A}{U+0336}
    $j::Send, {U+1D482}{U+0336}
    $k::Send, {U+1D48C}{U+0336}
    $l::Send, {U+1D48D}{U+0336}
    $m::Send, {U+1D48E}{U+0336}
    $n::Send, {U+1D48F}{U+0336}
    $o::Send, {U+1D490}{U+0336}
    $p::Send, {U+1D491}{U+0336}
    $q::Send, {U+1D492}{U+0336}
    $r::Send, {U+1D493}{U+0336}
    $s::Send, {U+1D494}{U+0336}
    $t::Send, {U+1D495}{U+0336}
    $u::Send, {U+1D496}{U+0336}
    $v::Send, {U+1D497}{U+0336}
    $w::Send, {U+1D498}{U+0336}
    $x::Send, {U+1D499}{U+0336}
    $y::Send, {U+1D49A}{U+0336}
    $z::Send, {U+1D49B}{U+0336}

    $+a::Send, {U+1D468}{U+0336}
    $+b::Send, {U+1D469}{U+0336}
    $+c::Send, {U+1D46A}{U+0336}
    $+d::Send, {U+1D46B}{U+0336}
    $+e::Send, {U+1D46C}{U+0336}
    $+f::Send, {U+1D46D}{U+0336}
    $+g::Send, {U+1D46E}{U+0336}
    $+h::Send, {U+1D46F}{U+0336}
    $+i::Send, {U+1D470}{U+0336}
    $+j::Send, {U+1D471}{U+0336}
    $+k::Send, {U+1D472}{U+0336}
    $+l::Send, {U+1D473}{U+0336}
    $+m::Send, {U+1D474}{U+0336}
    $+n::Send, {U+1D475}{U+0336}
    $+o::Send, {U+1D476}{U+0336}
    $+p::Send, {U+1D477}{U+0336}
    $+q::Send, {U+1D478}{U+0336}
    $+r::Send, {U+1D479}{U+0336}
    $+s::Send, {U+1D47A}{U+0336}
    $+t::Send, {U+1D47B}{U+0336}
    $+u::Send, {U+1D47C}{U+0336}
    $+v::Send, {U+1D47D}{U+0336}
    $+w::Send, {U+1D47E}{U+0336}
    $+x::Send, {U+1D47F}{U+0336}
    $+y::Send, {U+1D480}{U+0336}
    $+z::Send, {U+1D481}{U+0336}

    $0::Send, {U+1D7CE}{U+0336}
    $1::Send, {U+1D7CF}{U+0336}
    $2::Send, {U+1D7D0}{U+0336}
    $3::Send, {U+1D7D1}{U+0336}
    $4::Send, {U+1D7D2}{U+0336}
    $5::Send, {U+1D7D3}{U+0336}
    $6::Send, {U+1D7D4}{U+0336}
    $7::Send, {U+1D7D5}{U+0336}
    $8::Send, {U+1D7D6}{U+0336}
    $9::Send, {U+1D7D7}{U+0336}

    ~Space::Send, {U+0336}

    ~SC029::Send, {U+0336}
    ~+SC029::Send, {U+0336}
    ~+SC002::Send, {U+0336}
    ~+SC003::Send, {U+0336}
    ~+SC004::Send, {U+0336}
    ~+SC005::Send, {U+0336}
    ~+SC006::Send, {U+0336}
    ~+SC007::Send, {U+0336}
    ~+SC008::Send, {U+0336}
    ~+SC009::Send, {U+0336}
    ~+SC00a::Send, {U+0336}
    ~+SC00b::Send, {U+0336}
    ~SC00c::Send, {U+0336}
    ~+SC00c::Send, {U+0336}
    ~SC00d::Send, {U+0336}
    ~+SC00d::Send, {U+0336}
    ~SC01a::Send, {U+0336}
    ~+SC01a::Send, {U+0336}
    ~SC01b::Send, {U+0336}
    ~+SC01b::Send, {U+0336}
    ~SC027::Send, {U+0336}
    ~+SC027::Send, {U+0336}
    ~SC028::Send, {U+0336}
    ~+SC028::Send, {U+0336}
    ~SC02b::Send, {U+0336}
    ~+SC02b::Send, {U+0336}
    ~SC033::Send, {U+0336}
    ~+SC033::Send, {U+0336}
    ~SC034::Send, {U+0336}
    ~+SC034::Send, {U+0336}
    ~SC035::Send, {U+0336}
    ~+SC035::Send, {U+0336}
    ~SC037::Send, {U+0336}
    ~SC04a::Send, {U+0336}
    ~SC04e::Send, {U+0336}
    ~SC053::Send, {U+0336}
}
return


;Underline and Strikethrough Modifiers
#If TNR and modifier = "Bold, Underline, Strikethrough" and Caps = "Off"
{
    $a::Send, {U+1D41A}{U+0332}{U+0336}
    $b::Send, {U+1D41B}{U+0332}{U+0336}
    $c::Send, {U+1D41C}{U+0332}{U+0336}
    $d::Send, {U+1D41D}{U+0332}{U+0336}
    $e::Send, {U+1D41E}{U+0332}{U+0336}
    $f::Send, {U+1D41F}{U+0332}{U+0336}
    $g::Send, {U+1D420}{U+0336}
    $h::Send, {U+1D421}{U+0332}{U+0336}
    $i::Send, {U+1D422}{U+0332}{U+0336}
    $j::Send, {U+1D423}{U+0336}
    $k::Send, {U+1D424}{U+0332}{U+0336}
    $l::Send, {U+1D425}{U+0332}{U+0336}
    $m::Send, {U+1D426}{U+0332}{U+0336}
    $n::Send, {U+1D427}{U+0332}{U+0336}
    $o::Send, {U+1D428}{U+0332}{U+0336}
    $p::Send, {U+1D429}{U+0336}
    $q::Send, {U+1D42A}{U+0336}
    $r::Send, {U+1D42B}{U+0332}{U+0336}
    $s::Send, {U+1D42C}{U+0332}{U+0336}
    $t::Send, {U+1D42D}{U+0332}{U+0336}
    $u::Send, {U+1D42E}{U+0332}{U+0336}
    $v::Send, {U+1D42F}{U+0332}{U+0336}
    $w::Send, {U+1D430}{U+0332}{U+0336}
    $x::Send, {U+1D431}{U+0332}{U+0336}
    $y::Send, {U+1D432}{U+0336}
    $z::Send, {U+1D433}{U+0332}{U+0336}

    $+a::Send, {U+1D400}{U+0332}{U+0336}
    $+b::Send, {U+1D401}{U+0332}{U+0336}
    $+c::Send, {U+1D402}{U+0332}{U+0336}
    $+d::Send, {U+1D403}{U+0332}{U+0336}
    $+e::Send, {U+1D404}{U+0332}{U+0336}
    $+f::Send, {U+1D405}{U+0332}{U+0336}
    $+g::Send, {U+1D406}{U+0332}{U+0336}
    $+h::Send, {U+1D407}{U+0332}{U+0336}
    $+i::Send, {U+1D408}{U+0332}{U+0336}
    $+j::Send, {U+1D409}{U+0332}{U+0336}
    $+k::Send, {U+1D40A}{U+0332}{U+0336}
    $+l::Send, {U+1D40B}{U+0332}{U+0336}
    $+m::Send, {U+1D40C}{U+0332}{U+0336}
    $+n::Send, {U+1D40D}{U+0332}{U+0336}
    $+o::Send, {U+1D40E}{U+0332}{U+0336}
    $+p::Send, {U+1D40F}{U+0332}{U+0336}
    $+q::Send, {U+1D410}{U+0332}{U+0336}
    $+r::Send, {U+1D411}{U+0332}{U+0336}
    $+s::Send, {U+1D412}{U+0332}{U+0336}
    $+t::Send, {U+1D413}{U+0332}{U+0336}
    $+u::Send, {U+1D414}{U+0332}{U+0336}
    $+v::Send, {U+1D415}{U+0332}{U+0336}
    $+w::Send, {U+1D416}{U+0332}{U+0336}
    $+x::Send, {U+1D417}{U+0332}{U+0336}
    $+y::Send, {U+1D418}{U+0332}{U+0336}
    $+z::Send, {U+1D419}{U+0332}{U+0336}

    $0::Send, {U+1D7CE}{U+0332}{U+0336}
    $1::Send, {U+1D7CF}{U+0332}{U+0336}
    $2::Send, {U+1D7D0}{U+0332}{U+0336}
    $3::Send, {U+1D7D1}{U+0332}{U+0336}
    $4::Send, {U+1D7D2}{U+0332}{U+0336}
    $5::Send, {U+1D7D3}{U+0332}{U+0336}
    $6::Send, {U+1D7D4}{U+0332}{U+0336}
    $7::Send, {U+1D7D5}{U+0332}{U+0336}
    $8::Send, {U+1D7D6}{U+0332}{U+0336}
    $9::Send, {U+1D7D7}{U+0332}{U+0336}

    ~Space::Send, {U+0332}{U+0336}

    ~SC029::Send, {U+0332}{U+0336}
    ~+SC029::Send, {U+0332}{U+0336}
    ~+SC002::Send, {U+0332}{U+0336}
    ~+SC003::Send, {U+0332}{U+0336}
    ~+SC004::Send, {U+0332}{U+0336}
    ~+SC005::Send, {U+0332}{U+0336}
    ~+SC006::Send, {U+0332}{U+0336}
    ~+SC007::Send, {U+0332}{U+0336}
    ~+SC008::Send, {U+0332}{U+0336}
    ~+SC009::Send, {U+0332}{U+0336}
    ~+SC00a::Send, {U+0332}{U+0336}
    ~+SC00b::Send, {U+0332}{U+0336}
    ~SC00c::Send, {U+0332}{U+0336}
    ~+SC00c::Send, {U+0332}{U+0336}
    ~SC00d::Send, {U+0332}{U+0336}
    ~+SC00d::Send, {U+0332}{U+0336}
    ~SC01a::Send, {U+0332}{U+0336}
    ~+SC01a::Send, {U+0332}{U+0336}
    ~SC01b::Send, {U+0332}{U+0336}
    ~+SC01b::Send, {U+0332}{U+0336}
    ~SC027::Send, {U+0332}{U+0336}
    ~+SC027::Send, {U+0332}{U+0336}
    ~SC028::Send, {U+0332}{U+0336}
    ~+SC028::Send, {U+0332}{U+0336}
    ~SC02b::Send, {U+0332}{U+0336}
    ~+SC02b::Send, {U+0332}{U+0336}
    ~SC033::Send, {U+0332}{U+0336}
    ~+SC033::Send, {U+0332}{U+0336}
    ~SC034::Send, {U+0332}{U+0336}
    ~+SC034::Send, {U+0332}{U+0336}
    ~SC035::Send, {U+0332}{U+0336}
    ~+SC035::Send, {U+0332}{U+0336}
    ~SC037::Send, {U+0332}{U+0336}
    ~SC04a::Send, {U+0332}{U+0336}
    ~SC04e::Send, {U+0332}{U+0336}
    ~SC053::Send, {U+0332}{U+0336}
}
return

#If TNR and modifier = "Bold, Underline, Strikethrough" and Caps = "On"
{
    $a::Send, {U+1D400}{U+0332}{U+0336}
    $b::Send, {U+1D401}{U+0332}{U+0336}
    $c::Send, {U+1D402}{U+0332}{U+0336}
    $d::Send, {U+1D403}{U+0332}{U+0336}
    $e::Send, {U+1D404}{U+0332}{U+0336}
    $f::Send, {U+1D405}{U+0332}{U+0336}
    $g::Send, {U+1D406}{U+0332}{U+0336}
    $h::Send, {U+1D407}{U+0332}{U+0336}
    $i::Send, {U+1D408}{U+0332}{U+0336}
    $j::Send, {U+1D409}{U+0332}{U+0336}
    $k::Send, {U+1D40A}{U+0332}{U+0336}
    $l::Send, {U+1D40B}{U+0332}{U+0336}
    $m::Send, {U+1D40C}{U+0332}{U+0336}
    $n::Send, {U+1D40D}{U+0332}{U+0336}
    $o::Send, {U+1D40E}{U+0332}{U+0336}
    $p::Send, {U+1D40F}{U+0332}{U+0336}
    $q::Send, {U+1D410}{U+0332}{U+0336}
    $r::Send, {U+1D411}{U+0332}{U+0336}
    $s::Send, {U+1D412}{U+0332}{U+0336}
    $t::Send, {U+1D413}{U+0332}{U+0336}
    $u::Send, {U+1D414}{U+0332}{U+0336}
    $v::Send, {U+1D415}{U+0332}{U+0336}
    $w::Send, {U+1D416}{U+0332}{U+0336}
    $x::Send, {U+1D417}{U+0332}{U+0336}
    $y::Send, {U+1D418}{U+0332}{U+0336}
    $z::Send, {U+1D419}{U+0332}{U+0336}

    $+a::Send, {U+1D41A}{U+0332}{U+0336}
    $+b::Send, {U+1D41B}{U+0332}{U+0336}
    $+c::Send, {U+1D41C}{U+0332}{U+0336}
    $+d::Send, {U+1D41D}{U+0332}{U+0336}
    $+e::Send, {U+1D41E}{U+0332}{U+0336}
    $+f::Send, {U+1D41F}{U+0332}{U+0336}
    $+g::Send, {U+1D420}{U+0336}
    $+h::Send, {U+1D421}{U+0332}{U+0336}
    $+i::Send, {U+1D422}{U+0332}{U+0336}
    $+j::Send, {U+1D423}{U+0336}
    $+k::Send, {U+1D424}{U+0332}{U+0336}
    $+l::Send, {U+1D425}{U+0332}{U+0336}
    $+m::Send, {U+1D426}{U+0332}{U+0336}
    $+n::Send, {U+1D427}{U+0332}{U+0336}
    $+o::Send, {U+1D428}{U+0332}{U+0336}
    $+p::Send, {U+1D429}{U+0336}
    $+q::Send, {U+1D42A}{U+0336}
    $+r::Send, {U+1D42B}{U+0332}{U+0336}
    $+s::Send, {U+1D42C}{U+0332}{U+0336}
    $+t::Send, {U+1D42D}{U+0332}{U+0336}
    $+u::Send, {U+1D42E}{U+0332}{U+0336}
    $+v::Send, {U+1D42F}{U+0332}{U+0336}
    $+w::Send, {U+1D430}{U+0332}{U+0336}
    $+x::Send, {U+1D431}{U+0332}{U+0336}
    $+y::Send, {U+1D432}{U+0336}
    $+z::Send, {U+1D433}{U+0332}{U+0336}

    $0::Send, {U+1D7CE}{U+0332}{U+0336}
    $1::Send, {U+1D7CF}{U+0332}{U+0336}
    $2::Send, {U+1D7D0}{U+0332}{U+0336}
    $3::Send, {U+1D7D1}{U+0332}{U+0336}
    $4::Send, {U+1D7D2}{U+0332}{U+0336}
    $5::Send, {U+1D7D3}{U+0332}{U+0336}
    $6::Send, {U+1D7D4}{U+0332}{U+0336}
    $7::Send, {U+1D7D5}{U+0332}{U+0336}
    $8::Send, {U+1D7D6}{U+0332}{U+0336}
    $9::Send, {U+1D7D7}{U+0332}{U+0336}

    ~Space::Send, {U+0332}{U+0336}

    ~SC029::Send, {U+0332}{U+0336}
    ~+SC029::Send, {U+0332}{U+0336}
    ~+SC002::Send, {U+0332}{U+0336}
    ~+SC003::Send, {U+0332}{U+0336}
    ~+SC004::Send, {U+0332}{U+0336}
    ~+SC005::Send, {U+0332}{U+0336}
    ~+SC006::Send, {U+0332}{U+0336}
    ~+SC007::Send, {U+0332}{U+0336}
    ~+SC008::Send, {U+0332}{U+0336}
    ~+SC009::Send, {U+0332}{U+0336}
    ~+SC00a::Send, {U+0332}{U+0336}
    ~+SC00b::Send, {U+0332}{U+0336}
    ~SC00c::Send, {U+0332}{U+0336}
    ~+SC00c::Send, {U+0332}{U+0336}
    ~SC00d::Send, {U+0332}{U+0336}
    ~+SC00d::Send, {U+0332}{U+0336}
    ~SC01a::Send, {U+0332}{U+0336}
    ~+SC01a::Send, {U+0332}{U+0336}
    ~SC01b::Send, {U+0332}{U+0336}
    ~+SC01b::Send, {U+0332}{U+0336}
    ~SC027::Send, {U+0332}{U+0336}
    ~+SC027::Send, {U+0332}{U+0336}
    ~SC028::Send, {U+0332}{U+0336}
    ~+SC028::Send, {U+0332}{U+0336}
    ~SC02b::Send, {U+0332}{U+0336}
    ~+SC02b::Send, {U+0332}{U+0336}
    ~SC033::Send, {U+0332}{U+0336}
    ~+SC033::Send, {U+0332}{U+0336}
    ~SC034::Send, {U+0332}{U+0336}
    ~+SC034::Send, {U+0332}{U+0336}
    ~SC035::Send, {U+0332}{U+0336}
    ~+SC035::Send, {U+0332}{U+0336}
    ~SC037::Send, {U+0332}{U+0336}
    ~SC04a::Send, {U+0332}{U+0336}
    ~SC04e::Send, {U+0332}{U+0336}
    ~SC053::Send, {U+0332}{U+0336}
}
return

#If TNR and modifier = "Italics, Underline, Strikethrough" and Caps = "Off"
{
    $a::Send, {U+1D44E}{U+0332}{U+0336}
    $b::Send, {U+1D44F}{U+0332}{U+0336}
    $c::Send, {U+1D450}{U+0332}{U+0336}
    $d::Send, {U+1D451}{U+0332}{U+0336}
    $e::Send, {U+1D452}{U+0332}{U+0336}
    $f::Send, {U+1D453}{U+0332}{U+0336}
    $g::Send, {U+1D454}{U+0336}
    $h::Send, {U+210E}{U+0332}{U+0336}
    $i::Send, {U+1D456}{U+0332}{U+0336}
    $j::Send, {U+1D457}{U+0336}
    $k::Send, {U+1D458}{U+0332}{U+0336}
    $l::Send, {U+1D459}{U+0332}{U+0336}
    $m::Send, {U+1D45A}{U+0332}{U+0336}
    $n::Send, {U+1D45B}{U+0332}{U+0336}
    $o::Send, {U+1D45C}{U+0332}{U+0336}
    $p::Send, {U+1D45D}{U+0336}
    $q::Send, {U+1D45E}{U+0336}
    $r::Send, {U+1D45F}{U+0332}{U+0336}
    $s::Send, {U+1D460}{U+0332}{U+0336}
    $t::Send, {U+1D461}{U+0332}{U+0336}
    $u::Send, {U+1D462}{U+0332}{U+0336}
    $v::Send, {U+1D463}{U+0332}{U+0336}
    $w::Send, {U+1D464}{U+0332}{U+0336}
    $x::Send, {U+1D465}{U+0332}{U+0336}
    $y::Send, {U+1D466}{U+0336}
    $z::Send, {U+1D467}{U+0332}{U+0336}

    $+a::Send, {U+1D434}{U+0332}{U+0336}
    $+b::Send, {U+1D435}{U+0332}{U+0336}
    $+c::Send, {U+1D436}{U+0332}{U+0336}
    $+d::Send, {U+1D437}{U+0332}{U+0336}
    $+e::Send, {U+1D438}{U+0332}{U+0336}
    $+f::Send, {U+1D439}{U+0332}{U+0336}
    $+g::Send, {U+1D43A}{U+0332}{U+0336}
    $+h::Send, {U+1D43B}{U+0332}{U+0336}
    $+i::Send, {U+1D43C}{U+0332}{U+0336}
    $+j::Send, {U+1D43D}{U+0332}{U+0336}
    $+k::Send, {U+1D43E}{U+0332}{U+0336}
    $+l::Send, {U+1D43F}{U+0332}{U+0336}
    $+m::Send, {U+1D440}{U+0332}{U+0336}
    $+n::Send, {U+1D441}{U+0332}{U+0336}
    $+o::Send, {U+1D442}{U+0332}{U+0336}
    $+p::Send, {U+1D443}{U+0332}{U+0336}
    $+q::Send, {U+1D444}{U+0332}{U+0336}
    $+r::Send, {U+1D445}{U+0332}{U+0336}
    $+s::Send, {U+1D446}{U+0332}{U+0336}
    $+t::Send, {U+1D447}{U+0332}{U+0336}
    $+u::Send, {U+1D448}{U+0332}{U+0336}
    $+v::Send, {U+1D449}{U+0332}{U+0336}
    $+w::Send, {U+1D44A}{U+0332}{U+0336}
    $+x::Send, {U+1D44B}{U+0332}{U+0336}
    $+y::Send, {U+1D44C}{U+0332}{U+0336}
    $+z::Send, {U+1D44D}{U+0332}{U+0336}

    ~Space::Send, {U+0332}{U+0336}

    ~SC029::Send, {U+0332}{U+0336}
    ~+SC029::Send, {U+0332}{U+0336}
    ~+SC002::Send, {U+0332}{U+0336}
    ~+SC003::Send, {U+0332}{U+0336}
    ~+SC004::Send, {U+0332}{U+0336}
    ~+SC005::Send, {U+0332}{U+0336}
    ~+SC006::Send, {U+0332}{U+0336}
    ~+SC007::Send, {U+0332}{U+0336}
    ~+SC008::Send, {U+0332}{U+0336}
    ~+SC009::Send, {U+0332}{U+0336}
    ~+SC00a::Send, {U+0332}{U+0336}
    ~+SC00b::Send, {U+0332}{U+0336}
    ~SC00c::Send, {U+0332}{U+0336}
    ~+SC00c::Send, {U+0332}{U+0336}
    ~SC00d::Send, {U+0332}{U+0336}
    ~+SC00d::Send, {U+0332}{U+0336}
    ~SC01a::Send, {U+0332}{U+0336}
    ~+SC01a::Send, {U+0332}{U+0336}
    ~SC01b::Send, {U+0332}{U+0336}
    ~+SC01b::Send, {U+0332}{U+0336}
    ~SC027::Send, {U+0332}{U+0336}
    ~+SC027::Send, {U+0332}{U+0336}
    ~SC028::Send, {U+0332}{U+0336}
    ~+SC028::Send, {U+0332}{U+0336}
    ~SC02b::Send, {U+0332}{U+0336}
    ~+SC02b::Send, {U+0332}{U+0336}
    ~SC033::Send, {U+0332}{U+0336}
    ~+SC033::Send, {U+0332}{U+0336}
    ~SC034::Send, {U+0332}{U+0336}
    ~+SC034::Send, {U+0332}{U+0336}
    ~SC035::Send, {U+0332}{U+0336}
    ~+SC035::Send, {U+0332}{U+0336}
    ~SC037::Send, {U+0332}{U+0336}
    ~SC04a::Send, {U+0332}{U+0336}
    ~SC04e::Send, {U+0332}{U+0336}
    ~SC053::Send, {U+0332}{U+0336}
}
return

#If TNR and modifier = "Italics, Underline, Strikethrough" and Caps = "On"
{
    $a::Send, {U+1D434}{U+0332}{U+0336}
    $b::Send, {U+1D435}{U+0332}{U+0336}
    $c::Send, {U+1D436}{U+0332}{U+0336}
    $d::Send, {U+1D437}{U+0332}{U+0336}
    $e::Send, {U+1D438}{U+0332}{U+0336}
    $f::Send, {U+1D439}{U+0332}{U+0336}
    $g::Send, {U+1D43A}{U+0332}{U+0336}
    $h::Send, {U+1D43B}{U+0332}{U+0336}
    $i::Send, {U+1D43C}{U+0332}{U+0336}
    $j::Send, {U+1D43D}{U+0332}{U+0336}
    $k::Send, {U+1D43E}{U+0332}{U+0336}
    $l::Send, {U+1D43F}{U+0332}{U+0336}
    $m::Send, {U+1D440}{U+0332}{U+0336}
    $n::Send, {U+1D441}{U+0332}{U+0336}
    $o::Send, {U+1D442}{U+0332}{U+0336}
    $p::Send, {U+1D443}{U+0332}{U+0336}
    $q::Send, {U+1D444}{U+0332}{U+0336}
    $r::Send, {U+1D445}{U+0332}{U+0336}
    $s::Send, {U+1D446}{U+0332}{U+0336}
    $t::Send, {U+1D447}{U+0332}{U+0336}
    $u::Send, {U+1D448}{U+0332}{U+0336}
    $v::Send, {U+1D449}{U+0332}{U+0336}
    $w::Send, {U+1D44A}{U+0332}{U+0336}
    $x::Send, {U+1D44B}{U+0332}{U+0336}
    $y::Send, {U+1D44C}{U+0332}{U+0336}
    $z::Send, {U+1D44D}{U+0332}{U+0336}

    $+a::Send, {U+1D44E}{U+0332}{U+0336}
    $+b::Send, {U+1D44F}{U+0332}{U+0336}
    $+c::Send, {U+1D450}{U+0332}{U+0336}
    $+d::Send, {U+1D451}{U+0332}{U+0336}
    $+e::Send, {U+1D452}{U+0332}{U+0336}
    $+f::Send, {U+1D453}{U+0332}{U+0336}
    $+g::Send, {U+1D454}{U+0336}
    $+h::Send, {U+210E}{U+0332}{U+0336}
    $+i::Send, {U+1D456}{U+0332}{U+0336}
    $+j::Send, {U+1D457}{U+0336}
    $+k::Send, {U+1D458}{U+0332}{U+0336}
    $+l::Send, {U+1D459}{U+0332}{U+0336}
    $+m::Send, {U+1D45A}{U+0332}{U+0336}
    $+n::Send, {U+1D45B}{U+0332}{U+0336}
    $+o::Send, {U+1D45C}{U+0332}{U+0336}
    $+p::Send, {U+1D45D}{U+0336}
    $+q::Send, {U+1D45E}{U+0336}
    $+r::Send, {U+1D45F}{U+0332}{U+0336}
    $+s::Send, {U+1D460}{U+0332}{U+0336}
    $+t::Send, {U+1D461}{U+0332}{U+0336}
    $+u::Send, {U+1D462}{U+0332}{U+0336}
    $+v::Send, {U+1D463}{U+0332}{U+0336}
    $+w::Send, {U+1D464}{U+0332}{U+0336}
    $+x::Send, {U+1D465}{U+0332}{U+0336}
    $+y::Send, {U+1D466}{U+0336}
    $+z::Send, {U+1D467}{U+0332}{U+0336}

    ~Space::Send, {U+0332}{U+0336}

    ~SC029::Send, {U+0332}{U+0336}
    ~+SC029::Send, {U+0332}{U+0336}
    ~+SC002::Send, {U+0332}{U+0336}
    ~+SC003::Send, {U+0332}{U+0336}
    ~+SC004::Send, {U+0332}{U+0336}
    ~+SC005::Send, {U+0332}{U+0336}
    ~+SC006::Send, {U+0332}{U+0336}
    ~+SC007::Send, {U+0332}{U+0336}
    ~+SC008::Send, {U+0332}{U+0336}
    ~+SC009::Send, {U+0332}{U+0336}
    ~+SC00a::Send, {U+0332}{U+0336}
    ~+SC00b::Send, {U+0332}{U+0336}
    ~SC00c::Send, {U+0332}{U+0336}
    ~+SC00c::Send, {U+0332}{U+0336}
    ~SC00d::Send, {U+0332}{U+0336}
    ~+SC00d::Send, {U+0332}{U+0336}
    ~SC01a::Send, {U+0332}{U+0336}
    ~+SC01a::Send, {U+0332}{U+0336}
    ~SC01b::Send, {U+0332}{U+0336}
    ~+SC01b::Send, {U+0332}{U+0336}
    ~SC027::Send, {U+0332}{U+0336}
    ~+SC027::Send, {U+0332}{U+0336}
    ~SC028::Send, {U+0332}{U+0336}
    ~+SC028::Send, {U+0332}{U+0336}
    ~SC02b::Send, {U+0332}{U+0336}
    ~+SC02b::Send, {U+0332}{U+0336}
    ~SC033::Send, {U+0332}{U+0336}
    ~+SC033::Send, {U+0332}{U+0336}
    ~SC034::Send, {U+0332}{U+0336}
    ~+SC034::Send, {U+0332}{U+0336}
    ~SC035::Send, {U+0332}{U+0336}
    ~+SC035::Send, {U+0332}{U+0336}
    ~SC037::Send, {U+0332}{U+0336}
    ~SC04a::Send, {U+0332}{U+0336}
    ~SC04e::Send, {U+0332}{U+0336}
    ~SC053::Send, {U+0332}{U+0336}
}
return

#If TNR and modifier = "Bold, Italics, Underline, Strikethrough" and Caps = "Off"
{
    $a::Send, {U+1D482}{U+0332}{U+0336}
    $b::Send, {U+1D483}{U+0332}{U+0336}
    $c::Send, {U+1D484}{U+0332}{U+0336}
    $d::Send, {U+1D485}{U+0332}{U+0336}
    $e::Send, {U+1D486}{U+0332}{U+0336}
    $f::Send, {U+1D487}{U+0332}{U+0336}
    $g::Send, {U+1D488}{U+0336}
    $h::Send, {U+1D489}{U+0332}{U+0336}
    $i::Send, {U+1D48A}{U+0332}{U+0336}
    $j::Send, {U+1D482}{U+0336}
    $k::Send, {U+1D48C}{U+0332}{U+0336}
    $l::Send, {U+1D48D}{U+0332}{U+0336}
    $m::Send, {U+1D48E}{U+0332}{U+0336}
    $n::Send, {U+1D48F}{U+0332}{U+0336}
    $o::Send, {U+1D490}{U+0332}{U+0336}
    $p::Send, {U+1D491}{U+0336}
    $q::Send, {U+1D492}{U+0336}
    $r::Send, {U+1D493}{U+0332}{U+0336}
    $s::Send, {U+1D494}{U+0332}{U+0336}
    $t::Send, {U+1D495}{U+0332}{U+0336}
    $u::Send, {U+1D496}{U+0332}{U+0336}
    $v::Send, {U+1D497}{U+0332}{U+0336}
    $w::Send, {U+1D498}{U+0332}{U+0336}
    $x::Send, {U+1D499}{U+0332}{U+0336}
    $y::Send, {U+1D49A}{U+0336}
    $z::Send, {U+1D49B}{U+0332}{U+0336}

    $+a::Send, {U+1D468}{U+0332}{U+0336}
    $+b::Send, {U+1D469}{U+0332}{U+0336}
    $+c::Send, {U+1D46A}{U+0332}{U+0336}
    $+d::Send, {U+1D46B}{U+0332}{U+0336}
    $+e::Send, {U+1D46C}{U+0332}{U+0336}
    $+f::Send, {U+1D46D}{U+0332}{U+0336}
    $+g::Send, {U+1D46E}{U+0332}{U+0336}
    $+h::Send, {U+1D46F}{U+0332}{U+0336}
    $+i::Send, {U+1D470}{U+0332}{U+0336}
    $+j::Send, {U+1D471}{U+0332}{U+0336}
    $+k::Send, {U+1D472}{U+0332}{U+0336}
    $+l::Send, {U+1D473}{U+0332}{U+0336}
    $+m::Send, {U+1D474}{U+0332}{U+0336}
    $+n::Send, {U+1D475}{U+0332}{U+0336}
    $+o::Send, {U+1D476}{U+0332}{U+0336}
    $+p::Send, {U+1D477}{U+0332}{U+0336}
    $+q::Send, {U+1D478}{U+0332}{U+0336}
    $+r::Send, {U+1D479}{U+0332}{U+0336}
    $+s::Send, {U+1D47A}{U+0332}{U+0336}
    $+t::Send, {U+1D47B}{U+0332}{U+0336}
    $+u::Send, {U+1D47C}{U+0332}{U+0336}
    $+v::Send, {U+1D47D}{U+0332}{U+0336}
    $+w::Send, {U+1D47E}{U+0332}{U+0336}
    $+x::Send, {U+1D47F}{U+0332}{U+0336}
    $+y::Send, {U+1D480}{U+0332}{U+0336}
    $+z::Send, {U+1D481}{U+0332}{U+0336}

    $0::Send, {U+1D7CE}{U+0332}{U+0336}
    $1::Send, {U+1D7CF}{U+0332}{U+0336}
    $2::Send, {U+1D7D0}{U+0332}{U+0336}
    $3::Send, {U+1D7D1}{U+0332}{U+0336}
    $4::Send, {U+1D7D2}{U+0332}{U+0336}
    $5::Send, {U+1D7D3}{U+0332}{U+0336}
    $6::Send, {U+1D7D4}{U+0332}{U+0336}
    $7::Send, {U+1D7D5}{U+0332}{U+0336}
    $8::Send, {U+1D7D6}{U+0332}{U+0336}
    $9::Send, {U+1D7D7}{U+0332}{U+0336}

    ~Space::Send, {U+0332}{U+0336}

    ~SC029::Send, {U+0332}{U+0336}
    ~+SC029::Send, {U+0332}{U+0336}
    ~+SC002::Send, {U+0332}{U+0336}
    ~+SC003::Send, {U+0332}{U+0336}
    ~+SC004::Send, {U+0332}{U+0336}
    ~+SC005::Send, {U+0332}{U+0336}
    ~+SC006::Send, {U+0332}{U+0336}
    ~+SC007::Send, {U+0332}{U+0336}
    ~+SC008::Send, {U+0332}{U+0336}
    ~+SC009::Send, {U+0332}{U+0336}
    ~+SC00a::Send, {U+0332}{U+0336}
    ~+SC00b::Send, {U+0332}{U+0336}
    ~SC00c::Send, {U+0332}{U+0336}
    ~+SC00c::Send, {U+0332}{U+0336}
    ~SC00d::Send, {U+0332}{U+0336}
    ~+SC00d::Send, {U+0332}{U+0336}
    ~SC01a::Send, {U+0332}{U+0336}
    ~+SC01a::Send, {U+0332}{U+0336}
    ~SC01b::Send, {U+0332}{U+0336}
    ~+SC01b::Send, {U+0332}{U+0336}
    ~SC027::Send, {U+0332}{U+0336}
    ~+SC027::Send, {U+0332}{U+0336}
    ~SC028::Send, {U+0332}{U+0336}
    ~+SC028::Send, {U+0332}{U+0336}
    ~SC02b::Send, {U+0332}{U+0336}
    ~+SC02b::Send, {U+0332}{U+0336}
    ~SC033::Send, {U+0332}{U+0336}
    ~+SC033::Send, {U+0332}{U+0336}
    ~SC034::Send, {U+0332}{U+0336}
    ~+SC034::Send, {U+0332}{U+0336}
    ~SC035::Send, {U+0332}{U+0336}
    ~+SC035::Send, {U+0332}{U+0336}
    ~SC037::Send, {U+0332}{U+0336}
    ~SC04a::Send, {U+0332}{U+0336}
    ~SC04e::Send, {U+0332}{U+0336}
    ~SC053::Send, {U+0332}{U+0336}
}
return

#If TNR and modifier = "Bold, Italics, Underline, Strikethrough" and Caps = "On"
{
    $a::Send, {U+1D482}{U+0332}{U+0336}
    $b::Send, {U+1D483}{U+0332}{U+0336}
    $c::Send, {U+1D484}{U+0332}{U+0336}
    $d::Send, {U+1D485}{U+0332}{U+0336}
    $e::Send, {U+1D486}{U+0332}{U+0336}
    $f::Send, {U+1D487}{U+0332}{U+0336}
    $g::Send, {U+1D488}{U+0332}{U+0336}
    $h::Send, {U+1D489}{U+0332}{U+0336}
    $i::Send, {U+1D48A}{U+0332}{U+0336}
    $j::Send, {U+1D482}{U+0332}{U+0336}
    $k::Send, {U+1D48C}{U+0332}{U+0336}
    $l::Send, {U+1D48D}{U+0332}{U+0336}
    $m::Send, {U+1D48E}{U+0332}{U+0336}
    $n::Send, {U+1D48F}{U+0332}{U+0336}
    $o::Send, {U+1D490}{U+0332}{U+0336}
    $p::Send, {U+1D491}{U+0332}{U+0336}
    $q::Send, {U+1D492}{U+0332}{U+0336}
    $r::Send, {U+1D493}{U+0332}{U+0336}
    $s::Send, {U+1D494}{U+0332}{U+0336}
    $t::Send, {U+1D495}{U+0332}{U+0336}
    $u::Send, {U+1D496}{U+0332}{U+0336}
    $v::Send, {U+1D497}{U+0332}{U+0336}
    $w::Send, {U+1D498}{U+0332}{U+0336}
    $x::Send, {U+1D499}{U+0332}{U+0336}
    $y::Send, {U+1D49A}{U+0332}{U+0336}
    $z::Send, {U+1D49B}{U+0332}{U+0336}

    $+a::Send, {U+1D468}{U+0332}{U+0336}
    $+b::Send, {U+1D469}{U+0332}{U+0336}
    $+c::Send, {U+1D46A}{U+0332}{U+0336}
    $+d::Send, {U+1D46B}{U+0332}{U+0336}
    $+e::Send, {U+1D46C}{U+0332}{U+0336}
    $+f::Send, {U+1D46D}{U+0332}{U+0336}
    $+g::Send, {U+1D46E}{U+0336}
    $+h::Send, {U+1D46F}{U+0332}{U+0336}
    $+i::Send, {U+1D470}{U+0332}{U+0336}
    $+j::Send, {U+1D471}{U+0336}
    $+k::Send, {U+1D472}{U+0332}{U+0336}
    $+l::Send, {U+1D473}{U+0332}{U+0336}
    $+m::Send, {U+1D474}{U+0332}{U+0336}
    $+n::Send, {U+1D475}{U+0332}{U+0336}
    $+o::Send, {U+1D476}{U+0332}{U+0336}
    $+p::Send, {U+1D477}{U+0336}
    $+q::Send, {U+1D478}{U+0336}
    $+r::Send, {U+1D479}{U+0332}{U+0336}
    $+s::Send, {U+1D47A}{U+0332}{U+0336}
    $+t::Send, {U+1D47B}{U+0332}{U+0336}
    $+u::Send, {U+1D47C}{U+0332}{U+0336}
    $+v::Send, {U+1D47D}{U+0332}{U+0336}
    $+w::Send, {U+1D47E}{U+0332}{U+0336}
    $+x::Send, {U+1D47F}{U+0332}{U+0336}
    $+y::Send, {U+1D480}{U+0336}
    $+z::Send, {U+1D481}{U+0332}{U+0336}

    $0::Send, {U+1D7CE}{U+0332}{U+0336}
    $1::Send, {U+1D7CF}{U+0332}{U+0336}
    $2::Send, {U+1D7D0}{U+0332}{U+0336}
    $3::Send, {U+1D7D1}{U+0332}{U+0336}
    $4::Send, {U+1D7D2}{U+0332}{U+0336}
    $5::Send, {U+1D7D3}{U+0332}{U+0336}
    $6::Send, {U+1D7D4}{U+0332}{U+0336}
    $7::Send, {U+1D7D5}{U+0332}{U+0336}
    $8::Send, {U+1D7D6}{U+0332}{U+0336}
    $9::Send, {U+1D7D7}{U+0332}{U+0336}

    ~Space::Send, {U+0332}{U+0336}

    ~SC029::Send, {U+0332}{U+0336}
    ~+SC029::Send, {U+0332}{U+0336}
    ~+SC002::Send, {U+0332}{U+0336}
    ~+SC003::Send, {U+0332}{U+0336}
    ~+SC004::Send, {U+0332}{U+0336}
    ~+SC005::Send, {U+0332}{U+0336}
    ~+SC006::Send, {U+0332}{U+0336}
    ~+SC007::Send, {U+0332}{U+0336}
    ~+SC008::Send, {U+0332}{U+0336}
    ~+SC009::Send, {U+0332}{U+0336}
    ~+SC00a::Send, {U+0332}{U+0336}
    ~+SC00b::Send, {U+0332}{U+0336}
    ~SC00c::Send, {U+0332}{U+0336}
    ~+SC00c::Send, {U+0332}{U+0336}
    ~SC00d::Send, {U+0332}{U+0336}
    ~+SC00d::Send, {U+0332}{U+0336}
    ~SC01a::Send, {U+0332}{U+0336}
    ~+SC01a::Send, {U+0332}{U+0336}
    ~SC01b::Send, {U+0332}{U+0336}
    ~+SC01b::Send, {U+0332}{U+0336}
    ~SC027::Send, {U+0332}{U+0336}
    ~+SC027::Send, {U+0332}{U+0336}
    ~SC028::Send, {U+0332}{U+0336}
    ~+SC028::Send, {U+0332}{U+0336}
    ~SC02b::Send, {U+0332}{U+0336}
    ~+SC02b::Send, {U+0332}{U+0336}
    ~SC033::Send, {U+0332}{U+0336}
    ~+SC033::Send, {U+0332}{U+0336}
    ~SC034::Send, {U+0332}{U+0336}
    ~+SC034::Send, {U+0332}{U+0336}
    ~SC035::Send, {U+0332}{U+0336}
    ~+SC035::Send, {U+0332}{U+0336}
    ~SC037::Send, {U+0332}{U+0336}
    ~SC04a::Send, {U+0332}{U+0336}
    ~SC04e::Send, {U+0332}{U+0336}
    ~SC053::Send, {U+0332}{U+0336}
}
return


;------------------------------------------------------------------------------------------------;

; Cursive Font

;------------------------------------------------------------------------------------------------;

;Original Modifiers
#If Cursive and modifier = "Italics" and Caps = "Off"
{
    $a::Send, {U+1D4B6}
    $b::Send, {U+1D4B7}
    $c::Send, {U+1D4B8}
    $d::Send, {U+1D4B9}
    $e::Send, {U+1D452}
    $f::Send, {U+1D4BB}
    $g::Send, {U+1D454}
    $h::Send, {U+1D4BD}
    $i::Send, {U+1D4BE}
    $j::Send, {U+1D4BF}
    $k::Send, {U+1D4C0}
    $l::Send, {U+1D4C1}
    $m::Send, {U+1D4C2}
    $n::Send, {U+1D4C3}
    $o::Send, {U+1D45C}
    $p::Send, {U+1D4C5}
    $q::Send, {U+1D4C6}
    $r::Send, {U+1D4C7}
    $s::Send, {U+1D4C8}
    $t::Send, {U+1D4C9}
    $u::Send, {U+1D4CA}
    $v::Send, {U+1D4CB}
    $w::Send, {U+1D4CC}
    $x::Send, {U+1D4CD}
    $y::Send, {U+1D4CE}
    $z::Send, {U+1D4CF}

    $+a::Send, {U+1D49C}
    $+b::Send, {U+212C}
    $+c::Send, {U+1D49E}
    $+d::Send, {U+1D49F}
    $+e::Send, {U+2130}
    $+f::Send, {U+2131}
    $+g::Send, {U+1D4A2}
    $+h::Send, {U+210B}
    $+i::Send, {U+2110}
    $+j::Send, {U+1D4A5}
    $+k::Send, {U+1D4A6}
    $+l::Send, {U+2112}
    $+m::Send, {U+2133}
    $+n::Send, {U+1D4A9}
    $+o::Send, {U+1D4AA}
    $+p::Send, {U+1D4AB}
    $+q::Send, {U+1D4AC}
    $+r::Send, {U+211B}
    $+s::Send, {U+1D4AE}
    $+t::Send, {U+1D4AF}
    $+u::Send, {U+1D4B0}
    $+v::Send, {U+1D4B1}
    $+w::Send, {U+1D4B2}
    $+x::Send, {U+1D4B3}
    $+y::Send, {U+1D4B4}
    $+z::Send, {U+1D4B5}
}
return

#If Cursive and modifier = "Italics" and Caps = "On"
{
    $a::Send, {U+1D49C}
    $b::Send, {U+212C}
    $c::Send, {U+1D49E}
    $d::Send, {U+1D49F}
    $e::Send, {U+2130}
    $f::Send, {U+2131}
    $g::Send, {U+1D4A2}
    $h::Send, {U+210B}
    $i::Send, {U+2110}
    $j::Send, {U+1D4A5}
    $k::Send, {U+1D4A6}
    $l::Send, {U+2112}
    $m::Send, {U+2133}
    $n::Send, {U+1D4A9}
    $o::Send, {U+1D4AA}
    $p::Send, {U+1D4AB}
    $q::Send, {U+1D4AC}
    $r::Send, {U+211B}
    $s::Send, {U+1D4AE}
    $t::Send, {U+1D4AF}
    $u::Send, {U+1D4B0}
    $v::Send, {U+1D4B1}
    $w::Send, {U+1D4B2}
    $x::Send, {U+1D4B3}
    $y::Send, {U+1D4B4}
    $z::Send, {U+1D4B5}

    $+a::Send, {U+1D4B6}
    $+b::Send, {U+1D4B7}
    $+c::Send, {U+1D4B8}
    $+d::Send, {U+1D4B9}
    $+e::Send, {U+1D452}
    $+f::Send, {U+1D4BB}
    $+g::Send, {U+1D454}
    $+h::Send, {U+1D4BD}
    $+i::Send, {U+1D4BE}
    $+j::Send, {U+1D4BF}
    $+k::Send, {U+1D4C0}
    $+l::Send, {U+1D4C1}
    $+m::Send, {U+1D4C2}
    $+n::Send, {U+1D4C3}
    $+o::Send, {U+1D45C}
    $+p::Send, {U+1D4C5}
    $+q::Send, {U+1D4C6}
    $+r::Send, {U+1D4C7}
    $+s::Send, {U+1D4C8}
    $+t::Send, {U+1D4C9}
    $+u::Send, {U+1D4CA}
    $+v::Send, {U+1D4CB}
    $+w::Send, {U+1D4CC}
    $+x::Send, {U+1D4CD}
    $+y::Send, {U+1D4CE}
    $+z::Send, {U+1D4CF}
}
return

#If Cursive and modifier = "Bold, Italics" and Caps = "Off"
{
    $a::Send, {U+1D4EA}
    $b::Send, {U+1D4EB}
    $c::Send, {U+1D4EC}
    $d::Send, {U+1D4ED}
    $e::Send, {U+1D4EE}
    $f::Send, {U+1D4EF}
    $g::Send, {U+1D4F0}
    $h::Send, {U+1D4F1}
    $i::Send, {U+1D4F2}
    $j::Send, {U+1D4F3}
    $k::Send, {U+1D4F4}
    $l::Send, {U+1D4F5}
    $m::Send, {U+1D4F6}
    $n::Send, {U+1D4F7}
    $o::Send, {U+1D4F8}
    $p::Send, {U+1D4F9}
    $q::Send, {U+1D4FA}
    $r::Send, {U+1D4FB}
    $s::Send, {U+1D4FC}
    $t::Send, {U+1D4FD}
    $u::Send, {U+1D4FE}
    $v::Send, {U+1D4FF}
    $w::Send, {U+1D500}
    $x::Send, {U+1D501}
    $y::Send, {U+1D502}
    $z::Send, {U+1D503}

    $+a::Send, {U+1D4D0}
    $+b::Send, {U+1D4D1}
    $+c::Send, {U+1D4D2}
    $+d::Send, {U+1D4D3}
    $+e::Send, {U+1D4D4}
    $+f::Send, {U+1D4D5}
    $+g::Send, {U+1D4D6}
    $+h::Send, {U+1D4D7}
    $+i::Send, {U+1D4D8}
    $+j::Send, {U+1D4D9}
    $+k::Send, {U+1D4DA}
    $+l::Send, {U+1D4DB}
    $+m::Send, {U+1D4DC}
    $+n::Send, {U+1D4DD}
    $+o::Send, {U+1D4DE}
    $+p::Send, {U+1D4DF}
    $+q::Send, {U+1D4E0}
    $+r::Send, {U+1D4E1}
    $+s::Send, {U+1D4E2}
    $+t::Send, {U+1D4E3}
    $+u::Send, {U+1D4E4}
    $+v::Send, {U+1D4E5}
    $+w::Send, {U+1D4E6}
    $+x::Send, {U+1D4E7}
    $+y::Send, {U+1D4E8}
    $+z::Send, {U+1D4E9}
}
return

#If Cursive and modifier = "Bold, Italics" and Caps = "On"
{
    $a::Send, {U+1D4D0}
    $b::Send, {U+1D4D1}
    $c::Send, {U+1D4D2}
    $d::Send, {U+1D4D3}
    $e::Send, {U+1D4D4}
    $f::Send, {U+1D4D5}
    $g::Send, {U+1D4D6}
    $h::Send, {U+1D4D7}
    $i::Send, {U+1D4D8}
    $j::Send, {U+1D4D9}
    $k::Send, {U+1D4DA}
    $l::Send, {U+1D4DB}
    $m::Send, {U+1D4DC}
    $n::Send, {U+1D4DD}
    $o::Send, {U+1D4DE}
    $p::Send, {U+1D4DF}
    $q::Send, {U+1D4E0}
    $r::Send, {U+1D4E1}
    $s::Send, {U+1D4E2}
    $t::Send, {U+1D4E3}
    $u::Send, {U+1D4E4}
    $v::Send, {U+1D4E5}
    $w::Send, {U+1D4E6}
    $x::Send, {U+1D4E7}
    $y::Send, {U+1D4E8}
    $z::Send, {U+1D4E9}

    $+a::Send, {U+1D4EA}
    $+b::Send, {U+1D4EB}
    $+c::Send, {U+1D4EC}
    $+d::Send, {U+1D4ED}
    $+e::Send, {U+1D4EE}
    $+f::Send, {U+1D4EF}
    $+g::Send, {U+1D4F0}
    $+h::Send, {U+1D4F1}
    $+i::Send, {U+1D4F2}
    $+j::Send, {U+1D4F3}
    $+k::Send, {U+1D4F4}
    $+l::Send, {U+1D4F5}
    $+m::Send, {U+1D4F6}
    $+n::Send, {U+1D4F7}
    $+o::Send, {U+1D4F8}
    $+p::Send, {U+1D4F9}
    $+q::Send, {U+1D4FA}
    $+r::Send, {U+1D4FB}
    $+s::Send, {U+1D4FC}
    $+t::Send, {U+1D4FD}
    $+u::Send, {U+1D4FE}
    $+v::Send, {U+1D4FF}
    $+w::Send, {U+1D500}
    $+x::Send, {U+1D501}
    $+y::Send, {U+1D502}
    $+z::Send, {U+1D503}
}
return


;Underline Modifiers
#If Cursive and modifier = "Italics, Underline" and Caps = "Off"
{
    $a::Send, {U+1D4B6}{U+0332}
    $b::Send, {U+1D4B7}{U+0332}
    $c::Send, {U+1D4B8}{U+0332}
    $d::Send, {U+1D4B9}{U+0332}
    $e::Send, {U+1D452}{U+0332}
    $f::Send, {U+1D4BB}{U+0332}
    $g::Send, {U+1D454}{U+0332}
    $h::Send, {U+1D4BD}{U+0332}
    $i::Send, {U+1D4BE}{U+0332}
    $j::Send, {U+1D4BF}{U+0332}
    $k::Send, {U+1D4C0}{U+0332}
    $l::Send, {U+1D4C1}{U+0332}
    $m::Send, {U+1D4C2}{U+0332}
    $n::Send, {U+1D4C3}{U+0332}
    $o::Send, {U+1D45C}{U+0332}
    $p::Send, {U+1D4C5}{U+0332}
    $q::Send, {U+1D4C6}{U+0332}
    $r::Send, {U+1D4C7}{U+0332}
    $s::Send, {U+1D4C8}{U+0332}
    $t::Send, {U+1D4C9}{U+0332}
    $u::Send, {U+1D4CA}{U+0332}
    $v::Send, {U+1D4CB}{U+0332}
    $w::Send, {U+1D4CC}{U+0332}
    $x::Send, {U+1D4CD}{U+0332}
    $y::Send, {U+1D4CE}{U+0332}
    $z::Send, {U+1D4CF}{U+0332}

    $+a::Send, {U+1D49C}{U+0332}
    $+b::Send, {U+212C}{U+0332}
    $+c::Send, {U+1D49E}{U+0332}
    $+d::Send, {U+1D49F}{U+0332}
    $+e::Send, {U+2130}{U+0332}
    $+f::Send, {U+2131}{U+0332}
    $+g::Send, {U+1D4A2}{U+0332}
    $+h::Send, {U+210B}{U+0332}
    $+i::Send, {U+2110}{U+0332}
    $+j::Send, {U+1D4A5}{U+0332}
    $+k::Send, {U+1D4A6}{U+0332}
    $+l::Send, {U+2112}{U+0332}
    $+m::Send, {U+2133}{U+0332}
    $+n::Send, {U+1D4A9}{U+0332}
    $+o::Send, {U+1D4AA}{U+0332}
    $+p::Send, {U+1D4AB}{U+0332}
    $+q::Send, {U+1D4AC}{U+0332}
    $+r::Send, {U+211B}{U+0332}
    $+s::Send, {U+1D4AE}{U+0332}
    $+t::Send, {U+1D4AF}{U+0332}
    $+u::Send, {U+1D4B0}{U+0332}
    $+v::Send, {U+1D4B1}{U+0332}
    $+w::Send, {U+1D4B2}{U+0332}
    $+x::Send, {U+1D4B3}{U+0332}
    $+y::Send, {U+1D4B4}{U+0332}
    $+z::Send, {U+1D4B5}{U+0332}

    ~Space::Send, {U+0332}

    ~SC029::Send, {U+0332}
    ~+SC029::Send, {U+0332}
    ~+SC002::Send, {U+0332}
    ~+SC003::Send, {U+0332}
    ~+SC004::Send, {U+0332}
    ~+SC005::Send, {U+0332}
    ~+SC006::Send, {U+0332}
    ~+SC007::Send, {U+0332}
    ~+SC008::Send, {U+0332}
    ~+SC009::Send, {U+0332}
    ~+SC00a::Send, {U+0332}
    ~+SC00b::Send, {U+0332}
    ~SC00c::Send, {U+0332}
    ~+SC00c::Send, {U+0332}
    ~SC00d::Send, {U+0332}
    ~+SC00d::Send, {U+0332}
    ~SC01a::Send, {U+0332}
    ~+SC01a::Send, {U+0332}
    ~SC01b::Send, {U+0332}
    ~+SC01b::Send, {U+0332}
    ~SC027::Send, {U+0332}
    ~+SC027::Send, {U+0332}
    ~SC028::Send, {U+0332}
    ~+SC028::Send, {U+0332}
    ~SC02b::Send, {U+0332}
    ~+SC02b::Send, {U+0332}
    ~SC033::Send, {U+0332}
    ~+SC033::Send, {U+0332}
    ~SC034::Send, {U+0332}
    ~+SC034::Send, {U+0332}
    ~SC035::Send, {U+0332}
    ~+SC035::Send, {U+0332}
    ~SC037::Send, {U+0332}
    ~SC04a::Send, {U+0332}
    ~SC04e::Send, {U+0332}
    ~SC053::Send, {U+0332}
}
return

#If Cursive and modifier = "Italics, Underline" and Caps = "On"
{
    $a::Send, {U+1D49C}{U+0332}
    $b::Send, {U+212C}{U+0332}
    $c::Send, {U+1D49E}{U+0332}
    $d::Send, {U+1D49F}{U+0332}
    $e::Send, {U+2130}{U+0332}
    $f::Send, {U+2131}{U+0332}
    $g::Send, {U+1D4A2}{U+0332}
    $h::Send, {U+210B}{U+0332}
    $i::Send, {U+2110}{U+0332}
    $j::Send, {U+1D4A5}{U+0332}
    $k::Send, {U+1D4A6}{U+0332}
    $l::Send, {U+2112}{U+0332}
    $m::Send, {U+2133}{U+0332}
    $n::Send, {U+1D4A9}{U+0332}
    $o::Send, {U+1D4AA}{U+0332}
    $p::Send, {U+1D4AB}{U+0332}
    $q::Send, {U+1D4AC}{U+0332}
    $r::Send, {U+211B}{U+0332}
    $s::Send, {U+1D4AE}{U+0332}
    $t::Send, {U+1D4AF}{U+0332}
    $u::Send, {U+1D4B0}{U+0332}
    $v::Send, {U+1D4B1}{U+0332}
    $w::Send, {U+1D4B2}{U+0332}
    $x::Send, {U+1D4B3}{U+0332}
    $y::Send, {U+1D4B4}{U+0332}
    $z::Send, {U+1D4B5}{U+0332}

    $+a::Send, {U+1D4B6}{U+0332}
    $+b::Send, {U+1D4B7}{U+0332}
    $+c::Send, {U+1D4B8}{U+0332}
    $+d::Send, {U+1D4B9}{U+0332}
    $+e::Send, {U+1D452}{U+0332}
    $+f::Send, {U+1D4BB}{U+0332}
    $+g::Send, {U+1D454}{U+0332}
    $+h::Send, {U+1D4BD}{U+0332}
    $+i::Send, {U+1D4BE}{U+0332}
    $+j::Send, {U+1D4BF}{U+0332}
    $+k::Send, {U+1D4C0}{U+0332}
    $+l::Send, {U+1D4C1}{U+0332}
    $+m::Send, {U+1D4C2}{U+0332}
    $+n::Send, {U+1D4C3}{U+0332}
    $+o::Send, {U+1D45C}{U+0332}
    $+p::Send, {U+1D4C5}{U+0332}
    $+q::Send, {U+1D4C6}{U+0332}
    $+r::Send, {U+1D4C7}{U+0332}
    $+s::Send, {U+1D4C8}{U+0332}
    $+t::Send, {U+1D4C9}{U+0332}
    $+u::Send, {U+1D4CA}{U+0332}
    $+v::Send, {U+1D4CB}{U+0332}
    $+w::Send, {U+1D4CC}{U+0332}
    $+x::Send, {U+1D4CD}{U+0332}
    $+y::Send, {U+1D4CE}{U+0332}
    $+z::Send, {U+1D4CF}{U+0332}

    ~Space::Send, {U+0332}

    ~SC029::Send, {U+0332}
    ~+SC029::Send, {U+0332}
    ~+SC002::Send, {U+0332}
    ~+SC003::Send, {U+0332}
    ~+SC004::Send, {U+0332}
    ~+SC005::Send, {U+0332}
    ~+SC006::Send, {U+0332}
    ~+SC007::Send, {U+0332}
    ~+SC008::Send, {U+0332}
    ~+SC009::Send, {U+0332}
    ~+SC00a::Send, {U+0332}
    ~+SC00b::Send, {U+0332}
    ~SC00c::Send, {U+0332}
    ~+SC00c::Send, {U+0332}
    ~SC00d::Send, {U+0332}
    ~+SC00d::Send, {U+0332}
    ~SC01a::Send, {U+0332}
    ~+SC01a::Send, {U+0332}
    ~SC01b::Send, {U+0332}
    ~+SC01b::Send, {U+0332}
    ~SC027::Send, {U+0332}
    ~+SC027::Send, {U+0332}
    ~SC028::Send, {U+0332}
    ~+SC028::Send, {U+0332}
    ~SC02b::Send, {U+0332}
    ~+SC02b::Send, {U+0332}
    ~SC033::Send, {U+0332}
    ~+SC033::Send, {U+0332}
    ~SC034::Send, {U+0332}
    ~+SC034::Send, {U+0332}
    ~SC035::Send, {U+0332}
    ~+SC035::Send, {U+0332}
    ~SC037::Send, {U+0332}
    ~SC04a::Send, {U+0332}
    ~SC04e::Send, {U+0332}
    ~SC053::Send, {U+0332}
}
return

#If Cursive and modifier = "Bold, Italics, Underline" and Caps = "Off"
{
    $a::Send, {U+1D4EA}{U+0332}
    $b::Send, {U+1D4EB}{U+0332}
    $c::Send, {U+1D4EC}{U+0332}
    $d::Send, {U+1D4ED}{U+0332}
    $e::Send, {U+1D4EE}{U+0332}
    $f::Send, {U+1D4EF}{U+0332}
    $g::Send, {U+1D4F0}{U+0332}
    $h::Send, {U+1D4F1}{U+0332}
    $i::Send, {U+1D4F2}{U+0332}
    $j::Send, {U+1D4F3}{U+0332}
    $k::Send, {U+1D4F4}{U+0332}
    $l::Send, {U+1D4F5}{U+0332}
    $m::Send, {U+1D4F6}{U+0332}
    $n::Send, {U+1D4F7}{U+0332}
    $o::Send, {U+1D4F8}{U+0332}
    $p::Send, {U+1D4F9}{U+0332}
    $q::Send, {U+1D4FA}{U+0332}
    $r::Send, {U+1D4FB}{U+0332}
    $s::Send, {U+1D4FC}{U+0332}
    $t::Send, {U+1D4FD}{U+0332}
    $u::Send, {U+1D4FE}{U+0332}
    $v::Send, {U+1D4FF}{U+0332}
    $w::Send, {U+1D500}{U+0332}
    $x::Send, {U+1D501}{U+0332}
    $y::Send, {U+1D502}{U+0332}
    $z::Send, {U+1D503}{U+0332}

    $+a::Send, {U+1D4D0}{U+0332}
    $+b::Send, {U+1D4D1}{U+0332}
    $+c::Send, {U+1D4D2}{U+0332}
    $+d::Send, {U+1D4D3}{U+0332}
    $+e::Send, {U+1D4D4}{U+0332}
    $+f::Send, {U+1D4D5}{U+0332}
    $+g::Send, {U+1D4D6}{U+0332}
    $+h::Send, {U+1D4D7}{U+0332}
    $+i::Send, {U+1D4D8}{U+0332}
    $+j::Send, {U+1D4D9}{U+0332}
    $+k::Send, {U+1D4DA}{U+0332}
    $+l::Send, {U+1D4DB}{U+0332}
    $+m::Send, {U+1D4DC}{U+0332}
    $+n::Send, {U+1D4DD}{U+0332}
    $+o::Send, {U+1D4DE}{U+0332}
    $+p::Send, {U+1D4DF}{U+0332}
    $+q::Send, {U+1D4E0}{U+0332}
    $+r::Send, {U+1D4E1}{U+0332}
    $+s::Send, {U+1D4E2}{U+0332}
    $+t::Send, {U+1D4E3}{U+0332}
    $+u::Send, {U+1D4E4}{U+0332}
    $+v::Send, {U+1D4E5}{U+0332}
    $+w::Send, {U+1D4E6}{U+0332}
    $+x::Send, {U+1D4E7}{U+0332}
    $+y::Send, {U+1D4E8}{U+0332}
    $+z::Send, {U+1D4E9}{U+0332}

    ~Space::Send, {U+0332}

    ~SC029::Send, {U+0332}
    ~+SC029::Send, {U+0332}
    ~+SC002::Send, {U+0332}
    ~+SC003::Send, {U+0332}
    ~+SC004::Send, {U+0332}
    ~+SC005::Send, {U+0332}
    ~+SC006::Send, {U+0332}
    ~+SC007::Send, {U+0332}
    ~+SC008::Send, {U+0332}
    ~+SC009::Send, {U+0332}
    ~+SC00a::Send, {U+0332}
    ~+SC00b::Send, {U+0332}
    ~SC00c::Send, {U+0332}
    ~+SC00c::Send, {U+0332}
    ~SC00d::Send, {U+0332}
    ~+SC00d::Send, {U+0332}
    ~SC01a::Send, {U+0332}
    ~+SC01a::Send, {U+0332}
    ~SC01b::Send, {U+0332}
    ~+SC01b::Send, {U+0332}
    ~SC027::Send, {U+0332}
    ~+SC027::Send, {U+0332}
    ~SC028::Send, {U+0332}
    ~+SC028::Send, {U+0332}
    ~SC02b::Send, {U+0332}
    ~+SC02b::Send, {U+0332}
    ~SC033::Send, {U+0332}
    ~+SC033::Send, {U+0332}
    ~SC034::Send, {U+0332}
    ~+SC034::Send, {U+0332}
    ~SC035::Send, {U+0332}
    ~+SC035::Send, {U+0332}
    ~SC037::Send, {U+0332}
    ~SC04a::Send, {U+0332}
    ~SC04e::Send, {U+0332}
    ~SC053::Send, {U+0332}
}
return

#If Cursive and modifier = "Bold, Italics, Underline" and Caps = "On"
{
    $a::Send, {U+1D4D0}{U+0332}
    $b::Send, {U+1D4D1}{U+0332}
    $c::Send, {U+1D4D2}{U+0332}
    $d::Send, {U+1D4D3}{U+0332}
    $e::Send, {U+1D4D4}{U+0332}
    $f::Send, {U+1D4D5}{U+0332}
    $g::Send, {U+1D4D6}{U+0332}
    $h::Send, {U+1D4D7}{U+0332}
    $i::Send, {U+1D4D8}{U+0332}
    $j::Send, {U+1D4D9}{U+0332}
    $k::Send, {U+1D4DA}{U+0332}
    $l::Send, {U+1D4DB}{U+0332}
    $m::Send, {U+1D4DC}{U+0332}
    $n::Send, {U+1D4DD}{U+0332}
    $o::Send, {U+1D4DE}{U+0332}
    $p::Send, {U+1D4DF}{U+0332}
    $q::Send, {U+1D4E0}{U+0332}
    $r::Send, {U+1D4E1}{U+0332}
    $s::Send, {U+1D4E2}{U+0332}
    $t::Send, {U+1D4E3}{U+0332}
    $u::Send, {U+1D4E4}{U+0332}
    $v::Send, {U+1D4E5}{U+0332}
    $w::Send, {U+1D4E6}{U+0332}
    $x::Send, {U+1D4E7}{U+0332}
    $y::Send, {U+1D4E8}{U+0332}
    $z::Send, {U+1D4E9}{U+0332}

    $+a::Send, {U+1D4EA}{U+0332}
    $+b::Send, {U+1D4EB}{U+0332}
    $+c::Send, {U+1D4EC}{U+0332}
    $+d::Send, {U+1D4ED}{U+0332}
    $+e::Send, {U+1D4EE}{U+0332}
    $+f::Send, {U+1D4EF}{U+0332}
    $+g::Send, {U+1D4F0}{U+0332}
    $+h::Send, {U+1D4F1}{U+0332}
    $+i::Send, {U+1D4F2}{U+0332}
    $+j::Send, {U+1D4F3}{U+0332}
    $+k::Send, {U+1D4F4}{U+0332}
    $+l::Send, {U+1D4F5}{U+0332}
    $+m::Send, {U+1D4F6}{U+0332}
    $+n::Send, {U+1D4F7}{U+0332}
    $+o::Send, {U+1D4F8}{U+0332}
    $+p::Send, {U+1D4F9}{U+0332}
    $+q::Send, {U+1D4FA}{U+0332}
    $+r::Send, {U+1D4FB}{U+0332}
    $+s::Send, {U+1D4FC}{U+0332}
    $+t::Send, {U+1D4FD}{U+0332}
    $+u::Send, {U+1D4FE}{U+0332}
    $+v::Send, {U+1D4FF}{U+0332}
    $+w::Send, {U+1D500}{U+0332}
    $+x::Send, {U+1D501}{U+0332}
    $+y::Send, {U+1D502}{U+0332}
    $+z::Send, {U+1D503}{U+0332}

    ~Space::Send, {U+0332}

    ~SC029::Send, {U+0332}
    ~+SC029::Send, {U+0332}
    ~+SC002::Send, {U+0332}
    ~+SC003::Send, {U+0332}
    ~+SC004::Send, {U+0332}
    ~+SC005::Send, {U+0332}
    ~+SC006::Send, {U+0332}
    ~+SC007::Send, {U+0332}
    ~+SC008::Send, {U+0332}
    ~+SC009::Send, {U+0332}
    ~+SC00a::Send, {U+0332}
    ~+SC00b::Send, {U+0332}
    ~SC00c::Send, {U+0332}
    ~+SC00c::Send, {U+0332}
    ~SC00d::Send, {U+0332}
    ~+SC00d::Send, {U+0332}
    ~SC01a::Send, {U+0332}
    ~+SC01a::Send, {U+0332}
    ~SC01b::Send, {U+0332}
    ~+SC01b::Send, {U+0332}
    ~SC027::Send, {U+0332}
    ~+SC027::Send, {U+0332}
    ~SC028::Send, {U+0332}
    ~+SC028::Send, {U+0332}
    ~SC02b::Send, {U+0332}
    ~+SC02b::Send, {U+0332}
    ~SC033::Send, {U+0332}
    ~+SC033::Send, {U+0332}
    ~SC034::Send, {U+0332}
    ~+SC034::Send, {U+0332}
    ~SC035::Send, {U+0332}
    ~+SC035::Send, {U+0332}
    ~SC037::Send, {U+0332}
    ~SC04a::Send, {U+0332}
    ~SC04e::Send, {U+0332}
    ~SC053::Send, {U+0332}
}
return


;Strikethrough Modifiers
#If Cursive and modifier = "Italics, Strikethrough" and Caps = "Off"
{
    $a::Send, {U+1D4B6}{U+0336}
    $b::Send, {U+1D4B7}{U+0336}
    $c::Send, {U+1D4B8}{U+0336}
    $d::Send, {U+1D4B9}{U+0336}
    $e::Send, {U+1D452}{U+0336}
    $f::Send, {U+1D4BB}{U+0336}
    $g::Send, {U+1D454}{U+0336}
    $h::Send, {U+1D4BD}{U+0336}
    $i::Send, {U+1D4BE}{U+0336}
    $j::Send, {U+1D4BF}{U+0336}
    $k::Send, {U+1D4C0}{U+0336}
    $l::Send, {U+1D4C1}{U+0336}
    $m::Send, {U+1D4C2}{U+0336}
    $n::Send, {U+1D4C3}{U+0336}
    $o::Send, {U+1D45C}{U+0336}
    $p::Send, {U+1D4C5}{U+0336}
    $q::Send, {U+1D4C6}{U+0336}
    $r::Send, {U+1D4C7}{U+0336}
    $s::Send, {U+1D4C8}{U+0336}
    $t::Send, {U+1D4C9}{U+0336}
    $u::Send, {U+1D4CA}{U+0336}
    $v::Send, {U+1D4CB}{U+0336}
    $w::Send, {U+1D4CC}{U+0336}
    $x::Send, {U+1D4CD}{U+0336}
    $y::Send, {U+1D4CE}{U+0336}
    $z::Send, {U+1D4CF}{U+0336}

    $+a::Send, {U+1D49C}{U+0336}
    $+b::Send, {U+212C}{U+0336}
    $+c::Send, {U+1D49E}{U+0336}
    $+d::Send, {U+1D49F}{U+0336}
    $+e::Send, {U+2130}{U+0336}
    $+f::Send, {U+2131}{U+0336}
    $+g::Send, {U+1D4A2}{U+0336}
    $+h::Send, {U+210B}{U+0336}
    $+i::Send, {U+2110}{U+0336}
    $+j::Send, {U+1D4A5}{U+0336}
    $+k::Send, {U+1D4A6}{U+0336}
    $+l::Send, {U+2112}{U+0336}
    $+m::Send, {U+2133}{U+0336}
    $+n::Send, {U+1D4A9}{U+0336}
    $+o::Send, {U+1D4AA}{U+0336}
    $+p::Send, {U+1D4AB}{U+0336}
    $+q::Send, {U+1D4AC}{U+0336}
    $+r::Send, {U+211B}{U+0336}
    $+s::Send, {U+1D4AE}{U+0336}
    $+t::Send, {U+1D4AF}{U+0336}
    $+u::Send, {U+1D4B0}{U+0336}
    $+v::Send, {U+1D4B1}{U+0336}
    $+w::Send, {U+1D4B2}{U+0336}
    $+x::Send, {U+1D4B3}{U+0336}
    $+y::Send, {U+1D4B4}{U+0336}
    $+z::Send, {U+1D4B5}{U+0336}

    ~Space::Send, {U+0336}

    ~SC029::Send, {U+0336}
    ~+SC029::Send, {U+0336}
    ~+SC002::Send, {U+0336}
    ~+SC003::Send, {U+0336}
    ~+SC004::Send, {U+0336}
    ~+SC005::Send, {U+0336}
    ~+SC006::Send, {U+0336}
    ~+SC007::Send, {U+0336}
    ~+SC008::Send, {U+0336}
    ~+SC009::Send, {U+0336}
    ~+SC00a::Send, {U+0336}
    ~+SC00b::Send, {U+0336}
    ~SC00c::Send, {U+0336}
    ~+SC00c::Send, {U+0336}
    ~SC00d::Send, {U+0336}
    ~+SC00d::Send, {U+0336}
    ~SC01a::Send, {U+0336}
    ~+SC01a::Send, {U+0336}
    ~SC01b::Send, {U+0336}
    ~+SC01b::Send, {U+0336}
    ~SC027::Send, {U+0336}
    ~+SC027::Send, {U+0336}
    ~SC028::Send, {U+0336}
    ~+SC028::Send, {U+0336}
    ~SC02b::Send, {U+0336}
    ~+SC02b::Send, {U+0336}
    ~SC033::Send, {U+0336}
    ~+SC033::Send, {U+0336}
    ~SC034::Send, {U+0336}
    ~+SC034::Send, {U+0336}
    ~SC035::Send, {U+0336}
    ~+SC035::Send, {U+0336}
    ~SC037::Send, {U+0336}
    ~SC04a::Send, {U+0336}
    ~SC04e::Send, {U+0336}
    ~SC053::Send, {U+0336}
}
return

#If Cursive and modifier = "Italics, Strikethrough" and Caps = "On"
{
    $a::Send, {U+1D49C}{U+0336}
    $b::Send, {U+212C}{U+0336}
    $c::Send, {U+1D49E}{U+0336}
    $d::Send, {U+1D49F}{U+0336}
    $e::Send, {U+2130}{U+0336}
    $f::Send, {U+2131}{U+0336}
    $g::Send, {U+1D4A2}{U+0336}
    $h::Send, {U+210B}{U+0336}
    $i::Send, {U+2110}{U+0336}
    $j::Send, {U+1D4A5}{U+0336}
    $k::Send, {U+1D4A6}{U+0336}
    $l::Send, {U+2112}{U+0336}
    $m::Send, {U+2133}{U+0336}
    $n::Send, {U+1D4A9}{U+0336}
    $o::Send, {U+1D4AA}{U+0336}
    $p::Send, {U+1D4AB}{U+0336}
    $q::Send, {U+1D4AC}{U+0336}
    $r::Send, {U+211B}{U+0336}
    $s::Send, {U+1D4AE}{U+0336}
    $t::Send, {U+1D4AF}{U+0336}
    $u::Send, {U+1D4B0}{U+0336}
    $v::Send, {U+1D4B1}{U+0336}
    $w::Send, {U+1D4B2}{U+0336}
    $x::Send, {U+1D4B3}{U+0336}
    $y::Send, {U+1D4B4}{U+0336}
    $z::Send, {U+1D4B5}{U+0336}

    $+a::Send, {U+1D4B6}{U+0336}
    $+b::Send, {U+1D4B7}{U+0336}
    $+c::Send, {U+1D4B8}{U+0336}
    $+d::Send, {U+1D4B9}{U+0336}
    $+e::Send, {U+1D452}{U+0336}
    $+f::Send, {U+1D4BB}{U+0336}
    $+g::Send, {U+1D454}{U+0336}
    $+h::Send, {U+1D4BD}{U+0336}
    $+i::Send, {U+1D4BE}{U+0336}
    $+j::Send, {U+1D4BF}{U+0336}
    $+k::Send, {U+1D4C0}{U+0336}
    $+l::Send, {U+1D4C1}{U+0336}
    $+m::Send, {U+1D4C2}{U+0336}
    $+n::Send, {U+1D4C3}{U+0336}
    $+o::Send, {U+1D45C}{U+0336}
    $+p::Send, {U+1D4C5}{U+0336}
    $+q::Send, {U+1D4C6}{U+0336}
    $+r::Send, {U+1D4C7}{U+0336}
    $+s::Send, {U+1D4C8}{U+0336}
    $+t::Send, {U+1D4C9}{U+0336}
    $+u::Send, {U+1D4CA}{U+0336}
    $+v::Send, {U+1D4CB}{U+0336}
    $+w::Send, {U+1D4CC}{U+0336}
    $+x::Send, {U+1D4CD}{U+0336}
    $+y::Send, {U+1D4CE}{U+0336}
    $+z::Send, {U+1D4CF}{U+0336}

    ~Space::Send, {U+0336}

    ~SC029::Send, {U+0336}
    ~+SC029::Send, {U+0336}
    ~+SC002::Send, {U+0336}
    ~+SC003::Send, {U+0336}
    ~+SC004::Send, {U+0336}
    ~+SC005::Send, {U+0336}
    ~+SC006::Send, {U+0336}
    ~+SC007::Send, {U+0336}
    ~+SC008::Send, {U+0336}
    ~+SC009::Send, {U+0336}
    ~+SC00a::Send, {U+0336}
    ~+SC00b::Send, {U+0336}
    ~SC00c::Send, {U+0336}
    ~+SC00c::Send, {U+0336}
    ~SC00d::Send, {U+0336}
    ~+SC00d::Send, {U+0336}
    ~SC01a::Send, {U+0336}
    ~+SC01a::Send, {U+0336}
    ~SC01b::Send, {U+0336}
    ~+SC01b::Send, {U+0336}
    ~SC027::Send, {U+0336}
    ~+SC027::Send, {U+0336}
    ~SC028::Send, {U+0336}
    ~+SC028::Send, {U+0336}
    ~SC02b::Send, {U+0336}
    ~+SC02b::Send, {U+0336}
    ~SC033::Send, {U+0336}
    ~+SC033::Send, {U+0336}
    ~SC034::Send, {U+0336}
    ~+SC034::Send, {U+0336}
    ~SC035::Send, {U+0336}
    ~+SC035::Send, {U+0336}
    ~SC037::Send, {U+0336}
    ~SC04a::Send, {U+0336}
    ~SC04e::Send, {U+0336}
    ~SC053::Send, {U+0336}
}
return

#If Cursive and modifier = "Bold, Italics, Strikethrough" and Caps = "Off"
{
    $a::Send, {U+1D4EA}{U+0336}
    $b::Send, {U+1D4EB}{U+0336}
    $c::Send, {U+1D4EC}{U+0336}
    $d::Send, {U+1D4ED}{U+0336}
    $e::Send, {U+1D4EE}{U+0336}
    $f::Send, {U+1D4EF}{U+0336}
    $g::Send, {U+1D4F0}{U+0336}
    $h::Send, {U+1D4F1}{U+0336}
    $i::Send, {U+1D4F2}{U+0336}
    $j::Send, {U+1D4F3}{U+0336}
    $k::Send, {U+1D4F4}{U+0336}
    $l::Send, {U+1D4F5}{U+0336}
    $m::Send, {U+1D4F6}{U+0336}
    $n::Send, {U+1D4F7}{U+0336}
    $o::Send, {U+1D4F8}{U+0336}
    $p::Send, {U+1D4F9}{U+0336}
    $q::Send, {U+1D4FA}{U+0336}
    $r::Send, {U+1D4FB}{U+0336}
    $s::Send, {U+1D4FC}{U+0336}
    $t::Send, {U+1D4FD}{U+0336}
    $u::Send, {U+1D4FE}{U+0336}
    $v::Send, {U+1D4FF}{U+0336}
    $w::Send, {U+1D500}{U+0336}
    $x::Send, {U+1D501}{U+0336}
    $y::Send, {U+1D502}{U+0336}
    $z::Send, {U+1D503}{U+0336}

    $+a::Send, {U+1D4D0}{U+0336}
    $+b::Send, {U+1D4D1}{U+0336}
    $+c::Send, {U+1D4D2}{U+0336}
    $+d::Send, {U+1D4D3}{U+0336}
    $+e::Send, {U+1D4D4}{U+0336}
    $+f::Send, {U+1D4D5}{U+0336}
    $+g::Send, {U+1D4D6}{U+0336}
    $+h::Send, {U+1D4D7}{U+0336}
    $+i::Send, {U+1D4D8}{U+0336}
    $+j::Send, {U+1D4D9}{U+0336}
    $+k::Send, {U+1D4DA}{U+0336}
    $+l::Send, {U+1D4DB}{U+0336}
    $+m::Send, {U+1D4DC}{U+0336}
    $+n::Send, {U+1D4DD}{U+0336}
    $+o::Send, {U+1D4DE}{U+0336}
    $+p::Send, {U+1D4DF}{U+0336}
    $+q::Send, {U+1D4E0}{U+0336}
    $+r::Send, {U+1D4E1}{U+0336}
    $+s::Send, {U+1D4E2}{U+0336}
    $+t::Send, {U+1D4E3}{U+0336}
    $+u::Send, {U+1D4E4}{U+0336}
    $+v::Send, {U+1D4E5}{U+0336}
    $+w::Send, {U+1D4E6}{U+0336}
    $+x::Send, {U+1D4E7}{U+0336}
    $+y::Send, {U+1D4E8}{U+0336}
    $+z::Send, {U+1D4E9}{U+0336}

    ~Space::Send, {U+0336}

    ~SC029::Send, {U+0336}
    ~+SC029::Send, {U+0336}
    ~+SC002::Send, {U+0336}
    ~+SC003::Send, {U+0336}
    ~+SC004::Send, {U+0336}
    ~+SC005::Send, {U+0336}
    ~+SC006::Send, {U+0336}
    ~+SC007::Send, {U+0336}
    ~+SC008::Send, {U+0336}
    ~+SC009::Send, {U+0336}
    ~+SC00a::Send, {U+0336}
    ~+SC00b::Send, {U+0336}
    ~SC00c::Send, {U+0336}
    ~+SC00c::Send, {U+0336}
    ~SC00d::Send, {U+0336}
    ~+SC00d::Send, {U+0336}
    ~SC01a::Send, {U+0336}
    ~+SC01a::Send, {U+0336}
    ~SC01b::Send, {U+0336}
    ~+SC01b::Send, {U+0336}
    ~SC027::Send, {U+0336}
    ~+SC027::Send, {U+0336}
    ~SC028::Send, {U+0336}
    ~+SC028::Send, {U+0336}
    ~SC02b::Send, {U+0336}
    ~+SC02b::Send, {U+0336}
    ~SC033::Send, {U+0336}
    ~+SC033::Send, {U+0336}
    ~SC034::Send, {U+0336}
    ~+SC034::Send, {U+0336}
    ~SC035::Send, {U+0336}
    ~+SC035::Send, {U+0336}
    ~SC037::Send, {U+0336}
    ~SC04a::Send, {U+0336}
    ~SC04e::Send, {U+0336}
    ~SC053::Send, {U+0336}
}
return

#If Cursive and modifier = "Bold, Italics, Strikethrough" and Caps = "On"
{
    $a::Send, {U+1D4D0}{U+0336}
    $b::Send, {U+1D4D1}{U+0336}
    $c::Send, {U+1D4D2}{U+0336}
    $d::Send, {U+1D4D3}{U+0336}
    $e::Send, {U+1D4D4}{U+0336}
    $f::Send, {U+1D4D5}{U+0336}
    $g::Send, {U+1D4D6}{U+0336}
    $h::Send, {U+1D4D7}{U+0336}
    $i::Send, {U+1D4D8}{U+0336}
    $j::Send, {U+1D4D9}{U+0336}
    $k::Send, {U+1D4DA}{U+0336}
    $l::Send, {U+1D4DB}{U+0336}
    $m::Send, {U+1D4DC}{U+0336}
    $n::Send, {U+1D4DD}{U+0336}
    $o::Send, {U+1D4DE}{U+0336}
    $p::Send, {U+1D4DF}{U+0336}
    $q::Send, {U+1D4E0}{U+0336}
    $r::Send, {U+1D4E1}{U+0336}
    $s::Send, {U+1D4E2}{U+0336}
    $t::Send, {U+1D4E3}{U+0336}
    $u::Send, {U+1D4E4}{U+0336}
    $v::Send, {U+1D4E5}{U+0336}
    $w::Send, {U+1D4E6}{U+0336}
    $x::Send, {U+1D4E7}{U+0336}
    $y::Send, {U+1D4E8}{U+0336}
    $z::Send, {U+1D4E9}{U+0336}

    $+a::Send, {U+1D4EA}{U+0336}
    $+b::Send, {U+1D4EB}{U+0336}
    $+c::Send, {U+1D4EC}{U+0336}
    $+d::Send, {U+1D4ED}{U+0336}
    $+e::Send, {U+1D4EE}{U+0336}
    $+f::Send, {U+1D4EF}{U+0336}
    $+g::Send, {U+1D4F0}{U+0336}
    $+h::Send, {U+1D4F1}{U+0336}
    $+i::Send, {U+1D4F2}{U+0336}
    $+j::Send, {U+1D4F3}{U+0336}
    $+k::Send, {U+1D4F4}{U+0336}
    $+l::Send, {U+1D4F5}{U+0336}
    $+m::Send, {U+1D4F6}{U+0336}
    $+n::Send, {U+1D4F7}{U+0336}
    $+o::Send, {U+1D4F8}{U+0336}
    $+p::Send, {U+1D4F9}{U+0336}
    $+q::Send, {U+1D4FA}{U+0336}
    $+r::Send, {U+1D4FB}{U+0336}
    $+s::Send, {U+1D4FC}{U+0336}
    $+t::Send, {U+1D4FD}{U+0336}
    $+u::Send, {U+1D4FE}{U+0336}
    $+v::Send, {U+1D4FF}{U+0336}
    $+w::Send, {U+1D500}{U+0336}
    $+x::Send, {U+1D501}{U+0336}
    $+y::Send, {U+1D502}{U+0336}
    $+z::Send, {U+1D503}{U+0336}

    ~Space::Send, {U+0336}

    ~SC029::Send, {U+0336}
    ~+SC029::Send, {U+0336}
    ~+SC002::Send, {U+0336}
    ~+SC003::Send, {U+0336}
    ~+SC004::Send, {U+0336}
    ~+SC005::Send, {U+0336}
    ~+SC006::Send, {U+0336}
    ~+SC007::Send, {U+0336}
    ~+SC008::Send, {U+0336}
    ~+SC009::Send, {U+0336}
    ~+SC00a::Send, {U+0336}
    ~+SC00b::Send, {U+0336}
    ~SC00c::Send, {U+0336}
    ~+SC00c::Send, {U+0336}
    ~SC00d::Send, {U+0336}
    ~+SC00d::Send, {U+0336}
    ~SC01a::Send, {U+0336}
    ~+SC01a::Send, {U+0336}
    ~SC01b::Send, {U+0336}
    ~+SC01b::Send, {U+0336}
    ~SC027::Send, {U+0336}
    ~+SC027::Send, {U+0336}
    ~SC028::Send, {U+0336}
    ~+SC028::Send, {U+0336}
    ~SC02b::Send, {U+0336}
    ~+SC02b::Send, {U+0336}
    ~SC033::Send, {U+0336}
    ~+SC033::Send, {U+0336}
    ~SC034::Send, {U+0336}
    ~+SC034::Send, {U+0336}
    ~SC035::Send, {U+0336}
    ~+SC035::Send, {U+0336}
    ~SC037::Send, {U+0336}
    ~SC04a::Send, {U+0336}
    ~SC04e::Send, {U+0336}
    ~SC053::Send, {U+0336}
}
return


;Underline and Strikethrough Modifiers
#If Cursive and modifier = "Italics, Underline, Strikethrough" and Caps = "Off"
{
    $a::Send, {U+1D4B6}{U+0332}{U+0336}
    $b::Send, {U+1D4B7}{U+0332}{U+0336}
    $c::Send, {U+1D4B8}{U+0332}{U+0336}
    $d::Send, {U+1D4B9}{U+0332}{U+0336}
    $e::Send, {U+1D452}{U+0332}{U+0336}
    $f::Send, {U+1D4BB}{U+0332}{U+0336}
    $g::Send, {U+1D454}{U+0332}{U+0336}
    $h::Send, {U+1D4BD}{U+0332}{U+0336}
    $i::Send, {U+1D4BE}{U+0332}{U+0336}
    $j::Send, {U+1D4BF}{U+0332}{U+0336}
    $k::Send, {U+1D4C0}{U+0332}{U+0336}
    $l::Send, {U+1D4C1}{U+0332}{U+0336}
    $m::Send, {U+1D4C2}{U+0332}{U+0336}
    $n::Send, {U+1D4C3}{U+0332}{U+0336}
    $o::Send, {U+1D45C}{U+0332}{U+0336}
    $p::Send, {U+1D4C5}{U+0332}{U+0336}
    $q::Send, {U+1D4C6}{U+0332}{U+0336}
    $r::Send, {U+1D4C7}{U+0332}{U+0336}
    $s::Send, {U+1D4C8}{U+0332}{U+0336}
    $t::Send, {U+1D4C9}{U+0332}{U+0336}
    $u::Send, {U+1D4CA}{U+0332}{U+0336}
    $v::Send, {U+1D4CB}{U+0332}{U+0336}
    $w::Send, {U+1D4CC}{U+0332}{U+0336}
    $x::Send, {U+1D4CD}{U+0332}{U+0336}
    $y::Send, {U+1D4CE}{U+0332}{U+0336}
    $z::Send, {U+1D4CF}{U+0332}{U+0336}
    
    $+a::Send, {U+1D49C}{U+0332}{U+0336}
    $+b::Send, {U+212C}{U+0332}{U+0336}
    $+c::Send, {U+1D49E}{U+0332}{U+0336}
    $+d::Send, {U+1D49F}{U+0332}{U+0336}
    $+e::Send, {U+2130}{U+0332}{U+0336}
    $+f::Send, {U+2131}{U+0332}{U+0336}
    $+g::Send, {U+1D4A2}{U+0332}{U+0336}
    $+h::Send, {U+210B}{U+0332}{U+0336}
    $+i::Send, {U+2110}{U+0332}{U+0336}
    $+j::Send, {U+1D4A5}{U+0332}{U+0336}
    $+k::Send, {U+1D4A6}{U+0332}{U+0336}
    $+l::Send, {U+2112}{U+0332}{U+0336}
    $+m::Send, {U+2133}{U+0332}{U+0336}
    $+n::Send, {U+1D4A9}{U+0332}{U+0336}
    $+o::Send, {U+1D4AA}{U+0332}{U+0336}
    $+p::Send, {U+1D4AB}{U+0332}{U+0336}
    $+q::Send, {U+1D4AC}{U+0332}{U+0336}
    $+r::Send, {U+211B}{U+0332}{U+0336}
    $+s::Send, {U+1D4AE}{U+0332}{U+0336}
    $+t::Send, {U+1D4AF}{U+0332}{U+0336}
    $+u::Send, {U+1D4B0}{U+0332}{U+0336}
    $+v::Send, {U+1D4B1}{U+0332}{U+0336}
    $+w::Send, {U+1D4B2}{U+0332}{U+0336}
    $+x::Send, {U+1D4B3}{U+0332}{U+0336}
    $+y::Send, {U+1D4B4}{U+0332}{U+0336}
    $+z::Send, {U+1D4B5}{U+0332}{U+0336}

    ~Space::Send, {U+0332}{U+0336}

    ~SC029::Send, {U+0332}{U+0336}
    ~+SC029::Send, {U+0332}{U+0336}
    ~+SC002::Send, {U+0332}{U+0336}
    ~+SC003::Send, {U+0332}{U+0336}
    ~+SC004::Send, {U+0332}{U+0336}
    ~+SC005::Send, {U+0332}{U+0336}
    ~+SC006::Send, {U+0332}{U+0336}
    ~+SC007::Send, {U+0332}{U+0336}
    ~+SC008::Send, {U+0332}{U+0336}
    ~+SC009::Send, {U+0332}{U+0336}
    ~+SC00a::Send, {U+0332}{U+0336}
    ~+SC00b::Send, {U+0332}{U+0336}
    ~SC00c::Send, {U+0332}{U+0336}
    ~+SC00c::Send, {U+0332}{U+0336}
    ~SC00d::Send, {U+0332}{U+0336}
    ~+SC00d::Send, {U+0332}{U+0336}
    ~SC01a::Send, {U+0332}{U+0336}
    ~+SC01a::Send, {U+0332}{U+0336}
    ~SC01b::Send, {U+0332}{U+0336}
    ~+SC01b::Send, {U+0332}{U+0336}
    ~SC027::Send, {U+0332}{U+0336}
    ~+SC027::Send, {U+0332}{U+0336}
    ~SC028::Send, {U+0332}{U+0336}
    ~+SC028::Send, {U+0332}{U+0336}
    ~SC02b::Send, {U+0332}{U+0336}
    ~+SC02b::Send, {U+0332}{U+0336}
    ~SC033::Send, {U+0332}{U+0336}
    ~+SC033::Send, {U+0332}{U+0336}
    ~SC034::Send, {U+0332}{U+0336}
    ~+SC034::Send, {U+0332}{U+0336}
    ~SC035::Send, {U+0332}{U+0336}
    ~+SC035::Send, {U+0332}{U+0336}
    ~SC037::Send, {U+0332}{U+0336}
    ~SC04a::Send, {U+0332}{U+0336}
    ~SC04e::Send, {U+0332}{U+0336}
    ~SC053::Send, {U+0332}{U+0336}
}
return

#If Cursive and modifier = "Italics, Underline, Strikethrough" and Caps = "On"
{
    $a::Send, {U+1D49C}{U+0332}{U+0336}
    $b::Send, {U+212C}{U+0332}{U+0336}
    $c::Send, {U+1D49E}{U+0332}{U+0336}
    $d::Send, {U+1D49F}{U+0332}{U+0336}
    $e::Send, {U+2130}{U+0332}{U+0336}
    $f::Send, {U+2131}{U+0332}{U+0336}
    $g::Send, {U+1D4A2}{U+0332}{U+0336}
    $h::Send, {U+210B}{U+0332}{U+0336}
    $i::Send, {U+2110}{U+0332}{U+0336}
    $j::Send, {U+1D4A5}{U+0332}{U+0336}
    $k::Send, {U+1D4A6}{U+0332}{U+0336}
    $l::Send, {U+2112}{U+0332}{U+0336}
    $m::Send, {U+2133}{U+0332}{U+0336}
    $n::Send, {U+1D4A9}{U+0332}{U+0336}
    $o::Send, {U+1D4AA}{U+0332}{U+0336}
    $p::Send, {U+1D4AB}{U+0332}{U+0336}
    $q::Send, {U+1D4AC}{U+0332}{U+0336}
    $r::Send, {U+211B}{U+0332}{U+0336}
    $s::Send, {U+1D4AE}{U+0332}{U+0336}
    $t::Send, {U+1D4AF}{U+0332}{U+0336}
    $u::Send, {U+1D4B0}{U+0332}{U+0336}
    $v::Send, {U+1D4B1}{U+0332}{U+0336}
    $w::Send, {U+1D4B2}{U+0332}{U+0336}
    $x::Send, {U+1D4B3}{U+0332}{U+0336}
    $y::Send, {U+1D4B4}{U+0332}{U+0336}
    $z::Send, {U+1D4B5}{U+0332}{U+0336}

    $+a::Send, {U+1D4B6}{U+0332}{U+0336}
    $+b::Send, {U+1D4B7}{U+0332}{U+0336}
    $+c::Send, {U+1D4B8}{U+0332}{U+0336}
    $+d::Send, {U+1D4B9}{U+0332}{U+0336}
    $+e::Send, {U+1D452}{U+0332}{U+0336}
    $+f::Send, {U+1D4BB}{U+0332}{U+0336}
    $+g::Send, {U+1D454}{U+0332}{U+0336}
    $+h::Send, {U+1D4BD}{U+0332}{U+0336}
    $+i::Send, {U+1D4BE}{U+0332}{U+0336}
    $+j::Send, {U+1D4BF}{U+0332}{U+0336}
    $+k::Send, {U+1D4C0}{U+0332}{U+0336}
    $+l::Send, {U+1D4C1}{U+0332}{U+0336}
    $+m::Send, {U+1D4C2}{U+0332}{U+0336}
    $+n::Send, {U+1D4C3}{U+0332}{U+0336}
    $+o::Send, {U+1D45C}{U+0332}{U+0336}
    $+p::Send, {U+1D4C5}{U+0332}{U+0336}
    $+q::Send, {U+1D4C6}{U+0332}{U+0336}
    $+r::Send, {U+1D4C7}{U+0332}{U+0336}
    $+s::Send, {U+1D4C8}{U+0332}{U+0336}
    $+t::Send, {U+1D4C9}{U+0332}{U+0336}
    $+u::Send, {U+1D4CA}{U+0332}{U+0336}
    $+v::Send, {U+1D4CB}{U+0332}{U+0336}
    $+w::Send, {U+1D4CC}{U+0332}{U+0336}
    $+x::Send, {U+1D4CD}{U+0332}{U+0336}
    $+y::Send, {U+1D4CE}{U+0332}{U+0336}
    $+z::Send, {U+1D4CF}{U+0332}{U+0336}

    ~Space::Send, {U+0332}{U+0336}

    ~SC029::Send, {U+0332}{U+0336}
    ~+SC029::Send, {U+0332}{U+0336}
    ~+SC002::Send, {U+0332}{U+0336}
    ~+SC003::Send, {U+0332}{U+0336}
    ~+SC004::Send, {U+0332}{U+0336}
    ~+SC005::Send, {U+0332}{U+0336}
    ~+SC006::Send, {U+0332}{U+0336}
    ~+SC007::Send, {U+0332}{U+0336}
    ~+SC008::Send, {U+0332}{U+0336}
    ~+SC009::Send, {U+0332}{U+0336}
    ~+SC00a::Send, {U+0332}{U+0336}
    ~+SC00b::Send, {U+0332}{U+0336}
    ~SC00c::Send, {U+0332}{U+0336}
    ~+SC00c::Send, {U+0332}{U+0336}
    ~SC00d::Send, {U+0332}{U+0336}
    ~+SC00d::Send, {U+0332}{U+0336}
    ~SC01a::Send, {U+0332}{U+0336}
    ~+SC01a::Send, {U+0332}{U+0336}
    ~SC01b::Send, {U+0332}{U+0336}
    ~+SC01b::Send, {U+0332}{U+0336}
    ~SC027::Send, {U+0332}{U+0336}
    ~+SC027::Send, {U+0332}{U+0336}
    ~SC028::Send, {U+0332}{U+0336}
    ~+SC028::Send, {U+0332}{U+0336}
    ~SC02b::Send, {U+0332}{U+0336}
    ~+SC02b::Send, {U+0332}{U+0336}
    ~SC033::Send, {U+0332}{U+0336}
    ~+SC033::Send, {U+0332}{U+0336}
    ~SC034::Send, {U+0332}{U+0336}
    ~+SC034::Send, {U+0332}{U+0336}
    ~SC035::Send, {U+0332}{U+0336}
    ~+SC035::Send, {U+0332}{U+0336}
    ~SC037::Send, {U+0332}{U+0336}
    ~SC04a::Send, {U+0332}{U+0336}
    ~SC04e::Send, {U+0332}{U+0336}
    ~SC053::Send, {U+0332}{U+0336}
}
return

#If Cursive and modifier = "Bold, Italics, Underline, Strikethrough" and Caps = "Off"
{
    $a::Send, {U+1D4EA}{U+0332}{U+0336}
    $b::Send, {U+1D4EB}{U+0332}{U+0336}
    $c::Send, {U+1D4EC}{U+0332}{U+0336}
    $d::Send, {U+1D4ED}{U+0332}{U+0336}
    $e::Send, {U+1D4EE}{U+0332}{U+0336}
    $f::Send, {U+1D4EF}{U+0332}{U+0336}
    $g::Send, {U+1D4F0}{U+0332}{U+0336}
    $h::Send, {U+1D4F1}{U+0332}{U+0336}
    $i::Send, {U+1D4F2}{U+0332}{U+0336}
    $j::Send, {U+1D4F3}{U+0332}{U+0336}
    $k::Send, {U+1D4F4}{U+0332}{U+0336}
    $l::Send, {U+1D4F5}{U+0332}{U+0336}
    $m::Send, {U+1D4F6}{U+0332}{U+0336}
    $n::Send, {U+1D4F7}{U+0332}{U+0336}
    $o::Send, {U+1D4F8}{U+0332}{U+0336}
    $p::Send, {U+1D4F9}{U+0332}{U+0336}
    $q::Send, {U+1D4FA}{U+0332}{U+0336}
    $r::Send, {U+1D4FB}{U+0332}{U+0336}
    $s::Send, {U+1D4FC}{U+0332}{U+0336}
    $t::Send, {U+1D4FD}{U+0332}{U+0336}
    $u::Send, {U+1D4FE}{U+0332}{U+0336}
    $v::Send, {U+1D4FF}{U+0332}{U+0336}
    $w::Send, {U+1D500}{U+0332}{U+0336}
    $x::Send, {U+1D501}{U+0332}{U+0336}
    $y::Send, {U+1D502}{U+0332}{U+0336}
    $z::Send, {U+1D503}{U+0332}{U+0336}

    $+a::Send, {U+1D4D0}{U+0332}{U+0336}
    $+b::Send, {U+1D4D1}{U+0332}{U+0336}
    $+c::Send, {U+1D4D2}{U+0332}{U+0336}
    $+d::Send, {U+1D4D3}{U+0332}{U+0336}
    $+e::Send, {U+1D4D4}{U+0332}{U+0336}
    $+f::Send, {U+1D4D5}{U+0332}{U+0336}
    $+g::Send, {U+1D4D6}{U+0332}{U+0336}
    $+h::Send, {U+1D4D7}{U+0332}{U+0336}
    $+i::Send, {U+1D4D8}{U+0332}{U+0336}
    $+j::Send, {U+1D4D9}{U+0332}{U+0336}
    $+k::Send, {U+1D4DA}{U+0332}{U+0336}
    $+l::Send, {U+1D4DB}{U+0332}{U+0336}
    $+m::Send, {U+1D4DC}{U+0332}{U+0336}
    $+n::Send, {U+1D4DD}{U+0332}{U+0336}
    $+o::Send, {U+1D4DE}{U+0332}{U+0336}
    $+p::Send, {U+1D4DF}{U+0332}{U+0336}
    $+q::Send, {U+1D4E0}{U+0332}{U+0336}
    $+r::Send, {U+1D4E1}{U+0332}{U+0336}
    $+s::Send, {U+1D4E2}{U+0332}{U+0336}
    $+t::Send, {U+1D4E3}{U+0332}{U+0336}
    $+u::Send, {U+1D4E4}{U+0332}{U+0336}
    $+v::Send, {U+1D4E5}{U+0332}{U+0336}
    $+w::Send, {U+1D4E6}{U+0332}{U+0336}
    $+x::Send, {U+1D4E7}{U+0332}{U+0336}
    $+y::Send, {U+1D4E8}{U+0332}{U+0336}
    $+z::Send, {U+1D4E9}{U+0332}{U+0336}

    ~Space::Send, {U+0332}{U+0336}

    ~SC029::Send, {U+0332}{U+0336}
    ~+SC029::Send, {U+0332}{U+0336}
    ~+SC002::Send, {U+0332}{U+0336}
    ~+SC003::Send, {U+0332}{U+0336}
    ~+SC004::Send, {U+0332}{U+0336}
    ~+SC005::Send, {U+0332}{U+0336}
    ~+SC006::Send, {U+0332}{U+0336}
    ~+SC007::Send, {U+0332}{U+0336}
    ~+SC008::Send, {U+0332}{U+0336}
    ~+SC009::Send, {U+0332}{U+0336}
    ~+SC00a::Send, {U+0332}{U+0336}
    ~+SC00b::Send, {U+0332}{U+0336}
    ~SC00c::Send, {U+0332}{U+0336}
    ~+SC00c::Send, {U+0332}{U+0336}
    ~SC00d::Send, {U+0332}{U+0336}
    ~+SC00d::Send, {U+0332}{U+0336}
    ~SC01a::Send, {U+0332}{U+0336}
    ~+SC01a::Send, {U+0332}{U+0336}
    ~SC01b::Send, {U+0332}{U+0336}
    ~+SC01b::Send, {U+0332}{U+0336}
    ~SC027::Send, {U+0332}{U+0336}
    ~+SC027::Send, {U+0332}{U+0336}
    ~SC028::Send, {U+0332}{U+0336}
    ~+SC028::Send, {U+0332}{U+0336}
    ~SC02b::Send, {U+0332}{U+0336}
    ~+SC02b::Send, {U+0332}{U+0336}
    ~SC033::Send, {U+0332}{U+0336}
    ~+SC033::Send, {U+0332}{U+0336}
    ~SC034::Send, {U+0332}{U+0336}
    ~+SC034::Send, {U+0332}{U+0336}
    ~SC035::Send, {U+0332}{U+0336}
    ~+SC035::Send, {U+0332}{U+0336}
    ~SC037::Send, {U+0332}{U+0336}
    ~SC04a::Send, {U+0332}{U+0336}
    ~SC04e::Send, {U+0332}{U+0336}
    ~SC053::Send, {U+0332}{U+0336}
}
return

#If Cursive and modifier = "Bold, Italics, Underline, Strikethrough" and Caps = "On"
{
    $a::Send, {U+1D4D0}{U+0332}{U+0336}
    $b::Send, {U+1D4D1}{U+0332}{U+0336}
    $c::Send, {U+1D4D2}{U+0332}{U+0336}
    $d::Send, {U+1D4D3}{U+0332}{U+0336}
    $e::Send, {U+1D4D4}{U+0332}{U+0336}
    $f::Send, {U+1D4D5}{U+0332}{U+0336}
    $g::Send, {U+1D4D6}{U+0332}{U+0336}
    $h::Send, {U+1D4D7}{U+0332}{U+0336}
    $i::Send, {U+1D4D8}{U+0332}{U+0336}
    $j::Send, {U+1D4D9}{U+0332}{U+0336}
    $k::Send, {U+1D4DA}{U+0332}{U+0336}
    $l::Send, {U+1D4DB}{U+0332}{U+0336}
    $m::Send, {U+1D4DC}{U+0332}{U+0336}
    $n::Send, {U+1D4DD}{U+0332}{U+0336}
    $o::Send, {U+1D4DE}{U+0332}{U+0336}
    $p::Send, {U+1D4DF}{U+0332}{U+0336}
    $q::Send, {U+1D4E0}{U+0332}{U+0336}
    $r::Send, {U+1D4E1}{U+0332}{U+0336}
    $s::Send, {U+1D4E2}{U+0332}{U+0336}
    $t::Send, {U+1D4E3}{U+0332}{U+0336}
    $u::Send, {U+1D4E4}{U+0332}{U+0336}
    $v::Send, {U+1D4E5}{U+0332}{U+0336}
    $w::Send, {U+1D4E6}{U+0332}{U+0336}
    $x::Send, {U+1D4E7}{U+0332}{U+0336}
    $y::Send, {U+1D4E8}{U+0332}{U+0336}
    $z::Send, {U+1D4E9}{U+0332}{U+0336}

    $+a::Send, {U+1D4EA}{U+0332}{U+0336}
    $+b::Send, {U+1D4EB}{U+0332}{U+0336}
    $+c::Send, {U+1D4EC}{U+0332}{U+0336}
    $+d::Send, {U+1D4ED}{U+0332}{U+0336}
    $+e::Send, {U+1D4EE}{U+0332}{U+0336}
    $+f::Send, {U+1D4EF}{U+0332}{U+0336}
    $+g::Send, {U+1D4F0}{U+0332}{U+0336}
    $+h::Send, {U+1D4F1}{U+0332}{U+0336}
    $+i::Send, {U+1D4F2}{U+0332}{U+0336}
    $+j::Send, {U+1D4F3}{U+0332}{U+0336}
    $+k::Send, {U+1D4F4}{U+0332}{U+0336}
    $+l::Send, {U+1D4F5}{U+0332}{U+0336}
    $+m::Send, {U+1D4F6}{U+0332}{U+0336}
    $+n::Send, {U+1D4F7}{U+0332}{U+0336}
    $+o::Send, {U+1D4F8}{U+0332}{U+0336}
    $+p::Send, {U+1D4F9}{U+0332}{U+0336}
    $+q::Send, {U+1D4FA}{U+0332}{U+0336}
    $+r::Send, {U+1D4FB}{U+0332}{U+0336}
    $+s::Send, {U+1D4FC}{U+0332}{U+0336}
    $+t::Send, {U+1D4FD}{U+0332}{U+0336}
    $+u::Send, {U+1D4FE}{U+0332}{U+0336}
    $+v::Send, {U+1D4FF}{U+0332}{U+0336}
    $+w::Send, {U+1D500}{U+0332}{U+0336}
    $+x::Send, {U+1D501}{U+0332}{U+0336}
    $+y::Send, {U+1D502}{U+0332}{U+0336}
    $+z::Send, {U+1D503}{U+0332}{U+0336}

    ~Space::Send, {U+0332}{U+0336}

    ~SC029::Send, {U+0332}{U+0336}
    ~+SC029::Send, {U+0332}{U+0336}
    ~+SC002::Send, {U+0332}{U+0336}
    ~+SC003::Send, {U+0332}{U+0336}
    ~+SC004::Send, {U+0332}{U+0336}
    ~+SC005::Send, {U+0332}{U+0336}
    ~+SC006::Send, {U+0332}{U+0336}
    ~+SC007::Send, {U+0332}{U+0336}
    ~+SC008::Send, {U+0332}{U+0336}
    ~+SC009::Send, {U+0332}{U+0336}
    ~+SC00a::Send, {U+0332}{U+0336}
    ~+SC00b::Send, {U+0332}{U+0336}
    ~SC00c::Send, {U+0332}{U+0336}
    ~+SC00c::Send, {U+0332}{U+0336}
    ~SC00d::Send, {U+0332}{U+0336}
    ~+SC00d::Send, {U+0332}{U+0336}
    ~SC01a::Send, {U+0332}{U+0336}
    ~+SC01a::Send, {U+0332}{U+0336}
    ~SC01b::Send, {U+0332}{U+0336}
    ~+SC01b::Send, {U+0332}{U+0336}
    ~SC027::Send, {U+0332}{U+0336}
    ~+SC027::Send, {U+0332}{U+0336}
    ~SC028::Send, {U+0332}{U+0336}
    ~+SC028::Send, {U+0332}{U+0336}
    ~SC02b::Send, {U+0332}{U+0336}
    ~+SC02b::Send, {U+0332}{U+0336}
    ~SC033::Send, {U+0332}{U+0336}
    ~+SC033::Send, {U+0332}{U+0336}
    ~SC034::Send, {U+0332}{U+0336}
    ~+SC034::Send, {U+0332}{U+0336}
    ~SC035::Send, {U+0332}{U+0336}
    ~+SC035::Send, {U+0332}{U+0336}
    ~SC037::Send, {U+0332}{U+0336}
    ~SC04a::Send, {U+0332}{U+0336}
    ~SC04e::Send, {U+0332}{U+0336}
    ~SC053::Send, {U+0332}{U+0336}
}
return


;------------------------------------------------------------------------------------------------;

; Fraktur Font

;------------------------------------------------------------------------------------------------;

;Original Modifiers
#If Fraktur and modifier = "Default" and Caps = "Off"
{
    $a::Send, {U+1D51E}
    $b::Send, {U+1D51F}
    $c::Send, {U+1D520}
    $d::Send, {U+1D521}
    $e::Send, {U+1D522}
    $f::Send, {U+1D523}
    $g::Send, {U+1D524}
    $h::Send, {U+1D525}
    $i::Send, {U+1D526}
    $j::Send, {U+1D527}
    $k::Send, {U+1D528}
    $l::Send, {U+1D529}
    $m::Send, {U+1D52A}
    $n::Send, {U+1D52B}
    $o::Send, {U+1D52C}
    $p::Send, {U+1D52D}
    $q::Send, {U+1D52E}
    $r::Send, {U+1D52F}
    $s::Send, {U+1D530}
    $t::Send, {U+1D531}
    $u::Send, {U+1D532}
    $v::Send, {U+1D533}
    $w::Send, {U+1D534}
    $x::Send, {U+1D535}
    $y::Send, {U+1D536}
    $z::Send, {U+1D537}

    $+a::Send, {U+1D504}
    $+b::Send, {U+1D505}
    $+c::Send, {U+212D}
    $+d::Send, {U+1D507}
    $+e::Send, {U+1D508}
    $+f::Send, {U+1D509}
    $+g::Send, {U+1D50A}
    $+h::Send, {U+210C}
    $+i::Send, {U+2111}
    $+j::Send, {U+1D50D}
    $+k::Send, {U+1D50E}
    $+l::Send, {U+1D50F}
    $+m::Send, {U+1D510}
    $+n::Send, {U+1D511}
    $+o::Send, {U+1D512}
    $+p::Send, {U+1D513}
    $+q::Send, {U+1D514}
    $+r::Send, {U+211C}
    $+s::Send, {U+1D516}
    $+t::Send, {U+1D517}
    $+u::Send, {U+1D518}
    $+v::Send, {U+1D519}
    $+w::Send, {U+1D51A}
    $+x::Send, {U+1D51B}
    $+y::Send, {U+1D51C}
    $+z::Send, {U+2128}
}
return

#If Fraktur and modifier = "Default" and Caps = "On"
{
    $a::Send, {U+1D504}
    $b::Send, {U+1D505}
    $c::Send, {U+212D}
    $d::Send, {U+1D507}
    $e::Send, {U+1D508}
    $f::Send, {U+1D509}
    $g::Send, {U+1D50A}
    $h::Send, {U+210C}
    $i::Send, {U+2111}
    $j::Send, {U+1D50D}
    $k::Send, {U+1D50E}
    $l::Send, {U+1D50F}
    $m::Send, {U+1D510}
    $n::Send, {U+1D511}
    $o::Send, {U+1D512}
    $p::Send, {U+1D513}
    $q::Send, {U+1D514}
    $r::Send, {U+211C}
    $s::Send, {U+1D516}
    $t::Send, {U+1D517}
    $u::Send, {U+1D518}
    $v::Send, {U+1D519}
    $w::Send, {U+1D51A}
    $x::Send, {U+1D51B}
    $y::Send, {U+1D51C}
    $z::Send, {U+2128}

    $+a::Send, {U+1D51E}
    $+b::Send, {U+1D51F}
    $+c::Send, {U+1D520}
    $+d::Send, {U+1D521}
    $+e::Send, {U+1D522}
    $+f::Send, {U+1D523}
    $+g::Send, {U+1D524}
    $+h::Send, {U+1D525}
    $+i::Send, {U+1D526}
    $+j::Send, {U+1D527}
    $+k::Send, {U+1D528}
    $+l::Send, {U+1D529}
    $+m::Send, {U+1D52A}
    $+n::Send, {U+1D52B}
    $+o::Send, {U+1D52C}
    $+p::Send, {U+1D52D}
    $+q::Send, {U+1D52E}
    $+r::Send, {U+1D52F}
    $+s::Send, {U+1D530}
    $+t::Send, {U+1D531}
    $+u::Send, {U+1D532}
    $+v::Send, {U+1D533}
    $+w::Send, {U+1D534}
    $+x::Send, {U+1D535}
    $+y::Send, {U+1D536}
    $+z::Send, {U+1D537}
}
return

#If Fraktur and modifier = "Bold" and Caps = "Off"
{
    $a::Send, {U+1D586}
    $b::Send, {U+1D587}
    $c::Send, {U+1D588}
    $d::Send, {U+1D589}
    $e::Send, {U+1D58A}
    $f::Send, {U+1D58B}
    $g::Send, {U+1D58C}
    $h::Send, {U+1D58D}
    $i::Send, {U+1D58E}
    $j::Send, {U+1D58F}
    $k::Send, {U+1D590}
    $l::Send, {U+1D591}
    $m::Send, {U+1D592}
    $n::Send, {U+1D593}
    $o::Send, {U+1D594}
    $p::Send, {U+1D595}
    $q::Send, {U+1D596}
    $r::Send, {U+1D597}
    $s::Send, {U+1D598}
    $t::Send, {U+1D599}
    $u::Send, {U+1D59A}
    $v::Send, {U+1D59B}
    $w::Send, {U+1D59C}
    $x::Send, {U+1D59D}
    $y::Send, {U+1D59E}
    $z::Send, {U+1D59F}

    $+a::Send, {U+1D56C}
    $+b::Send, {U+1D56D}
    $+c::Send, {U+1D56E}
    $+d::Send, {U+1D56F}
    $+e::Send, {U+1D570}
    $+f::Send, {U+1D571}
    $+g::Send, {U+1D572}
    $+h::Send, {U+1D573}
    $+i::Send, {U+1D574}
    $+j::Send, {U+1D575}
    $+k::Send, {U+1D576}
    $+l::Send, {U+1D577}
    $+m::Send, {U+1D578}
    $+n::Send, {U+1D579}
    $+o::Send, {U+1D57A}
    $+p::Send, {U+1D57B}
    $+q::Send, {U+1D57C}
    $+r::Send, {U+1D57D}
    $+s::Send, {U+1D57E}
    $+t::Send, {U+1D57F}
    $+u::Send, {U+1D580}
    $+v::Send, {U+1D581}
    $+w::Send, {U+1D582}
    $+x::Send, {U+1D583}
    $+y::Send, {U+1D584}
    $+z::Send, {U+1D585}
}
return

#If Fraktur and modifier = "Bold" and Caps = "On"
{
    $a::Send, {U+1D56C}
    $b::Send, {U+1D56D}
    $c::Send, {U+1D56E}
    $d::Send, {U+1D56F}
    $e::Send, {U+1D570}
    $f::Send, {U+1D571}
    $g::Send, {U+1D572}
    $h::Send, {U+1D573}
    $i::Send, {U+1D574}
    $j::Send, {U+1D575}
    $k::Send, {U+1D576}
    $l::Send, {U+1D577}
    $m::Send, {U+1D578}
    $n::Send, {U+1D579}
    $o::Send, {U+1D57A}
    $p::Send, {U+1D57B}
    $q::Send, {U+1D57C}
    $r::Send, {U+1D57D}
    $s::Send, {U+1D57E}
    $t::Send, {U+1D57F}
    $u::Send, {U+1D580}
    $v::Send, {U+1D581}
    $w::Send, {U+1D582}
    $x::Send, {U+1D583}
    $y::Send, {U+1D584}
    $z::Send, {U+1D585}

    $+a::Send, {U+1D586}
    $+b::Send, {U+1D587}
    $+c::Send, {U+1D588}
    $+d::Send, {U+1D589}
    $+e::Send, {U+1D58A}
    $+f::Send, {U+1D58B}
    $+g::Send, {U+1D58C}
    $+h::Send, {U+1D58D}
    $+i::Send, {U+1D58E}
    $+j::Send, {U+1D58F}
    $+k::Send, {U+1D590}
    $+l::Send, {U+1D591}
    $+m::Send, {U+1D592}
    $+n::Send, {U+1D593}
    $+o::Send, {U+1D594}
    $+p::Send, {U+1D595}
    $+q::Send, {U+1D596}
    $+r::Send, {U+1D597}
    $+s::Send, {U+1D598}
    $+t::Send, {U+1D599}
    $+u::Send, {U+1D59A}
    $+v::Send, {U+1D59B}
    $+w::Send, {U+1D59C}
    $+x::Send, {U+1D59D}
    $+y::Send, {U+1D59E}
    $+z::Send, {U+1D59F}
}
return


;Underline Modifiers
#If Fraktur and modifier = "Underline" and Caps = "Off"
{
    $a::Send, {U+1D51E}{U+0332}
    $b::Send, {U+1D51F}{U+0332}
    $c::Send, {U+1D520}{U+0332}
    $d::Send, {U+1D521}{U+0332}
    $e::Send, {U+1D522}{U+0332}
    $f::Send, {U+1D523}{U+0332}
    $g::Send, {U+1D524}{U+0332}
    $h::Send, {U+1D525}{U+0332}
    $i::Send, {U+1D526}{U+0332}
    $j::Send, {U+1D527}{U+0332}
    $k::Send, {U+1D528}{U+0332}
    $l::Send, {U+1D529}{U+0332}
    $m::Send, {U+1D52A}{U+0332}
    $n::Send, {U+1D52B}{U+0332}
    $o::Send, {U+1D52C}{U+0332}
    $p::Send, {U+1D52D}{U+0332}
    $q::Send, {U+1D52E}{U+0332}
    $r::Send, {U+1D52F}{U+0332}
    $s::Send, {U+1D530}{U+0332}
    $t::Send, {U+1D531}{U+0332}
    $u::Send, {U+1D532}{U+0332}
    $v::Send, {U+1D533}{U+0332}
    $w::Send, {U+1D534}{U+0332}
    $x::Send, {U+1D535}{U+0332}
    $y::Send, {U+1D536}{U+0332}
    $z::Send, {U+1D537}{U+0332}

    $+a::Send, {U+1D504}{U+0332}
    $+b::Send, {U+1D505}{U+0332}
    $+c::Send, {U+212D}{U+0332}
    $+d::Send, {U+1D507}{U+0332}
    $+e::Send, {U+1D508}{U+0332}
    $+f::Send, {U+1D509}{U+0332}
    $+g::Send, {U+1D50A}{U+0332}
    $+h::Send, {U+210C}{U+0332}
    $+i::Send, {U+2111}{U+0332}
    $+j::Send, {U+1D50D}{U+0332}
    $+k::Send, {U+1D50E}{U+0332}
    $+l::Send, {U+1D50F}{U+0332}
    $+m::Send, {U+1D510}{U+0332}
    $+n::Send, {U+1D511}{U+0332}
    $+o::Send, {U+1D512}{U+0332}
    $+p::Send, {U+1D513}{U+0332}
    $+q::Send, {U+1D514}{U+0332}
    $+r::Send, {U+211C}{U+0332}
    $+s::Send, {U+1D516}{U+0332}
    $+t::Send, {U+1D517}{U+0332}
    $+u::Send, {U+1D518}{U+0332}
    $+v::Send, {U+1D519}{U+0332}
    $+w::Send, {U+1D51A}{U+0332}
    $+x::Send, {U+1D51B}{U+0332}
    $+y::Send, {U+1D51C}{U+0332}
    $+z::Send, {U+2128}{U+0332}

    ~Space::Send, {U+0332}

    ~SC029::Send, {U+0332}
    ~+SC029::Send, {U+0332}
    ~+SC002::Send, {U+0332}
    ~+SC003::Send, {U+0332}
    ~+SC004::Send, {U+0332}
    ~+SC005::Send, {U+0332}
    ~+SC006::Send, {U+0332}
    ~+SC007::Send, {U+0332}
    ~+SC008::Send, {U+0332}
    ~+SC009::Send, {U+0332}
    ~+SC00a::Send, {U+0332}
    ~+SC00b::Send, {U+0332}
    ~SC00c::Send, {U+0332}
    ~+SC00c::Send, {U+0332}
    ~SC00d::Send, {U+0332}
    ~+SC00d::Send, {U+0332}
    ~SC01a::Send, {U+0332}
    ~+SC01a::Send, {U+0332}
    ~SC01b::Send, {U+0332}
    ~+SC01b::Send, {U+0332}
    ~SC027::Send, {U+0332}
    ~+SC027::Send, {U+0332}
    ~SC028::Send, {U+0332}
    ~+SC028::Send, {U+0332}
    ~SC02b::Send, {U+0332}
    ~+SC02b::Send, {U+0332}
    ~SC033::Send, {U+0332}
    ~+SC033::Send, {U+0332}
    ~SC034::Send, {U+0332}
    ~+SC034::Send, {U+0332}
    ~SC035::Send, {U+0332}
    ~+SC035::Send, {U+0332}
    ~SC037::Send, {U+0332}
    ~SC04a::Send, {U+0332}
    ~SC04e::Send, {U+0332}
    ~SC053::Send, {U+0332}
}
return

#If Fraktur and modifier = "Underline" and Caps = "On"
{
    $a::Send, {U+1D504}{U+0332}
    $b::Send, {U+1D505}{U+0332}
    $c::Send, {U+212D}{U+0332}
    $d::Send, {U+1D507}{U+0332}
    $e::Send, {U+1D508}{U+0332}
    $f::Send, {U+1D509}{U+0332}
    $g::Send, {U+1D50A}{U+0332}
    $h::Send, {U+210C}{U+0332}
    $i::Send, {U+2111}{U+0332}
    $j::Send, {U+1D50D}{U+0332}
    $k::Send, {U+1D50E}{U+0332}
    $l::Send, {U+1D50F}{U+0332}
    $m::Send, {U+1D510}{U+0332}
    $n::Send, {U+1D511}{U+0332}
    $o::Send, {U+1D512}{U+0332}
    $p::Send, {U+1D513}{U+0332}
    $q::Send, {U+1D514}{U+0332}
    $r::Send, {U+211C}{U+0332}
    $s::Send, {U+1D516}{U+0332}
    $t::Send, {U+1D517}{U+0332}
    $u::Send, {U+1D518}{U+0332}
    $v::Send, {U+1D519}{U+0332}
    $w::Send, {U+1D51A}{U+0332}
    $x::Send, {U+1D51B}{U+0332}
    $y::Send, {U+1D51C}{U+0332}
    $z::Send, {U+2128}{U+0332}

    $+a::Send, {U+1D51E}{U+0332}
    $+b::Send, {U+1D51F}{U+0332}
    $+c::Send, {U+1D520}{U+0332}
    $+d::Send, {U+1D521}{U+0332}
    $+e::Send, {U+1D522}{U+0332}
    $+f::Send, {U+1D523}{U+0332}
    $+g::Send, {U+1D524}{U+0332}
    $+h::Send, {U+1D525}{U+0332}
    $+i::Send, {U+1D526}{U+0332}
    $+j::Send, {U+1D527}{U+0332}
    $+k::Send, {U+1D528}{U+0332}
    $+l::Send, {U+1D529}{U+0332}
    $+m::Send, {U+1D52A}{U+0332}
    $+n::Send, {U+1D52B}{U+0332}
    $+o::Send, {U+1D52C}{U+0332}
    $+p::Send, {U+1D52D}{U+0332}
    $+q::Send, {U+1D52E}{U+0332}
    $+r::Send, {U+1D52F}{U+0332}
    $+s::Send, {U+1D530}{U+0332}
    $+t::Send, {U+1D531}{U+0332}
    $+u::Send, {U+1D532}{U+0332}
    $+v::Send, {U+1D533}{U+0332}
    $+w::Send, {U+1D534}{U+0332}
    $+x::Send, {U+1D535}{U+0332}
    $+y::Send, {U+1D536}{U+0332}
    $+z::Send, {U+1D537}{U+0332}

    ~Space::Send, {U+0332}

    ~SC029::Send, {U+0332}
    ~+SC029::Send, {U+0332}
    ~+SC002::Send, {U+0332}
    ~+SC003::Send, {U+0332}
    ~+SC004::Send, {U+0332}
    ~+SC005::Send, {U+0332}
    ~+SC006::Send, {U+0332}
    ~+SC007::Send, {U+0332}
    ~+SC008::Send, {U+0332}
    ~+SC009::Send, {U+0332}
    ~+SC00a::Send, {U+0332}
    ~+SC00b::Send, {U+0332}
    ~SC00c::Send, {U+0332}
    ~+SC00c::Send, {U+0332}
    ~SC00d::Send, {U+0332}
    ~+SC00d::Send, {U+0332}
    ~SC01a::Send, {U+0332}
    ~+SC01a::Send, {U+0332}
    ~SC01b::Send, {U+0332}
    ~+SC01b::Send, {U+0332}
    ~SC027::Send, {U+0332}
    ~+SC027::Send, {U+0332}
    ~SC028::Send, {U+0332}
    ~+SC028::Send, {U+0332}
    ~SC02b::Send, {U+0332}
    ~+SC02b::Send, {U+0332}
    ~SC033::Send, {U+0332}
    ~+SC033::Send, {U+0332}
    ~SC034::Send, {U+0332}
    ~+SC034::Send, {U+0332}
    ~SC035::Send, {U+0332}
    ~+SC035::Send, {U+0332}
    ~SC037::Send, {U+0332}
    ~SC04a::Send, {U+0332}
    ~SC04e::Send, {U+0332}
    ~SC053::Send, {U+0332}
}
return

#If Fraktur and modifier = "Bold, Underline" and Caps = "Off"
{
    $a::Send, {U+1D586}{U+0332}
    $b::Send, {U+1D587}{U+0332}
    $c::Send, {U+1D588}{U+0332}
    $d::Send, {U+1D589}{U+0332}
    $e::Send, {U+1D58A}{U+0332}
    $f::Send, {U+1D58B}{U+0332}
    $g::Send, {U+1D58C}{U+0332}
    $h::Send, {U+1D58D}{U+0332}
    $i::Send, {U+1D58E}{U+0332}
    $j::Send, {U+1D58F}{U+0332}
    $k::Send, {U+1D590}{U+0332}
    $l::Send, {U+1D591}{U+0332}
    $m::Send, {U+1D592}{U+0332}
    $n::Send, {U+1D593}{U+0332}
    $o::Send, {U+1D594}{U+0332}
    $p::Send, {U+1D595}{U+0332}
    $q::Send, {U+1D596}{U+0332}
    $r::Send, {U+1D597}{U+0332}
    $s::Send, {U+1D598}{U+0332}
    $t::Send, {U+1D599}{U+0332}
    $u::Send, {U+1D59A}{U+0332}
    $v::Send, {U+1D59B}{U+0332}
    $w::Send, {U+1D59C}{U+0332}
    $x::Send, {U+1D59D}{U+0332}
    $y::Send, {U+1D59E}{U+0332}
    $z::Send, {U+1D59F}{U+0332}

    $+a::Send, {U+1D56C}{U+0332}
    $+b::Send, {U+1D56D}{U+0332}
    $+c::Send, {U+1D56E}{U+0332}
    $+d::Send, {U+1D56F}{U+0332}
    $+e::Send, {U+1D570}{U+0332}
    $+f::Send, {U+1D571}{U+0332}
    $+g::Send, {U+1D572}{U+0332}
    $+h::Send, {U+1D573}{U+0332}
    $+i::Send, {U+1D574}{U+0332}
    $+j::Send, {U+1D575}{U+0332}
    $+k::Send, {U+1D576}{U+0332}
    $+l::Send, {U+1D577}{U+0332}
    $+m::Send, {U+1D578}{U+0332}
    $+n::Send, {U+1D579}{U+0332}
    $+o::Send, {U+1D57A}{U+0332}
    $+p::Send, {U+1D57B}{U+0332}
    $+q::Send, {U+1D57C}{U+0332}
    $+r::Send, {U+1D57D}{U+0332}
    $+s::Send, {U+1D57E}{U+0332}
    $+t::Send, {U+1D57F}{U+0332}
    $+u::Send, {U+1D580}{U+0332}
    $+v::Send, {U+1D581}{U+0332}
    $+w::Send, {U+1D582}{U+0332}
    $+x::Send, {U+1D583}{U+0332}
    $+y::Send, {U+1D584}{U+0332}
    $+z::Send, {U+1D585}{U+0332}

    ~Space::Send, {U+0332}

    ~SC029::Send, {U+0332}
    ~+SC029::Send, {U+0332}
    ~+SC002::Send, {U+0332}
    ~+SC003::Send, {U+0332}
    ~+SC004::Send, {U+0332}
    ~+SC005::Send, {U+0332}
    ~+SC006::Send, {U+0332}
    ~+SC007::Send, {U+0332}
    ~+SC008::Send, {U+0332}
    ~+SC009::Send, {U+0332}
    ~+SC00a::Send, {U+0332}
    ~+SC00b::Send, {U+0332}
    ~SC00c::Send, {U+0332}
    ~+SC00c::Send, {U+0332}
    ~SC00d::Send, {U+0332}
    ~+SC00d::Send, {U+0332}
    ~SC01a::Send, {U+0332}
    ~+SC01a::Send, {U+0332}
    ~SC01b::Send, {U+0332}
    ~+SC01b::Send, {U+0332}
    ~SC027::Send, {U+0332}
    ~+SC027::Send, {U+0332}
    ~SC028::Send, {U+0332}
    ~+SC028::Send, {U+0332}
    ~SC02b::Send, {U+0332}
    ~+SC02b::Send, {U+0332}
    ~SC033::Send, {U+0332}
    ~+SC033::Send, {U+0332}
    ~SC034::Send, {U+0332}
    ~+SC034::Send, {U+0332}
    ~SC035::Send, {U+0332}
    ~+SC035::Send, {U+0332}
    ~SC037::Send, {U+0332}
    ~SC04a::Send, {U+0332}
    ~SC04e::Send, {U+0332}
    ~SC053::Send, {U+0332}
}
return

#If Fraktur and modifier = "Bold, Underline" and Caps = "On"
{
    $a::Send, {U+1D56C}{U+0332}
    $b::Send, {U+1D56D}{U+0332}
    $c::Send, {U+1D56E}{U+0332}
    $d::Send, {U+1D56F}{U+0332}
    $e::Send, {U+1D570}{U+0332}
    $f::Send, {U+1D571}{U+0332}
    $g::Send, {U+1D572}{U+0332}
    $h::Send, {U+1D573}{U+0332}
    $i::Send, {U+1D574}{U+0332}
    $j::Send, {U+1D575}{U+0332}
    $k::Send, {U+1D576}{U+0332}
    $l::Send, {U+1D577}{U+0332}
    $m::Send, {U+1D578}{U+0332}
    $n::Send, {U+1D579}{U+0332}
    $o::Send, {U+1D57A}{U+0332}
    $p::Send, {U+1D57B}{U+0332}
    $q::Send, {U+1D57C}{U+0332}
    $r::Send, {U+1D57D}{U+0332}
    $s::Send, {U+1D57E}{U+0332}
    $t::Send, {U+1D57F}{U+0332}
    $u::Send, {U+1D580}{U+0332}
    $v::Send, {U+1D581}{U+0332}
    $w::Send, {U+1D582}{U+0332}
    $x::Send, {U+1D583}{U+0332}
    $y::Send, {U+1D584}{U+0332}
    $z::Send, {U+1D585}{U+0332}

    $+a::Send, {U+1D586}{U+0332}
    $+b::Send, {U+1D587}{U+0332}
    $+c::Send, {U+1D588}{U+0332}
    $+d::Send, {U+1D589}{U+0332}
    $+e::Send, {U+1D58A}{U+0332}
    $+f::Send, {U+1D58B}{U+0332}
    $+g::Send, {U+1D58C}{U+0332}
    $+h::Send, {U+1D58D}{U+0332}
    $+i::Send, {U+1D58E}{U+0332}
    $+j::Send, {U+1D58F}{U+0332}
    $+k::Send, {U+1D590}{U+0332}
    $+l::Send, {U+1D591}{U+0332}
    $+m::Send, {U+1D592}{U+0332}
    $+n::Send, {U+1D593}{U+0332}
    $+o::Send, {U+1D594}{U+0332}
    $+p::Send, {U+1D595}{U+0332}
    $+q::Send, {U+1D596}{U+0332}
    $+r::Send, {U+1D597}{U+0332}
    $+s::Send, {U+1D598}{U+0332}
    $+t::Send, {U+1D599}{U+0332}
    $+u::Send, {U+1D59A}{U+0332}
    $+v::Send, {U+1D59B}{U+0332}
    $+w::Send, {U+1D59C}{U+0332}
    $+x::Send, {U+1D59D}{U+0332}
    $+y::Send, {U+1D59E}{U+0332}
    $+z::Send, {U+1D59F}{U+0332}

    ~Space::Send, {U+0332}

    ~SC029::Send, {U+0332}
    ~+SC029::Send, {U+0332}
    ~+SC002::Send, {U+0332}
    ~+SC003::Send, {U+0332}
    ~+SC004::Send, {U+0332}
    ~+SC005::Send, {U+0332}
    ~+SC006::Send, {U+0332}
    ~+SC007::Send, {U+0332}
    ~+SC008::Send, {U+0332}
    ~+SC009::Send, {U+0332}
    ~+SC00a::Send, {U+0332}
    ~+SC00b::Send, {U+0332}
    ~SC00c::Send, {U+0332}
    ~+SC00c::Send, {U+0332}
    ~SC00d::Send, {U+0332}
    ~+SC00d::Send, {U+0332}
    ~SC01a::Send, {U+0332}
    ~+SC01a::Send, {U+0332}
    ~SC01b::Send, {U+0332}
    ~+SC01b::Send, {U+0332}
    ~SC027::Send, {U+0332}
    ~+SC027::Send, {U+0332}
    ~SC028::Send, {U+0332}
    ~+SC028::Send, {U+0332}
    ~SC02b::Send, {U+0332}
    ~+SC02b::Send, {U+0332}
    ~SC033::Send, {U+0332}
    ~+SC033::Send, {U+0332}
    ~SC034::Send, {U+0332}
    ~+SC034::Send, {U+0332}
    ~SC035::Send, {U+0332}
    ~+SC035::Send, {U+0332}
    ~SC037::Send, {U+0332}
    ~SC04a::Send, {U+0332}
    ~SC04e::Send, {U+0332}
    ~SC053::Send, {U+0332}
}
return


;Strikethrough Modifiers
#If Fraktur and modifier = "Strikethrough" and Caps = "Off"
{
    $a::Send, {U+1D51E}{U+0336}
    $b::Send, {U+1D51F}{U+0336}
    $c::Send, {U+1D520}{U+0336}
    $d::Send, {U+1D521}{U+0336}
    $e::Send, {U+1D522}{U+0336}
    $f::Send, {U+1D523}{U+0336}
    $g::Send, {U+1D524}{U+0336}
    $h::Send, {U+1D525}{U+0336}
    $i::Send, {U+1D526}{U+0336}
    $j::Send, {U+1D527}{U+0336}
    $k::Send, {U+1D528}{U+0336}
    $l::Send, {U+1D529}{U+0336}
    $m::Send, {U+1D52A}{U+0336}
    $n::Send, {U+1D52B}{U+0336}
    $o::Send, {U+1D52C}{U+0336}
    $p::Send, {U+1D52D}{U+0336}
    $q::Send, {U+1D52E}{U+0336}
    $r::Send, {U+1D52F}{U+0336}
    $s::Send, {U+1D530}{U+0336}
    $t::Send, {U+1D531}{U+0336}
    $u::Send, {U+1D532}{U+0336}
    $v::Send, {U+1D533}{U+0336}
    $w::Send, {U+1D534}{U+0336}
    $x::Send, {U+1D535}{U+0336}
    $y::Send, {U+1D536}{U+0336}
    $z::Send, {U+1D537}{U+0336}

    $+a::Send, {U+1D504}{U+0336}
    $+b::Send, {U+1D505}{U+0336}
    $+c::Send, {U+212D}{U+0336}
    $+d::Send, {U+1D507}{U+0336}
    $+e::Send, {U+1D508}{U+0336}
    $+f::Send, {U+1D509}{U+0336}
    $+g::Send, {U+1D50A}{U+0336}
    $+h::Send, {U+210C}{U+0336}
    $+i::Send, {U+2111}{U+0336}
    $+j::Send, {U+1D50D}{U+0336}
    $+k::Send, {U+1D50E}{U+0336}
    $+l::Send, {U+1D50F}{U+0336}
    $+m::Send, {U+1D510}{U+0336}
    $+n::Send, {U+1D511}{U+0336}
    $+o::Send, {U+1D512}{U+0336}
    $+p::Send, {U+1D513}{U+0336}
    $+q::Send, {U+1D514}{U+0336}
    $+r::Send, {U+211C}{U+0336}
    $+s::Send, {U+1D516}{U+0336}
    $+t::Send, {U+1D517}{U+0336}
    $+u::Send, {U+1D518}{U+0336}
    $+v::Send, {U+1D519}{U+0336}
    $+w::Send, {U+1D51A}{U+0336}
    $+x::Send, {U+1D51B}{U+0336}
    $+y::Send, {U+1D51C}{U+0336}
    $+z::Send, {U+2128}{U+0336}

    ~Space::Send, {U+0336}

    ~SC029::Send, {U+0336}
    ~+SC029::Send, {U+0336}
    ~+SC002::Send, {U+0336}
    ~+SC003::Send, {U+0336}
    ~+SC004::Send, {U+0336}
    ~+SC005::Send, {U+0336}
    ~+SC006::Send, {U+0336}
    ~+SC007::Send, {U+0336}
    ~+SC008::Send, {U+0336}
    ~+SC009::Send, {U+0336}
    ~+SC00a::Send, {U+0336}
    ~+SC00b::Send, {U+0336}
    ~SC00c::Send, {U+0336}
    ~+SC00c::Send, {U+0336}
    ~SC00d::Send, {U+0336}
    ~+SC00d::Send, {U+0336}
    ~SC01a::Send, {U+0336}
    ~+SC01a::Send, {U+0336}
    ~SC01b::Send, {U+0336}
    ~+SC01b::Send, {U+0336}
    ~SC027::Send, {U+0336}
    ~+SC027::Send, {U+0336}
    ~SC028::Send, {U+0336}
    ~+SC028::Send, {U+0336}
    ~SC02b::Send, {U+0336}
    ~+SC02b::Send, {U+0336}
    ~SC033::Send, {U+0336}
    ~+SC033::Send, {U+0336}
    ~SC034::Send, {U+0336}
    ~+SC034::Send, {U+0336}
    ~SC035::Send, {U+0336}
    ~+SC035::Send, {U+0336}
    ~SC037::Send, {U+0336}
    ~SC04a::Send, {U+0336}
    ~SC04e::Send, {U+0336}
    ~SC053::Send, {U+0336}
}
return

#If Fraktur and modifier = "Strikethrough" and Caps = "On"
{
    $a::Send, {U+1D504}{U+0336}
    $b::Send, {U+1D505}{U+0336}
    $c::Send, {U+212D}{U+0336}
    $d::Send, {U+1D507}{U+0336}
    $e::Send, {U+1D508}{U+0336}
    $f::Send, {U+1D509}{U+0336}
    $g::Send, {U+1D50A}{U+0336}
    $h::Send, {U+210C}{U+0336}
    $i::Send, {U+2111}{U+0336}
    $j::Send, {U+1D50D}{U+0336}
    $k::Send, {U+1D50E}{U+0336}
    $l::Send, {U+1D50F}{U+0336}
    $m::Send, {U+1D510}{U+0336}
    $n::Send, {U+1D511}{U+0336}
    $o::Send, {U+1D512}{U+0336}
    $p::Send, {U+1D513}{U+0336}
    $q::Send, {U+1D514}{U+0336}
    $r::Send, {U+211C}{U+0336}
    $s::Send, {U+1D516}{U+0336}
    $t::Send, {U+1D517}{U+0336}
    $u::Send, {U+1D518}{U+0336}
    $v::Send, {U+1D519}{U+0336}
    $w::Send, {U+1D51A}{U+0336}
    $x::Send, {U+1D51B}{U+0336}
    $y::Send, {U+1D51C}{U+0336}
    $z::Send, {U+2128}{U+0336}

    $+a::Send, {U+1D51E}{U+0336}
    $+b::Send, {U+1D51F}{U+0336}
    $+c::Send, {U+1D520}{U+0336}
    $+d::Send, {U+1D521}{U+0336}
    $+e::Send, {U+1D522}{U+0336}
    $+f::Send, {U+1D523}{U+0336}
    $+g::Send, {U+1D524}{U+0336}
    $+h::Send, {U+1D525}{U+0336}
    $+i::Send, {U+1D526}{U+0336}
    $+j::Send, {U+1D527}{U+0336}
    $+k::Send, {U+1D528}{U+0336}
    $+l::Send, {U+1D529}{U+0336}
    $+m::Send, {U+1D52A}{U+0336}
    $+n::Send, {U+1D52B}{U+0336}
    $+o::Send, {U+1D52C}{U+0336}
    $+p::Send, {U+1D52D}{U+0336}
    $+q::Send, {U+1D52E}{U+0336}
    $+r::Send, {U+1D52F}{U+0336}
    $+s::Send, {U+1D530}{U+0336}
    $+t::Send, {U+1D531}{U+0336}
    $+u::Send, {U+1D532}{U+0336}
    $+v::Send, {U+1D533}{U+0336}
    $+w::Send, {U+1D534}{U+0336}
    $+x::Send, {U+1D535}{U+0336}
    $+y::Send, {U+1D536}{U+0336}
    $+z::Send, {U+1D537}{U+0336}

    ~Space::Send, {U+0336}

    ~SC029::Send, {U+0336}
    ~+SC029::Send, {U+0336}
    ~+SC002::Send, {U+0336}
    ~+SC003::Send, {U+0336}
    ~+SC004::Send, {U+0336}
    ~+SC005::Send, {U+0336}
    ~+SC006::Send, {U+0336}
    ~+SC007::Send, {U+0336}
    ~+SC008::Send, {U+0336}
    ~+SC009::Send, {U+0336}
    ~+SC00a::Send, {U+0336}
    ~+SC00b::Send, {U+0336}
    ~SC00c::Send, {U+0336}
    ~+SC00c::Send, {U+0336}
    ~SC00d::Send, {U+0336}
    ~+SC00d::Send, {U+0336}
    ~SC01a::Send, {U+0336}
    ~+SC01a::Send, {U+0336}
    ~SC01b::Send, {U+0336}
    ~+SC01b::Send, {U+0336}
    ~SC027::Send, {U+0336}
    ~+SC027::Send, {U+0336}
    ~SC028::Send, {U+0336}
    ~+SC028::Send, {U+0336}
    ~SC02b::Send, {U+0336}
    ~+SC02b::Send, {U+0336}
    ~SC033::Send, {U+0336}
    ~+SC033::Send, {U+0336}
    ~SC034::Send, {U+0336}
    ~+SC034::Send, {U+0336}
    ~SC035::Send, {U+0336}
    ~+SC035::Send, {U+0336}
    ~SC037::Send, {U+0336}
    ~SC04a::Send, {U+0336}
    ~SC04e::Send, {U+0336}
    ~SC053::Send, {U+0336}
}
return

#If Fraktur and modifier = "Bold, Strikethrough" and Caps = "Off"
{
    $a::Send, {U+1D586}{U+0336}
    $b::Send, {U+1D587}{U+0336}
    $c::Send, {U+1D588}{U+0336}
    $d::Send, {U+1D589}{U+0336}
    $e::Send, {U+1D58A}{U+0336}
    $f::Send, {U+1D58B}{U+0336}
    $g::Send, {U+1D58C}{U+0336}
    $h::Send, {U+1D58D}{U+0336}
    $i::Send, {U+1D58E}{U+0336}
    $j::Send, {U+1D58F}{U+0336}
    $k::Send, {U+1D590}{U+0336}
    $l::Send, {U+1D591}{U+0336}
    $m::Send, {U+1D592}{U+0336}
    $n::Send, {U+1D593}{U+0336}
    $o::Send, {U+1D594}{U+0336}
    $p::Send, {U+1D595}{U+0336}
    $q::Send, {U+1D596}{U+0336}
    $r::Send, {U+1D597}{U+0336}
    $s::Send, {U+1D598}{U+0336}
    $t::Send, {U+1D599}{U+0336}
    $u::Send, {U+1D59A}{U+0336}
    $v::Send, {U+1D59B}{U+0336}
    $w::Send, {U+1D59C}{U+0336}
    $x::Send, {U+1D59D}{U+0336}
    $y::Send, {U+1D59E}{U+0336}
    $z::Send, {U+1D59F}{U+0336}

    $+a::Send, {U+1D56C}{U+0336}
    $+b::Send, {U+1D56D}{U+0336}
    $+c::Send, {U+1D56E}{U+0336}
    $+d::Send, {U+1D56F}{U+0336}
    $+e::Send, {U+1D570}{U+0336}
    $+f::Send, {U+1D571}{U+0336}
    $+g::Send, {U+1D572}{U+0336}
    $+h::Send, {U+1D573}{U+0336}
    $+i::Send, {U+1D574}{U+0336}
    $+j::Send, {U+1D575}{U+0336}
    $+k::Send, {U+1D576}{U+0336}
    $+l::Send, {U+1D577}{U+0336}
    $+m::Send, {U+1D578}{U+0336}
    $+n::Send, {U+1D579}{U+0336}
    $+o::Send, {U+1D57A}{U+0336}
    $+p::Send, {U+1D57B}{U+0336}
    $+q::Send, {U+1D57C}{U+0336}
    $+r::Send, {U+1D57D}{U+0336}
    $+s::Send, {U+1D57E}{U+0336}
    $+t::Send, {U+1D57F}{U+0336}
    $+u::Send, {U+1D580}{U+0336}
    $+v::Send, {U+1D581}{U+0336}
    $+w::Send, {U+1D582}{U+0336}
    $+x::Send, {U+1D583}{U+0336}
    $+y::Send, {U+1D584}{U+0336}
    $+z::Send, {U+1D585}{U+0336}

    ~Space::Send, {U+0336}

    ~SC029::Send, {U+0336}
    ~+SC029::Send, {U+0336}
    ~+SC002::Send, {U+0336}
    ~+SC003::Send, {U+0336}
    ~+SC004::Send, {U+0336}
    ~+SC005::Send, {U+0336}
    ~+SC006::Send, {U+0336}
    ~+SC007::Send, {U+0336}
    ~+SC008::Send, {U+0336}
    ~+SC009::Send, {U+0336}
    ~+SC00a::Send, {U+0336}
    ~+SC00b::Send, {U+0336}
    ~SC00c::Send, {U+0336}
    ~+SC00c::Send, {U+0336}
    ~SC00d::Send, {U+0336}
    ~+SC00d::Send, {U+0336}
    ~SC01a::Send, {U+0336}
    ~+SC01a::Send, {U+0336}
    ~SC01b::Send, {U+0336}
    ~+SC01b::Send, {U+0336}
    ~SC027::Send, {U+0336}
    ~+SC027::Send, {U+0336}
    ~SC028::Send, {U+0336}
    ~+SC028::Send, {U+0336}
    ~SC02b::Send, {U+0336}
    ~+SC02b::Send, {U+0336}
    ~SC033::Send, {U+0336}
    ~+SC033::Send, {U+0336}
    ~SC034::Send, {U+0336}
    ~+SC034::Send, {U+0336}
    ~SC035::Send, {U+0336}
    ~+SC035::Send, {U+0336}
    ~SC037::Send, {U+0336}
    ~SC04a::Send, {U+0336}
    ~SC04e::Send, {U+0336}
    ~SC053::Send, {U+0336}
}
return

#If Fraktur and modifier = "Bold, Strikethrough" and Caps = "On"
{
    $a::Send, {U+1D56C}{U+0336}
    $b::Send, {U+1D56D}{U+0336}
    $c::Send, {U+1D56E}{U+0336}
    $d::Send, {U+1D56F}{U+0336}
    $e::Send, {U+1D570}{U+0336}
    $f::Send, {U+1D571}{U+0336}
    $g::Send, {U+1D572}{U+0336}
    $h::Send, {U+1D573}{U+0336}
    $i::Send, {U+1D574}{U+0336}
    $j::Send, {U+1D575}{U+0336}
    $k::Send, {U+1D576}{U+0336}
    $l::Send, {U+1D577}{U+0336}
    $m::Send, {U+1D578}{U+0336}
    $n::Send, {U+1D579}{U+0336}
    $o::Send, {U+1D57A}{U+0336}
    $p::Send, {U+1D57B}{U+0336}
    $q::Send, {U+1D57C}{U+0336}
    $r::Send, {U+1D57D}{U+0336}
    $s::Send, {U+1D57E}{U+0336}
    $t::Send, {U+1D57F}{U+0336}
    $u::Send, {U+1D580}{U+0336}
    $v::Send, {U+1D581}{U+0336}
    $w::Send, {U+1D582}{U+0336}
    $x::Send, {U+1D583}{U+0336}
    $y::Send, {U+1D584}{U+0336}
    $z::Send, {U+1D585}{U+0336}

    $+a::Send, {U+1D586}{U+0336}
    $+b::Send, {U+1D587}{U+0336}
    $+c::Send, {U+1D588}{U+0336}
    $+d::Send, {U+1D589}{U+0336}
    $+e::Send, {U+1D58A}{U+0336}
    $+f::Send, {U+1D58B}{U+0336}
    $+g::Send, {U+1D58C}{U+0336}
    $+h::Send, {U+1D58D}{U+0336}
    $+i::Send, {U+1D58E}{U+0336}
    $+j::Send, {U+1D58F}{U+0336}
    $+k::Send, {U+1D590}{U+0336}
    $+l::Send, {U+1D591}{U+0336}
    $+m::Send, {U+1D592}{U+0336}
    $+n::Send, {U+1D593}{U+0336}
    $+o::Send, {U+1D594}{U+0336}
    $+p::Send, {U+1D595}{U+0336}
    $+q::Send, {U+1D596}{U+0336}
    $+r::Send, {U+1D597}{U+0336}
    $+s::Send, {U+1D598}{U+0336}
    $+t::Send, {U+1D599}{U+0336}
    $+u::Send, {U+1D59A}{U+0336}
    $+v::Send, {U+1D59B}{U+0336}
    $+w::Send, {U+1D59C}{U+0336}
    $+x::Send, {U+1D59D}{U+0336}
    $+y::Send, {U+1D59E}{U+0336}
    $+z::Send, {U+1D59F}{U+0336}

    ~Space::Send, {U+0336}

    ~SC029::Send, {U+0336}
    ~+SC029::Send, {U+0336}
    ~+SC002::Send, {U+0336}
    ~+SC003::Send, {U+0336}
    ~+SC004::Send, {U+0336}
    ~+SC005::Send, {U+0336}
    ~+SC006::Send, {U+0336}
    ~+SC007::Send, {U+0336}
    ~+SC008::Send, {U+0336}
    ~+SC009::Send, {U+0336}
    ~+SC00a::Send, {U+0336}
    ~+SC00b::Send, {U+0336}
    ~SC00c::Send, {U+0336}
    ~+SC00c::Send, {U+0336}
    ~SC00d::Send, {U+0336}
    ~+SC00d::Send, {U+0336}
    ~SC01a::Send, {U+0336}
    ~+SC01a::Send, {U+0336}
    ~SC01b::Send, {U+0336}
    ~+SC01b::Send, {U+0336}
    ~SC027::Send, {U+0336}
    ~+SC027::Send, {U+0336}
    ~SC028::Send, {U+0336}
    ~+SC028::Send, {U+0336}
    ~SC02b::Send, {U+0336}
    ~+SC02b::Send, {U+0336}
    ~SC033::Send, {U+0336}
    ~+SC033::Send, {U+0336}
    ~SC034::Send, {U+0336}
    ~+SC034::Send, {U+0336}
    ~SC035::Send, {U+0336}
    ~+SC035::Send, {U+0336}
    ~SC037::Send, {U+0336}
    ~SC04a::Send, {U+0336}
    ~SC04e::Send, {U+0336}
    ~SC053::Send, {U+0336}
}
return


;Underline and Strikethrough Modifiers
#If Fraktur and modifier = "Underline, Strikethrough" and Caps = "Off"
{
    $a::Send, {U+1D51E}{U+0332}{U+0336}
    $b::Send, {U+1D51F}{U+0332}{U+0336}
    $c::Send, {U+1D520}{U+0332}{U+0336}
    $d::Send, {U+1D521}{U+0332}{U+0336}
    $e::Send, {U+1D522}{U+0332}{U+0336}
    $f::Send, {U+1D523}{U+0332}{U+0336}
    $g::Send, {U+1D524}{U+0332}{U+0336}
    $h::Send, {U+1D525}{U+0332}{U+0336}
    $i::Send, {U+1D526}{U+0332}{U+0336}
    $j::Send, {U+1D527}{U+0332}{U+0336}
    $k::Send, {U+1D528}{U+0332}{U+0336}
    $l::Send, {U+1D529}{U+0332}{U+0336}
    $m::Send, {U+1D52A}{U+0332}{U+0336}
    $n::Send, {U+1D52B}{U+0332}{U+0336}
    $o::Send, {U+1D52C}{U+0332}{U+0336}
    $p::Send, {U+1D52D}{U+0332}{U+0336}
    $q::Send, {U+1D52E}{U+0332}{U+0336}
    $r::Send, {U+1D52F}{U+0332}{U+0336}
    $s::Send, {U+1D530}{U+0332}{U+0336}
    $t::Send, {U+1D531}{U+0332}{U+0336}
    $u::Send, {U+1D532}{U+0332}{U+0336}
    $v::Send, {U+1D533}{U+0332}{U+0336}
    $w::Send, {U+1D534}{U+0332}{U+0336}
    $x::Send, {U+1D535}{U+0332}{U+0336}
    $y::Send, {U+1D536}{U+0332}{U+0336}
    $z::Send, {U+1D537}{U+0332}{U+0336}

    $+a::Send, {U+1D504}{U+0332}{U+0336}
    $+b::Send, {U+1D505}{U+0332}{U+0336}
    $+c::Send, {U+212D}{U+0332}{U+0336}
    $+d::Send, {U+1D507}{U+0332}{U+0336}
    $+e::Send, {U+1D508}{U+0332}{U+0336}
    $+f::Send, {U+1D509}{U+0332}{U+0336}
    $+g::Send, {U+1D50A}{U+0332}{U+0336}
    $+h::Send, {U+210C}{U+0332}{U+0336}
    $+i::Send, {U+2111}{U+0332}{U+0336}
    $+j::Send, {U+1D50D}{U+0332}{U+0336}
    $+k::Send, {U+1D50E}{U+0332}{U+0336}
    $+l::Send, {U+1D50F}{U+0332}{U+0336}
    $+m::Send, {U+1D510}{U+0332}{U+0336}
    $+n::Send, {U+1D511}{U+0332}{U+0336}
    $+o::Send, {U+1D512}{U+0332}{U+0336}
    $+p::Send, {U+1D513}{U+0332}{U+0336}
    $+q::Send, {U+1D514}{U+0332}{U+0336}
    $+r::Send, {U+211C}{U+0332}{U+0336}
    $+s::Send, {U+1D516}{U+0332}{U+0336}
    $+t::Send, {U+1D517}{U+0332}{U+0336}
    $+u::Send, {U+1D518}{U+0332}{U+0336}
    $+v::Send, {U+1D519}{U+0332}{U+0336}
    $+w::Send, {U+1D51A}{U+0332}{U+0336}
    $+x::Send, {U+1D51B}{U+0332}{U+0336}
    $+y::Send, {U+1D51C}{U+0332}{U+0336}
    $+z::Send, {U+2128}{U+0332}{U+0336}

    ~Space::Send, {U+0332}{U+0336}

    ~SC029::Send, {U+0332}{U+0336}
    ~+SC029::Send, {U+0332}{U+0336}
    ~+SC002::Send, {U+0332}{U+0336}
    ~+SC003::Send, {U+0332}{U+0336}
    ~+SC004::Send, {U+0332}{U+0336}
    ~+SC005::Send, {U+0332}{U+0336}
    ~+SC006::Send, {U+0332}{U+0336}
    ~+SC007::Send, {U+0332}{U+0336}
    ~+SC008::Send, {U+0332}{U+0336}
    ~+SC009::Send, {U+0332}{U+0336}
    ~+SC00a::Send, {U+0332}{U+0336}
    ~+SC00b::Send, {U+0332}{U+0336}
    ~SC00c::Send, {U+0332}{U+0336}
    ~+SC00c::Send, {U+0332}{U+0336}
    ~SC00d::Send, {U+0332}{U+0336}
    ~+SC00d::Send, {U+0332}{U+0336}
    ~SC01a::Send, {U+0332}{U+0336}
    ~+SC01a::Send, {U+0332}{U+0336}
    ~SC01b::Send, {U+0332}{U+0336}
    ~+SC01b::Send, {U+0332}{U+0336}
    ~SC027::Send, {U+0332}{U+0336}
    ~+SC027::Send, {U+0332}{U+0336}
    ~SC028::Send, {U+0332}{U+0336}
    ~+SC028::Send, {U+0332}{U+0336}
    ~SC02b::Send, {U+0332}{U+0336}
    ~+SC02b::Send, {U+0332}{U+0336}
    ~SC033::Send, {U+0332}{U+0336}
    ~+SC033::Send, {U+0332}{U+0336}
    ~SC034::Send, {U+0332}{U+0336}
    ~+SC034::Send, {U+0332}{U+0336}
    ~SC035::Send, {U+0332}{U+0336}
    ~+SC035::Send, {U+0332}{U+0336}
    ~SC037::Send, {U+0332}{U+0336}
    ~SC04a::Send, {U+0332}{U+0336}
    ~SC04e::Send, {U+0332}{U+0336}
    ~SC053::Send, {U+0332}{U+0336}
}
return

#If Fraktur and modifier = "Underline, Strikethrough" and Caps = "On"
{
    $a::Send, {U+1D504}{U+0332}{U+0336}
    $b::Send, {U+1D505}{U+0332}{U+0336}
    $c::Send, {U+212D}{U+0332}{U+0336}
    $d::Send, {U+1D507}{U+0332}{U+0336}
    $e::Send, {U+1D508}{U+0332}{U+0336}
    $f::Send, {U+1D509}{U+0332}{U+0336}
    $g::Send, {U+1D50A}{U+0332}{U+0336}
    $h::Send, {U+210C}{U+0332}{U+0336}
    $i::Send, {U+2111}{U+0332}{U+0336}
    $j::Send, {U+1D50D}{U+0332}{U+0336}
    $k::Send, {U+1D50E}{U+0332}{U+0336}
    $l::Send, {U+1D50F}{U+0332}{U+0336}
    $m::Send, {U+1D510}{U+0332}{U+0336}
    $n::Send, {U+1D511}{U+0332}{U+0336}
    $o::Send, {U+1D512}{U+0332}{U+0336}
    $p::Send, {U+1D513}{U+0332}{U+0336}
    $q::Send, {U+1D514}{U+0332}{U+0336}
    $r::Send, {U+211C}{U+0332}{U+0336}
    $s::Send, {U+1D516}{U+0332}{U+0336}
    $t::Send, {U+1D517}{U+0332}{U+0336}
    $u::Send, {U+1D518}{U+0332}{U+0336}
    $v::Send, {U+1D519}{U+0332}{U+0336}
    $w::Send, {U+1D51A}{U+0332}{U+0336}
    $x::Send, {U+1D51B}{U+0332}{U+0336}
    $y::Send, {U+1D51C}{U+0332}{U+0336}
    $z::Send, {U+2128}{U+0332}{U+0336}

    $+a::Send, {U+1D51E}{U+0332}{U+0336}
    $+b::Send, {U+1D51F}{U+0332}{U+0336}
    $+c::Send, {U+1D520}{U+0332}{U+0336}
    $+d::Send, {U+1D521}{U+0332}{U+0336}
    $+e::Send, {U+1D522}{U+0332}{U+0336}
    $+f::Send, {U+1D523}{U+0332}{U+0336}
    $+g::Send, {U+1D524}{U+0332}{U+0336}
    $+h::Send, {U+1D525}{U+0332}{U+0336}
    $+i::Send, {U+1D526}{U+0332}{U+0336}
    $+j::Send, {U+1D527}{U+0332}{U+0336}
    $+k::Send, {U+1D528}{U+0332}{U+0336}
    $+l::Send, {U+1D529}{U+0332}{U+0336}
    $+m::Send, {U+1D52A}{U+0332}{U+0336}
    $+n::Send, {U+1D52B}{U+0332}{U+0336}
    $+o::Send, {U+1D52C}{U+0332}{U+0336}
    $+p::Send, {U+1D52D}{U+0332}{U+0336}
    $+q::Send, {U+1D52E}{U+0332}{U+0336}
    $+r::Send, {U+1D52F}{U+0332}{U+0336}
    $+s::Send, {U+1D530}{U+0332}{U+0336}
    $+t::Send, {U+1D531}{U+0332}{U+0336}
    $+u::Send, {U+1D532}{U+0332}{U+0336}
    $+v::Send, {U+1D533}{U+0332}{U+0336}
    $+w::Send, {U+1D534}{U+0332}{U+0336}
    $+x::Send, {U+1D535}{U+0332}{U+0336}
    $+y::Send, {U+1D536}{U+0332}{U+0336}
    $+z::Send, {U+1D537}{U+0332}{U+0336}

    ~Space::Send, {U+0332}{U+0336}

    ~SC029::Send, {U+0332}{U+0336}
    ~+SC029::Send, {U+0332}{U+0336}
    ~+SC002::Send, {U+0332}{U+0336}
    ~+SC003::Send, {U+0332}{U+0336}
    ~+SC004::Send, {U+0332}{U+0336}
    ~+SC005::Send, {U+0332}{U+0336}
    ~+SC006::Send, {U+0332}{U+0336}
    ~+SC007::Send, {U+0332}{U+0336}
    ~+SC008::Send, {U+0332}{U+0336}
    ~+SC009::Send, {U+0332}{U+0336}
    ~+SC00a::Send, {U+0332}{U+0336}
    ~+SC00b::Send, {U+0332}{U+0336}
    ~SC00c::Send, {U+0332}{U+0336}
    ~+SC00c::Send, {U+0332}{U+0336}
    ~SC00d::Send, {U+0332}{U+0336}
    ~+SC00d::Send, {U+0332}{U+0336}
    ~SC01a::Send, {U+0332}{U+0336}
    ~+SC01a::Send, {U+0332}{U+0336}
    ~SC01b::Send, {U+0332}{U+0336}
    ~+SC01b::Send, {U+0332}{U+0336}
    ~SC027::Send, {U+0332}{U+0336}
    ~+SC027::Send, {U+0332}{U+0336}
    ~SC028::Send, {U+0332}{U+0336}
    ~+SC028::Send, {U+0332}{U+0336}
    ~SC02b::Send, {U+0332}{U+0336}
    ~+SC02b::Send, {U+0332}{U+0336}
    ~SC033::Send, {U+0332}{U+0336}
    ~+SC033::Send, {U+0332}{U+0336}
    ~SC034::Send, {U+0332}{U+0336}
    ~+SC034::Send, {U+0332}{U+0336}
    ~SC035::Send, {U+0332}{U+0336}
    ~+SC035::Send, {U+0332}{U+0336}
    ~SC037::Send, {U+0332}{U+0336}
    ~SC04a::Send, {U+0332}{U+0336}
    ~SC04e::Send, {U+0332}{U+0336}
    ~SC053::Send, {U+0332}{U+0336}
}
return

#If Fraktur and modifier = "Bold, Underline, Strikethrough" and Caps = "Off"
{
    $a::Send, {U+1D586}{U+0332}{U+0336}
    $b::Send, {U+1D587}{U+0332}{U+0336}
    $c::Send, {U+1D588}{U+0332}{U+0336}
    $d::Send, {U+1D589}{U+0332}{U+0336}
    $e::Send, {U+1D58A}{U+0332}{U+0336}
    $f::Send, {U+1D58B}{U+0332}{U+0336}
    $g::Send, {U+1D58C}{U+0332}{U+0336}
    $h::Send, {U+1D58D}{U+0332}{U+0336}
    $i::Send, {U+1D58E}{U+0332}{U+0336}
    $j::Send, {U+1D58F}{U+0332}{U+0336}
    $k::Send, {U+1D590}{U+0332}{U+0336}
    $l::Send, {U+1D591}{U+0332}{U+0336}
    $m::Send, {U+1D592}{U+0332}{U+0336}
    $n::Send, {U+1D593}{U+0332}{U+0336}
    $o::Send, {U+1D594}{U+0332}{U+0336}
    $p::Send, {U+1D595}{U+0332}{U+0336}
    $q::Send, {U+1D596}{U+0332}{U+0336}
    $r::Send, {U+1D597}{U+0332}{U+0336}
    $s::Send, {U+1D598}{U+0332}{U+0336}
    $t::Send, {U+1D599}{U+0332}{U+0336}
    $u::Send, {U+1D59A}{U+0332}{U+0336}
    $v::Send, {U+1D59B}{U+0332}{U+0336}
    $w::Send, {U+1D59C}{U+0332}{U+0336}
    $x::Send, {U+1D59D}{U+0332}{U+0336}
    $y::Send, {U+1D59E}{U+0332}{U+0336}
    $z::Send, {U+1D59F}{U+0332}{U+0336}

    $+a::Send, {U+1D56C}{U+0332}{U+0336}
    $+b::Send, {U+1D56D}{U+0332}{U+0336}
    $+c::Send, {U+1D56E}{U+0332}{U+0336}
    $+d::Send, {U+1D56F}{U+0332}{U+0336}
    $+e::Send, {U+1D570}{U+0332}{U+0336}
    $+f::Send, {U+1D571}{U+0332}{U+0336}
    $+g::Send, {U+1D572}{U+0332}{U+0336}
    $+h::Send, {U+1D573}{U+0332}{U+0336}
    $+i::Send, {U+1D574}{U+0332}{U+0336}
    $+j::Send, {U+1D575}{U+0332}{U+0336}
    $+k::Send, {U+1D576}{U+0332}{U+0336}
    $+l::Send, {U+1D577}{U+0332}{U+0336}
    $+m::Send, {U+1D578}{U+0332}{U+0336}
    $+n::Send, {U+1D579}{U+0332}{U+0336}
    $+o::Send, {U+1D57A}{U+0332}{U+0336}
    $+p::Send, {U+1D57B}{U+0332}{U+0336}
    $+q::Send, {U+1D57C}{U+0332}{U+0336}
    $+r::Send, {U+1D57D}{U+0332}{U+0336}
    $+s::Send, {U+1D57E}{U+0332}{U+0336}
    $+t::Send, {U+1D57F}{U+0332}{U+0336}
    $+u::Send, {U+1D580}{U+0332}{U+0336}
    $+v::Send, {U+1D581}{U+0332}{U+0336}
    $+w::Send, {U+1D582}{U+0332}{U+0336}
    $+x::Send, {U+1D583}{U+0332}{U+0336}
    $+y::Send, {U+1D584}{U+0332}{U+0336}
    $+z::Send, {U+1D585}{U+0332}{U+0336}

    ~Space::Send, {U+0332}{U+0336}

    ~SC029::Send, {U+0332}{U+0336}
    ~+SC029::Send, {U+0332}{U+0336}
    ~+SC002::Send, {U+0332}{U+0336}
    ~+SC003::Send, {U+0332}{U+0336}
    ~+SC004::Send, {U+0332}{U+0336}
    ~+SC005::Send, {U+0332}{U+0336}
    ~+SC006::Send, {U+0332}{U+0336}
    ~+SC007::Send, {U+0332}{U+0336}
    ~+SC008::Send, {U+0332}{U+0336}
    ~+SC009::Send, {U+0332}{U+0336}
    ~+SC00a::Send, {U+0332}{U+0336}
    ~+SC00b::Send, {U+0332}{U+0336}
    ~SC00c::Send, {U+0332}{U+0336}
    ~+SC00c::Send, {U+0332}{U+0336}
    ~SC00d::Send, {U+0332}{U+0336}
    ~+SC00d::Send, {U+0332}{U+0336}
    ~SC01a::Send, {U+0332}{U+0336}
    ~+SC01a::Send, {U+0332}{U+0336}
    ~SC01b::Send, {U+0332}{U+0336}
    ~+SC01b::Send, {U+0332}{U+0336}
    ~SC027::Send, {U+0332}{U+0336}
    ~+SC027::Send, {U+0332}{U+0336}
    ~SC028::Send, {U+0332}{U+0336}
    ~+SC028::Send, {U+0332}{U+0336}
    ~SC02b::Send, {U+0332}{U+0336}
    ~+SC02b::Send, {U+0332}{U+0336}
    ~SC033::Send, {U+0332}{U+0336}
    ~+SC033::Send, {U+0332}{U+0336}
    ~SC034::Send, {U+0332}{U+0336}
    ~+SC034::Send, {U+0332}{U+0336}
    ~SC035::Send, {U+0332}{U+0336}
    ~+SC035::Send, {U+0332}{U+0336}
    ~SC037::Send, {U+0332}{U+0336}
    ~SC04a::Send, {U+0332}{U+0336}
    ~SC04e::Send, {U+0332}{U+0336}
    ~SC053::Send, {U+0332}{U+0336}
}
return

#If Fraktur and modifier = "Bold, Underline, Strikethrough" and Caps = "On"
{
    $a::Send, {U+1D56C}{U+0332}{U+0336}
    $b::Send, {U+1D56D}{U+0332}{U+0336}
    $c::Send, {U+1D56E}{U+0332}{U+0336}
    $d::Send, {U+1D56F}{U+0332}{U+0336}
    $e::Send, {U+1D570}{U+0332}{U+0336}
    $f::Send, {U+1D571}{U+0332}{U+0336}
    $g::Send, {U+1D572}{U+0332}{U+0336}
    $h::Send, {U+1D573}{U+0332}{U+0336}
    $i::Send, {U+1D574}{U+0332}{U+0336}
    $j::Send, {U+1D575}{U+0332}{U+0336}
    $k::Send, {U+1D576}{U+0332}{U+0336}
    $l::Send, {U+1D577}{U+0332}{U+0336}
    $m::Send, {U+1D578}{U+0332}{U+0336}
    $n::Send, {U+1D579}{U+0332}{U+0336}
    $o::Send, {U+1D57A}{U+0332}{U+0336}
    $p::Send, {U+1D57B}{U+0332}{U+0336}
    $q::Send, {U+1D57C}{U+0332}{U+0336}
    $r::Send, {U+1D57D}{U+0332}{U+0336}
    $s::Send, {U+1D57E}{U+0332}{U+0336}
    $t::Send, {U+1D57F}{U+0332}{U+0336}
    $u::Send, {U+1D580}{U+0332}{U+0336}
    $v::Send, {U+1D581}{U+0332}{U+0336}
    $w::Send, {U+1D582}{U+0332}{U+0336}
    $x::Send, {U+1D583}{U+0332}{U+0336}
    $y::Send, {U+1D584}{U+0332}{U+0336}
    $z::Send, {U+1D585}{U+0332}{U+0336}

    $+a::Send, {U+1D586}{U+0332}{U+0336}
    $+b::Send, {U+1D587}{U+0332}{U+0336}
    $+c::Send, {U+1D588}{U+0332}{U+0336}
    $+d::Send, {U+1D589}{U+0332}{U+0336}
    $+e::Send, {U+1D58A}{U+0332}{U+0336}
    $+f::Send, {U+1D58B}{U+0332}{U+0336}
    $+g::Send, {U+1D58C}{U+0332}{U+0336}
    $+h::Send, {U+1D58D}{U+0332}{U+0336}
    $+i::Send, {U+1D58E}{U+0332}{U+0336}
    $+j::Send, {U+1D58F}{U+0332}{U+0336}
    $+k::Send, {U+1D590}{U+0332}{U+0336}
    $+l::Send, {U+1D591}{U+0332}{U+0336}
    $+m::Send, {U+1D592}{U+0332}{U+0336}
    $+n::Send, {U+1D593}{U+0332}{U+0336}
    $+o::Send, {U+1D594}{U+0332}{U+0336}
    $+p::Send, {U+1D595}{U+0332}{U+0336}
    $+q::Send, {U+1D596}{U+0332}{U+0336}
    $+r::Send, {U+1D597}{U+0332}{U+0336}
    $+s::Send, {U+1D598}{U+0332}{U+0336}
    $+t::Send, {U+1D599}{U+0332}{U+0336}
    $+u::Send, {U+1D59A}{U+0332}{U+0336}
    $+v::Send, {U+1D59B}{U+0332}{U+0336}
    $+w::Send, {U+1D59C}{U+0332}{U+0336}
    $+x::Send, {U+1D59D}{U+0332}{U+0336}
    $+y::Send, {U+1D59E}{U+0332}{U+0336}
    $+z::Send, {U+1D59F}{U+0332}{U+0336}

    ~Space::Send, {U+0332}{U+0336}

    ~SC029::Send, {U+0332}{U+0336}
    ~+SC029::Send, {U+0332}{U+0336}
    ~+SC002::Send, {U+0332}{U+0336}
    ~+SC003::Send, {U+0332}{U+0336}
    ~+SC004::Send, {U+0332}{U+0336}
    ~+SC005::Send, {U+0332}{U+0336}
    ~+SC006::Send, {U+0332}{U+0336}
    ~+SC007::Send, {U+0332}{U+0336}
    ~+SC008::Send, {U+0332}{U+0336}
    ~+SC009::Send, {U+0332}{U+0336}
    ~+SC00a::Send, {U+0332}{U+0336}
    ~+SC00b::Send, {U+0332}{U+0336}
    ~SC00c::Send, {U+0332}{U+0336}
    ~+SC00c::Send, {U+0332}{U+0336}
    ~SC00d::Send, {U+0332}{U+0336}
    ~+SC00d::Send, {U+0332}{U+0336}
    ~SC01a::Send, {U+0332}{U+0336}
    ~+SC01a::Send, {U+0332}{U+0336}
    ~SC01b::Send, {U+0332}{U+0336}
    ~+SC01b::Send, {U+0332}{U+0336}
    ~SC027::Send, {U+0332}{U+0336}
    ~+SC027::Send, {U+0332}{U+0336}
    ~SC028::Send, {U+0332}{U+0336}
    ~+SC028::Send, {U+0332}{U+0336}
    ~SC02b::Send, {U+0332}{U+0336}
    ~+SC02b::Send, {U+0332}{U+0336}
    ~SC033::Send, {U+0332}{U+0336}
    ~+SC033::Send, {U+0332}{U+0336}
    ~SC034::Send, {U+0332}{U+0336}
    ~+SC034::Send, {U+0332}{U+0336}
    ~SC035::Send, {U+0332}{U+0336}
    ~+SC035::Send, {U+0332}{U+0336}
    ~SC037::Send, {U+0332}{U+0336}
    ~SC04a::Send, {U+0332}{U+0336}
    ~SC04e::Send, {U+0332}{U+0336}
    ~SC053::Send, {U+0332}{U+0336}
}
return


;------------------------------------------------------------------------------------------------;

; Courier New Font

;------------------------------------------------------------------------------------------------;

;Original Modifiers
#If CN and modifier = "Default" and Caps = "Off"
{
    $a::Send, {U+1D68A}
    $b::Send, {U+1D68B}
    $c::Send, {U+1D68C}
    $d::Send, {U+1D68D}
    $e::Send, {U+1D68E}
    $f::Send, {U+1D68F}
    $g::Send, {U+1D690}
    $h::Send, {U+1D691}
    $i::Send, {U+1D692}
    $j::Send, {U+1D693}
    $k::Send, {U+1D694}
    $l::Send, {U+1D695}
    $m::Send, {U+1D696}
    $n::Send, {U+1D697}
    $o::Send, {U+1D698}
    $p::Send, {U+1D699}
    $q::Send, {U+1D69A}
    $r::Send, {U+1D69B}
    $s::Send, {U+1D69C}
    $t::Send, {U+1D69D}
    $u::Send, {U+1D69E}
    $v::Send, {U+1D69F}
    $w::Send, {U+1D6A0}
    $x::Send, {U+1D6A1}
    $y::Send, {U+1D6A2}
    $z::Send, {U+1D6A3}

    $+a::Send, {U+1D670}
    $+b::Send, {U+1D671}
    $+c::Send, {U+1D672}
    $+d::Send, {U+1D673}
    $+e::Send, {U+1D674}
    $+f::Send, {U+1D675}
    $+g::Send, {U+1D676}
    $+h::Send, {U+1D677}
    $+i::Send, {U+1D678}
    $+j::Send, {U+1D679}
    $+k::Send, {U+1D67A}
    $+l::Send, {U+1D67B}
    $+m::Send, {U+1D67C}
    $+n::Send, {U+1D67D}
    $+o::Send, {U+1D67E}
    $+p::Send, {U+1D67F}
    $+q::Send, {U+1D680}
    $+r::Send, {U+1D681}
    $+s::Send, {U+1D682}
    $+t::Send, {U+1D683}
    $+u::Send, {U+1D684}
    $+v::Send, {U+1D685}
    $+w::Send, {U+1D686}
    $+x::Send, {U+1D687}
    $+y::Send, {U+1D688}
    $+z::Send, {U+1D689}

    $0::Send, {U+1D7F6}
    $1::Send, {U+1D7F7}
    $2::Send, {U+1D7F8}
    $3::Send, {U+1D7F9}
    $4::Send, {U+1D7FA}
    $5::Send, {U+1D7FB}
    $6::Send, {U+1D7FC}
    $7::Send, {U+1D7FD}
    $8::Send, {U+1D7FE}
    $9::Send, {U+1D7FF}
}
return

#If CN and modifier = "Default" and Caps = "On"
{
    $a::Send, {U+1D670}
    $b::Send, {U+1D671}
    $c::Send, {U+1D672}
    $d::Send, {U+1D673}
    $e::Send, {U+1D674}
    $f::Send, {U+1D675}
    $g::Send, {U+1D676}
    $h::Send, {U+1D677}
    $i::Send, {U+1D678}
    $j::Send, {U+1D679}
    $k::Send, {U+1D67A}
    $l::Send, {U+1D67B}
    $m::Send, {U+1D67C}
    $n::Send, {U+1D67D}
    $o::Send, {U+1D67E}
    $p::Send, {U+1D67F}
    $q::Send, {U+1D680}
    $r::Send, {U+1D681}
    $s::Send, {U+1D682}
    $t::Send, {U+1D683}
    $u::Send, {U+1D684}
    $v::Send, {U+1D685}
    $w::Send, {U+1D686}
    $x::Send, {U+1D687}
    $y::Send, {U+1D688}
    $z::Send, {U+1D689}

    $+a::Send, {U+1D68A}
    $+b::Send, {U+1D68B}
    $+c::Send, {U+1D68C}
    $+d::Send, {U+1D68D}
    $+e::Send, {U+1D68E}
    $+f::Send, {U+1D68F}
    $+g::Send, {U+1D690}
    $+h::Send, {U+1D691}
    $+i::Send, {U+1D692}
    $+j::Send, {U+1D693}
    $+k::Send, {U+1D694}
    $+l::Send, {U+1D695}
    $+m::Send, {U+1D696}
    $+n::Send, {U+1D697}
    $+o::Send, {U+1D698}
    $+p::Send, {U+1D699}
    $+q::Send, {U+1D69A}
    $+r::Send, {U+1D69B}
    $+s::Send, {U+1D69C}
    $+t::Send, {U+1D69D}
    $+u::Send, {U+1D69E}
    $+v::Send, {U+1D69F}
    $+w::Send, {U+1D6A0}
    $+x::Send, {U+1D6A1}
    $+y::Send, {U+1D6A2}
    $+z::Send, {U+1D6A3}

    $0::Send, {U+1D7F6}
    $1::Send, {U+1D7F7}
    $2::Send, {U+1D7F8}
    $3::Send, {U+1D7F9}
    $4::Send, {U+1D7FA}
    $5::Send, {U+1D7FB}
    $6::Send, {U+1D7FC}
    $7::Send, {U+1D7FD}
    $8::Send, {U+1D7FE}
    $9::Send, {U+1D7FF}
}
return


;Underline Modifiers
#If CN and modifier = "Underline" and Caps = "Off"
{
    $a::Send, {U+1D68A}{U+0332}
    $b::Send, {U+1D68B}{U+0332}
    $c::Send, {U+1D68C}{U+0332}
    $d::Send, {U+1D68D}{U+0332}
    $e::Send, {U+1D68E}{U+0332}
    $f::Send, {U+1D68F}{U+0332}
    $g::Send, {U+1D690}{U+0332}
    $h::Send, {U+1D691}{U+0332}
    $i::Send, {U+1D692}{U+0332}
    $j::Send, {U+1D693}{U+0332}
    $k::Send, {U+1D694}{U+0332}
    $l::Send, {U+1D695}{U+0332}
    $m::Send, {U+1D696}{U+0332}
    $n::Send, {U+1D697}{U+0332}
    $o::Send, {U+1D698}{U+0332}
    $p::Send, {U+1D699}{U+0332}
    $q::Send, {U+1D69A}{U+0332}
    $r::Send, {U+1D69B}{U+0332}
    $s::Send, {U+1D69C}{U+0332}
    $t::Send, {U+1D69D}{U+0332}
    $u::Send, {U+1D69E}{U+0332}
    $v::Send, {U+1D69F}{U+0332}
    $w::Send, {U+1D6A0}{U+0332}
    $x::Send, {U+1D6A1}{U+0332}
    $y::Send, {U+1D6A2}{U+0332}
    $z::Send, {U+1D6A3}{U+0332}

    $+a::Send, {U+1D670}{U+0332}
    $+b::Send, {U+1D671}{U+0332}
    $+c::Send, {U+1D672}{U+0332}
    $+d::Send, {U+1D673}{U+0332}
    $+e::Send, {U+1D674}{U+0332}
    $+f::Send, {U+1D675}{U+0332}
    $+g::Send, {U+1D676}{U+0332}
    $+h::Send, {U+1D677}{U+0332}
    $+i::Send, {U+1D678}{U+0332}
    $+j::Send, {U+1D679}{U+0332}
    $+k::Send, {U+1D67A}{U+0332}
    $+l::Send, {U+1D67B}{U+0332}
    $+m::Send, {U+1D67C}{U+0332}
    $+n::Send, {U+1D67D}{U+0332}
    $+o::Send, {U+1D67E}{U+0332}
    $+p::Send, {U+1D67F}{U+0332}
    $+q::Send, {U+1D680}{U+0332}
    $+r::Send, {U+1D681}{U+0332}
    $+s::Send, {U+1D682}{U+0332}
    $+t::Send, {U+1D683}{U+0332}
    $+u::Send, {U+1D684}{U+0332}
    $+v::Send, {U+1D685}{U+0332}
    $+w::Send, {U+1D686}{U+0332}
    $+x::Send, {U+1D687}{U+0332}
    $+y::Send, {U+1D688}{U+0332}
    $+z::Send, {U+1D689}{U+0332}

    $0::Send, {U+1D7F6}{U+0332}
    $1::Send, {U+1D7F7}{U+0332}
    $2::Send, {U+1D7F8}{U+0332}
    $3::Send, {U+1D7F9}{U+0332}
    $4::Send, {U+1D7FA}{U+0332}
    $5::Send, {U+1D7FB}{U+0332}
    $6::Send, {U+1D7FC}{U+0332}
    $7::Send, {U+1D7FD}{U+0332}
    $8::Send, {U+1D7FE}{U+0332}
    $9::Send, {U+1D7FF}{U+0332}

    ~Space::Send, {U+0332}

    ~SC029::Send, {U+0332}
    ~+SC029::Send, {U+0332}
    ~+SC002::Send, {U+0332}
    ~+SC003::Send, {U+0332}
    ~+SC004::Send, {U+0332}
    ~+SC005::Send, {U+0332}
    ~+SC006::Send, {U+0332}
    ~+SC007::Send, {U+0332}
    ~+SC008::Send, {U+0332}
    ~+SC009::Send, {U+0332}
    ~+SC00a::Send, {U+0332}
    ~+SC00b::Send, {U+0332}
    ~SC00c::Send, {U+0332}
    ~+SC00c::Send, {U+0332}
    ~SC00d::Send, {U+0332}
    ~+SC00d::Send, {U+0332}
    ~SC01a::Send, {U+0332}
    ~+SC01a::Send, {U+0332}
    ~SC01b::Send, {U+0332}
    ~+SC01b::Send, {U+0332}
    ~SC027::Send, {U+0332}
    ~+SC027::Send, {U+0332}
    ~SC028::Send, {U+0332}
    ~+SC028::Send, {U+0332}
    ~SC02b::Send, {U+0332}
    ~+SC02b::Send, {U+0332}
    ~SC033::Send, {U+0332}
    ~+SC033::Send, {U+0332}
    ~SC034::Send, {U+0332}
    ~+SC034::Send, {U+0332}
    ~SC035::Send, {U+0332}
    ~+SC035::Send, {U+0332}
    ~SC037::Send, {U+0332}
    ~SC04a::Send, {U+0332}
    ~SC04e::Send, {U+0332}
    ~SC053::Send, {U+0332}
}
return

#If CN and modifier = "Underline" and Caps = "On"
{
    $a::Send, {U+1D670}{U+0332}
    $b::Send, {U+1D671}{U+0332}
    $c::Send, {U+1D672}{U+0332}
    $d::Send, {U+1D673}{U+0332}
    $e::Send, {U+1D674}{U+0332}
    $f::Send, {U+1D675}{U+0332}
    $g::Send, {U+1D676}{U+0332}
    $h::Send, {U+1D677}{U+0332}
    $i::Send, {U+1D678}{U+0332}
    $j::Send, {U+1D679}{U+0332}
    $k::Send, {U+1D67A}{U+0332}
    $l::Send, {U+1D67B}{U+0332}
    $m::Send, {U+1D67C}{U+0332}
    $n::Send, {U+1D67D}{U+0332}
    $o::Send, {U+1D67E}{U+0332}
    $p::Send, {U+1D67F}{U+0332}
    $q::Send, {U+1D680}{U+0332}
    $r::Send, {U+1D681}{U+0332}
    $s::Send, {U+1D682}{U+0332}
    $t::Send, {U+1D683}{U+0332}
    $u::Send, {U+1D684}{U+0332}
    $v::Send, {U+1D685}{U+0332}
    $w::Send, {U+1D686}{U+0332}
    $x::Send, {U+1D687}{U+0332}
    $y::Send, {U+1D688}{U+0332}
    $z::Send, {U+1D689}{U+0332}

    $+a::Send, {U+1D68A}{U+0332}
    $+b::Send, {U+1D68B}{U+0332}
    $+c::Send, {U+1D68C}{U+0332}
    $+d::Send, {U+1D68D}{U+0332}
    $+e::Send, {U+1D68E}{U+0332}
    $+f::Send, {U+1D68F}{U+0332}
    $+g::Send, {U+1D690}{U+0332}
    $+h::Send, {U+1D691}{U+0332}
    $+i::Send, {U+1D692}{U+0332}
    $+j::Send, {U+1D693}{U+0332}
    $+k::Send, {U+1D694}{U+0332}
    $+l::Send, {U+1D695}{U+0332}
    $+m::Send, {U+1D696}{U+0332}
    $+n::Send, {U+1D697}{U+0332}
    $+o::Send, {U+1D698}{U+0332}
    $+p::Send, {U+1D699}{U+0332}
    $+q::Send, {U+1D69A}{U+0332}
    $+r::Send, {U+1D69B}{U+0332}
    $+s::Send, {U+1D69C}{U+0332}
    $+t::Send, {U+1D69D}{U+0332}
    $+u::Send, {U+1D69E}{U+0332}
    $+v::Send, {U+1D69F}{U+0332}
    $+w::Send, {U+1D6A0}{U+0332}
    $+x::Send, {U+1D6A1}{U+0332}
    $+y::Send, {U+1D6A2}{U+0332}
    $+z::Send, {U+1D6A3}{U+0332}

    $0::Send, {U+1D7F6}{U+0332}
    $1::Send, {U+1D7F7}{U+0332}
    $2::Send, {U+1D7F8}{U+0332}
    $3::Send, {U+1D7F9}{U+0332}
    $4::Send, {U+1D7FA}{U+0332}
    $5::Send, {U+1D7FB}{U+0332}
    $6::Send, {U+1D7FC}{U+0332}
    $7::Send, {U+1D7FD}{U+0332}
    $8::Send, {U+1D7FE}{U+0332}
    $9::Send, {U+1D7FF}{U+0332}

    ~Space::Send, {U+0332}

    ~SC029::Send, {U+0332}
    ~+SC029::Send, {U+0332}
    ~+SC002::Send, {U+0332}
    ~+SC003::Send, {U+0332}
    ~+SC004::Send, {U+0332}
    ~+SC005::Send, {U+0332}
    ~+SC006::Send, {U+0332}
    ~+SC007::Send, {U+0332}
    ~+SC008::Send, {U+0332}
    ~+SC009::Send, {U+0332}
    ~+SC00a::Send, {U+0332}
    ~+SC00b::Send, {U+0332}
    ~SC00c::Send, {U+0332}
    ~+SC00c::Send, {U+0332}
    ~SC00d::Send, {U+0332}
    ~+SC00d::Send, {U+0332}
    ~SC01a::Send, {U+0332}
    ~+SC01a::Send, {U+0332}
    ~SC01b::Send, {U+0332}
    ~+SC01b::Send, {U+0332}
    ~SC027::Send, {U+0332}
    ~+SC027::Send, {U+0332}
    ~SC028::Send, {U+0332}
    ~+SC028::Send, {U+0332}
    ~SC02b::Send, {U+0332}
    ~+SC02b::Send, {U+0332}
    ~SC033::Send, {U+0332}
    ~+SC033::Send, {U+0332}
    ~SC034::Send, {U+0332}
    ~+SC034::Send, {U+0332}
    ~SC035::Send, {U+0332}
    ~+SC035::Send, {U+0332}
    ~SC037::Send, {U+0332}
    ~SC04a::Send, {U+0332}
    ~SC04e::Send, {U+0332}
    ~SC053::Send, {U+0332}
}
return


;Strikethrough Modifiers
#If CN and modifier = "Strikethrough" and Caps = "Off"
{
    $a::Send, {U+1D68A}{U+0336}
    $b::Send, {U+1D68B}{U+0336}
    $c::Send, {U+1D68C}{U+0336}
    $d::Send, {U+1D68D}{U+0336}
    $e::Send, {U+1D68E}{U+0336}
    $f::Send, {U+1D68F}{U+0336}
    $g::Send, {U+1D690}{U+0336}
    $h::Send, {U+1D691}{U+0336}
    $i::Send, {U+1D692}{U+0336}
    $j::Send, {U+1D693}{U+0336}
    $k::Send, {U+1D694}{U+0336}
    $l::Send, {U+1D695}{U+0336}
    $m::Send, {U+1D696}{U+0336}
    $n::Send, {U+1D697}{U+0336}
    $o::Send, {U+1D698}{U+0336}
    $p::Send, {U+1D699}{U+0336}
    $q::Send, {U+1D69A}{U+0336}
    $r::Send, {U+1D69B}{U+0336}
    $s::Send, {U+1D69C}{U+0336}
    $t::Send, {U+1D69D}{U+0336}
    $u::Send, {U+1D69E}{U+0336}
    $v::Send, {U+1D69F}{U+0336}
    $w::Send, {U+1D6A0}{U+0336}
    $x::Send, {U+1D6A1}{U+0336}
    $y::Send, {U+1D6A2}{U+0336}
    $z::Send, {U+1D6A3}{U+0336}

    $+a::Send, {U+1D670}{U+0336}
    $+b::Send, {U+1D671}{U+0336}
    $+c::Send, {U+1D672}{U+0336}
    $+d::Send, {U+1D673}{U+0336}
    $+e::Send, {U+1D674}{U+0336}
    $+f::Send, {U+1D675}{U+0336}
    $+g::Send, {U+1D676}{U+0336}
    $+h::Send, {U+1D677}{U+0336}
    $+i::Send, {U+1D678}{U+0336}
    $+j::Send, {U+1D679}{U+0336}
    $+k::Send, {U+1D67A}{U+0336}
    $+l::Send, {U+1D67B}{U+0336}
    $+m::Send, {U+1D67C}{U+0336}
    $+n::Send, {U+1D67D}{U+0336}
    $+o::Send, {U+1D67E}{U+0336}
    $+p::Send, {U+1D67F}{U+0336}
    $+q::Send, {U+1D680}{U+0336}
    $+r::Send, {U+1D681}{U+0336}
    $+s::Send, {U+1D682}{U+0336}
    $+t::Send, {U+1D683}{U+0336}
    $+u::Send, {U+1D684}{U+0336}
    $+v::Send, {U+1D685}{U+0336}
    $+w::Send, {U+1D686}{U+0336}
    $+x::Send, {U+1D687}{U+0336}
    $+y::Send, {U+1D688}{U+0336}
    $+z::Send, {U+1D689}{U+0336}

    $0::Send, {U+1D7F6}{U+0336}
    $1::Send, {U+1D7F7}{U+0336}
    $2::Send, {U+1D7F8}{U+0336}
    $3::Send, {U+1D7F9}{U+0336}
    $4::Send, {U+1D7FA}{U+0336}
    $5::Send, {U+1D7FB}{U+0336}
    $6::Send, {U+1D7FC}{U+0336}
    $7::Send, {U+1D7FD}{U+0336}
    $8::Send, {U+1D7FE}{U+0336}
    $9::Send, {U+1D7FF}{U+0336}

    ~Space::Send, {U+0336}

    ~SC029::Send, {U+0336}
    ~+SC029::Send, {U+0336}
    ~+SC002::Send, {U+0336}
    ~+SC003::Send, {U+0336}
    ~+SC004::Send, {U+0336}
    ~+SC005::Send, {U+0336}
    ~+SC006::Send, {U+0336}
    ~+SC007::Send, {U+0336}
    ~+SC008::Send, {U+0336}
    ~+SC009::Send, {U+0336}
    ~+SC00a::Send, {U+0336}
    ~+SC00b::Send, {U+0336}
    ~SC00c::Send, {U+0336}
    ~+SC00c::Send, {U+0336}
    ~SC00d::Send, {U+0336}
    ~+SC00d::Send, {U+0336}
    ~SC01a::Send, {U+0336}
    ~+SC01a::Send, {U+0336}
    ~SC01b::Send, {U+0336}
    ~+SC01b::Send, {U+0336}
    ~SC027::Send, {U+0336}
    ~+SC027::Send, {U+0336}
    ~SC028::Send, {U+0336}
    ~+SC028::Send, {U+0336}
    ~SC02b::Send, {U+0336}
    ~+SC02b::Send, {U+0336}
    ~SC033::Send, {U+0336}
    ~+SC033::Send, {U+0336}
    ~SC034::Send, {U+0336}
    ~+SC034::Send, {U+0336}
    ~SC035::Send, {U+0336}
    ~+SC035::Send, {U+0336}
    ~SC037::Send, {U+0336}
    ~SC04a::Send, {U+0336}
    ~SC04e::Send, {U+0336}
    ~SC053::Send, {U+0336}
}
return

#If CN and modifier = "Strikethrough" and Caps = "On"
{
    $a::Send, {U+1D670}{U+0336}
    $b::Send, {U+1D671}{U+0336}
    $c::Send, {U+1D672}{U+0336}
    $d::Send, {U+1D673}{U+0336}
    $e::Send, {U+1D674}{U+0336}
    $f::Send, {U+1D675}{U+0336}
    $g::Send, {U+1D676}{U+0336}
    $h::Send, {U+1D677}{U+0336}
    $i::Send, {U+1D678}{U+0336}
    $j::Send, {U+1D679}{U+0336}
    $k::Send, {U+1D67A}{U+0336}
    $l::Send, {U+1D67B}{U+0336}
    $m::Send, {U+1D67C}{U+0336}
    $n::Send, {U+1D67D}{U+0336}
    $o::Send, {U+1D67E}{U+0336}
    $p::Send, {U+1D67F}{U+0336}
    $q::Send, {U+1D680}{U+0336}
    $r::Send, {U+1D681}{U+0336}
    $s::Send, {U+1D682}{U+0336}
    $t::Send, {U+1D683}{U+0336}
    $u::Send, {U+1D684}{U+0336}
    $v::Send, {U+1D685}{U+0336}
    $w::Send, {U+1D686}{U+0336}
    $x::Send, {U+1D687}{U+0336}
    $y::Send, {U+1D688}{U+0336}
    $z::Send, {U+1D689}{U+0336}

    $+a::Send, {U+1D68A}{U+0336}
    $+b::Send, {U+1D68B}{U+0336}
    $+c::Send, {U+1D68C}{U+0336}
    $+d::Send, {U+1D68D}{U+0336}
    $+e::Send, {U+1D68E}{U+0336}
    $+f::Send, {U+1D68F}{U+0336}
    $+g::Send, {U+1D690}{U+0336}
    $+h::Send, {U+1D691}{U+0336}
    $+i::Send, {U+1D692}{U+0336}
    $+j::Send, {U+1D693}{U+0336}
    $+k::Send, {U+1D694}{U+0336}
    $+l::Send, {U+1D695}{U+0336}
    $+m::Send, {U+1D696}{U+0336}
    $+n::Send, {U+1D697}{U+0336}
    $+o::Send, {U+1D698}{U+0336}
    $+p::Send, {U+1D699}{U+0336}
    $+q::Send, {U+1D69A}{U+0336}
    $+r::Send, {U+1D69B}{U+0336}
    $+s::Send, {U+1D69C}{U+0336}
    $+t::Send, {U+1D69D}{U+0336}
    $+u::Send, {U+1D69E}{U+0336}
    $+v::Send, {U+1D69F}{U+0336}
    $+w::Send, {U+1D6A0}{U+0336}
    $+x::Send, {U+1D6A1}{U+0336}
    $+y::Send, {U+1D6A2}{U+0336}
    $+z::Send, {U+1D6A3}{U+0336}

    $0::Send, {U+1D7F6}{U+0336}
    $1::Send, {U+1D7F7}{U+0336}
    $2::Send, {U+1D7F8}{U+0336}
    $3::Send, {U+1D7F9}{U+0336}
    $4::Send, {U+1D7FA}{U+0336}
    $5::Send, {U+1D7FB}{U+0336}
    $6::Send, {U+1D7FC}{U+0336}
    $7::Send, {U+1D7FD}{U+0336}
    $8::Send, {U+1D7FE}{U+0336}
    $9::Send, {U+1D7FF}{U+0336}

    ~Space::Send, {U+0336}

    ~SC029::Send, {U+0336}
    ~+SC029::Send, {U+0336}
    ~+SC002::Send, {U+0336}
    ~+SC003::Send, {U+0336}
    ~+SC004::Send, {U+0336}
    ~+SC005::Send, {U+0336}
    ~+SC006::Send, {U+0336}
    ~+SC007::Send, {U+0336}
    ~+SC008::Send, {U+0336}
    ~+SC009::Send, {U+0336}
    ~+SC00a::Send, {U+0336}
    ~+SC00b::Send, {U+0336}
    ~SC00c::Send, {U+0336}
    ~+SC00c::Send, {U+0336}
    ~SC00d::Send, {U+0336}
    ~+SC00d::Send, {U+0336}
    ~SC01a::Send, {U+0336}
    ~+SC01a::Send, {U+0336}
    ~SC01b::Send, {U+0336}
    ~+SC01b::Send, {U+0336}
    ~SC027::Send, {U+0336}
    ~+SC027::Send, {U+0336}
    ~SC028::Send, {U+0336}
    ~+SC028::Send, {U+0336}
    ~SC02b::Send, {U+0336}
    ~+SC02b::Send, {U+0336}
    ~SC033::Send, {U+0336}
    ~+SC033::Send, {U+0336}
    ~SC034::Send, {U+0336}
    ~+SC034::Send, {U+0336}
    ~SC035::Send, {U+0336}
    ~+SC035::Send, {U+0336}
    ~SC037::Send, {U+0336}
    ~SC04a::Send, {U+0336}
    ~SC04e::Send, {U+0336}
    ~SC053::Send, {U+0336}
}
return


;Underline and Strikethrough Modifiers
#If CN and modifier = "Underline, Strikethrough" and Caps = "Off"
{
    $a::Send, {U+1D68A}{U+0332}{U+0336}
    $b::Send, {U+1D68B}{U+0332}{U+0336}
    $c::Send, {U+1D68C}{U+0332}{U+0336}
    $d::Send, {U+1D68D}{U+0332}{U+0336}
    $e::Send, {U+1D68E}{U+0332}{U+0336}
    $f::Send, {U+1D68F}{U+0332}{U+0336}
    $g::Send, {U+1D690}{U+0332}{U+0336}
    $h::Send, {U+1D691}{U+0332}{U+0336}
    $i::Send, {U+1D692}{U+0332}{U+0336}
    $j::Send, {U+1D693}{U+0332}{U+0336}
    $k::Send, {U+1D694}{U+0332}{U+0336}
    $l::Send, {U+1D695}{U+0332}{U+0336}
    $m::Send, {U+1D696}{U+0332}{U+0336}
    $n::Send, {U+1D697}{U+0332}{U+0336}
    $o::Send, {U+1D698}{U+0332}{U+0336}
    $p::Send, {U+1D699}{U+0332}{U+0336}
    $q::Send, {U+1D69A}{U+0332}{U+0336}
    $r::Send, {U+1D69B}{U+0332}{U+0336}
    $s::Send, {U+1D69C}{U+0332}{U+0336}
    $t::Send, {U+1D69D}{U+0332}{U+0336}
    $u::Send, {U+1D69E}{U+0332}{U+0336}
    $v::Send, {U+1D69F}{U+0332}{U+0336}
    $w::Send, {U+1D6A0}{U+0332}{U+0336}
    $x::Send, {U+1D6A1}{U+0332}{U+0336}
    $y::Send, {U+1D6A2}{U+0332}{U+0336}
    $z::Send, {U+1D6A3}{U+0332}{U+0336}

    $+a::Send, {U+1D670}{U+0332}{U+0336}
    $+b::Send, {U+1D671}{U+0332}{U+0336}
    $+c::Send, {U+1D672}{U+0332}{U+0336}
    $+d::Send, {U+1D673}{U+0332}{U+0336}
    $+e::Send, {U+1D674}{U+0332}{U+0336}
    $+f::Send, {U+1D675}{U+0332}{U+0336}
    $+g::Send, {U+1D676}{U+0332}{U+0336}
    $+h::Send, {U+1D677}{U+0332}{U+0336}
    $+i::Send, {U+1D678}{U+0332}{U+0336}
    $+j::Send, {U+1D679}{U+0332}{U+0336}
    $+k::Send, {U+1D67A}{U+0332}{U+0336}
    $+l::Send, {U+1D67B}{U+0332}{U+0336}
    $+m::Send, {U+1D67C}{U+0332}{U+0336}
    $+n::Send, {U+1D67D}{U+0332}{U+0336}
    $+o::Send, {U+1D67E}{U+0332}{U+0336}
    $+p::Send, {U+1D67F}{U+0332}{U+0336}
    $+q::Send, {U+1D680}{U+0332}{U+0336}
    $+r::Send, {U+1D681}{U+0332}{U+0336}
    $+s::Send, {U+1D682}{U+0332}{U+0336}
    $+t::Send, {U+1D683}{U+0332}{U+0336}
    $+u::Send, {U+1D684}{U+0332}{U+0336}
    $+v::Send, {U+1D685}{U+0332}{U+0336}
    $+w::Send, {U+1D686}{U+0332}{U+0336}
    $+x::Send, {U+1D687}{U+0332}{U+0336}
    $+y::Send, {U+1D688}{U+0332}{U+0336}
    $+z::Send, {U+1D689}{U+0332}{U+0336}

    $0::Send, {U+1D7F6}{U+0332}{U+0336}
    $1::Send, {U+1D7F7}{U+0332}{U+0336}
    $2::Send, {U+1D7F8}{U+0332}{U+0336}
    $3::Send, {U+1D7F9}{U+0332}{U+0336}
    $4::Send, {U+1D7FA}{U+0332}{U+0336}
    $5::Send, {U+1D7FB}{U+0332}{U+0336}
    $6::Send, {U+1D7FC}{U+0332}{U+0336}
    $7::Send, {U+1D7FD}{U+0332}{U+0336}
    $8::Send, {U+1D7FE}{U+0332}{U+0336}
    $9::Send, {U+1D7FF}{U+0332}{U+0336}

    ~Space::Send, {U+0332}{U+0336}

    ~SC029::Send, {U+0332}{U+0336}
    ~+SC029::Send, {U+0332}{U+0336}
    ~+SC002::Send, {U+0332}{U+0336}
    ~+SC003::Send, {U+0332}{U+0336}
    ~+SC004::Send, {U+0332}{U+0336}
    ~+SC005::Send, {U+0332}{U+0336}
    ~+SC006::Send, {U+0332}{U+0336}
    ~+SC007::Send, {U+0332}{U+0336}
    ~+SC008::Send, {U+0332}{U+0336}
    ~+SC009::Send, {U+0332}{U+0336}
    ~+SC00a::Send, {U+0332}{U+0336}
    ~+SC00b::Send, {U+0332}{U+0336}
    ~SC00c::Send, {U+0332}{U+0336}
    ~+SC00c::Send, {U+0332}{U+0336}
    ~SC00d::Send, {U+0332}{U+0336}
    ~+SC00d::Send, {U+0332}{U+0336}
    ~SC01a::Send, {U+0332}{U+0336}
    ~+SC01a::Send, {U+0332}{U+0336}
    ~SC01b::Send, {U+0332}{U+0336}
    ~+SC01b::Send, {U+0332}{U+0336}
    ~SC027::Send, {U+0332}{U+0336}
    ~+SC027::Send, {U+0332}{U+0336}
    ~SC028::Send, {U+0332}{U+0336}
    ~+SC028::Send, {U+0332}{U+0336}
    ~SC02b::Send, {U+0332}{U+0336}
    ~+SC02b::Send, {U+0332}{U+0336}
    ~SC033::Send, {U+0332}{U+0336}
    ~+SC033::Send, {U+0332}{U+0336}
    ~SC034::Send, {U+0332}{U+0336}
    ~+SC034::Send, {U+0332}{U+0336}
    ~SC035::Send, {U+0332}{U+0336}
    ~+SC035::Send, {U+0332}{U+0336}
    ~SC037::Send, {U+0332}{U+0336}
    ~SC04a::Send, {U+0332}{U+0336}
    ~SC04e::Send, {U+0332}{U+0336}
    ~SC053::Send, {U+0332}{U+0336}
}
return

#If CN and modifier = "Underline, Strikethrough" and Caps = "On"
{
    $a::Send, {U+1D670}{U+0332}{U+0336}
    $b::Send, {U+1D671}{U+0332}{U+0336}
    $c::Send, {U+1D672}{U+0332}{U+0336}
    $d::Send, {U+1D673}{U+0332}{U+0336}
    $e::Send, {U+1D674}{U+0332}{U+0336}
    $f::Send, {U+1D675}{U+0332}{U+0336}
    $g::Send, {U+1D676}{U+0332}{U+0336}
    $h::Send, {U+1D677}{U+0332}{U+0336}
    $i::Send, {U+1D678}{U+0332}{U+0336}
    $j::Send, {U+1D679}{U+0332}{U+0336}
    $k::Send, {U+1D67A}{U+0332}{U+0336}
    $l::Send, {U+1D67B}{U+0332}{U+0336}
    $m::Send, {U+1D67C}{U+0332}{U+0336}
    $n::Send, {U+1D67D}{U+0332}{U+0336}
    $o::Send, {U+1D67E}{U+0332}{U+0336}
    $p::Send, {U+1D67F}{U+0332}{U+0336}
    $q::Send, {U+1D680}{U+0332}{U+0336}
    $r::Send, {U+1D681}{U+0332}{U+0336}
    $s::Send, {U+1D682}{U+0332}{U+0336}
    $t::Send, {U+1D683}{U+0332}{U+0336}
    $u::Send, {U+1D684}{U+0332}{U+0336}
    $v::Send, {U+1D685}{U+0332}{U+0336}
    $w::Send, {U+1D686}{U+0332}{U+0336}
    $x::Send, {U+1D687}{U+0332}{U+0336}
    $y::Send, {U+1D688}{U+0332}{U+0336}
    $z::Send, {U+1D689}{U+0332}{U+0336}

    $+a::Send, {U+1D68A}{U+0332}{U+0336}
    $+b::Send, {U+1D68B}{U+0332}{U+0336}
    $+c::Send, {U+1D68C}{U+0332}{U+0336}
    $+d::Send, {U+1D68D}{U+0332}{U+0336}
    $+e::Send, {U+1D68E}{U+0332}{U+0336}
    $+f::Send, {U+1D68F}{U+0332}{U+0336}
    $+g::Send, {U+1D690}{U+0332}{U+0336}
    $+h::Send, {U+1D691}{U+0332}{U+0336}
    $+i::Send, {U+1D692}{U+0332}{U+0336}
    $+j::Send, {U+1D693}{U+0332}{U+0336}
    $+k::Send, {U+1D694}{U+0332}{U+0336}
    $+l::Send, {U+1D695}{U+0332}{U+0336}
    $+m::Send, {U+1D696}{U+0332}{U+0336}
    $+n::Send, {U+1D697}{U+0332}{U+0336}
    $+o::Send, {U+1D698}{U+0332}{U+0336}
    $+p::Send, {U+1D699}{U+0332}{U+0336}
    $+q::Send, {U+1D69A}{U+0332}{U+0336}
    $+r::Send, {U+1D69B}{U+0332}{U+0336}
    $+s::Send, {U+1D69C}{U+0332}{U+0336}
    $+t::Send, {U+1D69D}{U+0332}{U+0336}
    $+u::Send, {U+1D69E}{U+0332}{U+0336}
    $+v::Send, {U+1D69F}{U+0332}{U+0336}
    $+w::Send, {U+1D6A0}{U+0332}{U+0336}
    $+x::Send, {U+1D6A1}{U+0332}{U+0336}
    $+y::Send, {U+1D6A2}{U+0332}{U+0336}
    $+z::Send, {U+1D6A3}{U+0332}{U+0336}

    $0::Send, {U+1D7F6}{U+0332}{U+0336}
    $1::Send, {U+1D7F7}{U+0332}{U+0336}
    $2::Send, {U+1D7F8}{U+0332}{U+0336}
    $3::Send, {U+1D7F9}{U+0332}{U+0336}
    $4::Send, {U+1D7FA}{U+0332}{U+0336}
    $5::Send, {U+1D7FB}{U+0332}{U+0336}
    $6::Send, {U+1D7FC}{U+0332}{U+0336}
    $7::Send, {U+1D7FD}{U+0332}{U+0336}
    $8::Send, {U+1D7FE}{U+0332}{U+0336}
    $9::Send, {U+1D7FF}{U+0332}{U+0336}

    ~Space::Send, {U+0332}{U+0336}

    ~SC029::Send, {U+0332}{U+0336}
    ~+SC029::Send, {U+0332}{U+0336}
    ~+SC002::Send, {U+0332}{U+0336}
    ~+SC003::Send, {U+0332}{U+0336}
    ~+SC004::Send, {U+0332}{U+0336}
    ~+SC005::Send, {U+0332}{U+0336}
    ~+SC006::Send, {U+0332}{U+0336}
    ~+SC007::Send, {U+0332}{U+0336}
    ~+SC008::Send, {U+0332}{U+0336}
    ~+SC009::Send, {U+0332}{U+0336}
    ~+SC00a::Send, {U+0332}{U+0336}
    ~+SC00b::Send, {U+0332}{U+0336}
    ~SC00c::Send, {U+0332}{U+0336}
    ~+SC00c::Send, {U+0332}{U+0336}
    ~SC00d::Send, {U+0332}{U+0336}
    ~+SC00d::Send, {U+0332}{U+0336}
    ~SC01a::Send, {U+0332}{U+0336}
    ~+SC01a::Send, {U+0332}{U+0336}
    ~SC01b::Send, {U+0332}{U+0336}
    ~+SC01b::Send, {U+0332}{U+0336}
    ~SC027::Send, {U+0332}{U+0336}
    ~+SC027::Send, {U+0332}{U+0336}
    ~SC028::Send, {U+0332}{U+0336}
    ~+SC028::Send, {U+0332}{U+0336}
    ~SC02b::Send, {U+0332}{U+0336}
    ~+SC02b::Send, {U+0332}{U+0336}
    ~SC033::Send, {U+0332}{U+0336}
    ~+SC033::Send, {U+0332}{U+0336}
    ~SC034::Send, {U+0332}{U+0336}
    ~+SC034::Send, {U+0332}{U+0336}
    ~SC035::Send, {U+0332}{U+0336}
    ~+SC035::Send, {U+0332}{U+0336}
    ~SC037::Send, {U+0332}{U+0336}
    ~SC04a::Send, {U+0332}{U+0336}
    ~SC04e::Send, {U+0332}{U+0336}
    ~SC053::Send, {U+0332}{U+0336}
}
return


;------------------------------------------------------------------------------------------------;

; Double-Struck Font

;------------------------------------------------------------------------------------------------;

;Original Modifiers
#If DS and modifier = "Bold" and Caps = "Off"
{
    $a::Send, {U+1D552}
    $b::Send, {U+1D553}
    $c::Send, {U+1D554}
    $d::Send, {U+1D555}
    $e::Send, {U+1D556}
    $f::Send, {U+1D557}
    $g::Send, {U+1D558}
    $h::Send, {U+1D559}
    $i::Send, {U+1D55A}
    $j::Send, {U+1D55B}
    $k::Send, {U+1D55C}
    $l::Send, {U+1D55D}
    $m::Send, {U+1D55E}
    $n::Send, {U+1D55F}
    $o::Send, {U+1D560}
    $p::Send, {U+1D561}
    $q::Send, {U+1D562}
    $r::Send, {U+1D563}
    $s::Send, {U+1D564}
    $t::Send, {U+1D565}
    $u::Send, {U+1D566}
    $v::Send, {U+1D567}
    $w::Send, {U+1D568}
    $x::Send, {U+1D569}
    $y::Send, {U+1D56A}
    $z::Send, {U+1D56B}

    $+a::Send, {U+1D538}
    $+b::Send, {U+1D539}
    $+c::Send, {U+2102}
    $+d::Send, {U+1D53B}
    $+e::Send, {U+1D53C}
    $+f::Send, {U+1D53D}
    $+g::Send, {U+1D53E}
    $+h::Send, {U+210D}
    $+i::Send, {U+1D540}
    $+j::Send, {U+1D541}
    $+k::Send, {U+1D542}
    $+l::Send, {U+1D543}
    $+m::Send, {U+1D544}
    $+n::Send, {U+2115}
    $+o::Send, {U+1D546}
    $+p::Send, {U+2119}
    $+q::Send, {U+211A}
    $+r::Send, {U+211D}
    $+s::Send, {U+1D54A}
    $+t::Send, {U+1D54B}
    $+u::Send, {U+1D54C}
    $+v::Send, {U+1D54D}
    $+w::Send, {U+1D54E}
    $+x::Send, {U+1D54F}
    $+y::Send, {U+1D550}
    $+z::Send, {U+2124}

    $0::Send, {U+1D7D8}
    $1::Send, {U+1D7D9}
    $2::Send, {U+1D7DA}
    $3::Send, {U+1D7DB}
    $4::Send, {U+1D7DC}
    $5::Send, {U+1D7DD}
    $6::Send, {U+1D7DE}
    $7::Send, {U+1D7DF}
    $8::Send, {U+1D7E0}
    $9::Send, {U+1D7E1}
}
return

#If DS and modifier = "Bold" and Caps = "On"
{
    $a::Send, {U+1D538}
    $b::Send, {U+1D539}
    $c::Send, {U+2102}
    $d::Send, {U+1D53B}
    $e::Send, {U+1D53C}
    $f::Send, {U+1D53D}
    $g::Send, {U+1D53E}
    $h::Send, {U+210D}
    $i::Send, {U+1D540}
    $j::Send, {U+1D541}
    $k::Send, {U+1D542}
    $l::Send, {U+1D543}
    $m::Send, {U+1D544}
    $n::Send, {U+2115}
    $o::Send, {U+1D546}
    $p::Send, {U+2119}
    $q::Send, {U+211A}
    $r::Send, {U+211D}
    $s::Send, {U+1D54A}
    $t::Send, {U+1D54B}
    $u::Send, {U+1D54C}
    $v::Send, {U+1D54D}
    $w::Send, {U+1D54E}
    $x::Send, {U+1D54F}
    $y::Send, {U+1D550}
    $z::Send, {U+2124}

    $+a::Send, {U+1D552}
    $+b::Send, {U+1D553}
    $+c::Send, {U+1D554}
    $+d::Send, {U+1D555}
    $+e::Send, {U+1D556}
    $+f::Send, {U+1D557}
    $+g::Send, {U+1D558}
    $+h::Send, {U+1D559}
    $+i::Send, {U+1D55A}
    $+j::Send, {U+1D55B}
    $+k::Send, {U+1D55C}
    $+l::Send, {U+1D55D}
    $+m::Send, {U+1D55E}
    $+n::Send, {U+1D55F}
    $+o::Send, {U+1D560}
    $+p::Send, {U+1D561}
    $+q::Send, {U+1D562}
    $+r::Send, {U+1D563}
    $+s::Send, {U+1D564}
    $+t::Send, {U+1D565}
    $+u::Send, {U+1D566}
    $+v::Send, {U+1D567}
    $+w::Send, {U+1D568}
    $+x::Send, {U+1D569}
    $+y::Send, {U+1D56A}
    $+z::Send, {U+1D56B}

    $0::Send, {U+1D7D8}
    $1::Send, {U+1D7D9}
    $2::Send, {U+1D7DA}
    $3::Send, {U+1D7DB}
    $4::Send, {U+1D7DC}
    $5::Send, {U+1D7DD}
    $6::Send, {U+1D7DE}
    $7::Send, {U+1D7DF}
    $8::Send, {U+1D7E0}
    $9::Send, {U+1D7E1}
    
}
return

;Underline Modifiers
#If DS and modifier = "Bold, Underline" and Caps = "Off"
{
    $a::Send, {U+1D552}{U+0332}
    $b::Send, {U+1D553}{U+0332}
    $c::Send, {U+1D554}{U+0332}
    $d::Send, {U+1D555}{U+0332}
    $e::Send, {U+1D556}{U+0332}
    $f::Send, {U+1D557}{U+0332}
    $g::Send, {U+1D558}{U+0332}
    $h::Send, {U+1D559}{U+0332}
    $i::Send, {U+1D55A}{U+0332}
    $j::Send, {U+1D55B}{U+0332}
    $k::Send, {U+1D55C}{U+0332}
    $l::Send, {U+1D55D}{U+0332}
    $m::Send, {U+1D55E}{U+0332}
    $n::Send, {U+1D55F}{U+0332}
    $o::Send, {U+1D560}{U+0332}
    $p::Send, {U+1D561}{U+0332}
    $q::Send, {U+1D562}{U+0332}
    $r::Send, {U+1D563}{U+0332}
    $s::Send, {U+1D564}{U+0332}
    $t::Send, {U+1D565}{U+0332}
    $u::Send, {U+1D566}{U+0332}
    $v::Send, {U+1D567}{U+0332}
    $w::Send, {U+1D568}{U+0332}
    $x::Send, {U+1D569}{U+0332}
    $y::Send, {U+1D56A}{U+0332}
    $z::Send, {U+1D56B}{U+0332}

    $+a::Send, {U+1D538}{U+0332}
    $+b::Send, {U+1D539}{U+0332}
    $+c::Send, {U+2102}{U+0332}
    $+d::Send, {U+1D53B}{U+0332}
    $+e::Send, {U+1D53C}{U+0332}
    $+f::Send, {U+1D53D}{U+0332}
    $+g::Send, {U+1D53E}{U+0332}
    $+h::Send, {U+210D}{U+0332}
    $+i::Send, {U+1D540}{U+0332}
    $+j::Send, {U+1D541}{U+0332}
    $+k::Send, {U+1D542}{U+0332}
    $+l::Send, {U+1D543}{U+0332}
    $+m::Send, {U+1D544}{U+0332}
    $+n::Send, {U+2115}{U+0332}
    $+o::Send, {U+1D546}{U+0332}
    $+p::Send, {U+2119}{U+0332}
    $+q::Send, {U+211A}{U+0332}
    $+r::Send, {U+211D}{U+0332}
    $+s::Send, {U+1D54A}{U+0332}
    $+t::Send, {U+1D54B}{U+0332}
    $+u::Send, {U+1D54C}{U+0332}
    $+v::Send, {U+1D54D}{U+0332}
    $+w::Send, {U+1D54E}{U+0332}
    $+x::Send, {U+1D54F}{U+0332}
    $+y::Send, {U+1D550}{U+0332}
    $+z::Send, {U+2124}{U+0332}

    $0::Send, {U+1D7D8}{U+0332}
    $1::Send, {U+1D7D9}{U+0332}
    $2::Send, {U+1D7DA}{U+0332}
    $3::Send, {U+1D7DB}{U+0332}
    $4::Send, {U+1D7DC}{U+0332}
    $5::Send, {U+1D7DD}{U+0332}
    $6::Send, {U+1D7DE}{U+0332}
    $7::Send, {U+1D7DF}{U+0332}
    $8::Send, {U+1D7E0}{U+0332}
    $9::Send, {U+1D7E1}{U+0332}

    ~Space::Send, {U+0332}

    ~SC029::Send, {U+0332}
    ~+SC029::Send, {U+0332}
    ~+SC002::Send, {U+0332}
    ~+SC003::Send, {U+0332}
    ~+SC004::Send, {U+0332}
    ~+SC005::Send, {U+0332}
    ~+SC006::Send, {U+0332}
    ~+SC007::Send, {U+0332}
    ~+SC008::Send, {U+0332}
    ~+SC009::Send, {U+0332}
    ~+SC00a::Send, {U+0332}
    ~+SC00b::Send, {U+0332}
    ~SC00c::Send, {U+0332}
    ~+SC00c::Send, {U+0332}
    ~SC00d::Send, {U+0332}
    ~+SC00d::Send, {U+0332}
    ~SC01a::Send, {U+0332}
    ~+SC01a::Send, {U+0332}
    ~SC01b::Send, {U+0332}
    ~+SC01b::Send, {U+0332}
    ~SC027::Send, {U+0332}
    ~+SC027::Send, {U+0332}
    ~SC028::Send, {U+0332}
    ~+SC028::Send, {U+0332}
    ~SC02b::Send, {U+0332}
    ~+SC02b::Send, {U+0332}
    ~SC033::Send, {U+0332}
    ~+SC033::Send, {U+0332}
    ~SC034::Send, {U+0332}
    ~+SC034::Send, {U+0332}
    ~SC035::Send, {U+0332}
    ~+SC035::Send, {U+0332}
    ~SC037::Send, {U+0332}
    ~SC04a::Send, {U+0332}
    ~SC04e::Send, {U+0332}
    ~SC053::Send, {U+0332}
}
return

#If DS and modifier = "Bold, Underline" and Caps = "On"
{
    $a::Send, {U+1D538}{U+0332}
    $b::Send, {U+1D539}{U+0332}
    $c::Send, {U+2102}{U+0332}
    $d::Send, {U+1D53B}{U+0332}
    $e::Send, {U+1D53C}{U+0332}
    $f::Send, {U+1D53D}{U+0332}
    $g::Send, {U+1D53E}{U+0332}
    $h::Send, {U+210D}{U+0332}
    $i::Send, {U+1D540}{U+0332}
    $j::Send, {U+1D541}{U+0332}
    $k::Send, {U+1D542}{U+0332}
    $l::Send, {U+1D543}{U+0332}
    $m::Send, {U+1D544}{U+0332}
    $n::Send, {U+2115}{U+0332}
    $o::Send, {U+1D546}{U+0332}
    $p::Send, {U+2119}{U+0332}
    $q::Send, {U+211A}{U+0332}
    $r::Send, {U+211D}{U+0332}
    $s::Send, {U+1D54A}{U+0332}
    $t::Send, {U+1D54B}{U+0332}
    $u::Send, {U+1D54C}{U+0332}
    $v::Send, {U+1D54D}{U+0332}
    $w::Send, {U+1D54E}{U+0332}
    $x::Send, {U+1D54F}{U+0332}
    $y::Send, {U+1D550}{U+0332}
    $z::Send, {U+2124}{U+0332}

    $+a::Send, {U+1D552}{U+0332}
    $+b::Send, {U+1D553}{U+0332}
    $+c::Send, {U+1D554}{U+0332}
    $+d::Send, {U+1D555}{U+0332}
    $+e::Send, {U+1D556}{U+0332}
    $+f::Send, {U+1D557}{U+0332}
    $+g::Send, {U+1D558}{U+0332}
    $+h::Send, {U+1D559}{U+0332}
    $+i::Send, {U+1D55A}{U+0332}
    $+j::Send, {U+1D55B}{U+0332}
    $+k::Send, {U+1D55C}{U+0332}
    $+l::Send, {U+1D55D}{U+0332}
    $+m::Send, {U+1D55E}{U+0332}
    $+n::Send, {U+1D55F}{U+0332}
    $+o::Send, {U+1D560}{U+0332}
    $+p::Send, {U+1D561}{U+0332}
    $+q::Send, {U+1D562}{U+0332}
    $+r::Send, {U+1D563}{U+0332}
    $+s::Send, {U+1D564}{U+0332}
    $+t::Send, {U+1D565}{U+0332}
    $+u::Send, {U+1D566}{U+0332}
    $+v::Send, {U+1D567}{U+0332}
    $+w::Send, {U+1D568}{U+0332}
    $+x::Send, {U+1D569}{U+0332}
    $+y::Send, {U+1D56A}{U+0332}
    $+z::Send, {U+1D56B}{U+0332}

    $0::Send, {U+1D7D8}{U+0332}
    $1::Send, {U+1D7D9}{U+0332}
    $2::Send, {U+1D7DA}{U+0332}
    $3::Send, {U+1D7DB}{U+0332}
    $4::Send, {U+1D7DC}{U+0332}
    $5::Send, {U+1D7DD}{U+0332}
    $6::Send, {U+1D7DE}{U+0332}
    $7::Send, {U+1D7DF}{U+0332}
    $8::Send, {U+1D7E0}{U+0332}
    $9::Send, {U+1D7E1}{U+0332}

    ~Space::Send, {U+0332}

    ~SC029::Send, {U+0332}
    ~+SC029::Send, {U+0332}
    ~+SC002::Send, {U+0332}
    ~+SC003::Send, {U+0332}
    ~+SC004::Send, {U+0332}
    ~+SC005::Send, {U+0332}
    ~+SC006::Send, {U+0332}
    ~+SC007::Send, {U+0332}
    ~+SC008::Send, {U+0332}
    ~+SC009::Send, {U+0332}
    ~+SC00a::Send, {U+0332}
    ~+SC00b::Send, {U+0332}
    ~SC00c::Send, {U+0332}
    ~+SC00c::Send, {U+0332}
    ~SC00d::Send, {U+0332}
    ~+SC00d::Send, {U+0332}
    ~SC01a::Send, {U+0332}
    ~+SC01a::Send, {U+0332}
    ~SC01b::Send, {U+0332}
    ~+SC01b::Send, {U+0332}
    ~SC027::Send, {U+0332}
    ~+SC027::Send, {U+0332}
    ~SC028::Send, {U+0332}
    ~+SC028::Send, {U+0332}
    ~SC02b::Send, {U+0332}
    ~+SC02b::Send, {U+0332}
    ~SC033::Send, {U+0332}
    ~+SC033::Send, {U+0332}
    ~SC034::Send, {U+0332}
    ~+SC034::Send, {U+0332}
    ~SC035::Send, {U+0332}
    ~+SC035::Send, {U+0332}
    ~SC037::Send, {U+0332}
    ~SC04a::Send, {U+0332}
    ~SC04e::Send, {U+0332}
    ~SC053::Send, {U+0332}
}
return

;Strikethrough Modifiers
#If DS and modifier = "Bold, Strikethrough" and Caps = "Off"
{
    $a::Send, {U+1D552}{U+0336}
    $b::Send, {U+1D553}{U+0336}
    $c::Send, {U+1D554}{U+0336}
    $d::Send, {U+1D555}{U+0336}
    $e::Send, {U+1D556}{U+0336}
    $f::Send, {U+1D557}{U+0336}
    $g::Send, {U+1D558}{U+0336}
    $h::Send, {U+1D559}{U+0336}
    $i::Send, {U+1D55A}{U+0336}
    $j::Send, {U+1D55B}{U+0336}
    $k::Send, {U+1D55C}{U+0336}
    $l::Send, {U+1D55D}{U+0336}
    $m::Send, {U+1D55E}{U+0336}
    $n::Send, {U+1D55F}{U+0336}
    $o::Send, {U+1D560}{U+0336}
    $p::Send, {U+1D561}{U+0336}
    $q::Send, {U+1D562}{U+0336}
    $r::Send, {U+1D563}{U+0336}
    $s::Send, {U+1D564}{U+0336}
    $t::Send, {U+1D565}{U+0336}
    $u::Send, {U+1D566}{U+0336}
    $v::Send, {U+1D567}{U+0336}
    $w::Send, {U+1D568}{U+0336}
    $x::Send, {U+1D569}{U+0336}
    $y::Send, {U+1D56A}{U+0336}
    $z::Send, {U+1D56B}{U+0336}

    $+a::Send, {U+1D538}{U+0336}
    $+b::Send, {U+1D539}{U+0336}
    $+c::Send, {U+2102}{U+0336}
    $+d::Send, {U+1D53B}{U+0336}
    $+e::Send, {U+1D53C}{U+0336}
    $+f::Send, {U+1D53D}{U+0336}
    $+g::Send, {U+1D53E}{U+0336}
    $+h::Send, {U+210D}{U+0336}
    $+i::Send, {U+1D540}{U+0336}
    $+j::Send, {U+1D541}{U+0336}
    $+k::Send, {U+1D542}{U+0336}
    $+l::Send, {U+1D543}{U+0336}
    $+m::Send, {U+1D544}{U+0336}
    $+n::Send, {U+2115}{U+0336}
    $+o::Send, {U+1D546}{U+0336}
    $+p::Send, {U+2119}{U+0336}
    $+q::Send, {U+211A}{U+0336}
    $+r::Send, {U+211D}{U+0336}
    $+s::Send, {U+1D54A}{U+0336}
    $+t::Send, {U+1D54B}{U+0336}
    $+u::Send, {U+1D54C}{U+0336}
    $+v::Send, {U+1D54D}{U+0336}
    $+w::Send, {U+1D54E}{U+0336}
    $+x::Send, {U+1D54F}{U+0336}
    $+y::Send, {U+1D550}{U+0336}
    $+z::Send, {U+2124}{U+0336}

    $0::Send, {U+1D7D8}{U+0336}
    $1::Send, {U+1D7D9}{U+0336}
    $2::Send, {U+1D7DA}{U+0336}
    $3::Send, {U+1D7DB}{U+0336}
    $4::Send, {U+1D7DC}{U+0336}
    $5::Send, {U+1D7DD}{U+0336}
    $6::Send, {U+1D7DE}{U+0336}
    $7::Send, {U+1D7DF}{U+0336}
    $8::Send, {U+1D7E0}{U+0336}
    $9::Send, {U+1D7E1}{U+0336}

    ~Space::Send, {U+0336}

    ~SC029::Send, {U+0336}
    ~+SC029::Send, {U+0336}
    ~+SC002::Send, {U+0336}
    ~+SC003::Send, {U+0336}
    ~+SC004::Send, {U+0336}
    ~+SC005::Send, {U+0336}
    ~+SC006::Send, {U+0336}
    ~+SC007::Send, {U+0336}
    ~+SC008::Send, {U+0336}
    ~+SC009::Send, {U+0336}
    ~+SC00a::Send, {U+0336}
    ~+SC00b::Send, {U+0336}
    ~SC00c::Send, {U+0336}
    ~+SC00c::Send, {U+0336}
    ~SC00d::Send, {U+0336}
    ~+SC00d::Send, {U+0336}
    ~SC01a::Send, {U+0336}
    ~+SC01a::Send, {U+0336}
    ~SC01b::Send, {U+0336}
    ~+SC01b::Send, {U+0336}
    ~SC027::Send, {U+0336}
    ~+SC027::Send, {U+0336}
    ~SC028::Send, {U+0336}
    ~+SC028::Send, {U+0336}
    ~SC02b::Send, {U+0336}
    ~+SC02b::Send, {U+0336}
    ~SC033::Send, {U+0336}
    ~+SC033::Send, {U+0336}
    ~SC034::Send, {U+0336}
    ~+SC034::Send, {U+0336}
    ~SC035::Send, {U+0336}
    ~+SC035::Send, {U+0336}
    ~SC037::Send, {U+0336}
    ~SC04a::Send, {U+0336}
    ~SC04e::Send, {U+0336}
    ~SC053::Send, {U+0336}
}
return

#If DS and modifier = "Bold, Strikethrough" and Caps = "On"
{
    $a::Send, {U+1D538}{U+0336}
    $b::Send, {U+1D539}{U+0336}
    $c::Send, {U+2102}{U+0336}
    $d::Send, {U+1D53B}{U+0336}
    $e::Send, {U+1D53C}{U+0336}
    $f::Send, {U+1D53D}{U+0336}
    $g::Send, {U+1D53E}{U+0336}
    $h::Send, {U+210D}{U+0336}
    $i::Send, {U+1D540}{U+0336}
    $j::Send, {U+1D541}{U+0336}
    $k::Send, {U+1D542}{U+0336}
    $l::Send, {U+1D543}{U+0336}
    $m::Send, {U+1D544}{U+0336}
    $n::Send, {U+2115}{U+0336}
    $o::Send, {U+1D546}{U+0336}
    $p::Send, {U+2119}{U+0336}
    $q::Send, {U+211A}{U+0336}
    $r::Send, {U+211D}{U+0336}
    $s::Send, {U+1D54A}{U+0336}
    $t::Send, {U+1D54B}{U+0336}
    $u::Send, {U+1D54C}{U+0336}
    $v::Send, {U+1D54D}{U+0336}
    $w::Send, {U+1D54E}{U+0336}
    $x::Send, {U+1D54F}{U+0336}
    $y::Send, {U+1D550}{U+0336}
    $z::Send, {U+2124}{U+0336}

    $+a::Send, {U+1D552}{U+0336}
    $+b::Send, {U+1D553}{U+0336}
    $+c::Send, {U+1D554}{U+0336}
    $+d::Send, {U+1D555}{U+0336}
    $+e::Send, {U+1D556}{U+0336}
    $+f::Send, {U+1D557}{U+0336}
    $+g::Send, {U+1D558}{U+0336}
    $+h::Send, {U+1D559}{U+0336}
    $+i::Send, {U+1D55A}{U+0336}
    $+j::Send, {U+1D55B}{U+0336}
    $+k::Send, {U+1D55C}{U+0336}
    $+l::Send, {U+1D55D}{U+0336}
    $+m::Send, {U+1D55E}{U+0336}
    $+n::Send, {U+1D55F}{U+0336}
    $+o::Send, {U+1D560}{U+0336}
    $+p::Send, {U+1D561}{U+0336}
    $+q::Send, {U+1D562}{U+0336}
    $+r::Send, {U+1D563}{U+0336}
    $+s::Send, {U+1D564}{U+0336}
    $+t::Send, {U+1D565}{U+0336}
    $+u::Send, {U+1D566}{U+0336}
    $+v::Send, {U+1D567}{U+0336}
    $+w::Send, {U+1D568}{U+0336}
    $+x::Send, {U+1D569}{U+0336}
    $+y::Send, {U+1D56A}{U+0336}
    $+z::Send, {U+1D56B}{U+0336}

    $0::Send, {U+1D7D8}{U+0336}
    $1::Send, {U+1D7D9}{U+0336}
    $2::Send, {U+1D7DA}{U+0336}
    $3::Send, {U+1D7DB}{U+0336}
    $4::Send, {U+1D7DC}{U+0336}
    $5::Send, {U+1D7DD}{U+0336}
    $6::Send, {U+1D7DE}{U+0336}
    $7::Send, {U+1D7DF}{U+0336}
    $8::Send, {U+1D7E0}{U+0336}
    $9::Send, {U+1D7E1}{U+0336}

    ~Space::Send, {U+0336}

    ~SC029::Send, {U+0336}
    ~+SC029::Send, {U+0336}
    ~+SC002::Send, {U+0336}
    ~+SC003::Send, {U+0336}
    ~+SC004::Send, {U+0336}
    ~+SC005::Send, {U+0336}
    ~+SC006::Send, {U+0336}
    ~+SC007::Send, {U+0336}
    ~+SC008::Send, {U+0336}
    ~+SC009::Send, {U+0336}
    ~+SC00a::Send, {U+0336}
    ~+SC00b::Send, {U+0336}
    ~SC00c::Send, {U+0336}
    ~+SC00c::Send, {U+0336}
    ~SC00d::Send, {U+0336}
    ~+SC00d::Send, {U+0336}
    ~SC01a::Send, {U+0336}
    ~+SC01a::Send, {U+0336}
    ~SC01b::Send, {U+0336}
    ~+SC01b::Send, {U+0336}
    ~SC027::Send, {U+0336}
    ~+SC027::Send, {U+0336}
    ~SC028::Send, {U+0336}
    ~+SC028::Send, {U+0336}
    ~SC02b::Send, {U+0336}
    ~+SC02b::Send, {U+0336}
    ~SC033::Send, {U+0336}
    ~+SC033::Send, {U+0336}
    ~SC034::Send, {U+0336}
    ~+SC034::Send, {U+0336}
    ~SC035::Send, {U+0336}
    ~+SC035::Send, {U+0336}
    ~SC037::Send, {U+0336}
    ~SC04a::Send, {U+0336}
    ~SC04e::Send, {U+0336}
    ~SC053::Send, {U+0336}
}
return

;Underline and Strikethrough Modifiers
#If DS and modifier = "Bold, Underline, Strikethrough" and Caps = "Off"
{
    $a::Send, {U+1D552}{U+0332}{U+0336}
    $b::Send, {U+1D553}{U+0332}{U+0336}
    $c::Send, {U+1D554}{U+0332}{U+0336}
    $d::Send, {U+1D555}{U+0332}{U+0336}
    $e::Send, {U+1D556}{U+0332}{U+0336}
    $f::Send, {U+1D557}{U+0332}{U+0336}
    $g::Send, {U+1D558}{U+0332}{U+0336}
    $h::Send, {U+1D559}{U+0332}{U+0336}
    $i::Send, {U+1D55A}{U+0332}{U+0336}
    $j::Send, {U+1D55B}{U+0332}{U+0336}
    $k::Send, {U+1D55C}{U+0332}{U+0336}
    $l::Send, {U+1D55D}{U+0332}{U+0336}
    $m::Send, {U+1D55E}{U+0332}{U+0336}
    $n::Send, {U+1D55F}{U+0332}{U+0336}
    $o::Send, {U+1D560}{U+0332}{U+0336}
    $p::Send, {U+1D561}{U+0332}{U+0336}
    $q::Send, {U+1D562}{U+0332}{U+0336}
    $r::Send, {U+1D563}{U+0332}{U+0336}
    $s::Send, {U+1D564}{U+0332}{U+0336}
    $t::Send, {U+1D565}{U+0332}{U+0336}
    $u::Send, {U+1D566}{U+0332}{U+0336}
    $v::Send, {U+1D567}{U+0332}{U+0336}
    $w::Send, {U+1D568}{U+0332}{U+0336}
    $x::Send, {U+1D569}{U+0332}{U+0336}
    $y::Send, {U+1D56A}{U+0332}{U+0336}
    $z::Send, {U+1D56B}{U+0332}{U+0336}

    $+a::Send, {U+1D538}{U+0332}{U+0336}
    $+b::Send, {U+1D539}{U+0332}{U+0336}
    $+c::Send, {U+2102}{U+0332}{U+0336}
    $+d::Send, {U+1D53B}{U+0332}{U+0336}
    $+e::Send, {U+1D53C}{U+0332}{U+0336}
    $+f::Send, {U+1D53D}{U+0332}{U+0336}
    $+g::Send, {U+1D53E}{U+0332}{U+0336}
    $+h::Send, {U+210D}{U+0332}{U+0336}
    $+i::Send, {U+1D540}{U+0332}{U+0336}
    $+j::Send, {U+1D541}{U+0332}{U+0336}
    $+k::Send, {U+1D542}{U+0332}{U+0336}
    $+l::Send, {U+1D543}{U+0332}{U+0336}
    $+m::Send, {U+1D544}{U+0332}{U+0336}
    $+n::Send, {U+2115}{U+0332}{U+0336}
    $+o::Send, {U+1D546}{U+0332}{U+0336}
    $+p::Send, {U+2119}{U+0332}{U+0336}
    $+q::Send, {U+211A}{U+0332}{U+0336}
    $+r::Send, {U+211D}{U+0332}{U+0336}
    $+s::Send, {U+1D54A}{U+0332}{U+0336}
    $+t::Send, {U+1D54B}{U+0332}{U+0336}
    $+u::Send, {U+1D54C}{U+0332}{U+0336}
    $+v::Send, {U+1D54D}{U+0332}{U+0336}
    $+w::Send, {U+1D54E}{U+0332}{U+0336}
    $+x::Send, {U+1D54F}{U+0332}{U+0336}
    $+y::Send, {U+1D550}{U+0332}{U+0336}
    $+z::Send, {U+2124}{U+0332}{U+0336}

    $0::Send, {U+1D7D8}{U+0332}{U+0336}
    $1::Send, {U+1D7D9}{U+0332}{U+0336}
    $2::Send, {U+1D7DA}{U+0332}{U+0336}
    $3::Send, {U+1D7DB}{U+0332}{U+0336}
    $4::Send, {U+1D7DC}{U+0332}{U+0336}
    $5::Send, {U+1D7DD}{U+0332}{U+0336}
    $6::Send, {U+1D7DE}{U+0332}{U+0336}
    $7::Send, {U+1D7DF}{U+0332}{U+0336}
    $8::Send, {U+1D7E0}{U+0332}{U+0336}
    $9::Send, {U+1D7E1}{U+0332}{U+0336}

    ~Space::Send, {U+0332}{U+0336}

    ~SC029::Send, {U+0332}{U+0336}
    ~+SC029::Send, {U+0332}{U+0336}
    ~+SC002::Send, {U+0332}{U+0336}
    ~+SC003::Send, {U+0332}{U+0336}
    ~+SC004::Send, {U+0332}{U+0336}
    ~+SC005::Send, {U+0332}{U+0336}
    ~+SC006::Send, {U+0332}{U+0336}
    ~+SC007::Send, {U+0332}{U+0336}
    ~+SC008::Send, {U+0332}{U+0336}
    ~+SC009::Send, {U+0332}{U+0336}
    ~+SC00a::Send, {U+0332}{U+0336}
    ~+SC00b::Send, {U+0332}{U+0336}
    ~SC00c::Send, {U+0332}{U+0336}
    ~+SC00c::Send, {U+0332}{U+0336}
    ~SC00d::Send, {U+0332}{U+0336}
    ~+SC00d::Send, {U+0332}{U+0336}
    ~SC01a::Send, {U+0332}{U+0336}
    ~+SC01a::Send, {U+0332}{U+0336}
    ~SC01b::Send, {U+0332}{U+0336}
    ~+SC01b::Send, {U+0332}{U+0336}
    ~SC027::Send, {U+0332}{U+0336}
    ~+SC027::Send, {U+0332}{U+0336}
    ~SC028::Send, {U+0332}{U+0336}
    ~+SC028::Send, {U+0332}{U+0336}
    ~SC02b::Send, {U+0332}{U+0336}
    ~+SC02b::Send, {U+0332}{U+0336}
    ~SC033::Send, {U+0332}{U+0336}
    ~+SC033::Send, {U+0332}{U+0336}
    ~SC034::Send, {U+0332}{U+0336}
    ~+SC034::Send, {U+0332}{U+0336}
    ~SC035::Send, {U+0332}{U+0336}
    ~+SC035::Send, {U+0332}{U+0336}
    ~SC037::Send, {U+0332}{U+0336}
    ~SC04a::Send, {U+0332}{U+0336}
    ~SC04e::Send, {U+0332}{U+0336}
    ~SC053::Send, {U+0332}{U+0336}
}
return

#If DS and modifier = "Bold, Underline, Strikethrough" and Caps = "On"
{
    $a::Send, {U+1D538}{U+0332}{U+0336}
    $b::Send, {U+1D539}{U+0332}{U+0336}
    $c::Send, {U+2102}{U+0332}{U+0336}
    $d::Send, {U+1D53B}{U+0332}{U+0336}
    $e::Send, {U+1D53C}{U+0332}{U+0336}
    $f::Send, {U+1D53D}{U+0332}{U+0336}
    $g::Send, {U+1D53E}{U+0332}{U+0336}
    $h::Send, {U+210D}{U+0332}{U+0336}
    $i::Send, {U+1D540}{U+0332}{U+0336}
    $j::Send, {U+1D541}{U+0332}{U+0336}
    $k::Send, {U+1D542}{U+0332}{U+0336}
    $l::Send, {U+1D543}{U+0332}{U+0336}
    $m::Send, {U+1D544}{U+0332}{U+0336}
    $n::Send, {U+2115}{U+0332}{U+0336}
    $o::Send, {U+1D546}{U+0332}{U+0336}
    $p::Send, {U+2119}{U+0332}{U+0336}
    $q::Send, {U+211A}{U+0332}{U+0336}
    $r::Send, {U+211D}{U+0332}{U+0336}
    $s::Send, {U+1D54A}{U+0332}{U+0336}
    $t::Send, {U+1D54B}{U+0332}{U+0336}
    $u::Send, {U+1D54C}{U+0332}{U+0336}
    $v::Send, {U+1D54D}{U+0332}{U+0336}
    $w::Send, {U+1D54E}{U+0332}{U+0336}
    $x::Send, {U+1D54F}{U+0332}{U+0336}
    $y::Send, {U+1D550}{U+0332}{U+0336}
    $z::Send, {U+2124}{U+0332}{U+0336}

    $+a::Send, {U+1D552}{U+0332}{U+0336}
    $+b::Send, {U+1D553}{U+0332}{U+0336}
    $+c::Send, {U+1D554}{U+0332}{U+0336}
    $+d::Send, {U+1D555}{U+0332}{U+0336}
    $+e::Send, {U+1D556}{U+0332}{U+0336}
    $+f::Send, {U+1D557}{U+0332}{U+0336}
    $+g::Send, {U+1D558}{U+0332}{U+0336}
    $+h::Send, {U+1D559}{U+0332}{U+0336}
    $+i::Send, {U+1D55A}{U+0332}{U+0336}
    $+j::Send, {U+1D55B}{U+0332}{U+0336}
    $+k::Send, {U+1D55C}{U+0332}{U+0336}
    $+l::Send, {U+1D55D}{U+0332}{U+0336}
    $+m::Send, {U+1D55E}{U+0332}{U+0336}
    $+n::Send, {U+1D55F}{U+0332}{U+0336}
    $+o::Send, {U+1D560}{U+0332}{U+0336}
    $+p::Send, {U+1D561}{U+0332}{U+0336}
    $+q::Send, {U+1D562}{U+0332}{U+0336}
    $+r::Send, {U+1D563}{U+0332}{U+0336}
    $+s::Send, {U+1D564}{U+0332}{U+0336}
    $+t::Send, {U+1D565}{U+0332}{U+0336}
    $+u::Send, {U+1D566}{U+0332}{U+0336}
    $+v::Send, {U+1D567}{U+0332}{U+0336}
    $+w::Send, {U+1D568}{U+0332}{U+0336}
    $+x::Send, {U+1D569}{U+0332}{U+0336}
    $+y::Send, {U+1D56A}{U+0332}{U+0336}
    $+z::Send, {U+1D56B}{U+0332}{U+0336}

    $0::Send, {U+1D7D8}{U+0332}{U+0336}
    $1::Send, {U+1D7D9}{U+0332}{U+0336}
    $2::Send, {U+1D7DA}{U+0332}{U+0336}
    $3::Send, {U+1D7DB}{U+0332}{U+0336}
    $4::Send, {U+1D7DC}{U+0332}{U+0336}
    $5::Send, {U+1D7DD}{U+0332}{U+0336}
    $6::Send, {U+1D7DE}{U+0332}{U+0336}
    $7::Send, {U+1D7DF}{U+0332}{U+0336}
    $8::Send, {U+1D7E0}{U+0332}{U+0336}
    $9::Send, {U+1D7E1}{U+0332}{U+0336}

    ~Space::Send, {U+0332}{U+0336}

    ~SC029::Send, {U+0332}{U+0336}
    ~+SC029::Send, {U+0332}{U+0336}
    ~+SC002::Send, {U+0332}{U+0336}
    ~+SC003::Send, {U+0332}{U+0336}
    ~+SC004::Send, {U+0332}{U+0336}
    ~+SC005::Send, {U+0332}{U+0336}
    ~+SC006::Send, {U+0332}{U+0336}
    ~+SC007::Send, {U+0332}{U+0336}
    ~+SC008::Send, {U+0332}{U+0336}
    ~+SC009::Send, {U+0332}{U+0336}
    ~+SC00a::Send, {U+0332}{U+0336}
    ~+SC00b::Send, {U+0332}{U+0336}
    ~SC00c::Send, {U+0332}{U+0336}
    ~+SC00c::Send, {U+0332}{U+0336}
    ~SC00d::Send, {U+0332}{U+0336}
    ~+SC00d::Send, {U+0332}{U+0336}
    ~SC01a::Send, {U+0332}{U+0336}
    ~+SC01a::Send, {U+0332}{U+0336}
    ~SC01b::Send, {U+0332}{U+0336}
    ~+SC01b::Send, {U+0332}{U+0336}
    ~SC027::Send, {U+0332}{U+0336}
    ~+SC027::Send, {U+0332}{U+0336}
    ~SC028::Send, {U+0332}{U+0336}
    ~+SC028::Send, {U+0332}{U+0336}
    ~SC02b::Send, {U+0332}{U+0336}
    ~+SC02b::Send, {U+0332}{U+0336}
    ~SC033::Send, {U+0332}{U+0336}
    ~+SC033::Send, {U+0332}{U+0336}
    ~SC034::Send, {U+0332}{U+0336}
    ~+SC034::Send, {U+0332}{U+0336}
    ~SC035::Send, {U+0332}{U+0336}
    ~+SC035::Send, {U+0332}{U+0336}
    ~SC037::Send, {U+0332}{U+0336}
    ~SC04a::Send, {U+0332}{U+0336}
    ~SC04e::Send, {U+0332}{U+0336}
    ~SC053::Send, {U+0332}{U+0336}
}
return
