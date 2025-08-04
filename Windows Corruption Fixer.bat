@echo off
title Windows Corruption Fixer
setlocal
echo Program Name: Windows Corruption Fixer
echo Version: 14.0.10
echo License: GNU General Public License v3.0
echo Developer: @YonatanReuvenIsraeli
echo GitHub: https://github.com/YonatanReuvenIsraeli
echo Sponsor: https://github.com/sponsors/YonatanReuvenIsraeli
"%windir%\System32\net.exe" session > nul 2>&1
if not "%errorlevel%"=="0" goto "NotAdministrator"
goto "Start"

:"NotAdministrator"
echo.
echo Please run this batch file as an administrator. Press any key to close this batch file.
pause > nul 2>&1
goto "Done"

:"Start"
echo.
echo [1] CHKDSK check.
echo [2] CHKDSK check and fix.
echo [3] View CHKDSK logs.
echo [4] DISM check health.
echo [5] DISM scan health.
echo [6] DISM restore health.
echo [7] DISM revert pending actions.
echo [8] View DISM logs.
echo [9] SFC scan now.
echo [10] SFC verify only.
echo [11] SFC scan file.
echo [12] SFC verify file.
echo [13] View SFC logs.
echo [14] Close.
echo.
set Input=
set /p Input="What do you want to do? (1-14) "
if /i "%Input%"=="1" goto "1"
if /i "%Input%"=="2" goto "2"
if /i "%Input%"=="3" goto "3"
if /i "%Input%"=="4" goto "4"
if /i "%Input%"=="5" goto "5"
if /i "%Input%"=="6" goto "6"
if /i "%Input%"=="7" goto "7"
if /i "%Input%"=="8" goto "8"
if /i "%Input%"=="9" goto "9"
if /i "%Input%"=="10" goto "10"
if /i "%Input%"=="11" goto "11"
if /i "%Input%"=="12" goto "12"
if /i "%Input%"=="13" goto "13"
if /i "%Input%"=="14" goto "Exit"
echo Invalid syntax!
goto "Start"

:"1"
echo.
set CHKDSKCheck=
set /p CHKDSKCheck="Which drive do you want to run CHKDSK check on? (A:-Z:) "
if /i "%CHKDSKCheck%"=="" set CHKDSKCheck=%SystemDrive%
if /i "%CHKDSKCheck%"=="A:" goto "SureCHKDSKCheck"
if /i "%CHKDSKCheck%"=="B:" goto "SureCHKDSKCheck"
if /i "%CHKDSKCheck%"=="C:" goto "SureCHKDSKCheck"
if /i "%CHKDSKCheck%"=="D:" goto "SureCHKDSKCheck"
if /i "%CHKDSKCheck%"=="E:" goto "SureCHKDSKCheck"
if /i "%CHKDSKCheck%"=="F:" goto "SureCHKDSKCheck"
if /i "%CHKDSKCheck%"=="G:" goto "SureCHKDSKCheck"
if /i "%CHKDSKCheck%"=="H:" goto "SureCHKDSKCheck"
if /i "%CHKDSKCheck%"=="I:" goto "SureCHKDSKCheck"
if /i "%CHKDSKCheck%"=="J:" goto "SureCHKDSKCheck"
if /i "%CHKDSKCheck%"=="K:" goto "SureCHKDSKCheck"
if /i "%CHKDSKCheck%"=="L:" goto "SureCHKDSKCheck"
if /i "%CHKDSKCheck%"=="M:" goto "SureCHKDSKCheck"
if /i "%CHKDSKCheck%"=="N:" goto "SureCHKDSKCheck"
if /i "%CHKDSKCheck%"=="O:" goto "SureCHKDSKCheck"
if /i "%CHKDSKCheck%"=="P:" goto "SureCHKDSKCheck"
if /i "%CHKDSKCheck%"=="Q:" goto "SureCHKDSKCheck"
if /i "%CHKDSKCheck%"=="R:" goto "SureCHKDSKCheck"
if /i "%CHKDSKCheck%"=="S:" goto "SureCHKDSKCheck"
if /i "%CHKDSKCheck%"=="T:" goto "SureCHKDSKCheck"
if /i "%CHKDSKCheck%"=="U:" goto "SureCHKDSKCheck"
if /i "%CHKDSKCheck%"=="V:" goto "SureCHKDSKCheck"
if /i "%CHKDSKCheck%"=="W:" goto "SureCHKDSKCheck"
if /i "%CHKDSKCheck%"=="X:" goto "SureCHKDSKCheck"
if /i "%CHKDSKCheck%"=="Y:" goto "SureCHKDSKCheck"
if /i "%CHKDSKCheck%"=="Z:" goto "SureCHKDSKCheck"
echo Invalid syntax!
goto "1"

:"SureCHKDSKCheck"
echo.
set SureCHKDSKCheck=
set /p SureCHKDSKCheck="Are you sure "%CHKDSKCheck%" is the drive letter that you want to run CHKDSK check on? (Yes/No) "
if /i "%SureCHKDSKCheck%"=="Yes" goto "CheckExistCHKDSKCheck"
if /i "%SureCHKDSKCheck%"=="No" goto "1"
echo Invalid syntax!
goto "SureCHKDSKCheck"

:"CheckExistCHKDSKCheck"
if not exist "%CHKDSKCheck%" goto "NotExistCHKDSKCheck"
goto "CHKDSKCheck"

:"NotExistCHKDSKCheck"
echo "%CHKDSKCheck%" does not exist! Please try again.
goto "1"

:"CHKDSKCheck"
echo.
"%windir%\System32\chkdsk.exe" "%CHKDSKCheck%"
goto "Start"

:"2"
echo.
set CHKDSKCheckFix=
set /p CHKDSKCheckFix="Which drive do you want to run CHKDSK check and fix on? (A:-Z:) "
if /i "%CHKDSKCheckFix%"=="" set CHKDSKCheckFix=%SystemDrive%
if /i "%CHKDSKCheckFix%"=="A:" goto "SureCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="B:" goto "SureCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="C:" goto "SureCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="D:" goto "SureCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="E:" goto "SureCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="F:" goto "SureCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="G:" goto "SureCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="H:" goto "SureCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="I:" goto "SureCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="J:" goto "SureCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="K:" goto "SureCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="L:" goto "SureCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="M:" goto "SureCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="N:" goto "SureCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="O:" goto "SureCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="P:" goto "SureCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="Q:" goto "SureCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="R:" goto "SureCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="S:" goto "SureCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="T:" goto "SureCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="U:" goto "SureCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="V:" goto "SureCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="W:" goto "SureCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="X:" goto "SureCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="Y:" goto "SureCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="Z:" goto "SureCHKDSKCheckFix"
echo Invalid syntax!
goto "2"

:"SureCHKDSKCheckFix"
echo.
set SureCHKDSKCheckFix=
set /p SureCHKDSKCheckFix="Are you sure "%CHKDSKCheckFix%" is the drive letter that you want to run CHKDSK check and fix on? (Yes/No) "
if /i "%SureCHKDSKCheckFix%"=="Yes" goto "CheckExistCHKDSKCheckFix"
if /i "%SureCHKDSKCheckFix%"=="No" goto "2"
echo Invalid syntax!
goto "SureCHKDSKCheckFix"

:"CheckExistCHKDSKCheckFix"
if not exist "%CHKDSKCheckFix%" goto "NotExistCHKDSKCheckFix"
goto "CHKDSKCheckFix"

:"NotExistCHKDSKCheckFix"
echo "%CHKDSKCheckFix%" does not exist! Please try again.
goto "2"

:"CHKDSKCheckFix"
echo.
"%windir%\System32\chkdsk.exe" "%CHKDSKCheckFix%" /r
goto "Start"

:"3"
echo.
set OnlineOffline=
set /p OnlineOffline="Are you viewing the logs of an online or offline Windows installation? (Online/Offline) "
if /i "%OnlineOffline%"=="Online" goto "AllRecent"
if /i "%OnlineOffline%"=="Offline" goto "CHKDSKLog"
echo Invalid syntax!
goto "3"

:"CHKDSKLog"
echo.
set CHKDSKLog=
set /p CHKDSKLog="What is the drive letter of your offline Windows installation? (A:-Z:) "
if /i "%CHKDSKLog%"=="A:" goto "SureCHKDSKLog"
if /i "%CHKDSKLog%"=="B:" goto "SureCHKDSKLog"
if /i "%CHKDSKLog%"=="C:" goto "SureCHKDSKLog"
if /i "%CHKDSKLog%"=="D:" goto "SureCHKDSKLog"
if /i "%CHKDSKLog%"=="E:" goto "SureCHKDSKLog"
if /i "%CHKDSKLog%"=="F:" goto "SureCHKDSKLog"
if /i "%CHKDSKLog%"=="G:" goto "SureCHKDSKLog"
if /i "%CHKDSKLog%"=="H:" goto "SureCHKDSKLog"
if /i "%CHKDSKLog%"=="I:" goto "SureCHKDSKLog"
if /i "%CHKDSKLog%"=="J:" goto "SureCHKDSKLog"
if /i "%CHKDSKLog%"=="K:" goto "SureCHKDSKLog"
if /i "%CHKDSKLog%"=="L:" goto "SureCHKDSKLog"
if /i "%CHKDSKLog%"=="M:" goto "SureCHKDSKLog"
if /i "%CHKDSKLog%"=="N:" goto "SureCHKDSKLog"
if /i "%CHKDSKLog%"=="O:" goto "SureCHKDSKLog"
if /i "%CHKDSKLog%"=="P:" goto "SureCHKDSKLog"
if /i "%CHKDSKLog%"=="Q:" goto "SureCHKDSKLog"
if /i "%CHKDSKLog%"=="R:" goto "SureCHKDSKLog"
if /i "%CHKDSKLog%"=="S:" goto "SureCHKDSKLog"
if /i "%CHKDSKLog%"=="T:" goto "SureCHKDSKLog"
if /i "%CHKDSKLog%"=="U:" goto "SureCHKDSKLog"
if /i "%CHKDSKLog%"=="V:" goto "SureCHKDSKLog"
if /i "%CHKDSKLog%"=="W:" goto "SureCHKDSKLog"
if /i "%CHKDSKLog%"=="X:" goto "SureCHKDSKLog"
if /i "%CHKDSKLog%"=="Y:" goto "SureCHKDSKLog"
if /i "%CHKDSKLog%"=="Z:" goto "SureCHKDSKLog"
echo Invalid syntax!
goto "CHKDSKLog"

:"SureCHKDSKLog"
echo.
set SureCHKDSKLog=
set /p SureCHKDSKLog="Are you sure "%CHKDSKLog%" is the drive letter of your offline Windows installation? (Yes/No) "
if /i "%SureCHKDSKLog%"=="Yes" goto "CheckExistCHKDSKLog"
if /i "%SureCHKDSKLog%"=="No" goto "CHKDSKLog"
echo Invalid syntax!
goto "SureCHKDSKLog"

