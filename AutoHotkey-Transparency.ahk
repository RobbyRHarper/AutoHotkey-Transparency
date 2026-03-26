;--------------------------------------------------------------------------------------------------;
;AUTOHOTKEY-TRANSPARENCY
;--------------------------------------------------------------------------------------------------;

;Name: AutoHotkey-Transparency
;Kind: AHK Script
;Purpose: Provide window transparency automations accessible by the keyboard.

;--------------------------------------------------------------------------------------------------;
;READ ME
;--------------------------------------------------------------------------------------------------;

;Refer to https://www.autohotkey.com/docs/v2/ for AutoHotkey documentation.

;This script can be renamed as "AutoHotkey.ahk" and placed into Windows Startup folder.
;	Path: %USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

;Windows can run multiple .ahk file simultaneously, each with its own tray icon.
;Files with the .ahk extension are associated with AutoHotkey and can run by double-clicking.
;AutoHotkey can run .ahk files located in any folder.

;--------------------------------------------------------------------------------------------------;
;DEPENDENCIES
;--------------------------------------------------------------------------------------------------;

;This script has no external dependencies.

;--------------------------------------------------------------------------------------------------;
;TABLE OF CONTENTS
;--------------------------------------------------------------------------------------------------;

;--------------------------------------------------------------------------------------------------;
;OPTIONS
;--------------------------------------------------------------------------------------------------;
;HOTKEYS
;--------------------------------------------------------------------------------------------------;
;HOTKEYS - Remapped Keys
;--------------------------------------------------------------------------------------------------;
;HOTKEYS - WIN+CTRL - Operating System
;--------------------------------------------------------------------------------------------------;
;FUNCTIONS
;--------------------------------------------------------------------------------------------------;
;FUNCTIONS - Operating System
;--------------------------------------------------------------------------------------------------;
;APPENDIX
;--------------------------------------------------------------------------------------------------;

;--------------------------------------------------------------------------------------------------;
;OPTIONS
;--------------------------------------------------------------------------------------------------;

;Set version.
#Requires AutoHotkey v2.0

;Set single instance mode.
#SingleInstance Force

;--------------------------------------------------------------------------------------------------;
;HOTKEYS
;--------------------------------------------------------------------------------------------------;

;--------------------------------------------------------------------------------------------------;
;HOTKEYS - Remapped Keys
;--------------------------------------------------------------------------------------------------;
/* ;DISABLED CODE:
;Reassign ` to loop through setting window transparency.
$`::
{
	;Loop through setting window transparency.
	SetWindowTransparency()
}

;Reassign Shift+` to ~ key to avoid remapped key collision, with keyboard hook safety.
$+`::
{
	SendInput("{~}")
}
*/ ;DISABLED CODE.
;--------------------------------------------------------------------------------------------------;
;HOTKEYS - WIN+CTRL - Operating System
;--------------------------------------------------------------------------------------------------;

;Reassign Win+Ctrl+g to display window properties for window under cursor.
#^g::
{
	ShowWindowPropertiesUnderCursor()
}

;Reassign Win+Ctrl+o to set active window transparency to opaque.
#^o::
{
	SetWindowTransparencyOpaque()
}

;Reassign Win+Ctrl+t to set active window transparency to translucent.
#^t::
{
	SetWindowTransparencyTranslucent()
}

;Reassign Win+Ctrl+w to recursively set active window transparency to decreasing values.
#^w::
{
	SetWindowTransparency()
}

;--------------------------------------------------------------------------------------------------;
;FUNCTIONS
;--------------------------------------------------------------------------------------------------;

;--------------------------------------------------------------------------------------------------;
;FUNCTIONS - Operating System
;--------------------------------------------------------------------------------------------------;

;Set active window transparency to decreasing values.
SetWindowTransparency()
{
	DetectHiddenWindows("On")
	CurrentTransparency := WinGetTransparent("A")
	If !CurrentTransparency
		CurrentTransparency := 255
	NewTransparency := CurrentTransparency - 16
	If NewTransparency > 0
	{
		WinSetTransparent(NewTransparency,"A")
	}
	Else
	{
		SetWindowTransparencyOpaque()
	}
}

;Set active window transparency to opaque.
SetWindowTransparencyOpaque()
{
	WinSetTransparent(255, "A")
	WinSetTransparent("Off", "A")
}

;Set active window transparency to translucent.
SetWindowTransparencyTranslucent()
{
	DetectHiddenWindows("On")
	WinSetTransparent(128, "A")
}

;Display window properties for window under cursor.
ShowWindowPropertiesUnderCursor()
{
	MouseGetPos(,, &MouseWin)
	Transparent := WinGetTransparent("ahk_id " MouseWin)
	TransColor := WinGetTransColor("ahk_id " MouseWin)
	ToolTip("Translucency:`t" . Transparent . "`nTransColor:`t" . TransColor)
}

;--------------------------------------------------------------------------------------------------;
;APPENDIX
;--------------------------------------------------------------------------------------------------;
