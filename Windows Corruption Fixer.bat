@echo off
title Windows Corruption Fixer
setlocal
echo Program Name: Windows Corruption Fixer
echo Version: 14.0.0
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
if /i "%CHKDSKCheck%"=="" set DriveLetter=%SystemDrive%
if /i "%CHKDSKCheck%"=="A:" goto "SureDriveLetterCHKDSKCheck"
if /i "%CHKDSKCheck%"=="B:" goto "SureDriveLetterCHKDSKCheck"
if /i "%CHKDSKCheck%"=="C:" goto "SureDriveLetterCHKDSKCheck"
if /i "%CHKDSKCheck%"=="D:" goto "SureDriveLetterCHKDSKCheck"
if /i "%CHKDSKCheck%"=="E:" goto "SureDriveLetterCHKDSKCheck"
if /i "%CHKDSKCheck%"=="F:" goto "SureDriveLetterCHKDSKCheck"
if /i "%CHKDSKCheck%"=="G:" goto "SureDriveLetterCHKDSKCheck"
if /i "%CHKDSKCheck%"=="H:" goto "SureDriveLetterCHKDSKCheck"
if /i "%CHKDSKCheck%"=="I:" goto "SureDriveLetterCHKDSKCheck"
if /i "%CHKDSKCheck%"=="J:" goto "SureDriveLetterCHKDSKCheck"
if /i "%CHKDSKCheck%"=="K:" goto "SureDriveLetterCHKDSKCheck"
if /i "%CHKDSKCheck%"=="L:" goto "SureDriveLetterCHKDSKCheck"
if /i "%CHKDSKCheck%"=="M:" goto "SureDriveLetterCHKDSKCheck"
if /i "%CHKDSKCheck%"=="N:" goto "SureDriveLetterCHKDSKCheck"
if /i "%CHKDSKCheck%"=="O:" goto "SureDriveLetterCHKDSKCheck"
if /i "%CHKDSKCheck%"=="P:" goto "SureDriveLetterCHKDSKCheck"
if /i "%CHKDSKCheck%"=="Q:" goto "SureDriveLetterCHKDSKCheck"
if /i "%CHKDSKCheck%"=="R:" goto "SureDriveLetterCHKDSKCheck"
if /i "%CHKDSKCheck%"=="S:" goto "SureDriveLetterCHKDSKCheck"
if /i "%CHKDSKCheck%"=="T:" goto "SureDriveLetterCHKDSKCheck"
if /i "%CHKDSKCheck%"=="U:" goto "SureDriveLetterCHKDSKCheck"
if /i "%CHKDSKCheck%"=="V:" goto "SureDriveLetterCHKDSKCheck"
if /i "%CHKDSKCheck%"=="W:" goto "SureDriveLetterCHKDSKCheck"
if /i "%CHKDSKCheck%"=="X:" goto "SureDriveLetterCHKDSKCheck"
if /i "%CHKDSKCheck%"=="Y:" goto "SureDriveLetterCHKDSKCheck"
if /i "%CHKDSKCheck%"=="Z:" goto "SureDriveLetterCHKDSKCheck"
echo Invalid syntax!
goto "1"

:"SureDriveLetterCHKDSKCheck"
echo.
set SureCHKDSKCheckr=
set /p SureCHKDSKCheck="Are you sure "%CHKDSKCheck%" is the drive letter that you want to run CHKDSK check on? (Yes/No) "
if /i "%SureCHKDSKCheckr%"=="Yes" goto "CheckExistCHKDSKCheck"
if /i "%SureCHKDSKCheck%"=="No" goto "1"
echo Invalid syntax!
goto "SureDriveLetterCHKDSKCheck"

:"CheckExistCHKDSKCheck"
if not exist "%CHKDSKCheck%" goto "DriveLetterNotExistCHKDSKCheck"
goto "CHKDSKCheck"

:"DriveLetterNotExistCHKDSKCheck"
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
if /i "%CHKDSKCheckFix%"=="" set DriveLetter=%SystemDrive%
if /i "%CHKDSKCheckFix%"=="A:" goto "SureDriveLetterCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="B:" goto "SureDriveLetterCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="C:" goto "SureDriveLetterCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="D:" goto "SureDriveLetterCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="E:" goto "SureDriveLetterCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="F:" goto "SureDriveLetterCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="G:" goto "SureDriveLetterCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="H:" goto "SureDriveLetterCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="I:" goto "SureDriveLetterCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="J:" goto "SureDriveLetterCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="K:" goto "SureDriveLetterCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="L:" goto "SureDriveLetterCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="M:" goto "SureDriveLetterCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="N:" goto "SureDriveLetterCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="O:" goto "SureDriveLetterCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="P:" goto "SureDriveLetterCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="Q:" goto "SureDriveLetterCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="R:" goto "SureDriveLetterCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="S:" goto "SureDriveLetterCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="T:" goto "SureDriveLetterCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="U:" goto "SureDriveLetterCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="V:" goto "SureDriveLetterCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="W:" goto "SureDriveLetterCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="X:" goto "SureDriveLetterCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="Y:" goto "SureDriveLetterCHKDSKCheckFix"
if /i "%CHKDSKCheckFix%"=="Z:" goto "SureDriveLetterCHKDSKCheckFix"
echo Invalid syntax!
goto "2"