:"CheckExistCHKDSKLog"
if not exist "%CHKDSKLog%" goto "CHKDSKLogNotExist"
if /i "%CHKDSKLog%"=="%SystemDrive%" goto "CHKDSKLogIsOnline"
if not exist "%CHKDSKLog%\Windows" goto "CHKDSKLogNotWindows"
goto "AllRecent"

:"CHKDSKLogNotExist"
echo "%CHKDSKLog%" does not exist!
goto "CHKDSKLog"

:"CHKDSKLogIsOnline"
echo "%CHKDSKLog%" is an online Windows installation!
goto "3"

:"CHKDSKLogNotWindows"
echo "%CHKDSKLog%" is not an offline Windows installation!
goto "CHKDSKLog"

:"AllRecent"
echo.
set Recent=
set /p Recent="How many of the most recent CHKDSK logs do you want to view? (1-?/All) "
if /i "%Recent%"=="All" goto "SureAll"
goto "SureRecent"

:"SureAll"
echo.
set SureAll=
set /p SureAll="Are you sure you want to view all CHKDSK logs? (Yes/No) "
if /i "%OnlineOffline%"=="Online"  if /i "%SureAll%"=="Yes" goto "wevtutilAllOnline"
if /i "%OnlineOffline%"=="Offline"  if /i "%SureAll%"=="Yes" goto "wevtutilAllOffline"
if /i "%SureAll%"=="No" goto "3"
echo Invalid syntax!
goto "SureAll"

:"SureRecent"
echo.
set SureRecent=
set /p SureRecent="Are you sure you want to view the %Recent% most recent CHKDSK logs? (Yes/No) "
if /i "%OnlineOffline%"=="Online" if /i "%SureRecent%"=="Yes" goto "wevtutilRecentOnline"
if /i "%OnlineOffline%"=="Offline" if /i "%SureRecent%"=="Yes" goto "wevtutilRecentOffline"
if /i "%SureRecent%"=="No" goto "3"
echo Invalid syntax!
goto "SureRecent"

:"wevtutilAllOnline"
echo.
"%windir%\System32\wevtutil.exe" qe Application "/q:*[System[Provider[@Name='chkdsk'] or Provider[@Name='wininit']]]" /lf:False /f:text
if not "%errorlevel%"=="0" goto "wevtutilError"
goto "Start"

:"wevtutilRecentOnline"
echo.
"%windir%\System32\wevtutil.exe" qe Application "/q:*[System[Provider[@Name='chkdsk'] or Provider[@Name='wininit']]]" /lf:False /f:text /c:%Recent%
if not "%errorlevel%"=="0" goto "wevtutilError"
goto "Start"

:"wevtutilAllOffline"
echo.
"%windir%\System32\wevtutil.exe" qe C:\Windows\System32\winevt\Logs "/q:*[System[Provider[@Name='chkdsk'] or Provider[@Name='wininit']]]" /lf:True /f:text
if not "%errorlevel%"=="0" goto "wevtutilError"
goto "Start"

:"wevtutilRecentOffline"
echo.
"%windir%\System32\wevtutil.exe" qe C:\Windows\System32\winevt\Logs "/q:*[System[Provider[@Name='chkdsk'] or Provider[@Name='wininit']]]" /lf:True /f:text /c:%Recent%
if not "%errorlevel%"=="0" goto "wevtutilError"
goto "Start"

:"wevtutilError"
echo There has been an error! You can try again.
goto "3"

:"4"
echo.
set OnlineOffline=
set /p OnlineOffline="Are you checking an online or offline Windows installation? (Online/Offline) "
if /i "%OnlineOffline%"=="Online" goto "CheckOnline"
if /i "%OnlineOffline%"=="Offline" goto "InstallationCheck"
echo Invalid syntax!
goto "4"

:"InstallationCheck"
echo.
set InstallationCheck=
set /p InstallationCheck="What is the drive letter to your offline Windows installation? (A:-Z:) "
if /i "%InstallationCheck%"=="A:" goto "SureInstallationCheck"
if /i "%InstallationCheck%"=="B:" goto "SureInstallationCheck"
if /i "%InstallationCheck%"=="C:" goto "SureInstallationCheck"
if /i "%InstallationCheck%"=="D:" goto "SureInstallationCheck"
if /i "%InstallationCheck%"=="E:" goto "SureInstallationCheck"
if /i "%InstallationCheck%"=="F:" goto "SureInstallationCheck"
if /i "%InstallationCheck%"=="G:" goto "SureInstallationCheck"
if /i "%InstallationCheck%"=="H:" goto "SureInstallationCheck"
if /i "%InstallationCheck%"=="I:" goto "SureInstallationCheck"
if /i "%InstallationCheck%"=="J:" goto "SureInstallationCheck"
if /i "%InstallationCheck%"=="K:" goto "SureInstallationCheck"
if /i "%InstallationCheck%"=="L:" goto "SureInstallationCheck"
if /i "%InstallationCheck%"=="M:" goto "SureInstallationCheck"
if /i "%InstallationCheck%"=="N:" goto "SureInstallationCheck"
if /i "%InstallationCheck%"=="O:" goto "SureInstallationCheck"
if /i "%InstallationCheck%"=="P:" goto "SureInstallationCheck"
if /i "%InstallationCheck%"=="Q:" goto "SureInstallationCheck"
if /i "%InstallationCheck%"=="R:" goto "SureInstallationCheck"
if /i "%InstallationCheck%"=="S:" goto "SureInstallationCheck"
if /i "%InstallationCheck%"=="T:" goto "SureInstallationCheck"
if /i "%InstallationCheck%"=="U:" goto "SureInstallationCheck"
if /i "%InstallationCheck%"=="V:" goto "SureInstallationCheck"
if /i "%InstallationCheck%"=="W:" goto "SureInstallationCheck"
if /i "%InstallationCheck%"=="X:" goto "SureInstallationCheck"
if /i "%InstallationCheck%"=="Y:" goto "SureInstallationCheck"
if /i "%InstallationCheck%"=="Z:" goto "SureInstallationCheck"
echo Invalid syntax!
goto "InstallationCheck"

:"SureInstallationCheck"
echo.
set SureInstallationCheck=
set /p SureInstallationCheck="Are you sure "%InstallationCheck%" is the drive letter of your offline Windows installation? (Yes/No) "
if /i "%SureInstallationCheck%"=="Yes" goto "CheckExistInstallationCheck"
if /i "%SureInstallationCheck%"=="No" goto "InstallationCheck"
echo Invalid syntax!
goto "SureInstallationCheck"

:"CheckExistInstallationCheck"
if not exist "%InstallationCheck%" goto "NotExistInstallationCheck"
if /i "%InstallationCheck%"=="%SystemDrive%" goto "InstallationCheckIsOnline"
if not exist "%InstallationCheck%\Windows" goto "InstallationCheckNotWindows"
goto "CheckOffline"

:"NotExistInstallationCheck"
echo "%InstallationCheck%" does not exist!
goto "InstallationCheck"

:"InstallationCheckIsOnline"
echo "%InstallationCheck%" is an online Windows installation!
goto "4"

:"InstallationCheckNotWindows"
echo "%InstallationCheck%" is not an offline Windows installation!
goto "InstallationCheck"

:"CheckOnline"
echo.
echo Checking health on Windows installation "%SystemDrive%".
"%windir%\System32\Dism.exe" /Online /Cleanup-Image /CheckHealth
if not "%errorlevel%"=="0" goto "InstallationCheck"
echo Checked health on Windows installation "%SystemDrive%".
goto "Start"

:"CheckOffline"
echo.
echo Checking health on Windows installation "%InstallationCheck%".
if not exist "%InstallationCheck%\Windows\Logs\DISM" md "%InstallationCheck%\Windows\Logs\DISM" > nul 2>&1
"%windir%\System32\Dism.exe" /Image:"%InstallationCheck%" /Cleanup-Image /CheckHealth /LogPath:"%InstallationCheck%"\Windows\Logs\DISM\dism.log
if not "%errorlevel%"=="0" goto "InstallationCheck"
echo Checked health on Windows installation "%InstallationCheck%".
goto "Start"

:"5"
echo.
set OnlineOffline=
set /p OnlineOffline="Are you scanning an online or offline Windows installation? (Online/Offline) "
if /i "%OnlineOffline%"=="Online" goto "ScanOnline"
if /i "%OnlineOffline%"=="Offline" goto "InstallationScan"
echo Invalid syntax!
goto "5"

:"InstallationScan"
echo.
set InstallationScan=
set /p InstallationScan="What is the drive letter to your offline Windows installation? (A:-Z:) "
if /i "%InstallationScan%"=="A:" goto "SureInstallationScan"
if /i "%InstallationScan%"=="B:" goto "SureInstallationScan"
if /i "%InstallationScan%"=="C:" goto "SureInstallationScan"
if /i "%InstallationScan%"=="D:" goto "SureInstallationScan"
if /i "%InstallationScan%"=="E:" goto "SureInstallationScan"
if /i "%InstallationScan%"=="F:" goto "SureInstallationScan"
if /i "%InstallationScan%"=="G:" goto "SureInstallationScan"
if /i "%InstallationScan%"=="H:" goto "SureInstallationScan"
if /i "%InstallationScan%"=="I:" goto "SureInstallationScan"
if /i "%InstallationScan%"=="J:" goto "SureInstallationScan"
if /i "%InstallationScan%"=="K:" goto "SureInstallationScan"
if /i "%InstallationScan%"=="L:" goto "SureInstallationScan"
if /i "%InstallationScan%"=="M:" goto "SureInstallationScan"
if /i "%InstallationScan%"=="N:" goto "SureInstallationScan"
if /i "%InstallationScan%"=="O:" goto "SureInstallationScan"
if /i "%InstallationScan%"=="P:" goto "SureInstallationScan"
if /i "%InstallationScan%"=="Q:" goto "SureInstallationScan"
if /i "%InstallationScan%"=="R:" goto "SureInstallationScan"
if /i "%InstallationScan%"=="S:" goto "SureInstallationScan"
if /i "%InstallationScan%"=="T:" goto "SureInstallationScan"
if /i "%InstallationScan%"=="U:" goto "SureInstallationScan"
if /i "%InstallationScan%"=="V:" goto "SureInstallationScan"
if /i "%InstallationScan%"=="W:" goto "SureInstallationScan"
if /i "%InstallationScan%"=="X:" goto "SureInstallationScan"
if /i "%InstallationScan%"=="Y:" goto "SureInstallationScan"
if /i "%InstallationScan%"=="Z:" goto "SureInstallationScan"
echo Invalid syntax!
goto "InstallationScan"

:"SureInstallationScan"
echo.
set SureInstallationScan=
set /p SureInstallationScan="Are you sure "%InstallationScan%" is the drive letter of your offline Windows installation? (Yes/No) "
if /i "%SureInstallationScan%"=="Yes" goto "CheckExistInstallationScan"
if /i "%SureInstallationScan%"=="No" goto "InstallationScan"
echo Invalid syntax!
goto "SureInstallationScan"

