@echo off
@echo off
set "target_path=%~dp0\bin\64bit"
set "shortcut_path=%~dp0\OBS.lnk"

echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs
echo sLinkFile = "%shortcut_path%" >> CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs
echo oLink.TargetPath = "%target_path%\obs64.exe" >> CreateShortcut.vbs
echo oLink.WorkingDirectory = "%target_path%" >> CreateShortcut.vbs
echo oLink.Save >> CreateShortcut.vbs

cscript /nologo CreateShortcut.vbs
del CreateShortcut.vbs

echo "Setup done, can copy the shortcut to your start menu? (y/n)"

set /p answer=
if "%answer%"=="y" (
  copy "%shortcut_path%" "%appdata%\Microsoft\Windows\Start Menu\Programs\OBS Portable.lnk"
) 

echo "Can copy again to Desktop? (y/n)"

set /p answer=
if "%answer%"=="y" (
  copy "%shortcut_path%" "%userprofile%\Desktop\OBS Portable.lnk"
) 