:"SureDriveLetterCHKDSKCheckFix"
echo.
set SureCHKDSKCheckFix=
set /p SureCHKDSKCheckFix="Are you sure "%CHKDSKCheckFix%" is the drive letter that you want to run CHKDSK check and fix on? (Yes/No) "
if /i "%SureCHKDSKCheckFix%"=="Yes" goto "CheckExistCHKDSKCheckFix"
if /i "%SureCHKDSKCheckFix%"=="No" goto "2"
echo Invalid syntax!
goto "SureDriveLetterCHKDSKCheckFix"

:"CheckExistCHKDSKCheckFix"
if not exist "%CHKDSKCheckFix%" goto "DriveLetterNotExistCHKDSKCheckFix"
goto "CHKDSKCheckFix"

:"DriveLetterNotExistCHKDSKCheckFix"
echo "%CHKDSKCheckFix%" does not exist! Please try again.
goto "2"

:"CHKDSKCheckFix"
echo.
"%windir%\System32\chkdsk.exe" "%CHKDSKCheckFix%" /r
goto "Start"

:"3"
echo.
echo.
set OnlineOffline=
set /p OnlineOffline="Are you viewings the logs of an online or offline Windows installation? (Online/Offline) "
if /i "%OnlineOffline%"=="Online" goto "AllRecent"
if /i "%OnlineOffline%"=="Offline" goto "CHKDSKLogDriveLetter"
echo Invalid syntax!
goto "3"

:"CHKDSKLogDriveLetter"
echo.
set CHKDSKLogDriveLetter=
set /p CHKDSKLogDriveLetter="What is the drive letter of the offline Windows installation? (A:-Z:) "
if /i "%CHKDSKLogDriveLetter%"=="A:" goto "CheckExistCHKDSKOfflineLog"
if /i "%CHKDSKLogDriveLetter%"=="B:" goto "CheckExistCHKDSKOfflineLog"
if /i "%CHKDSKLogDriveLetter%"=="C:" goto "CheckExistCHKDSKOfflineLog"
if /i "%CHKDSKLogDriveLetter%"=="D:" goto "CheckExistCHKDSKOfflineLog"
if /i "%CHKDSKLogDriveLetter%"=="E:" goto "CheckExistCHKDSKOfflineLog"
if /i "%CHKDSKLogDriveLetter%"=="F:" goto "CheckExistCHKDSKOfflineLog"
if /i "%CHKDSKLogDriveLetter%"=="G:" goto "CheckExistCHKDSKOfflineLog"
if /i "%CHKDSKLogDriveLetter%"=="H:" goto "CheckExistCHKDSKOfflineLog"
if /i "%CHKDSKLogDriveLetter%"=="I:" goto "CheckExistCHKDSKOfflineLog"
if /i "%CHKDSKLogDriveLetter%"=="J:" goto "CheckExistCHKDSKOfflineLog"
if /i "%CHKDSKLogDriveLetter%"=="K:" goto "CheckExistCHKDSKOfflineLog"
if /i "%CHKDSKLogDriveLetter%"=="L:" goto "CheckExistCHKDSKOfflineLog"
if /i "%CHKDSKLogDriveLetter%"=="M:" goto "CheckExistCHKDSKOfflineLog"
if /i "%CHKDSKLogDriveLetter%"=="N:" goto "CheckExistCHKDSKOfflineLog"
if /i "%CHKDSKLogDriveLetter%"=="O:" goto "CheckExistCHKDSKOfflineLog"
if /i "%CHKDSKLogDriveLetter%"=="P:" goto "CheckExistCHKDSKOfflineLog"
if /i "%CHKDSKLogDriveLetter%"=="Q:" goto "CheckExistCHKDSKOfflineLog"
if /i "%CHKDSKLogDriveLetter%"=="R:" goto "CheckExistCHKDSKOfflineLog"
if /i "%CHKDSKLogDriveLetter%"=="S:" goto "CheckExistCHKDSKOfflineLog"
if /i "%CHKDSKLogDriveLetter%"=="T:" goto "CheckExistCHKDSKOfflineLog"
if /i "%CHKDSKLogDriveLetter%"=="U:" goto "CheckExistCHKDSKOfflineLog"
if /i "%CHKDSKLogDriveLetter%"=="V:" goto "CheckExistCHKDSKOfflineLog"
if /i "%CHKDSKLogDriveLetter%"=="W:" goto "CheckExistCHKDSKOfflineLog"
if /i "%CHKDSKLogDriveLetter%"=="X:" goto "CheckExistCHKDSKOfflineLog"
if /i "%CHKDSKLogDriveLetter%"=="Y:" goto "CheckExistCHKDSKOfflineLog"
if /i "%CHKDSKLogDriveLetter%"=="Z:" goto "CheckExistCHKDSKOfflineLog"
echo Invalid syntax!
goto "CHKDSKLogDriveLetter"