:"CheckExistInstallationScan"
if not exist "%InstallationScan%" goto "NotExistInstallationScan"
if "%InstallationScan%"=="%SystemDrive%" goto "InstallationScanIsOnline"
if not exist "%InstallationScan%\Windows" goto "InstallationScanNotWindows"
goto "ScanOffline"

:"NotExistInstallationScan"
echo "%InstallationScan%" does not exist!
goto "InstallationScan"

:"InstallationScanIsOnline"
echo "%InstallationScan%" is an online Windows installation!
goto "5"

:"InstallationScanNotWindows"
echo "%InstallationScan%" is not an offline Windows installation!
goto "InstallationScan"

:"ScanOnline"
echo.
echo Scanning health on Windows installation "%SystemDrive%".
"%windir%\System32\Dism.exe" /Online /Cleanup-Image /ScanHealth
if not "%errorlevel%"=="0" goto "InstallationScan"
echo Scanned health on Windows installation "%SystemDrive%".
goto "Start"

:"ScanOffline"
echo.
echo Scanning health on Windows installation "%InstallationScan%".
if not exist "%InstallationScan%\Windows\Logs\DISM" md "%InstallationScan%\Windows\Logs\DISM" > nul 2>&1
"%windir%\System32\Dism.exe" /Image:"%InstallationScan%" /Cleanup-Image /ScanHealth /LogPath:"%InstallationScan%"\Windows\Logs\DISM\dism.log
if not "%errorlevel%"=="0" goto "InstallationScan"
echo Scanned health on Windows installation "%InstallationScan%".
goto "Start"

:"6"
echo.
set OnlineOffline=
set /p OnlineOffline="Are you restoring an online or offline Windows installation? (Online/Offline) "
if /i "%OnlineOffline%"=="Online" goto "Update"
if /i "%OnlineOffline%"=="Offline" goto "InstallationRestore"
echo Invalid syntax!
goto "6"

:"InstallationRestore"
echo.
set InstallationRestore=
set /p InstallationRestore="What is the drive letter to your offline Windows installation? (A:-Z:) "
if /i "%InstallationRestore%"=="A:" goto "SureInstallationRestore"
if /i "%InstallationRestore%"=="B:" goto "SureInstallationRestore"
if /i "%InstallationRestore%"=="C:" goto "SureInstallationRestore"
if /i "%InstallationRestore%"=="D:" goto "SureInstallationRestore"
if /i "%InstallationRestore%"=="E:" goto "SureInstallationRestore"
if /i "%InstallationRestore%"=="F:" goto "SureInstallationRestore"
if /i "%InstallationRestore%"=="G:" goto "SureInstallationRestore"
if /i "%InstallationRestore%"=="H:" goto "SureInstallationRestore"
if /i "%InstallationRestore%"=="I:" goto "SureInstallationRestore"
if /i "%InstallationRestore%"=="J:" goto "SureInstallationRestore"
if /i "%InstallationRestore%"=="K:" goto "SureInstallationRestore"
if /i "%InstallationRestore%"=="L:" goto "SureInstallationRestore"
if /i "%InstallationRestore%"=="M:" goto "SureInstallationRestore"
if /i "%InstallationRestore%"=="N:" goto "SureInstallationRestore"
if /i "%InstallationRestore%"=="O:" goto "SureInstallationRestore"
if /i "%InstallationRestore%"=="P:" goto "SureInstallationRestore"
if /i "%InstallationRestore%"=="Q:" goto "SureInstallationRestore"
if /i "%InstallationRestore%"=="R:" goto "SureInstallationRestore"
if /i "%InstallationRestore%"=="S:" goto "SureInstallationRestore"
if /i "%InstallationRestore%"=="T:" goto "SureInstallationRestore"
if /i "%InstallationRestore%"=="U:" goto "SureInstallationRestore"
if /i "%InstallationRestore%"=="V:" goto "SureInstallationRestore"
if /i "%InstallationRestore%"=="W:" goto "SureInstallationRestore"
if /i "%InstallationRestore%"=="X:" goto "SureInstallationRestore"
if /i "%InstallationRestore%"=="Y:" goto "SureInstallationRestore"
if /i "%InstallationRestore%"=="Z:" goto "SureInstallationRestore"
echo Invalid syntax!
goto "InstallationRestore"

:"SureInstallationRestore"
echo.
set SureInstallationRestore=
set /p SureInstallationRestore="Are you sure "%InstallationRestore%" is the drive letter of your offline Windows installation? (Yes/No) "
if /i "%SureInstallationRestore%"=="Yes" goto "CheckExistInstallationRestore"
if /i "%SureInstallationRestore%"=="No" goto "InstallationRestore"
echo Invalid syntax!
goto "SureInstallationRestore"

:"CheckExistInstallationRestore"
if not exist "%InstallationRestore%" goto "NotExistInstallationRestore"
if /i "%InstallationRestore%"=="%SystemDrive%" goto "InstallationRestoreIsOnline"
if not exist "%InstallationRestore%\Windows" goto "InstallationRestoreNotWindows"
goto "Update"

:"NotExistInstallationRestore"
echo "%InstallationRestore%" does not exist!
goto "InstallationRestore"

:"InstallationRestoreIsOnline"
echo "%InstallationRestore%" is an online Windows installation!
goto "6"

:"InstallationRestoreNotWindows"
echo "%InstallationRestore%" is not an offline Windows installation!
goto "InstallationRestore"

:"Update"
echo.
set Update=
set /p Update="Do you want to use Windows Update? (Yes/No) "
if /i "%Update%"=="Yes" goto "Media"
if /i "%Update%"=="No" goto "Media"
echo Invalid syntax!
goto "Update"

:"Media"
echo.
set Media=
set /p Media="Do you want to use a Windows Disk Image/Windows installation media? (Yes/No) "
if /i "%Media%"=="Yes" goto "RestoreType"
if /i "%OnlineOffline%"=="Online" if /i "%Media%"=="No" goto "DISMOnlineNoImage"
if /i "%OnlineOffline%"=="Offline" if /i "%Media%"=="No" goto "DISMOfflineNoImage"
echo Invalid syntax!
goto "Media"

:"RestoreType"
echo.
echo [1] Mounted Windows image.
echo [2] Mounted side by side (SxS) folder.
echo [3] Windows image.
echo [4] Side by side (SxS) folder.
echo.
set RestoreType=
set /p RestoreType="What do you want to use? (1-4) "
if /i "%RestoreType%"=="1" goto "Download"
if /i "%RestoreType%"=="2" goto "Download"
if /i "%RestoreType%"=="3" goto "Download"
if /i "%RestoreType%"=="4" goto "Download"
echo Invalid syntax!
goto "RestoreType"

:"Download"
echo.
echo [1] Download Windows 10 22H2 x86/x64 Windows Disk Image/Windows installation media.
echo [2] Download Windows 11 24H2 x64 Windows Disk Image/Windows installation media.
echo [3] Download Windows 11 24H2 Arm64 Windows Disk Image/Windows installation media.
echo [4] Already have downloaded Windows 10 22H2 x86/x64 Windows Disk Image/Windows installation media or Windows 11 24H2 x64/Arm64 Windows Disk Image/Windows installation media.
echo.
set Download=
set /p Download="What do you want to do? (1-4) "
if /i "%Download%"=="1" goto "SureDownload"
if /i "%Download%"=="2" goto "SureDownload"
if /i "%Download%"=="3" goto "SureDownload"
if /i "%Download%"=="4" goto "SureDownload"
echo Invalid syntax!
goto "Download"

:"SureDownload"
echo.
set SureDownload=
if /i "%Download%"=="1" set /p SureDownload="Are you sure you want to download Windows 10 22H2 x86/x64 Windows Disk Image/Windows installation media? (Yes/No) "
if /i "%Download%"=="2" set /p SureDownload="Are you sure you want to download Windows 11 24H2 x64 Windows Disk Image/Windows installation media? (Yes/No) "
if /i "%Download%"=="3" set /p SureDownload="Are you sure you want to download Windows 11 24H2 Arm64 Windows Disk Image/Windows installation media? (Yes/No) "
if /i "%Download%"=="4" set /p SureDownload="Are you sure you have downloaded Windows 10 22H2 x86/x64 Windows Disk Image/Windows installation media or Windows 11 24H2 x64/Arm64 Windows Disk Image/Windows installation media? (Yes/No) "
if /i "%SureDownload%"=="Yes" goto "DownloadGo"
if /i "%SureDownload%"=="No" goto "Download"
echo Invalid syntax!
goto "SureDownload"

:"DownloadGo"
if /i "%Download%"=="1" goto "10"
if /i "%Download%"=="2" goto "11x64"
if /i "%Download%"=="3" goto "11Arm64"
if /i "%Download%"=="4" goto "MountDiskImageinstallationmedia"

:"10"
echo.
echo Download Windows 10 22H2 x86/x64 Disk Image/installation media from here. ^-^-^> https://www.microsoft.com/software-download/windows10
echo.
echo Press any key to open the website.
pause > nul 2>&1
start https://www.microsoft.com/software-download/windows10
echo.
echo Press any key to continue once you have downloaded the Windows 10 22H2 x86/x64 Disk Image.
pause > nul 2>&1
goto "MountDiskImageinstallationmedia"

:"11x64"
echo.
echo Download Windows 11 24H2 x64 Disk Image/installation media from here. ^-^-^> https://www.microsoft.com/software-download/windows11
echo.
echo Press any key to open the website.
pause > nul 2>&1
start https://www.microsoft.com/software-download/windows11
echo.
echo Press any key to continue once you have downloaded the Windows 11 24H2 x64 Disk Image.
pause > nul 2>&1
goto "MountDiskImageinstallationmedia"

:"11Arm64"
echo.
echo Download Windows 11 24H2 Arm64 Disk Image/installation media from here. ^-^-^> https://www.microsoft.com/software-download/windows11arm64
echo.
echo Press any key to open the website.
pause > nul 2>&1
start https://www.microsoft.com/software-download/windows11arm64
echo.
echo Press any key to continue once you have downloaded the Windows 11 24H2 Arm64 Disk Image.
pause > nul 2>&1
goto "MountDiskImageinstallationmedia"

:"MountDiskImageinstallationmedia"
echo.
echo Please mount your Windows Disk Image/Windows installation media then press any key to continue.
pause > nul 2>&1
goto "DriveLetter"

:"DriveLetter"
echo.
set DriveLetter=
set /p DriveLetter="What is the drive letter of your mounted Windows Disk Image/Windows installation media? (A:-Z:) "
if /i "%DriveLetter%"=="A:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="B:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="C:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="D:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="E:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="F:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="G:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="H:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="I:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="J:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="K:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="L:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="M:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="N:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="O:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="P:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="Q:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="R:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="S:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="T:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="U:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="V:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="W:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="X:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="Y:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="Z:" goto "SureDriveLetter"
echo Invalid syntax!
goto "DriveLetter"

