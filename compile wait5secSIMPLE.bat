@PATH C:\Program Files\AutoHotkey\Compiler;C:\windows\system32
@if not exist "C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" goto notins

@echo -------------------------------------------------
Ahk2Exe.exe /in "wait5secSIMPLE.ahk" /out "wait5secSIMPLE.exe" /icon "SharedIcons/ico_sync.ico" /mpress "0"
@echo -------------------------------------------------
@exit

:notins
@echo -------------------------------------------------
@echo Ahk is not installed.
@echo -------------------------------------------------
@pause

:exit
@echo -------------------------------------------------
@exit