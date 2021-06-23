@PATH C:\Program Files\AutoHotkey\Compiler;C:\windows\system32
@if not exist "C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" goto notins

taskkill /im "wait5sec.exe"

@echo -------------------------------------------------
Ahk2Exe.exe /in "wait5sec.ahk" /out "wait5sec.exe" /icon "SharedIcons/ico_sync.ico" /mpress "0"
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