:"SureDriveLetter"
echo.
set SureDriveLetter=
set /p SureDriveLetter="Are you sure "%DriveLetter%" is the drive letter of your Windows Disk Image/Windows installation media? (Yes/No) "
if /i "%SureDriveLetter%"=="Yes" goto "CheckExistDriveLetter"
if /i "%SureDriveLetter%"=="No" goto "DriveLetter"
echo Invalid syntax!
goto "SureDriveLetter"

:"CheckExistDriveLetter"
if not exist "%DriveLetter%" goto "NotExist"
goto "BitDetection"

:"NotExist"
echo "%DriveLetter%" does not exist! Please try again.
goto "DriveLetter"

:"BitDetection"
if exist "%DriveLetter%\sources" goto "Sources"
if exist "%DriveLetter%\x86\sources" goto "Bit"
if exist "%DriveLetter%\x64\sources" goto "Bit"
echo "%DriveLetter%" is not a Windows Disk Image/Windows installation media!
goto "DriveLetter"

:"Sources"
set Sources=%DriveLetter%\sources
if /i "%RestoreType%"=="1" goto "ESDSWMWIM"
if /i "%RestoreType%"=="2" goto "ESDSWMWIM"
if /i "%RestoreType%"=="3" goto "ESDSWMWIM"
if /i "%RestoreType%"=="4" goto "WindowsimageSxS"

:"Bit"
echo.
set Bit=
set /p Bit="Do you have a 32-bit or 64-bit version of Windows? (32/64) "
if /i "%Bit%"=="32" goto "SureBit"
if /i "%Bit%"=="64" goto "SureBit"
echo Invalid syntax!
goto "Bit"

:"SureBit"
echo.
set SureBit=
set /p SureBit="Are you sure you have a %Bit%-bit version of Windows? (Yes/No) "
if /i "%SureBit%"=="Yes" goto "BitSources"
if /i "%SureBit%"=="No" goto "Bit"
echo Invalid syntax!
goto "SureBit"

:"BitSources"
if /i "%Bit%"=="32" set Sources=%DriveLetter%\x86\sources
if /i "%Bit%"=="64" set Sources=%DriveLetter%\x64\sources
if /i "%RestoreType%"=="1" goto "ESDSWMWIM"
if /i "%RestoreType%"=="2" goto "ESDSWMWIM"
if /i "%RestoreType%"=="3" goto "ESDSWMWIM"
if /i "%RestoreType%"=="4" goto "WindowsimageSxS"

:"ESDSWMWIM"
if exist "%Sources%\install.esd" set Install=install.esd
if exist "%Sources%\install.swm" set Install=install.swm
if exist "%Sources%\install.wim" set Install=install.wim
goto "IndexSet"

:"IndexSet"
set Index=
goto "DISM"

:"DISM"
if exist "Index.txt" goto "IndexExist"
echo.
echo Getting index details for Windows Disk Image/Windows installation media "%DriveLetter%".
"%windir%\System32\Dism.exe" /Get-ImageInfo /ImageFile:"%Sources%\%Install%" | "%windir%\System32\find.exe" /c /i "Index" > "Index.txt"
set /p IndexNumber=< "Index.txt"
del "Index.txt" /f /q > nul 2>&1
"%windir%\System32\Dism.exe" /Get-ImageInfo /ImageFile:"%Sources%\%Install%"
if not "%errorlevel%"=="0" goto "DriveLetter"
echo Got index details for Windows Disk Image/Windows installation media "%DriveLetter%".
if "%Index%"=="True" goto "IndexDone"
if "%IndexNumber%"=="3" goto "Index3"
if "%IndexNumber%"=="7" goto "Index7"
if "%IndexNumber%"=="11" goto "Index11"
echo.
echo Invalid Windows Disk Image/Windows installation media!
goto "DriveLetter"

:"IndexExist"
set Index=True
echo.
echo Please temporarily rename to something else or temporarily move to another location "Index.txt" in order for this batch file to proceed. "Index.txt" is not a system file. "Index.txt" is located in the folder "%cd%". Press any key to continue when "Index.txt" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
pause > nul 2>&1
goto "DISM"

:"IndexDone"
echo.
echo You can now rename or move the file back to "Index.txt".
if "%IndexNumber%"=="3" goto "Index3"
if "%IndexNumber%"=="7" goto "Index7"
if "%IndexNumber%"=="11" goto "Index11"
echo.
echo Invalid Windows Disk Image/Windows installation media!
goto "DriveLetter"

:"Index3"
echo.
set Index=
set /p Index="What do you have on your PC? (1-3) "
if /i "%Index%"=="1" goto "SureIndex3"
if /i "%Index%"=="2" goto "SureIndex3"
if /i "%Index%"=="3" goto "SureIndex3"
echo Invalid syntax!
goto "Index3"

:"SureIndex3"
echo.
set SureIndex=
set /p SureIndex="Are you sure you want Index %Index%? (Yes/No) "
if /i "%RestoreType%"=="1" if /i "%SureIndex%"=="Yes" goto "MountDrive"
if /i "%RestoreType%"=="2" if /i "%SureIndex%"=="Yes" goto "MountDrive"
if /i "%RestoreType%"=="3" if /i "%SureIndex%"=="Yes" goto "WindowsimageSxS"
if /i "%SureIndex%"=="No" goto "Index3"
echo Invalid syntax!
goto "SureIndex3"

:"Index7"
echo.
set Index=
set /p Index="What do you have on your PC? (1-7) "
if /i "%Index%"=="1" goto "SureIndex7"
if /i "%Index%"=="2" goto "SureIndex7"
if /i "%Index%"=="3" goto "SureIndex7"
if /i "%Index%"=="4" goto "SureIndex7"
if /i "%Index%"=="5" goto "SureIndex7"
if /i "%Index%"=="6" goto "SureIndex7"
if /i "%Index%"=="7" goto "SureIndex7"
echo Invalid syntax!
goto "Index7"

:"SureIndex7"
echo.
set SureIndex=
set /p SureIndex="Are you sure you want Index %Index%? (Yes/No) "
if /i "%RestoreType%"=="1" if /i "%SureIndex%"=="Yes" goto "MountDrive"
if /i "%RestoreType%"=="2" if /i "%SureIndex%"=="Yes" goto "MountDrive"
if /i "%RestoreType%"=="3" if /i "%SureIndex%"=="Yes" goto "WindowsimageSxS"
if /i "%SureIndex%"=="No" goto "Index7"
echo Invalid syntax!
goto "SureIndex7"

:"Index11"
echo.
set Index=
set /p Index="What do you have on your PC? (1-11) "
if /i "%Index%"=="1" goto "SureIndex11"
if /i "%Index%"=="2" goto "SureIndex11"
if /i "%Index%"=="3" goto "SureIndex11"
if /i "%Index%"=="4" goto "SureIndex11"
if /i "%Index%"=="5" goto "SureIndex11"
if /i "%Index%"=="6" goto "SureIndex11"
if /i "%Index%"=="7" goto "SureIndex11"
if /i "%Index%"=="8" goto "SureIndex11"
if /i "%Index%"=="9" goto "SureIndex11"
if /i "%Index%"=="10" goto "SureIndex11"
if /i "%Index%"=="11" goto "SureIndex11"
echo Invalid syntax!
goto "Index11"

:"SureIndex11"
echo.
set SureIndex=
set /p SureIndex="Are you sure you want Index %Index%? (Yes/No) "
if /i "%RestoreType%"=="1" if /i "%SureIndex%"=="Yes" goto "MountDrive"
if /i "%RestoreType%"=="2" if /i "%SureIndex%"=="Yes" goto "MountDrive"
if /i "%RestoreType%"=="3" if /i "%SureIndex%"=="Yes" goto "WindowsimageSxS"
if /i "%SureIndex%"=="No" goto "Index11"
echo Invalid syntax!
goto "SureIndex11"

:"MountDrive"
if /i "%OnlineOffline%"=="Online" set MountDrive=%SystemDrive%
if /i "%OnlineOffline%"=="Offline" set MountDrive=%InstallationRestore%
goto "WIMCheck"

:"WIMCheck"
if /i "%Install%"=="install.esd" goto "ExportWIMSetTrue"
if /i "%Install%"=="install.swm" goto "ExportWIMSetTrue"
if /i "%Install%"=="install.wim" goto "ExportWIMSet"

:"ExportWIMSet"
set ExportWIM=
goto "MountSet"

:"ExportWIMSetTrue"
set ExportWIM=True
goto "ExportWIM"

:"ExportWIM"
if exist "%MountDrive%\install.wim" goto "WIMExist"
echo.
echo Exporting Windows image to "%MountDrive%\install.wim".
"%windir%\System32\Dism.exe" /Export-Image /SourceImageFile:"%Sources%\%Install%" /SourceIndex:%Index% /DestinationImageFile:"%MountDrive%\install.wim" /Compress:None
if not "%errorlevel%"=="0" goto "WIMError"
echo Windows image exported to "%MountDrive%\install.wim".
goto "MountSet"

:"WIMExist"
set WIM=True
echo.
echo Please temporarily rename to something else or temporarily move to another location "%MountDrive%\install.wim" in order for this batch file to proceed. "%MountDrive%\install.wim" is not a system file. Press any key to continue when "%MountDrive%\install.wim" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
pause > nul 2>&1
goto "ExportWIM"

:"WIMError"
echo.
echo Deleting Windows image from "%MountDrive%\install.wim".
del "%MountDrive%\install.wim" /f /q > nul 2>&1
echo Windows image deleted from "%MountDrive%\install.wim".
goto "Update"

:"MountSet"
set Mount=
goto "Mount"

:"Mount"
if exist "%MountDrive%\Mount" goto "MountExist"
echo.
echo Mounting Windows image to "%MountDrive%\Mount".
md "%MountDrive%\Mount" > nul 2>&1
if /i "%ExportWIM%"=="" "%windir%\System32\Dism.exe" /Mount-Image /ImageFile:"%Sources%\%Install%" /Index:%Index% /MountDir:"%MountDrive%\Mount" /ReadOnly
if /i "%ExportWIM%"=="True" "%windir%\System32\Dism.exe" /Mount-Image /ImageFile:"%MountDrive%\install.wim" /Index:1 /MountDir:"%MountDrive%\Mount" /ReadOnly
if not "%errorlevel%"=="0" goto "MountError"
echo Windows image mounted to "%MountDrive%\Mount".
if /i "%OnlineOffline%"=="Online" if /i "%RestoreType%"=="1" goto "DISMOnlineMountedWindowsimage"
if /i "%OnlineOffline%"=="Online" if /i "%RestoreType%"=="2" goto "DISMOnlineMountedSxS"
if /i "%OnlineOffline%"=="Offline" if /i "%RestoreType%"=="1" goto "DISMOfflineMountedWindowsimage"
if /i "%OnlineOffline%"=="Offline" if /i "%RestoreType%"=="2" goto "DISMOfflineMountedSxS"

:"MountExist"
set Mount=True
echo.
echo Please temporarily rename to something else or temporarily move to another location "%MountDrive%\Mount" in order for this batch file to proceed. "%MountDrive%\Mount" is not a system file. Press any key to continue when "%MountDrive%\Mount" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
pause > nul 2>&1
goto "Mount"