:"CheckExistCHKDSKOfflineLog"
if not exist "%CHKDSKLogDriveLetter%" goto "CHKDSKLogDriveLetterNotExist"
if /i "%CHKDSKLogDriveLetter%"=="%SystemDrive%" goto "CHKDSKLogDriveLetterIsOnline"
if not exist "%CHKDSKLogDriveLetter%\Windows" goto "CHKDSKLogDriveLetterNotWindows"
goto "AllRecent"

:"CHKDSKLogDriveLetterNotExist"
echo "%CHKDSKLogDriveLetter%" does not exist!
goto "CHKDSKLogDriveLetter"

:"CHKDSKLogDriveLetterIsOnline"
echo "%CHKDSKLogDriveLetter%" is an online Windows installation!
goto "3"

:"CHKDSKLogDriveLetterNotWindows"
echo "%CHKDSKLogDriveLetter%" is not an offline Windows installation!
goto "CHKDSKLogDriveLetter"

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
if /i "%DriveLetter%"=="A:" goto "SureDriveLetterDISM"
if /i "%DriveLetter%"=="B:" goto "SureDriveLetterDISM"
if /i "%DriveLetter%"=="C:" goto "SureDriveLetterDISM"
if /i "%DriveLetter%"=="D:" goto "SureDriveLetterDISM"
if /i "%DriveLetter%"=="E:" goto "SureDriveLetterDISM"
if /i "%DriveLetter%"=="F:" goto "SureDriveLetterDISM"
if /i "%DriveLetter%"=="G:" goto "SureDriveLetterDISM"
if /i "%DriveLetter%"=="H:" goto "SureDriveLetterDISM"
if /i "%DriveLetter%"=="I:" goto "SureDriveLetterDISM"
if /i "%DriveLetter%"=="J:" goto "SureDriveLetterDISM"
if /i "%DriveLetter%"=="K:" goto "SureDriveLetterDISM"
if /i "%DriveLetter%"=="L:" goto "SureDriveLetterDISM"
if /i "%DriveLetter%"=="M:" goto "SureDriveLetterDISM"
if /i "%DriveLetter%"=="N:" goto "SureDriveLetterDISM"
if /i "%DriveLetter%"=="O:" goto "SureDriveLetterDISM"
if /i "%DriveLetter%"=="P:" goto "SureDriveLetterDISM"
if /i "%DriveLetter%"=="Q:" goto "SureDriveLetterDISM"
if /i "%DriveLetter%"=="R:" goto "SureDriveLetterDISM"
if /i "%DriveLetter%"=="S:" goto "SureDriveLetterDISM"
if /i "%DriveLetter%"=="T:" goto "SureDriveLetterDISM"
if /i "%DriveLetter%"=="U:" goto "SureDriveLetterDISM"
if /i "%DriveLetter%"=="V:" goto "SureDriveLetterDISM"
if /i "%DriveLetter%"=="W:" goto "SureDriveLetterDISM"
if /i "%DriveLetter%"=="X:" goto "SureDriveLetterDISM"
if /i "%DriveLetter%"=="Y:" goto "SureDriveLetterDISM"
if /i "%DriveLetter%"=="Z:" goto "SureDriveLetterDISM"
echo Invalid syntax!
goto "DriveLetter"

:"SureDriveLetterDISM"
echo.
set SureDriveLetter=
set /p SureDriveLetter="Are you sure "%DriveLetter%" is the drive letter of your Windows Disk Image/Windows installation media? (Yes/No) "
if /i "%SureDriveLetter%"=="Yes" goto "CheckExistDriveLetter"
if /i "%SureDriveLetter%"=="No" goto "DriveLetter"
echo Invalid syntax!
goto "SureDriveLetterDISM"

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
"%windir%\System32\Dism.exe" /Get-ImageInfo /ImageFile:"%Sources%\%Install%" | find /c /i "Index" > "Index.txt"
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
if /i "%Install%"=="install.esd" goto "ExportWIMSet"
if /i "%Install%"=="install.swm" goto "ExportWIMSet"
if /i "%Install%"=="install.wim" goto "MountSet"

:"ExportWIMSet"
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
set /p OnlineOffline="Are you viewings the logs of an online or offline Windows installation? (Online/Offline) "
if /i "%OnlineOffline%"=="Online" goto "DISMOnlineLog"
if /i "%OnlineOffline%"=="Offline" goto "DISMLogDriveLetter"
echo Invalid syntax!
goto "8"

