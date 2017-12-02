;;--- Head --- Informations --- AHK --- File(s) needed ---

;;	start up all minimize windows
;;	Compatibility: Windows
;;	All files must be in same folder. Where you want.
;;	64 bit AHK version : 1.1.24.2 64 bit Unicode

;;	Why make it simple when you can make it complicated.

;;--- Softwares var options files ---

	;;Menu, Tray, Icon, C:\Windows\winsxs\amd64_microsoft-windows-dxp-deviceexperience_31bf3856ad364e35_6.1.7601.17514_none_a54b31331066c8e2\sync.ico

	SetWorkingDir, %A_ScriptDir%
	#NoEnv

	SetEnv, sleep, 5
	SetEnv, sleep2, %sleep%
	Sleep2 *= 2

	SetEnv, title, Wait %sleep2% seconds
	SetEnv, mode, Wait and quit.
	SetEnv, version, Version 2017-12-02-1307
	SetEnv, Author, LostByteSoft
	SetEnv, debug, 0

	FileInstall, SharedIcons.dll, C:\Program Files\Common Files\SharedIcons.dll, 0

;;--- Menu Tray options ---

	SharedIcons :=  "C:\Program Files\Common Files\SharedIcons.dll"		;; Put wait5sec anywhere and icon came from c:\pf\si.dll

	Menu, Tray, Icon, %SharedIcons%, 9

	Menu, Tray, NoStandard
	Menu, tray, add, ---=== %title% ===---, about
	Menu, Tray, Icon, ---=== %title% ===---, %SharedIcons%, 9
	Menu, tray, add, Show logo, GuiLogo
	Menu, tray, add, Secret MsgBox, secret					; Secret MsgBox, just show all options and variables of the program
	Menu, Tray, Icon, Secret MsgBox, %SharedIcons%, 1
	Menu, tray, add, About && ReadMe, author
	Menu, Tray, Icon, About && ReadMe, %SharedIcons%, 2
	Menu, tray, add, Author %author%, about
	menu, tray, disable, Author %author%
	Menu, tray, add, %version%, about
	menu, tray, disable, %version%
	Menu, tray, add,
	Menu, tray, add, --== Control ==--, about
	Menu, Tray, Icon, --== Control ==--, %SharedIcons%, 3
	Menu, tray, add, Exit %title%, Close					; Close exit program
	Menu, Tray, Icon, Exit %title%,  %SharedIcons%, 4
	Menu, tray, add, Refresh (ini mod), doReload 				; Reload the script.
	Menu, Tray, Icon, Refresh (ini mod),  %SharedIcons%, 5
	Menu, tray, add, Set Debug (Toggle), debug
	Menu, Tray, Icon, Set Debug (Toggle),  %SharedIcons%, 6
	Menu, tray, add, Pause (Toggle), pause
	Menu, Tray, Icon, Pause (Toggle),  %SharedIcons%, 7
	Menu, tray, add,
	Menu, Tray, Tip, %title%

;;--- Software start here ---

start:
	loop:
	Sleep, %sleep%000

	IfEqual, debug, 1, TrayTip, Sleeper, Just sleep for %sleep2% seconds. In debug mode this software do not quit. (quit by tray or press ESC)., 4, 1

	Sleep, %sleep%000

	IfEqual, debug, 1, goto, loop
	Goto, close

;;--- Debug Pause ---

debug:
	IfEqual, debug, 0, goto, debug1
	IfEqual, debug, 1, goto, debug0

	debug0:
	SetEnv, debug, 0
	goto, start

	debug1:
	SetEnv, debug, 1
	goto, start

pause:
	Ifequal, pause, 0, goto, paused
	Ifequal, pause, 1, goto, unpaused

	paused:
	SetEnv, pause, 1
	goto, sleep

	unpaused:	
	Menu, Tray, Icon, %logoicon%
	SetEnv, pause, 0
	Goto, start

	sleep:
	Menu, Tray, Icon, %SharedIcons%, 7
	sleep2:
	sleep, 500000
	goto, sleep2

;;--- Quit (escape , esc) ---

Close:
	ExitApp

Escape::
	ExitApp

doReload:
	Reload
	sleep, 100
	goto, Close

;;--- Tray bar ---

secret:
	MsgBox, 48, %title%,All variables is shown here.`n`nTitle=%title% mode=%mode% version=%version% author=%author% A_WorkingDir=%A_WorkingDir%`n`nSharedIcons=%SharedIcons%
	Return

about:
	TrayTip, %title%, %mode% : Time: %sleep% Speed: %speed%, 2, 1
	Return

author:
	MsgBox, 64, %title%, %title% %mode% %version% %author%. This software is usefull to wait %sleep2% seconds (and nothing more).`n`n`tGo to https://github.com/LostByteSoft
	Return

version:
	TrayTip, %title%, %version% by %author%, 2, 2
	Return

GuiLogo:
	Gui, 4:Add, Picture, x25 y25 w400 h400, %logoicon%
	Gui, 4:Show, w450 h450, %title% Logo
	Gui, 4:Color, 000000
	Sleep, 500
	Return

	4GuiClose:
	Gui 4:Cancel
	return

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
;      The warranty is included in your anus. Look carefully you
;             might miss all theses small characters.
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