:"MountError"
echo.
echo Unmounting Windows image from "%MountDrive%\Mount".
"%windir%\System32\Dism.exe" /Unmount-Image /MountDir:"%MountDrive%\Mount" /Discard
if not "%errorlevel%"=="0" goto "MountErrorError"
rd "%MountDrive%\Mount" /s /q > nul 2>&1
echo Windows image unmounted from "%MountDrive%\Mount".
if /i "%MountDrive%"=="True" goto "MountDoneMount"
goto "WIMCheckMount"

:"MountErrorError"
echo There has been an error and all images need to be unmounted! Make sure to save all changes you have made to your mounted images before pressing any key to unmount all images. Press any key to unmount all images when you are ready to unmount all images.
pause > nul 2>&1
echo.
echo Cleaning up mounted images.
"%windir%\System32\Dism.exe" /Cleanup-Mountpoints
rd "%MountDrive%\Mount" /s /q > nul 2>&1
echo Mounted images cleaned up.
if /i "%MountDrive%"=="True" goto "MountDoneMount"
goto "WIMCheckMount"

:"MountDoneMount"
set Mount=
echo.
echo You can now rename or move the file back to "%MountDrive%\Mount". Press any key to continue.
pause > nul 2>&1
goto "WIMCheckMount"

:"WIMCheckMount"
if /i "%ExportWIM%"=="True" goto "WIMDeleteMount"
goto "Update"

:"WIMDeleteMount"
set ExportWIM=
echo.
echo Deleting Windows image from "%MountDrive%\install.wim".
del "%MountDrive%\install.wim" /f /q > nul 2>&1
echo Windows image deleted from "%MountDrive%\install.wim".
if /i "%WIM%"=="True" goto "WIMDoneMount"
goto "Update"

:"WIMDoneMount"
set WIM=
echo.
echo You can now rename or move the file back to "%MountDrive%\install.wim". Press any key to continue.
pause > nul 2>&1
goto "Update"

:"WindowsimageSxS"
if /i "%OnlineOffline%"=="Online" goto "DISMOnlineWindowsimage"
if /i "%OnlineOffline%"=="Online" goto "DISMOnlineSxS"
if /i "%OnlineOffline%"=="Offline" goto "DISMOfflineWindowsimage"
if /i "%OnlineOffline%"=="Offline" goto "DISMOfflineSxS"

:"DISMOnlineNoImage"
echo.
echo Restoring health on Windows installation "%SystemDrive%".
if /i "%Update%"=="Yes" "%windir%\System32\Dism.exe" /Online /Cleanup-Image /RestoreHealth
if /i "%Update%"=="No" "%windir%\System32\Dism.exe" /Online /Cleanup-Image /RestoreHealth /LimitAccess
if not "%errorlevel%"=="0" goto "Update"
echo Health restored on Windows installation "%SystemDrive%".
goto "Start"

:"DISMOnlineMountedWindowsimage"
echo.
echo Restoring health on Windows installation "%SystemDrive%".
if /i "%Update%"=="Yes" "%windir%\System32\Dism.exe" /Online /Cleanup-Image /RestoreHealth /Source:"%MountDrive%\Mount\Windows"
if /i "%Update%"=="No" "%windir%\System32\Dism.exe" /Online /Cleanup-Image /RestoreHealth /Source:"%MountDrive%\Mount\Windows" /LimitAccess
if not "%errorlevel%"=="0" goto "Update"
echo Health restored on Windows installation "%SystemDrive%".
goto "Unmount"

:"DISMOnlineMountedSxS"
echo.
echo Restoring health on Windows installation "%SystemDrive%".
if /i "%Update%"=="Yes" "%windir%\System32\Dism.exe" /Online /Cleanup-Image /RestoreHealth /Source:"%MountDrive%\Mount\Windows\WinSxS"
if /i "%Update%"=="No" "%windir%\System32\Dism.exe" /Online /Cleanup-Image /RestoreHealth /Source:"%MountDrive%\Mount\Windows\WinSxS" /LimitAccess
if not "%errorlevel%"=="0" goto "Update"
echo Health restored on Windows installation "%SystemDrive%".
goto "Unmount"

:"DISMOnlineWindowsimage"
echo.
echo Restoring health on Windows installation "%SystemDrive%".
if /i "%Update%"=="Yes" "%windir%\System32\Dism.exe" /Online /Cleanup-Image /RestoreHealth /Source:"%Sources%\%Install%":%Index%
if /i "%Update%"=="No" "%windir%\System32\Dism.exe" /Online /Cleanup-Image /RestoreHealth /Source:"%Sources%\%Install%":%Index% /LimitAccess
if not "%errorlevel%"=="0" goto "Update"
echo Health restored on Windows installation "%SystemDrive%".
goto "Start"

:"DISMOnlineSxS"
echo.
echo Restoring health on Windows installation "%SystemDrive%".
if /i "%Update%"=="Yes" "%windir%\System32\Dism.exe" /Online /Cleanup-Image /RestoreHealth /Source:"%Sources%\sxs"
if /i "%Update%"=="No" "%windir%\System32\Dism.exe" /Online /Cleanup-Image /RestoreHealth /Source:"%Sources%\sxs" /LimitAccess
if not "%errorlevel%"=="0" goto "Update"
echo Health restored on Windows installation "%SystemDrive%".
goto "Start"

:"DISMOfflineNoImage"
echo.
echo Restoring health on Windows installation "%InstallationRestore%".
if not exist "%InstallationRestore%\Windows\Logs\DISM" md "%InstallationRestore%\Windows\Logs\DISM" > nul 2>&1
if /i "%Update%"=="Yes" "%windir%\System32\Dism.exe" /Image:"%InstallationRestore%" /Cleanup-Image /RestoreHealth /LogPath:"%InstallationRestore%\Windows\Logs\DISM\dism.log"
if /i "%Update%"=="No" "%windir%\System32\Dism.exe" /Image:"%InstallationRestore%" /Cleanup-Image /RestoreHealth /LimitAccess /LogPath:"%InstallationRestore%\Windows\Logs\DISM\dism.log"
if not "%errorlevel%"=="0" goto "Update"
echo Health restored on Windows installation "%InstallationRestore%".
goto "Start"

:"DISMOfflineMountedWindowsimage"
echo.
echo Restoring health on Windows installation "%InstallationRestore%".
if not exist "%InstallationRestore%\Windows\Logs\DISM" md "%InstallationRestore%\Windows\Logs\DISM" > nul 2>&1
if /i "%Update%"=="Yes" "%windir%\System32\Dism.exe" /Image:"%InstallationRestore%" /Cleanup-Image /RestoreHealth /Source:"%MountDrive%\Mount\Windows" /LogPath:"%InstallationRestore%\Windows\Logs\DISM\dism.log"
if /i "%Update%"=="No" "%windir%\System32\Dism.exe" /Image:"%InstallationRestore%" /Cleanup-Image /RestoreHealth /Source:"%MountDrive%\Mount\Windows" /LimitAccess /LogPath:"%InstallationRestore%\Windows\Logs\DISM\dism.log"
if not "%errorlevel%"=="0" goto "Update"
echo Health restored on Windows installation "%InstallationRestore%".
goto "Unmount"

:"DISMOfflineMountedSxS"
echo.
echo Restoring health on Windows installation "%InstallationRestore%".
if not exist "%InstallationRestore%\Windows\Logs\DISM" md "%InstallationRestore%\Windows\Logs\DISM" > nul 2>&1
if /i "%Update%"=="Yes" "%windir%\System32\Dism.exe" /Image:"%InstallationRestore%" /Cleanup-Image /RestoreHealth /Source:"%MountDrive%\Mount\Windows\WinSxS" /LogPath:"%InstallationRestore%\Windows\Logs\DISM\dism.log"
if /i "%Update%"=="No" "%windir%\System32\Dism.exe" /Image:"%InstallationRestore%" /Cleanup-Image /RestoreHealth /Source:"%MountDrive%\Mount\Windows\WinSxS" /LimitAccess /LogPath:"%InstallationRestore%\Windows\Logs\DISM\dism.log"
if not "%errorlevel%"=="0" goto "Update"
echo Health restored on Windows installation "%InstallationRestore%".
goto "Unmount"

:"DISMOfflineWindowsimage"
echo.
echo Restoring health on Windows installation "%InstallationRestore%".
if not exist "%InstallationRestore%\Windows\Logs\DISM" md "%InstallationRestore%\Windows\Logs\DISM" > nul 2>&1
if /i "%Update%"=="Yes" "%windir%\System32\Dism.exe" /Image:"%InstallationRestore%" /Cleanup-Image /RestoreHealth /Source:"%Sources%\%Install%":%Index% /LogPath:"%InstallationRestore%\Windows\Logs\DISM\dism.log"
if /i "%Update%"=="No" "%windir%\System32\Dism.exe" /Image:"%InstallationRestore%" /Cleanup-Image /RestoreHealth /Source:"%Sources%\%Install%":%Index% /LimitAccess /LogPath:"%InstallationRestore%\Windows\Logs\DISM\dism.log"
if not "%errorlevel%"=="0" goto "Update"
echo Health restored on Windows installation "%InstallationRestore%".
goto "Start"

:"DISMOfflineSxS"
echo.
echo Restoring health on Windows installation "%InstallationRestore%".
if not exist "%InstallationRestore%\Windows\Logs\DISM" md "%InstallationRestore%\Windows\Logs\DISM" > nul 2>&1
if /i "%Update%"=="Yes" "%windir%\System32\Dism.exe" /Image:"%InstallationRestore%" /Cleanup-Image /RestoreHealth /Source:"%Sources%\sxs" /LogPath:"%InstallationRestore%\Windows\Logs\DISM\dism.log"
if /i "%Update%"=="No" "%windir%\System32\Dism.exe" /Image:"%InstallationRestore%" /Cleanup-Image /RestoreHealth /Source:"%Sources%\sxs" /LimitAccess /LogPath:"%InstallationRestore%\Windows\Logs\DISM\dism.log"
if not "%errorlevel%"=="0" goto "Update"
echo Health restored on Windows installation "%InstallationRestore%".
goto "Start"

:"Unmount"
echo.
echo Unmounting Windows image from "%MountDrive%\Mount".
"%windir%\System32\Dism.exe" /Unmount-Image /MountDir:"%MountDrive%\Mount" /Discard
if not "%errorlevel%"=="0" goto "UnmountError"
rd "%MountDrive%\Mount" /s /q > nul 2>&1
echo Windows image unmounted from "%MountDrive%\Mount".
if /i "%Mount%"=="True" goto "MountDone"
goto "WIMCheck"

:"UnmountError"
echo There has been an error and all images need to be unmounted! Make sure to save all changes you have made to your mounted images before pressing any key to unmount all images. Press any key to unmount all images when you are ready to unmount all images.
pause > nul 2>&1
echo.
echo Cleaning up mounted images.
"%windir%\System32\Dism.exe" /Cleanup-Mountpoints
rd "%MountDrive%\Mount" /s /q > nul 2>&1
echo Mounted images cleaned up.
if /i "%Mount%"=="True" goto "MountDone"
goto "WIMCheck"