:"DISMLogDriveLetter"
echo.
set DISMLogDriveLetter=
set /p DISMLogDriveLetter="What is the drive letter of the offline Windows installation? (A:-Z:) "
if /i "%DISMLogDriveLetter%"=="A:" goto "SureDISMLogDriveLetter"
if /i "%DISMLogDriveLetter%"=="B:" goto "SureDISMLogDriveLetter"
if /i "%DISMLogDriveLetter%"=="C:" goto "SureDISMLogDriveLetter"
if /i "%DISMLogDriveLetter%"=="D:" goto "SureDISMLogDriveLetter"
if /i "%DISMLogDriveLetter%"=="E:" goto "SureDISMLogDriveLetter"
if /i "%DISMLogDriveLetter%"=="F:" goto "SureDISMLogDriveLetter"
if /i "%DISMLogDriveLetter%"=="G:" goto "SureDISMLogDriveLetter"
if /i "%DISMLogDriveLetter%"=="H:" goto "SureDISMLogDriveLetter"
if /i "%DISMLogDriveLetter%"=="I:" goto "SureDISMLogDriveLetter"
if /i "%DISMLogDriveLetter%"=="J:" goto "SureDISMLogDriveLetter"
if /i "%DISMLogDriveLetter%"=="K:" goto "SureDISMLogDriveLetter"
if /i "%DISMLogDriveLetter%"=="L:" goto "SureDISMLogDriveLetter"
if /i "%DISMLogDriveLetter%"=="M:" goto "SureDISMLogDriveLetter"
if /i "%DISMLogDriveLetter%"=="N:" goto "SureDISMLogDriveLetter"
if /i "%DISMLogDriveLetter%"=="O:" goto "SureDISMLogDriveLetter"
if /i "%DISMLogDriveLetter%"=="P:" goto "SureDISMLogDriveLetter"
if /i "%DISMLogDriveLetter%"=="Q:" goto "SureDISMLogDriveLetter"
if /i "%DISMLogDriveLetter%"=="R:" goto "SureDISMLogDriveLetter"
if /i "%DISMLogDriveLetter%"=="S:" goto "SureDISMLogDriveLetter"
if /i "%DISMLogDriveLetter%"=="T:" goto "SureDISMLogDriveLetter"
if /i "%DISMLogDriveLetter%"=="U:" goto "SureDISMLogDriveLetter"
if /i "%DISMLogDriveLetter%"=="V:" goto "SureDISMLogDriveLetter"
if /i "%DISMLogDriveLetter%"=="W:" goto "SureDISMLogDriveLetter"
if /i "%DISMLogDriveLetter%"=="X:" goto "SureDISMLogDriveLetter"
if /i "%DISMLogDriveLetter%"=="Y:" goto "SureDISMLogDriveLetter"
if /i "%DISMLogDriveLetter%"=="Z:" goto "SureDISMLogDriveLetter"
echo Invalid syntax!
goto "DISMLogDriveLetter"

:"SureDISMLogDriveLetter"
echo.
set SureDISMLogDriveLetter=
set /p SureDISMLogDriveLetter="Are you sure "%DISMLogDriveLetter%" is the drive letter of your offline Windows installation? (Yes/No) "
if /i "%SureDISMLogDriveLetter%"=="Yes" goto "CheckExistDISMOfflineLog"
if /i "%SureDISMLogDriveLetter%"=="No" goto "DISMLogDriveLetter"
echo Invalid syntax!
goto "SureDISMLogDriveLetter"

:"CheckExistDISMOfflineLog"
if not exist "%DISMLogDriveLetter%" goto "DISMLogDriveLetterNotExist"
if /i "%DISMLogDriveLetter%"=="%SystemDrive%" goto "DISMLogDriveLetterIsOnline"
if not exist "%DISMLogDriveLetter%\Windows" goto "DISMLogDriveLetterNotWindows"
goto "DISMOfflineLog"

:"DISMLogDriveLetterNotExist"
echo "%DISMLogDriveLetter%" does not exist!
goto "DISMLogDriveLetter"

:"DISMLogDriveLetterIsOnline"
echo "%DISMLogDriveLetter%" is an online Windows installation!
goto "8"

:"DISMLogDriveLetterNotWindows"
echo "%DISMLogDriveLetter%" is not an offline Windows installation!
goto "DISMLogDriveLetter"

:"DISMOnlineLog"
if not exist "%windir%\Logs\DISM\dism.log" goto "DISMOnlineLogNotExist"
"%windir%\notepad.exe" "%windir%\Logs\DISM\dism.log"
if not "%errorlevel%"=="0" goto "ErrorDISMLog"
goto "Start"

:"DISMOnlineLogNotExist"
echo DISM log file ("%windir%\Logs\DISM\dism.log") does not exist!
goto "Start"

:"DISMOfflineLog"
if not exist "%DISMLogDriveLetter%\Windows\Logs\DISM\dism.log" goto "DISMOfflineLogNotExist"
"%windir%\notepad.exe" "%DISMLogDriveLetter%\Windows\Logs\DISM\dism.log"
if not "%errorlevel%"=="0" goto "ErrorDISMLog"
goto "Start"

:"DISMOfflineLogNotExist"
echo DISM log file ("%DISMLogDriveLetter%\Windows\Logs\DISM\dism.log") does not exist!
goto "Start"

:"ErrorDISMLog"
echo There has been an error! Please try again.
goto "8"

:"9"
echo.
set OnlineOffline=
set /p OnlineOffline="Are you scanning an online or offline Windows installation? (Online/Offline) "
if /i "%OnlineOffline%"=="Online" goto "ScanNowOnline"
if /i "%OnlineOffline%"=="Offline" goto "ScanNowDriveLetter"
echo Invalid syntax!
goto "9"

