;;--- Head --- Informations --- AHK --- File(s) needed ---

;;	LostByteSoft
;;	Compatibility : w7 w8 w8.1 w10 w11
;;	Architecture: x64

;;	All files must be in same folder. Where you want.
;;	64 bit AHK version : 1.1.24.2 64 bit Unicode

;;	Why make it simple when you can make it complicated.

;;--- Softwares var options files ---

	SetWorkingDir, %A_ScriptDir%
	#NoEnv

	SetEnv, sleep, 5
	SetEnv, sleep2, %sleep%
	Sleep2 *= 2

	SetEnv, title, Wait %sleep2% seconds
	SetEnv, mode, Wait and quit.
	SetEnv, version, Version 2020-06-24
	SetEnv, Author, LostByteSoft
	SetEnv, debug, 0

	SetEnv, nomsg, 0	;; put 1 to remove the traytip msg (silent mode)

	SetEnv, icofolder, C:\Program Files\Common Files
	SetEnv, logoicon, ico_sync.ico

	;; specific files

	FileInstall, SharedIcons\ico_sync.ico, %icofolder%\ico_sync.ico, 0

	;; Common ico

	FileInstall, SharedIcons\ico_about.ico, %icofolder%\ico_about.ico, 0
	FileInstall, SharedIcons\ico_lock.ico, %icofolder%\ico_lock.ico, 0
	FileInstall, SharedIcons\ico_options.ico, %icofolder%\ico_options.ico, 0
	FileInstall, SharedIcons\ico_reboot.ico, %icofolder%\ico_reboot.ico, 0
	FileInstall, SharedIcons\ico_shut.ico, %icofolder%\ico_shut.ico, 0
	FileInstall, SharedIcons\ico_debug.ico, %icofolder%\ico_debug.ico, 0
	FileInstall, SharedIcons\ico_HotKeys.ico, %icofolder%\ico_HotKeys.ico, 0
	FileInstall, SharedIcons\ico_pause.ico, %icofolder%\ico_pause.ico, 0
	FileInstall, SharedIcons\ico_loupe.ico, %icofolder%\ico_loupe.ico, 0
	FileInstall, SharedIcons\ico_folder.ico, %icofolder%\ico_folder.ico, 0

;;--- Menu Tray options ---

	Menu, Tray, NoStandard
	Menu, tray, add, ---=== %title% ===---, about
	Menu, Tray, Icon, ---=== %title% ===---, %icofolder%\%logoicon%
	Menu, tray, add, Show logo, GuiLogo
	Menu, tray, add, Secret MsgBox, secret					; Secret MsgBox, just show all options and variables of the program.
	Menu, Tray, Icon, Secret MsgBox, %icofolder%\ico_lock.ico
	Menu, tray, add, About && ReadMe, author				; infos about author
	Menu, Tray, Icon, About && ReadMe, %icofolder%\ico_about.ico
	Menu, tray, add, Author %author%, about					; author msg box
	menu, tray, disable, Author %author%
	Menu, tray, add, %version%, about					; version of the software
	menu, tray, disable, %version%
	Menu, tray, add, Open project web page, webpage				; open web page project
	Menu, Tray, Icon, Open project web page, %icofolder%\ico_HotKeys.ico
	Menu, tray, add,
	Menu, tray, add, --== Control ==--, about
	Menu, Tray, Icon, --== Control ==--, %icofolder%\ico_options.ico
	;menu, tray, add, Show Gui (Same as click), start			; Default gui open
	;Menu, Tray, Icon, Show Gui (Same as click), %icofolder%\ico_loupe.ico
	;Menu, Tray, Default, Show Gui (Same as click)
	;Menu, Tray, Click, 1
	Menu, tray, add, Set Debug (Toggle), debug				; debug msg
	Menu, Tray, Icon, Set Debug (Toggle), %icofolder%\ico_debug.ico
	Menu, tray, add, Open A_WorkingDir, A_WorkingDir			; open where the exe is
	Menu, Tray, Icon, Open A_WorkingDir, %icofolder%\ico_folder.ico
	Menu, tray, add,
	Menu, tray, add, Exit %title%, ExitApp					; Close exit program
	Menu, Tray, Icon, Exit %title%, %icofolder%\ico_shut.ico
	Menu, tray, add, Refresh (Ini mod), doReload 				; Reload the script.
	Menu, Tray, Icon, Refresh (Ini mod), %icofolder%\ico_reboot.ico
	Menu, tray, add, Pause (Toggle), pause					; pause the script
	Menu, Tray, Icon, Pause (Toggle), %icofolder%\ico_pause.ico
	Menu, tray, add,
	Menu, tray, add, --== Options ==--, about
	Menu, Tray, Icon, --== Options ==--, %icofolder%\ico_options.ico
	;;Menu, tray, add, Show working folder and app name (Toggle), pause	
	menu, tray, add,
	Menu, Tray, Tip, %mode%
	Menu, Tray, Icon, %icofolder%\%logoicon%

;;--- Software start here ---

start:
	loop:

	IfEqual, nomsg, 1, goto, nomsg

	TrayTip , %Title%, File location : %A_WorkingDir%\ (In clipboard) and the name is %A_ScriptName%, 2, 18

	nomsg:

	clipboard = %A_WorkingDir%\

	Sleep, %sleep%000

	IfEqual, debug, 1, TrayTip, Sleeper, Just sleep for %sleep2% seconds. In debug mode this software do not quit. (quit by tray or press ESC)., 4, 1

	Sleep, %sleep%000

	IfEqual, debug, 1, goto, loop

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
		;;Menu, Tray, Icon, %icofolder%\ico_pause.ico
		SetEnv, pause, 1
		goto, start

	unpaused:
		;;Menu, Tray, Icon, %icofolder%\%logoicon%
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
	;; Gui, 4:Add, Picture, x25 y25 w400 h400, %icofolder%\%logoicon%
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