:"MountDone"
set Mount=
echo.
echo You can now rename or move the file back to "%MountDrive%\Mount". Press any key to continue.
pause > nul 2>&1
goto "WIMCheck"

:"WIMCheck"
if /i "%ExportWIM%"=="True" goto "WIMDelete"
goto "Start"

:"WIMDelete"
set ExportWIM=
echo.
echo Deleting Windows image from "%MountDrive%\install.wim".
del "%MountDrive%\install.wim" /f /q > nul 2>&1
echo Windows image deleted from "%MountDrive%\install.wim".
if /i "%WIM%"=="True" goto "WIMDone"
goto "Start"

:"WIMDone"
set WIM=
echo.
echo You can now rename or move the file back to "%MountDrive%\install.wim". Press any key to continue.
pause > nul 2>&1
goto "Start"

:"7"
echo.
set OnlineOffline=
set /p OnlineOffline="Are you reverting an online or offline Windows installation? (Online/Offline) "
if /i "%OnlineOffline%"=="Online" goto "RevertOnline"
if /i "%OnlineOffline%"=="Offline" goto "InstallationRevert"
echo Invalid syntax!
goto "7"

:"InstallationRevert"
echo.
set InstallationRevert=
set /p InstallationRevert="What is the drive letter to your offline Windows installation? (A:-Z:) "
if /i "%InstallationRevert%"=="A:" goto "SureInstallationRevert"
if /i "%InstallationRevert%"=="B:" goto "SureInstallationRevert"
if /i "%InstallationRevert%"=="C:" goto "SureInstallationRevert"
if /i "%InstallationRevert%"=="D:" goto "SureInstallationRevert"
if /i "%InstallationRevert%"=="E:" goto "SureInstallationRevert"
if /i "%InstallationRevert%"=="F:" goto "SureInstallationRevert"
if /i "%InstallationRevert%"=="G:" goto "SureInstallationRevert"
if /i "%InstallationRevert%"=="H:" goto "SureInstallationRevert"
if /i "%InstallationRevert%"=="I:" goto "SureInstallationRevert"
if /i "%InstallationRevert%"=="J:" goto "SureInstallationRevert"
if /i "%InstallationRevert%"=="K:" goto "SureInstallationRevert"
if /i "%InstallationRevert%"=="L:" goto "SureInstallationRevert"
if /i "%InstallationRevert%"=="M:" goto "SureInstallationRevert"
if /i "%InstallationRevert%"=="N:" goto "SureInstallationRevert"
if /i "%InstallationRevert%"=="O:" goto "SureInstallationRevert"
if /i "%InstallationRevert%"=="P:" goto "SureInstallationRevert"
if /i "%InstallationRevert%"=="Q:" goto "SureInstallationRevert"
if /i "%InstallationRevert%"=="R:" goto "SureInstallationRevert"
if /i "%InstallationRevert%"=="S:" goto "SureInstallationRevert"
if /i "%InstallationRevert%"=="T:" goto "SureInstallationRevert"
if /i "%InstallationRevert%"=="U:" goto "SureInstallationRevert"
if /i "%InstallationRevert%"=="V:" goto "SureInstallationRevert"
if /i "%InstallationRevert%"=="W:" goto "SureInstallationRevert"
if /i "%InstallationRevert%"=="X:" goto "SureInstallationRevert"
if /i "%InstallationRevert%"=="Y:" goto "SureInstallationRevert"
if /i "%InstallationRevert%"=="Z:" goto "SureInstallationRevert"
echo Invalid syntax!
goto "InstallationRevert"

:"SureInstallationRevert"
echo.
set SureInstallationRevert=
set /p SureInstallationRevert="Are you sure "%InstallationRevert%" is the drive letter of your offline Windows installation? (Yes/No) "
if /i "%SureInstallationRevert%"=="Yes" goto "CheckExistInstallationRevert"
if /i "%SureInstallationRevert%"=="No" goto "InstallationRevert"
echo Invalid syntax!
goto "SureInstallationRevert"

:"CheckExistInstallationRevert"
if not exist "%InstallationRevert%" goto "NotExistInstallationRevert"
if /i "%InstallationRevert%"=="%SystemDrive%" goto "InstallationRevertIsOnline"
if not exist "%InstallationRevert%\Windows" goto "InstallationRevertNotWindows"
goto "RevertOffline"

:"NotExistInstallationRevert"
echo "%InstallationRevert%" does not exist!
goto "InstallationRevert"

:"InstallationRevertIsOnline"
echo "%InstallationRevert%" is an online Windows installation!
goto "7"

:"InstallationRevertNotWindows"
echo "%InstallationRevert%" is not an offline Windows installation!
goto "InstallationRevert"

:"RevertOnline"
echo.
echo Reverting pending actions on Windows installation "%SystemDrive%".
"%windir%\System32\Dism.exe" /Online /Cleanup-Image /RevertPendingActions
if not "%errorlevel%"=="0" goto "7"
echo Reverted pending actions on Windows installation "%SystemDrive%".
goto "Start"

:"RevertOffline"
echo.
echo Reverting pending actions on Windows installation "%InstallationRevert%".
if not exist "%InstallationRevert%\Windows\Logs\DISM" md "%InstallationRevert%\Windows\Logs\DISM" > nul 2>&1
"%windir%\System32\Dism.exe" /Image:"%InstallationRevert%" /Cleanup-Image /RevertPendingActions /LogPath:"%InstallationRevert%\Windows\Logs\DISM\dism.log"
if not "%errorlevel%"=="0" goto "7"
echo Reverted pending actions on Windows installation "%InstallationRevert%".
goto "Start"

:"8"
echo.
set OnlineOffline=
set /p OnlineOffline="Are you viewing the logs of an online or offline Windows installation? (Online/Offline) "
if /i "%OnlineOffline%"=="Online" goto "DISMOnlineLog"
if /i "%OnlineOffline%"=="Offline" goto "DISMLog"
echo Invalid syntax!
goto "8"

:"DISMLog"
echo.
set DISMLog=
set /p DISMLog="What is the drive letter of your offline Windows installation? (A:-Z:) "
if /i "%DISMLog%"=="A:" goto "SureDISMLog"
if /i "%DISMLog%"=="B:" goto "SureDISMLog"
if /i "%DISMLog%"=="C:" goto "SureDISMLog"
if /i "%DISMLog%"=="D:" goto "SureDISMLog"
if /i "%DISMLog%"=="E:" goto "SureDISMLog"
if /i "%DISMLog%"=="F:" goto "SureDISMLog"
if /i "%DISMLog%"=="G:" goto "SureDISMLog"
if /i "%DISMLog%"=="H:" goto "SureDISMLog"
if /i "%DISMLog%"=="I:" goto "SureDISMLog"
if /i "%DISMLog%"=="J:" goto "SureDISMLog"
if /i "%DISMLog%"=="K:" goto "SureDISMLog"
if /i "%DISMLog%"=="L:" goto "SureDISMLog"
if /i "%DISMLog%"=="M:" goto "SureDISMLog"
if /i "%DISMLog%"=="N:" goto "SureDISMLog"
if /i "%DISMLog%"=="O:" goto "SureDISMLog"
if /i "%DISMLog%"=="P:" goto "SureDISMLog"
if /i "%DISMLog%"=="Q:" goto "SureDISMLog"
if /i "%DISMLog%"=="R:" goto "SureDISMLog"
if /i "%DISMLog%"=="S:" goto "SureDISMLog"
if /i "%DISMLog%"=="T:" goto "SureDISMLog"
if /i "%DISMLog%"=="U:" goto "SureDISMLog"
if /i "%DISMLog%"=="V:" goto "SureDISMLog"
if /i "%DISMLog%"=="W:" goto "SureDISMLog"
if /i "%DISMLog%"=="X:" goto "SureDISMLog"
if /i "%DISMLog%"=="Y:" goto "SureDISMLog"
if /i "%DISMLog%"=="Z:" goto "SureDISMLog"
echo Invalid syntax!
goto "DISMLog"

:"SureDISMLog"
echo.
set SureDISMLog=
set /p SureDISMLog="Are you sure "%DISMLog%" is the drive letter of your offline Windows installation? (Yes/No) "
if /i "%SureDISMLog%"=="Yes" goto "CheckExistDISMOfflineLog"
if /i "%SureDISMLog%"=="No" goto "DISMLog"
echo Invalid syntax!
goto "SureDISMLog"

:"CheckExistDISMOfflineLog"
if not exist "%DISMLog%" goto "DISMLogNotExist"
if /i "%DISMLog%"=="%SystemDrive%" goto "DISMLogIsOnline"
if not exist "%DISMLog%\Windows" goto "DISMLogNotWindows"
goto "DISMOfflineLog"

:"DISMLogNotExist"
echo "%DISMLog%" does not exist!
goto "DISMLog"

:"DISMLogIsOnline"
echo "%DISMLog%" is an online Windows installation!
goto "8"

:"DISMLogNotWindows"
echo "%DISMLog%" is not an offline Windows installation!
goto "DISMLog"

:"DISMOnlineLog"
if not exist "%windir%\Logs\DISM\dism.log" goto "DISMOnlineLogNotExist"
"%windir%\notepad.exe" "%windir%\Logs\DISM\dism.log" > nul 2>&1
if not "%errorlevel%"=="0" goto "ErrorDISMLog"
goto "Start"

:"DISMOnlineLogNotExist"
echo DISM log file ("%windir%\Logs\DISM\dism.log") does not exist!
goto "Start"

:"DISMOfflineLog"
if not exist "%DISMLog%\Windows\Logs\DISM\dism.log" goto "DISMOfflineLogNotExist"
"%windir%\notepad.exe" "%DISMLog%\Windows\Logs\DISM\dism.log" > nul 2>&1
if not "%errorlevel%"=="0" goto "ErrorDISMLog"
goto "Start"

:"DISMOfflineLogNotExist"
echo DISM log file ("%DISMLog%\Windows\Logs\DISM\dism.log") does not exist!
goto "Start"

:"ErrorDISMLog"
echo There has been an error! Please try again.
goto "8"

:"9"
echo.
set OnlineOffline=
set /p OnlineOffline="Are you scanning an online or offline Windows installation? (Online/Offline) "
if /i "%OnlineOffline%"=="Online" goto "ScanNowOnline"
if /i "%OnlineOffline%"=="Offline" goto "ScanNow"
echo Invalid syntax!
goto "9"