:"ScanNowDriveLetter"
echo.
set ScanNowDriveLetter=
set /p ScanNowDriveLetter="What is the drive letter of the offline Windows installation? (A:-Z:) "
if /i "%ScanNowDriveLetter%"=="A:" goto "SureScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="B:" goto "SureScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="C:" goto "SureScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="D:" goto "SureScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="E:" goto "SureScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="F:" goto "SureScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="G:" goto "SureScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="H:" goto "SureScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="I:" goto "SureScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="J:" goto "SureScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="K:" goto "SureScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="L:" goto "SureScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="M:" goto "SureScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="N:" goto "SureScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="O:" goto "SureScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="P:" goto "SureScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="Q:" goto "SureScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="R:" goto "SureScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="S:" goto "SureScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="T:" goto "SureScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="U:" goto "SureScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="V:" goto "SureScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="W:" goto "SureScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="X:" goto "SureScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="Y:" goto "SureScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="Z:" goto "SureScanNowDriveLetter"
echo Invalid syntax!
goto "ScanNowDriveLetter"

:"SureScanNowDriveLetter"
echo.
set SureScanNowDriveLetter=
set /p SureScanNowDriveLetter="Are you sure "%ScanNowDriveLetter%" is the drive letter of your offline Windows installation? (Yes/No) "
if /i "%SureScanNowDriveLetter%"=="Yes" goto "CheckExistScanNowDriveLetter"
if /i "%SureScanNowDriveLetter%"=="No" goto "ScanNowDriveLetter"
echo Invalid syntax!
goto "SureScanNowDriveLetter"

:"CheckExistScanNowDriveLetter"
if not exist "%ScanNowDriveLetter%" goto "ScanNowDriveLetterNotExist"
if /i "%ScanNowDriveLetter%"=="%SystemDrive%" goto "ScanNowDriveLetterIsOnline"
if not exist "%ScanNowDriveLetter%\Windows" goto "ScanNowDriveLetterNotWindows"
goto "ScanNowOffline"

:"ScanNowDriveLetterNotExist"
echo "%ScanNowDriveLetter%" does not exist.
goto "ScanNowDriveLetter"

:"ScanNowDriveLetterIsOnline"
echo "%ScanNowDriveLetter%" is an online Windows installation!
goto "9"

:"ScanNowDriveLetterNotWindows"
echo "%ScanNowDriveLetter%" is not an offline Windows installation!
goto "ScanNowDriveLetter"

:"ScanNowOnline"
echo.
echo Scanning Windows installation "%SystemDrive%".
"%windir%\System32\sfc.exe" /scannow
if not "%errorlevel%"=="0" goto "9"
echo Windows installation "%SystemDrive%" scanned.
goto "Start"

:"ScanNowOffline"
echo.
echo Scanning Windows installation "%ScanNowDriveLetter%".
if not exist "%ScanNowDriveLetter%\Windows\Logs\CBS" md "%ScanNowDriveLetter%\Windows\Logs\CBS" > nul 2>&1
"%windir%\System32\sfc.exe" /scannow /offbootdir="%ScanNowDriveLetter%" /offwindir="%ScanNowDriveLetter%\Windows" /offlogfile="%ScanNowDriveLetter%\Windows\Logs\CBS\CBS.log"
if not "%errorlevel%"=="0" goto "9"
echo Windows installation "%ScanNowDriveLetter%" scanned.
goto "Start"

:"10"
echo.
set OnlineOffline=
set /p OnlineOffline="Are you verifying an online or offline Windows installation? (Online/Offline) "
if /i "%OnlineOffline%"=="Online" goto "VerifyOnlyOnline"
if /i "%OnlineOffline%"=="Offline" goto "VerifyOnlyDriveLetter"
echo Invalid syntax!
goto "10"

:"VerifyOnlyDriveLetter"
echo.
set VerifyOnlyDriveLetter=
set /p VerifyOnlyDriveLetter="What is the drive letter of the offline Windows installation? (A:-Z:) "
if /i "%VerifyOnlyDriveLetter%"=="A:" goto "SureVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="B:" goto "SureVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="C:" goto "SureVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="D:" goto "SureVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="E:" goto "SureVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="F:" goto "SureVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="G:" goto "SureVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="H:" goto "SureVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="I:" goto "SureVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="J:" goto "SureVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="K:" goto "SureVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="L:" goto "SureVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="M:" goto "SureVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="N:" goto "SureVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="O:" goto "SureVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="P:" goto "SureVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="Q:" goto "SureVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="R:" goto "SureVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="S:" goto "SureVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="T:" goto "SureVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="U:" goto "SureVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="V:" goto "SureVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="W:" goto "SureVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="X:" goto "SureVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="Y:" goto "SureVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="Z:" goto "SureVerifyOnlyDriveLetter"
echo Invalid syntax!
goto "VerifyOnlyDriveLetter"

:"SureVerifyOnlyDriveLetter"
echo.
set SureVerifyOnlyDriveLetter=
set /p SureVerifyOnlyDriveLetter="Are you sure "%VerifyOnlyDriveLetter%" is the drive letter of your offline Windows installation? (Yes/No) "
if /i "%SureVerifyOnlyDriveLetter%"=="Yes" goto "CheckExistVerifyOnlyDriveLetter"
if /i "%SureVerifyOnlyDriveLetter%"=="No" goto "VerifyOnlyDriveLetter"
echo Invalid syntax!
goto "SureVerifyOnlyDriveLetter"

