:: Directory to save backups
SET backupDir=C:\OBS Backups

:: Clear cache to save storage
del /q "config\obs-studio\plugin_config\obs-browser\Cache"
del /q "config\obs-studio\plugin_config\obs-browser\Code Cache\js"
del /q "config\obs-studio\crashes"
del /q "config\obs-studio\logs"

:: Store date as a variable
FOR /f "tokens=2 delims==" %%G in ('wmic os get localdatetime /value') do set datetime=%%G
SET hh=%time:~0,2%
SET hh=%hh: =0%
SET datetime=%datetime:~0,4%-%datetime:~4,2%-%datetime:~6,2% %hh%-%time:~3,2%-%time:~6,2%

:: Zip folders
C:\"Program Files"\7-Zip\7z A "%backupDir%\%datetime% OBS Studio.zip" "*"

:: Open backup directory
start "" "%backupDir%"