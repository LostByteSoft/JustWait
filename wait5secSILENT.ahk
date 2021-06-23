;;--- Head --- Informations --- AHK --- File(s) needed ---

;;	Compatibility: Windows
;;	All files must be in same folder. Where you want.
;;	64 bit AHK version : 1.1.24.2 64 bit Unicode

;;	Why make it simple when you can make it complicated.

;;	Version 2021-06-23

;;--- Softwares var options files ---

	SetWorkingDir, %A_ScriptDir%
	#NoEnv

	SetEnv, sleep, 5
	SetEnv, sleep2, %sleep%
	Sleep2 *= 2

	SetEnv, title, Wait %sleep2% seconds
	SetEnv, mode, Wait and quit.
	SetEnv, version, Version 2020-05-27
	SetEnv, Author, LostByteSoft
	SetEnv, debug, 0

	SetEnv, nomsg, 1	;; put 1 to remove the traytip msg (silent mode)

;;--- Menu Tray options ---

	Menu, Tray, NoStandard
	Menu, tray, add, ---=== %title% ===---, about
	Menu, tray, add, Show logo, GuiLogo
	Menu, tray, add, Secret MsgBox, secret					; Secret MsgBox, just show all options and variables of the program.
	Menu, tray, add, About && ReadMe, author				; infos about author
	Menu, tray, add, Author %author%, about					; author msg box
	menu, tray, disable, Author %author%
	Menu, tray, add, %version%, about					; version of the software
	menu, tray, disable, %version%
	Menu, tray, add, Open project web page, webpage				; open web page project
	Menu, tray, add,
	Menu, tray, add, --== Control ==--, about
	Menu, tray, add, Set Debug (Toggle), debug				; debug msg
	Menu, tray, add, Open A_WorkingDir, A_WorkingDir			; open where the exe is
	Menu, tray, add,
	Menu, tray, add, Exit %title%, ExitApp					; Close exit program
	Menu, tray, add, Refresh (Ini mod), doReload 				; Reload the script.
	Menu, tray, add, Pause (Toggle), pause					; pause the script
	Menu, tray, add,
	Menu, tray, add, --== Options ==--, about
	menu, tray, add,
	menu, tray, add, Show infos, secret
	menu, tray, add,
	Menu, Tray, Tip, %mode%

;;--- Software start here ---

start:
	loop:

	IfEqual, nomsg, 1, goto, nomsg

	TrayTip , %Title%, File location : %A_WorkingDir%\ (In clipboard) and the name is %A_ScriptName%, 2, 18

	nomsg:

	clipboard = %A_WorkingDir%\	;; with some things this is causing some issues

	Sleep, %sleep%000

	IfEqual, debug, 1, TrayTip, Sleeper, Just sleep for %sleep2% seconds. In debug mode this software do not quit. (quit by tray or press ESC)., 4, 1

	Sleep, %sleep%000

	IfEqual, debug, 1, goto, loop

	IfEqual, pause, 1, goto, loop

	Goto, close

;;--- debug pause ---

Debug:
	IfEqual, debug, 0, goto, enable
	IfEqual, debug, 1, goto, disable

	enable:
		SetEnv, debug, 1
		TrayTip, %title%, Activated ! debug=%debug%, 1, 2
		Goto, start

	disable:
		SetEnv, debug, 0
		TrayTip, %title%, Deactivated ! debug=%debug%, 1, 2
		Goto, start

pause:
	Ifequal, pause, 0, goto, paused
	Ifequal, pause, 1, goto, unpaused

	paused:
		SetEnv, pause, 1
		goto, start

	unpaused:
		SetEnv, pause, 0
		Goto, start

;;--- Quit (escape , esc) ---

Escape::
	ExitApp

GuiClose:
	Gui, destroy
	ExitApp

ExitApp:
	Gui, destroy
	ExitApp

doReload:
	Gui, destroy
	Reload
	ExitApp

Close:
	Gui, destroy
	ExitApp

;;--- Tray bar ---

author:
	MsgBox, 64, %title%, %title% %mode% %version% %author%. This software is usefull to wait %sleep2% seconds (and nothing more).`n`n`tGo to https://github.com/LostByteSoft
	Return

secret:
	MsgBox, 0, %title% - SECRET MsgBox, title=%title%`nmode=%mode%`nversion=%version%`nauthor=%author%`nLogoIcon=%logoicon%`n`nDebug=%debug%`nA_ScriptDir=%A_ScriptDir%\`nA_WorkingDir=%A_WorkingDir%\`nIcoFolder=%icofolder%\`n`nClipboard (if text)=%clipboard%
	Return

about:
	TrayTip, %title%, %mode% by %author%, 2, 1
	Sleep, 500
	Return

version:
	TrayTip, %title%, %version%, 2, 2
	Sleep, 500
	Return

GuiLogo:
	Gui, 4:Add, Picture, x25 y25 w400 h400, %A_WorkingDir%\%A_ScriptName%
	Gui, 4:Show, w450 h450, %title% Logo
	Gui, 4:Color, 000000
	Gui, 4:-MinimizeBox
	Sleep, 500
	Return

	4GuiClose:
	Gui 4:Cancel
	return

A_WorkingDir:
	IfEqual, debug, 1, msgbox, (A_WorkingDir:) run explorer.exe "%A_WorkingDir%"
	run, explorer.exe "%A_WorkingDir%"
	Return

webpage:
	run, https://github.com/LostByteSoft/
	Return

;;--- End of script ---
;
;            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
;   Version 3.14159265358979323846264338327950288419716939937510582
;                          March 2017
;
; Everyone is permitted to copy and distribute verbatim or modified
; copies of this license document, and changing it is allowed as long
; as the name is changed.
;
;            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
;   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
;
;              You just DO WHAT THE FUCK YOU WANT TO.
;
;		     NO FUCKING WARRANTY AT ALL
;
;	As is customary and in compliance with current global and
;	interplanetary regulations, the author of these pages disclaims
;	all liability for the consequences of the advice given here,
;	in particular in the event of partial or total destruction of
;	the material, Loss of rights to the manufacturer's warranty,
;	electrocution, drowning, divorce, civil war, the effects of
;	radiation due to atomic fission, unexpected tax recalls or
;	    encounters with extraterrestrial beings 'elsewhere.
;
;              LostByteSoft no copyright or copyleft.
;
;	If you are unhappy with this software i do not care.
;
;;--- End of file ---     