:"CheckExistVerifyOnlyDriveLetter"
if not exist "%VerifyOnlyDriveLetter%" goto "VerifyOnlyDriveLetterNotExist"
if /i "%VerifyOnlyDriveLetter%"=="%SystemDrive%" goto "VerifyOnlyDriveLetterIsOnline"
if not exist "%VerifyOnlyDriveLetter%\Windows" goto "VerfiyOnlyDriveLetterNotWindows"
goto "VerifyOnlyOffline"

:"VerifyOnlyDriveLetterNotExist"
echo "%VerifyOnlyDriveLetterNotExist%" does not exist!
goto "VerifyOnlyDriveLetter"

:"VerifyOnlyDriveLetterIsOnline"
echo "%VerifyOnlyDriveLetter%" is an online Windows installation!
goto "10"

:"VerfiyOnlyDriveLetterNotWindows"
echo "%VerifyOnlyDriveLetter%" is not an offline Windows installation!
goto "VerifyOnlyDriveLetter"

:"VerifyOnlyOnline"
echo.
echo Verifing Windows installation "%SystemDrive%".
"%windir%\System32\sfc.exe" /verifyonly
if not "%errorlevel%"=="0" goto "10"
echo Windows installation "%SystemDrive%" verified.
goto "Start"

:"VerifyOnlyOffline"
echo.
echo Verifing Windows installation "%VerifyOnlyDriveLetter%".
if not exist "%VerifyOnlyDriveLetter%\Windows\Logs\CBS" md "%VerifyOnlyDriveLetter%\Windows\Logs\CBS" > nul 2>&1
"%windir%\System32\sfc.exe" /verifyonly /offbootdir="%VerifyOnlyDriveLetter%" /offwindir="%VerifyOnlyDriveLetter%\Windows" /offlogfile="%VerifyOnlyDriveLetter%\Windows\Logs\CBS\CBS.log"
if not "%errorlevel%"=="0" goto "10"
echo Windows installation "%VerifyOnlyDriveLetter%" verified.
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
if /i "%OnlineOffline%"=="Offline" goto "ScanFileDriveLetter"

:"ScanFileFileNotExist"
echo "%File%" does not exist! Please try again.
goto "ScanFileFile"

:"ScanFileDriveLetter"
echo.
set ScanFileDriveLetter=
set /p ScanFileDriveLetter="What is the drive letter of the offline Windows installation? (A:-Z:) "
if /i "%ScanFileDriveLetter%"=="A:" goto "SureScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="B:" goto "SureScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="C:" goto "SureScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="D:" goto "SureScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="E:" goto "SureScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="F:" goto "SureScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="G:" goto "SureScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="H:" goto "SureScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="I:" goto "SureScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="J:" goto "SureScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="K:" goto "SureScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="L:" goto "SureScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="M:" goto "SureScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="N:" goto "SureScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="O:" goto "SureScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="P:" goto "SureScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="Q:" goto "SureScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="R:" goto "SureScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="S:" goto "SureScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="T:" goto "SureScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="U:" goto "SureScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="V:" goto "SureScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="W:" goto "SureScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="X:" goto "SureScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="Y:" goto "SureScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="Z:" goto "SureScanFileDriveLetter"
echo Invalid syntax!
goto "ScanFileDriveLetter"

:"SureScanFileDriveLetter"
echo.
set SureScanFileDriveLetter=
set /p SureScanFileDriveLetter="Are you sure "%ScanFileDriveLetter%" is the drive letter of your offline Windows installation? (Yes/No) "
if /i "%SureScanFileDriveLetter%"=="Yes" goto "CheckExistScanFileDriveLetter"
if /i "%SureScanFileDriveLetter%"=="No" goto "ScanFileDriveLetter"
echo Invalid syntax!
goto "SureSureScanFileDriveLetter"

:"CheckExistScanFileDriveLetter"
if not exist "%ScanFileDriveLetter%" goto "ScanFileDriveLetterNotExist"
if /i "%ScanFileDriveLetter%"=="%SystemDrive%" goto "ScanFileDriveLetterIsOnline"
if not exist "%ScanFileDriveLetter%\Windows" goto "ScanFileDriveLetterNotWindows"
goto "ScanFileOffline"

:"ScanFileDriveLetterNotExist"
echo "%ScanFileDriveLetterNotExist%" does not exist!
goto "ScanFileDriveLetter"

:"ScanFileDriveLetterIsOnline"
echo "%ScanFileDriveLetter%" is an online Windows installation!
goto "11"

:"ScanFileDriveLetterNotWindows"
echo "%ScanFileDriveLetter%" is not an offline Windows installation!
goto "ScanFileDriveLetter"

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
if not exist "%ScanFileDriveLetter%\Windows\Logs\CBS" md "%ScanFileDriveLetter%\Windows\Logs\CBS" > nul 2>&1
"%windir%\System32\sfc.exe" /scannfile="%File%" /offbootdir="%ScanFileDriveLetter%" /offwindir="%ScanFileDriveLetter%\Windows" /offlogfile="%ScanFileDriveLetter%\Windows\Logs\CBS\CBS.log"
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
if /i "%OnlineOffline%"=="Offline" goto "VerifyFileDriveLetter"