:"ScanNow"
echo.
set ScanNow=
set /p ScanNow="What is the drive letter of your offline Windows installation? (A:-Z:) "
if /i "%ScanNow%"=="A:" goto "SureScanNow"
if /i "%ScanNow%"=="B:" goto "SureScanNow"
if /i "%ScanNow%"=="C:" goto "SureScanNow"
if /i "%ScanNow%"=="D:" goto "SureScanNow"
if /i "%ScanNow%"=="E:" goto "SureScanNow"
if /i "%ScanNow%"=="F:" goto "SureScanNow"
if /i "%ScanNow%"=="G:" goto "SureScanNow"
if /i "%ScanNow%"=="H:" goto "SureScanNow"
if /i "%ScanNow%"=="I:" goto "SureScanNow"
if /i "%ScanNow%"=="J:" goto "SureScanNow"
if /i "%ScanNow%"=="K:" goto "SureScanNow"
if /i "%ScanNow%"=="L:" goto "SureScanNow"
if /i "%ScanNow%"=="M:" goto "SureScanNow"
if /i "%ScanNow%"=="N:" goto "SureScanNow"
if /i "%ScanNow%"=="O:" goto "SureScanNow"
if /i "%ScanNow%"=="P:" goto "SureScanNow"
if /i "%ScanNow%"=="Q:" goto "SureScanNow"
if /i "%ScanNow%"=="R:" goto "SureScanNow"
if /i "%ScanNow%"=="S:" goto "SureScanNow"
if /i "%ScanNow%"=="T:" goto "SureScanNow"
if /i "%ScanNow%"=="U:" goto "SureScanNow"
if /i "%ScanNow%"=="V:" goto "SureScanNow"
if /i "%ScanNow%"=="W:" goto "SureScanNow"
if /i "%ScanNow%"=="X:" goto "SureScanNow"
if /i "%ScanNow%"=="Y:" goto "SureScanNow"
if /i "%ScanNow%"=="Z:" goto "SureScanNow"
echo Invalid syntax!
goto "ScanNow"

:"SureScanNow"
echo.
set SureScanNow=
set /p SureScanNow="Are you sure "%ScanNow%" is the drive letter of your offline Windows installation? (Yes/No) "
if /i "%SureScanNow%"=="Yes" goto "CheckExistScanNow"
if /i "%SureScanNow%"=="No" goto "ScanNow"
echo Invalid syntax!
goto "SureScanNow"

:"CheckExistScanNow"
if not exist "%ScanNow%" goto "ScanNowNotExist"
if /i "%ScanNow%"=="%SystemDrive%" goto "ScanNowIsOnline"
if not exist "%ScanNow%\Windows" goto "ScanNowNotWindows"
goto "ScanNowOffline"

:"ScanNowNotExist"
echo "%ScanNow%" does not exist.
goto "ScanNow"

:"ScanNowIsOnline"
echo "%ScanNow%" is an online Windows installation!
goto "9"

:"ScanNowNotWindows"
echo "%ScanNow%" is not an offline Windows installation!
goto "ScanNow"

:"ScanNowOnline"
echo.
echo Scanning Windows installation "%SystemDrive%".
"%windir%\System32\sfc.exe" /scannow
if not "%errorlevel%"=="0" goto "9"
echo Windows installation "%SystemDrive%" scanned.
goto "Start"

:"ScanNowOffline"
echo.
echo Scanning Windows installation "%ScanNow%".
if not exist "%ScanNow%\Windows\Logs\CBS" md "%ScanNow%\Windows\Logs\CBS" > nul 2>&1
"%windir%\System32\sfc.exe" /scannow /offbootdir="%ScanNow%" /offwindir="%ScanNow%\Windows" /offlogfile="%ScanNow%\Windows\Logs\CBS\CBS.log"
if not "%errorlevel%"=="0" goto "9"
echo Windows installation "%ScanNow%" scanned.
goto "Start"

:"10"
echo.
set OnlineOffline=
set /p OnlineOffline="Are you verifying an online or offline Windows installation? (Online/Offline) "
if /i "%OnlineOffline%"=="Online" goto "VerifyOnlyOnline"
if /i "%OnlineOffline%"=="Offline" goto "VerifyOnly"
echo Invalid syntax!
goto "10"

:"VerifyOnly"
echo.
set VerifyOnly=
set /p VerifyOnly="What is the drive letter of your offline Windows installation? (A:-Z:) "
if /i "%VerifyOnly%"=="A:" goto "SureVerifyOnly"
if /i "%VerifyOnly%"=="B:" goto "SureVerifyOnly"
if /i "%VerifyOnly%"=="C:" goto "SureVerifyOnly"
if /i "%VerifyOnly%"=="D:" goto "SureVerifyOnly"
if /i "%VerifyOnly%"=="E:" goto "SureVerifyOnly"
if /i "%VerifyOnly%"=="F:" goto "SureVerifyOnly"
if /i "%VerifyOnly%"=="G:" goto "SureVerifyOnly"
if /i "%VerifyOnly%"=="H:" goto "SureVerifyOnly"
if /i "%VerifyOnly%"=="I:" goto "SureVerifyOnly"
if /i "%VerifyOnly%"=="J:" goto "SureVerifyOnly"
if /i "%VerifyOnly%"=="K:" goto "SureVerifyOnly"
if /i "%VerifyOnly%"=="L:" goto "SureVerifyOnly"
if /i "%VerifyOnly%"=="M:" goto "SureVerifyOnly"
if /i "%VerifyOnly%"=="N:" goto "SureVerifyOnly"
if /i "%VerifyOnly%"=="O:" goto "SureVerifyOnly"
if /i "%VerifyOnly%"=="P:" goto "SureVerifyOnly"
if /i "%VerifyOnly%"=="Q:" goto "SureVerifyOnly"
if /i "%VerifyOnly%"=="R:" goto "SureVerifyOnly"
if /i "%VerifyOnly%"=="S:" goto "SureVerifyOnly"
if /i "%VerifyOnly%"=="T:" goto "SureVerifyOnly"
if /i "%VerifyOnly%"=="U:" goto "SureVerifyOnly"
if /i "%VerifyOnly%"=="V:" goto "SureVerifyOnly"
if /i "%VerifyOnly%"=="W:" goto "SureVerifyOnly"
if /i "%VerifyOnly%"=="X:" goto "SureVerifyOnly"
if /i "%VerifyOnly%"=="Y:" goto "SureVerifyOnly"
if /i "%VerifyOnly%"=="Z:" goto "SureVerifyOnly"
echo Invalid syntax!
goto "VerifyOnly"

:"SureVerifyOnly"
echo.
set SureVerifyOnly=
set /p SureVerifyOnly="Are you sure "%VerifyOnly%" is the drive letter of your offline Windows installation? (Yes/No) "
if /i "%SureVerifyOnly%"=="Yes" goto "CheckExistVerifyOnly"
if /i "%SureVerifyOnly%"=="No" goto "VerifyOnly"
echo Invalid syntax!
goto "SureVerifyOnly"

:"CheckExistVerifyOnly"
if not exist "%VerifyOnly%" goto "VerifyOnlyNotExist"
if /i "%VerifyOnly%"=="%SystemDrive%" goto "VerifyOnlyIsOnline"
if not exist "%VerifyOnly%\Windows" goto "VerfiyOnlyNotWindows"
goto "VerifyOnlyOffline"

:"VerifyOnlyNotExist"
echo "%VerifyOnlyNotExist%" does not exist!
goto "VerifyOnly"

:"VerifyOnlyIsOnline"
echo "%VerifyOnly%" is an online Windows installation!
goto "10"

:"VerfiyOnlyNotWindows"
echo "%VerifyOnly%" is not an offline Windows installation!
goto "VerifyOnly"

:"VerifyOnlyOnline"
echo.
echo Verifing Windows installation "%SystemDrive%".
"%windir%\System32\sfc.exe" /verifyonly
if not "%errorlevel%"=="0" goto "10"
echo Windows installation "%SystemDrive%" verified.
goto "Start"

:"VerifyOnlyOffline"
echo.
echo Verifing Windows installation "%VerifyOnly%".
if not exist "%VerifyOnly%\Windows\Logs\CBS" md "%VerifyOnly%\Windows\Logs\CBS" > nul 2>&1
"%windir%\System32\sfc.exe" /verifyonly /offbootdir="%VerifyOnly%" /offwindir="%VerifyOnly%\Windows" /offlogfile="%VerifyOnly%\Windows\Logs\CBS\CBS.log"
if not "%errorlevel%"=="0" goto "10"
echo Windows installation "%VerifyOnly%" verified.
goto "Start"

:"11"
echo.
set OnlineOffline=
set /p OnlineOffline="Are you scanning an online or offline Windows installation file? (Online/Offline) "
if /i "%OnlineOffline%"=="Online" goto "ScanFileFile"
if /i "%OnlineOffline%"=="Offline" goto "ScanFileFile"
echo Invalid syntax!
goto "11"

:"ScanFileFile"
echo.
set File=
set /p File="What is the file you are repairing? "
if not exist "%File%" goto "ScanFileFileNotExist"
if /i "%OnlineOffline%"=="Online" goto "ScanFileOnline"
if /i "%OnlineOffline%"=="Offline" goto "ScanFile"

:"ScanFileFileNotExist"
echo "%File%" does not exist! Please try again.
goto "ScanFileFile"

:"ScanFile"
echo.
set ScanFile=
set /p ScanFile="What is the drive letter of your offline Windows installation? (A:-Z:) "
if /i "%ScanFile%"=="A:" goto "SureScanFile"
if /i "%ScanFile%"=="B:" goto "SureScanFile"
if /i "%ScanFile%"=="C:" goto "SureScanFile"
if /i "%ScanFile%"=="D:" goto "SureScanFile"
if /i "%ScanFile%"=="E:" goto "SureScanFile"
if /i "%ScanFile%"=="F:" goto "SureScanFile"
if /i "%ScanFile%"=="G:" goto "SureScanFile"
if /i "%ScanFile%"=="H:" goto "SureScanFile"
if /i "%ScanFile%"=="I:" goto "SureScanFile"
if /i "%ScanFile%"=="J:" goto "SureScanFile"
if /i "%ScanFile%"=="K:" goto "SureScanFile"
if /i "%ScanFile%"=="L:" goto "SureScanFile"
if /i "%ScanFile%"=="M:" goto "SureScanFile"
if /i "%ScanFile%"=="N:" goto "SureScanFile"
if /i "%ScanFile%"=="O:" goto "SureScanFile"
if /i "%ScanFile%"=="P:" goto "SureScanFile"
if /i "%ScanFile%"=="Q:" goto "SureScanFile"
if /i "%ScanFile%"=="R:" goto "SureScanFile"
if /i "%ScanFile%"=="S:" goto "SureScanFile"
if /i "%ScanFile%"=="T:" goto "SureScanFile"
if /i "%ScanFile%"=="U:" goto "SureScanFile"
if /i "%ScanFile%"=="V:" goto "SureScanFile"
if /i "%ScanFile%"=="W:" goto "SureScanFile"
if /i "%ScanFile%"=="X:" goto "SureScanFile"
if /i "%ScanFile%"=="Y:" goto "SureScanFile"
if /i "%ScanFile%"=="Z:" goto "SureScanFile"
echo Invalid syntax!
goto "ScanFile"

