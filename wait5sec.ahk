;;--- Head --- Informations --- AHK --- File(s) needed ---

;;	start up all minimize windows
;;	Compatibility: Windows
;;	All files must be in same folder. Where you want.
;;	64 bit AHK version : 1.1.24.2 64 bit Unicode

;;	Why make it simple when you can make it complicated.

;;--- Softwares var options files ---

	Menu, Tray, Icon, C:\Windows\winsxs\amd64_microsoft-windows-dxp-deviceexperience_31bf3856ad364e35_6.1.7601.17514_none_a54b31331066c8e2\sync.ico

	SetWorkingDir, %A_ScriptDir%
	#NoEnv

	SetEnv, sleep, 5
	SetEnv, sleep2, %sleep%
	Sleep2 *= 2
	SetEnv, logoicon, C:\Windows\winsxs\amd64_microsoft-windows-dxp-deviceexperience_31bf3856ad364e35_6.1.7601.17514_none_a54b31331066c8e2\sync.ico

	SetEnv, title, Wait %sleep2% seconds
	SetEnv, mode, Wait and quit.
	SetEnv, version, Version 2017-10-14-2028
	SetEnv, Author, LostByteSoft

;;--- Menu Tray options ---

	Menu, Tray, NoStandard
	Menu, tray, add, ---=== %title% ===---, about
	Menu, Tray, Icon, ---=== %title% ===---, %logoicon%
	Menu, tray, add, Show logo, GuiLogo
	Menu, tray, add, Secret MsgBox, secret				; Secret MsgBox, just show all options and variables of the program
	Menu, tray, add, About && ReadMe, author
	Menu, tray, add, Author %author%, about
	menu, tray, disable, Author %author%
	Menu, tray, add, %version%, about
	menu, tray, disable, %version%
	Menu, tray, add,
	Menu, tray, add, Exit, Close					; Close exit program
	Menu, tray, add, Refresh, doReload				; Reload the script. Usefull if you change something in configuration
	Menu, tray, add, Set Debug mode (Toggle), debug
	Menu, tray, add,
	Menu, Tray, Tip, %title%

;;--- Software start here ---

loop:
	Sleep, %sleep%000

	IfEqual, debug, 1, TrayTip, Sleeper, Just sleep for %sleep2% seconds. In debug mode this software do not quit. (quit by tray or press ESC)., 4, 1

	Sleep, %sleep%000

	IfEqual, debug, 1, goto, loop
	Goto, close

Debug:
	IfEqual, debug, 0, goto, enable
	IfEqual, debug, 1, goto, disable

	enable:
	SetEnv, debug, 1
	Goto, loop

	disable:
	SetEnv, debug, 0
	Goto, loop

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
	MsgBox, 48, %title%,All variables is shown here.`n`nTitle=%title% mode=%mode% version=%version% author=%author% A_WorkingDir=%A_WorkingDir% Sleep=%sleep% sleep2=%sleep2%
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
	Gui, Add, Picture, x25 y25 w400 h400 , C:\Windows\winsxs\amd64_microsoft-windows-dxp-deviceexperience_31bf3856ad364e35_6.1.7601.17514_none_a54b31331066c8e2\sync.ico
	Gui, Show, w450 h450, %title% Logo
	Gui, Color, 000000
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