:"VerifyFileFileNotExist"
echo "%File%" does not exist! Please try again.
goto "VerifyFileFile"

:"VerifyFileDriveLetter"
echo.
set VerifyFileDriveLetter=
set /p VerifyFileDriveLetter="What is the drive letter of the offline Windows installation? (A:-Z:) "
if /i "%VerifyFileDriveLetter%"=="A:" goto "CheckExistVerifyFileDriveLetter"
if /i "%VerifyFileDriveLetter%"=="B:" goto "CheckExistVerifyFileDriveLetter"
if /i "%VerifyFileDriveLetter%"=="C:" goto "CheckExistVerifyFileDriveLetter"
if /i "%VerifyFileDriveLetter%"=="D:" goto "CheckExistVerifyFileDriveLetter"
if /i "%VerifyFileDriveLetter%"=="E:" goto "CheckExistVerifyFileDriveLetter"
if /i "%VerifyFileDriveLetter%"=="F:" goto "CheckExistVerifyFileDriveLetter"
if /i "%VerifyFileDriveLetter%"=="G:" goto "CheckExistVerifyFileDriveLetter"
if /i "%VerifyFileDriveLetter%"=="H:" goto "CheckExistVerifyFileDriveLetter"
if /i "%VerifyFileDriveLetter%"=="I:" goto "CheckExistVerifyFileDriveLetter"
if /i "%VerifyFileDriveLetter%"=="J:" goto "CheckExistVerifyFileDriveLetter"
if /i "%VerifyFileDriveLetter%"=="K:" goto "CheckExistVerifyFileDriveLetter"
if /i "%VerifyFileDriveLetter%"=="L:" goto "CheckExistVerifyFileDriveLetter"
if /i "%VerifyFileDriveLetter%"=="M:" goto "CheckExistVerifyFileDriveLetter"
if /i "%VerifyFileDriveLetter%"=="N:" goto "CheckExistVerifyFileDriveLetter"
if /i "%VerifyFileDriveLetter%"=="O:" goto "CheckExistVerifyFileDriveLetter"
if /i "%VerifyFileDriveLetter%"=="P:" goto "CheckExistVerifyFileDriveLetter"
if /i "%VerifyFileDriveLetter%"=="Q:" goto "CheckExistVerifyFileDriveLetter"
if /i "%VerifyFileDriveLetter%"=="R:" goto "CheckExistVerifyFileDriveLetter"
if /i "%VerifyFileDriveLetter%"=="S:" goto "CheckExistVerifyFileDriveLetter"
if /i "%VerifyFileDriveLetter%"=="T:" goto "CheckExistVerifyFileDriveLetter"
if /i "%VerifyFileDriveLetter%"=="U:" goto "CheckExistVerifyFileDriveLetter"
if /i "%VerifyFileDriveLetter%"=="V:" goto "CheckExistVerifyFileDriveLetter"
if /i "%VerifyFileDriveLetter%"=="W:" goto "CheckExistVerifyFileDriveLetter"
if /i "%VerifyFileDriveLetter%"=="X:" goto "CheckExistVerifyFileDriveLetter"
if /i "%VerifyFileDriveLetter%"=="Y:" goto "CheckExistVerifyFileDriveLetter"
if /i "%VerifyFileDriveLetter%"=="Z:" goto "CheckExistVerifyFileDriveLetter"
echo Invalid syntax!
goto "VerifyFileDriveLetter"

:"CheckExistVerifyFileDriveLetter"
if not exist "%VerifyFileDriveLetter%" goto "VerifyFileDriveLetterNotExist"
if /i "%VerifyFileDriveLetter%"=="%SystemDrive%" goto "VerifyFileDriveLetterIsOnline"
if not exist "%VerifyFileDriveLetter%\Windows" goto "VerifyFileDriveLetterNotWindows"
goto "VerifyFileOffline"

:"VerifyFileDriveLetterNotExist"
echo "%VerifyFileDriveLetterNotExist%" does not exist!
goto "VerifyFileDriveLetter"

:"VerifyFileDriveLetterIsOnline"
echo "%VerifyFileDriveLetter%" is an online Windows installation!
goto "12"

:"VerifyFileDriveLetterNotWindows"
echo "%VerifyFileDriveLetter%" is not an offline Windows installation!
goto "VerifyFileDriveLetter"

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
if not exist "%VerifyFileDriveLetter%\Windows\Logs\CBS" md "%VerifyFileDriveLetter%\Windows\Logs\CBS" > nul 2>&1
"%windir%\System32\sfc.exe" /verifyfile="%File%" /offbootdir="%VerifyFileDriveLetter%" /offwindir="%VerifyFileDriveLetter%\Windows" /offlogfile="%VerifyFileDriveLetter%\Windows\Logs\CBS\CBS.log"
if not "%errorlevel%"=="0" goto "12"
echo File "%File%" verified.
goto "Start"

:"13"
echo.
set OnlineOffline=
set /p OnlineOffline="Are you viewings the logs of an online or offline Windows installation? (Online/Offline) "
if /i "%OnlineOffline%"=="Online" goto "SFCOnlineLog"
if /i "%OnlineOffline%"=="Offline" goto "SFCLogDriveLetter"
echo Invalid syntax!
goto "13"