:"SureScanFile"
echo.
set SureScanFile=
set /p SureScanFile="Are you sure "%ScanFile%" is the drive letter of your offline Windows installation? (Yes/No) "
if /i "%SureScanFile%"=="Yes" goto "CheckExistScanFile"
if /i "%SureScanFile%"=="No" goto "ScanFile"
echo Invalid syntax!
goto "SureSureScanFile"

:"CheckExistScanFile"
if not exist "%ScanFile%" goto "ScanFileNotExist"
if /i "%ScanFile%"=="%SystemDrive%" goto "ScanFileIsOnline"
if not exist "%ScanFile%\Windows" goto "ScanFileNotWindows"
goto "ScanFileOffline"

:"ScanFileNotExist"
echo "%ScanFileNotExist%" does not exist!
goto "ScanFile"

:"ScanFileIsOnline"
echo "%ScanFile%" is an online Windows installation!
goto "11"

:"ScanFileNotWindows"
echo "%ScanFile%" is not an offline Windows installation!
goto "ScanFile"

:"ScanFileOnline"
echo.
echo Scanning file "%File%".
"%windir%\System32\sfc.exe" /scannfile="%File%"
if not "%errorlevel%"=="0" goto "11"
echo File "%File%" scanned.
goto "Start"

:"ScanFileOffline"
echo.
echo Scanning file "%File%".
if not exist "%ScanFile%\Windows\Logs\CBS" md "%ScanFile%\Windows\Logs\CBS" > nul 2>&1
"%windir%\System32\sfc.exe" /scannfile="%File%" /offbootdir="%ScanFile%" /offwindir="%ScanFile%\Windows" /offlogfile="%ScanFile%\Windows\Logs\CBS\CBS.log"
if not "%errorlevel%"=="0" goto "11"
echo File "%File%" scanned.
goto "Start"

:"12"
echo.
set OnlineOffline=
set /p OnlineOffline="Are you verifying an online or offline Windows installation file? (Online/Offline) "
if /i "%OnlineOffline%"=="Online" goto "VerifyFileFile"
if /i "%OnlineOffline%"=="Offline" goto "VerifyFileFile"
echo Invalid syntax!
goto "12"

:"VerifyFileFile"
echo.
set File=
set /p File="What is the file you are repairing? "
if not exist "%File%" goto "VerifyFileFileNotExist"
if /i "%OnlineOffline%"=="Online" goto "VerifyFileOnline"
if /i "%OnlineOffline%"=="Offline" goto "VerifyFile"

:"VerifyFileFileNotExist"
echo "%File%" does not exist! Please try again.
goto "VerifyFileFile"

:"VerifyFile"
echo.
set VerifyFile=
set /p VerifyFile="What is the drive letter of your offline Windows installation? (A:-Z:) "
if /i "%VerifyFile%"=="A:" goto "SureVerifyFile"
if /i "%VerifyFile%"=="B:" goto "SureVerifyFile"
if /i "%VerifyFile%"=="C:" goto "SureVerifyFile"
if /i "%VerifyFile%"=="D:" goto "SureVerifyFile"
if /i "%VerifyFile%"=="E:" goto "SureVerifyFile"
if /i "%VerifyFile%"=="F:" goto "SureVerifyFile"
if /i "%VerifyFile%"=="G:" goto "SureVerifyFile"
if /i "%VerifyFile%"=="H:" goto "SureVerifyFile"
if /i "%VerifyFile%"=="I:" goto "SureVerifyFile"
if /i "%VerifyFile%"=="J:" goto "SureVerifyFile"
if /i "%VerifyFile%"=="K:" goto "SureVerifyFile"
if /i "%VerifyFile%"=="L:" goto "SureVerifyFile"
if /i "%VerifyFile%"=="M:" goto "SureVerifyFile"
if /i "%VerifyFile%"=="N:" goto "SureVerifyFile"
if /i "%VerifyFile%"=="O:" goto "SureVerifyFile"
if /i "%VerifyFile%"=="P:" goto "SureVerifyFile"
if /i "%VerifyFile%"=="Q:" goto "SureVerifyFile"
if /i "%VerifyFile%"=="R:" goto "SureVerifyFile"
if /i "%VerifyFile%"=="S:" goto "SureVerifyFile"
if /i "%VerifyFile%"=="T:" goto "SureVerifyFile"
if /i "%VerifyFile%"=="U:" goto "SureVerifyFile"
if /i "%VerifyFile%"=="V:" goto "SureVerifyFile"
if /i "%VerifyFile%"=="W:" goto "SureVerifyFile"
if /i "%VerifyFile%"=="X:" goto "SureVerifyFile"
if /i "%VerifyFile%"=="Y:" goto "SureVerifyFile"
if /i "%VerifyFile%"=="Z:" goto "SureVerifyFile"
echo Invalid syntax!
goto "VerifyFile"

:"SureVerifyFile"
echo.
set SureVerifyFile=
set /p SureVerifyFile="Are you sure "%VerifyFile%" is the drive letter of your offline Windows installation? (Yes/No) "
if /i "%SureVerifyFile%"=="Yes" goto "CheckExistVerifyFile"
if /i "%SureVerifyFile%"=="No" goto "VerifyFile"
echo Invalid syntax!
goto "SureVerifyFile"

:"CheckExistVerifyFile"
if not exist "%VerifyFile%" goto "VerifyFileNotExist"
if /i "%VerifyFile%"=="%SystemDrive%" goto "VerifyFileIsOnline"
if not exist "%VerifyFile%\Windows" goto "VerifyFileNotWindows"
goto "VerifyFileOffline"

:"VerifyFileNotExist"
echo "%VerifyFileNotExist%" does not exist!
goto "VerifyFile"

:"VerifyFileIsOnline"
echo "%VerifyFile%" is an online Windows installation!
goto "12"

:"VerifyFileNotWindows"
echo "%VerifyFile%" is not an offline Windows installation!
goto "VerifyFile"

:"VerifyFileOnline"
echo.
echo Verifying file "%File%".
"%windir%\System32\sfc.exe" /verifyfile="%File%"
if not "%errorlevel%"=="0" goto "12"
echo File "%File%" verified.
goto "Start"

:"VerifyFileOffline"
echo.
echo Verifying file "%File%".
if not exist "%VerifyFile%\Windows\Logs\CBS" md "%VerifyFile%\Windows\Logs\CBS" > nul 2>&1
"%windir%\System32\sfc.exe" /verifyfile="%File%" /offbootdir="%VerifyFile%" /offwindir="%VerifyFile%\Windows" /offlogfile="%VerifyFile%\Windows\Logs\CBS\CBS.log"
if not "%errorlevel%"=="0" goto "12"
echo File "%File%" verified.
goto "Start"

:"13"
echo.
set OnlineOffline=
set /p OnlineOffline="Are you viewing the logs of an online or offline Windows installation? (Online/Offline) "
if /i "%OnlineOffline%"=="Online" goto "SFCOnlineLog"
if /i "%OnlineOffline%"=="Offline" goto "SFCLog"
echo Invalid syntax!
goto "13"

:"SFCLog"
echo.
set SFCLog=
set /p SFCLog="What is the drive letter of your offline Windows installation? (A:-Z:) "
if /i "%SFCLog%"=="A:" goto "SureSFCLog"
if /i "%SFCLog%"=="B:" goto "SureSFCLog"
if /i "%SFCLog%"=="C:" goto "SureSFCLog"
if /i "%SFCLog%"=="D:" goto "SureSFCLog"
if /i "%SFCLog%"=="E:" goto "SureSFCLog"
if /i "%SFCLog%"=="F:" goto "SureSFCLog"
if /i "%SFCLog%"=="G:" goto "SureSFCLog"
if /i "%SFCLog%"=="H:" goto "SureSFCLog"
if /i "%SFCLog%"=="I:" goto "SureSFCLog"
if /i "%SFCLog%"=="J:" goto "SureSFCLog"
if /i "%SFCLog%"=="K:" goto "SureSFCLog"
if /i "%SFCLog%"=="L:" goto "SureSFCLog"
if /i "%SFCLog%"=="M:" goto "SureSFCLog"
if /i "%SFCLog%"=="N:" goto "SureSFCLog"
if /i "%SFCLog%"=="O:" goto "SureSFCLog"
if /i "%SFCLog%"=="P:" goto "SureSFCLog"
if /i "%SFCLog%"=="Q:" goto "SureSFCLog"
if /i "%SFCLog%"=="R:" goto "SureSFCLog"
if /i "%SFCLog%"=="S:" goto "SureSFCLog"
if /i "%SFCLog%"=="T:" goto "SureSFCLog"
if /i "%SFCLog%"=="U:" goto "SureSFCLog"
if /i "%SFCLog%"=="V:" goto "SureSFCLog"
if /i "%SFCLog%"=="W:" goto "SureSFCLog"
if /i "%SFCLog%"=="X:" goto "SureSFCLog"
if /i "%SFCLog%"=="Y:" goto "SureSFCLog"
if /i "%SFCLog%"=="Z:" goto "SureSFCLog"
echo Invalid syntax!
goto "SFCLog"

:"SureSFCLog"
echo.
set SureSFCLog=
set /p SureSFCLog="Are you sure "%SFCLog%" is the drive letter of your offline Windows installation? (Yes/No) "
if /i "%SureSFCLog%"=="Yes" goto "CheckExistSFCOfflineLog"
if /i "%SureSFCLog%"=="No" goto "SFCLog"
echo Invalid syntax!
goto "SureSFCLog"

:"CheckExistSFCOfflineLog"
if not exist "%SFCLog%" goto "SFCLogNotExist"
if /i "%SFCLog%"=="%SystemDrive%" goto "SFCLogIsOnline"
if not exist "%SFCLog%\Windows" goto "SFCLogNotWindows"
goto "SFCOfflineLog"

:"SFCLogNotExist"
echo "%SFCLog%" does not exist!
goto "SFCLog"

:"SFCLogIsOnline"
echo "%SFCLog%" is an online Windows installation!
goto "13"

:"SFCLogNotWindows"
echo "%SFCLog%" is not an offline Windows installation!
goto "SFCLog"

:"SFCOnlineLog"
if not exist "%windir%\Logs\CBS\CBS.log" goto "SFCOnlineLogNotExist"
"%windir%\notepad.exe" "%windir%\Logs\CBS\CBS.log"
if not "%errorlevel%"=="0" goto "ErrorSFCLog"
goto "Start"

:"SFCOnlineLogNotExist"
echo SFC log file ("%windir%\Logs\CBS\CBS.log") does not exist!
goto "Start"

:"SFCOfflineLog"
if not exist "%SFCLog%\Windows\Logs\CBS\CBS.log" goto "SFCOfflineLogNotExist"
"%windir%\notepad.exe" "%SFCLog%\Windows\Logs\CBS\CBS.log" > nul 2>&1
if not "%errorlevel%"=="0" goto "ErrorSFCLog"
goto "Start"

:"SFCOfflineLogNotExist"
echo SFC log file ("%SFCLog%\Windows\Logs\CBS\CBS.log") does not exist!
goto "Start"

:"ErrorSFCLog"
echo There has been an error! Please try again.
goto "13"

:"Exit"
endlocal
exit