:"SFCLogDriveLetter"
echo.
set SFCLogDriveLetter=
set /p SFCLogDriveLetter="What is the drive letter of the offline Windows installation? (A:-Z:) "
if /i "%SFCLogDriveLetter%"=="A:" goto "CheckExistSFCOfflineLog"
if /i "%SFCLogDriveLetter%"=="B:" goto "CheckExistSFCOfflineLog"
if /i "%SFCLogDriveLetter%"=="C:" goto "CheckExistSFCOfflineLog"
if /i "%SFCLogDriveLetter%"=="D:" goto "CheckExistSFCOfflineLog"
if /i "%SFCLogDriveLetter%"=="E:" goto "CheckExistSFCOfflineLog"
if /i "%SFCLogDriveLetter%"=="F:" goto "CheckExistSFCOfflineLog"
if /i "%SFCLogDriveLetter%"=="G:" goto "CheckExistSFCOfflineLog"
if /i "%SFCLogDriveLetter%"=="H:" goto "CheckExistSFCOfflineLog"
if /i "%SFCLogDriveLetter%"=="I:" goto "CheckExistSFCOfflineLog"
if /i "%SFCLogDriveLetter%"=="J:" goto "CheckExistSFCOfflineLog"
if /i "%SFCLogDriveLetter%"=="K:" goto "CheckExistSFCOfflineLog"
if /i "%SFCLogDriveLetter%"=="L:" goto "CheckExistSFCOfflineLog"
if /i "%SFCLogDriveLetter%"=="M:" goto "CheckExistSFCOfflineLog"
if /i "%SFCLogDriveLetter%"=="N:" goto "CheckExistSFCOfflineLog"
if /i "%SFCLogDriveLetter%"=="O:" goto "CheckExistSFCOfflineLog"
if /i "%SFCLogDriveLetter%"=="P:" goto "CheckExistSFCOfflineLog"
if /i "%SFCLogDriveLetter%"=="Q:" goto "CheckExistSFCOfflineLog"
if /i "%SFCLogDriveLetter%"=="R:" goto "CheckExistSFCOfflineLog"
if /i "%SFCLogDriveLetter%"=="S:" goto "CheckExistSFCOfflineLog"
if /i "%SFCLogDriveLetter%"=="T:" goto "CheckExistSFCOfflineLog"
if /i "%SFCLogDriveLetter%"=="U:" goto "CheckExistSFCOfflineLog"
if /i "%SFCLogDriveLetter%"=="V:" goto "CheckExistSFCOfflineLog"
if /i "%SFCLogDriveLetter%"=="W:" goto "CheckExistSFCOfflineLog"
if /i "%SFCLogDriveLetter%"=="X:" goto "CheckExistSFCOfflineLog"
if /i "%SFCLogDriveLetter%"=="Y:" goto "CheckExistSFCOfflineLog"
if /i "%SFCLogDriveLetter%"=="Z:" goto "CheckExistSFCOfflineLog"
echo Invalid syntax!
goto "SFCLogDriveLetter"

:"CheckExistSFCOfflineLog"
if not exist "%SFCLogDriveLetter%" goto "SFCLogDriveLetterNotExist"
if /i "%SFCLogDriveLetter%"=="%SystemDrive%" goto "SFCLogDriveLetterIsOnline"
if not exist "%SFCLogDriveLetter%\Windows" goto "SFCLogDriveLetterNotWindows"
goto "SFCOfflineLog"

:"SFCLogDriveLetterNotExist"
echo "%SFCLogDriveLetter%" does not exist!
goto "SFCLogDriveLetter"

:"SFCLogDriveLetterIsOnline"
echo "%SFCLogDriveLetter%" is an online Windows installation!
goto "13"

:"SFCLogDriveLetterNotWindows"
echo "%SFCLogDriveLetter%" is not an offline Windows installation!
goto "SFCLogDriveLetter"

:"SFCOnlineLog"
if not exist "%windir%\Logs\CBS\CBS.log" goto "SFCOnlineLogNotExist"
"%windir%\notepad.exe" "%windir%\Logs\CBS\CBS.log"
if not "%errorlevel%"=="0" goto "ErrorSFCLog"
goto "Start"

:"SFCOnlineLogNotExist"
echo SFC log file ("%windir%\Logs\CBS\CBS.log") does not exist!
goto "Start"

:"SFCOfflineLog"
if not exist "%SFCLogDriveLetter%\Windows\Logs\CBS\CBS.log" goto "SFCOfflineLogNotExist"
"%windir%\notepad.exe" "%SFCLogDriveLetter%\Windows\Logs\CBS\CBS.log"
if not "%errorlevel%"=="0" goto "ErrorSFCLog"
goto "Start"

:"SFCOfflineLogNotExist"
echo SFC log file ("%SFCLogDriveLetter%\Windows\Logs\CBS\CBS.log") does not exist!
goto "Start"

:"ErrorSFCLog"
echo There has been an error! Please try again.
goto "13"

:"Exit"
endlocal
exit
