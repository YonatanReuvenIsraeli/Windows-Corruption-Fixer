@echo off
setlocal
title Windows Corruption Fixer
echo Program Name: Windows Corruption Fixer
echo Version: 10.1.0
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
echo [1] CHKDSK.
echo [2] View CHKDSK logs.
echo [3] DISM check health.
echo [4] DISM scan health.
echo [5] DISM restore health.
echo [6] View DISM logs.
echo [7] SFC scan now.
echo [8] SFC verify only.
echo [9] SFC scan file.
echo [10] SFC verify file.
echo [11] View SFC logs.
echo [12] Close.
echo.
set Input=
set /p Input="Which one do you want to do? (1-12) "
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
if /i "%Input%"=="12" goto "Done"
echo Invalid syntax!
goto "Start"

:"1"
echo.
set DriveLetter=
set /p DriveLetter="Which drive do you want to run CHKDSK on? (A:-Z:) "
if /i "%DriveLetter%"=="A:" goto "SureDriveLetterCHKDSK"
if /i "%DriveLetter%"=="B:" goto "SureDriveLetterCHKDSK"
if /i "%DriveLetter%"=="C:" goto "SureDriveLetterCHKDSK"
if /i "%DriveLetter%"=="D:" goto "SureDriveLetterCHKDSK"
if /i "%DriveLetter%"=="E:" goto "SureDriveLetterCHKDSK"
if /i "%DriveLetter%"=="F:" goto "SureDriveLetterCHKDSK"
if /i "%DriveLetter%"=="G:" goto "SureDriveLetterCHKDSK"
if /i "%DriveLetter%"=="H:" goto "SureDriveLetterCHKDSK"
if /i "%DriveLetter%"=="I:" goto "SureDriveLetterCHKDSK"
if /i "%DriveLetter%"=="J:" goto "SureDriveLetterCHKDSK"
if /i "%DriveLetter%"=="K:" goto "SureDriveLetterCHKDSK"
if /i "%DriveLetter%"=="L:" goto "SureDriveLetterCHKDSK"
if /i "%DriveLetter%"=="M:" goto "SureDriveLetterCHKDSK"
if /i "%DriveLetter%"=="N:" goto "SureDriveLetterCHKDSK"
if /i "%DriveLetter%"=="O:" goto "SureDriveLetterCHKDSK"
if /i "%DriveLetter%"=="P:" goto "SureDriveLetterCHKDSK"
if /i "%DriveLetter%"=="Q:" goto "SureDriveLetterCHKDSK"
if /i "%DriveLetter%"=="R:" goto "SureDriveLetterCHKDSK"
if /i "%DriveLetter%"=="S:" goto "SureDriveLetterCHKDSK"
if /i "%DriveLetter%"=="T:" goto "SureDriveLetterCHKDSK"
if /i "%DriveLetter%"=="U:" goto "SureDriveLetterCHKDSK"
if /i "%DriveLetter%"=="V:" goto "SureDriveLetterCHKDSK"
if /i "%DriveLetter%"=="W:" goto "SureDriveLetterCHKDSK"
if /i "%DriveLetter%"=="X:" goto "SureDriveLetterCHKDSK"
if /i "%DriveLetter%"=="Y:" goto "SureDriveLetterCHKDSK"
if /i "%DriveLetter%"=="Z:" goto "SureDriveLetterCHKDSK"
echo Invalid syntax!
goto "1"

:"SureDriveLetterCHKDSK"
echo.
set SureDriveLetter=
set /p SureDriveLetter="Are you sure %DriveLetter% is the drive letter that you want to run CHKDSK on? (Yes/No) "
if /i "%SureDriveLetter%"=="Yes" goto "CHKDSK"
if /i "%SureDriveLetter%"=="No" goto "DriveLetter"
echo Invalid syntax!
goto "SureDriveLetterCHKDSK"

:CheckExistCHKDSK
if not exist "%DriveLetter%" goto "DriveLetterNotExist"
goto "CHKDSK"

:"DriveLetterNotExist"
echo "%DriveLetter%" does not exist! Please try again.
goto "DriveLetter"

:"CHKDSK"
"%windir%\System32\chkdsk.exe" "%DriveLetter%" /f /r
goto "Start"

:"2"
echo.
set Recent=
set /p Recent="How many of the most recent CHKDSK logs to you want to view? (1-?/All) "
if /i "%Recent%"=="All" goto "SureRecentAll"
goto "SureRecent"

:"SureRecentAll"
echo.
set SureRecent=
set /p SureRecent="Are you sure you want to view all CHKDSK logs? (Yes/No) "
if /i "%SureRecent%"=="Yes" goto "wevtutilAll"
if /i "%SureRecent%"=="No" goto "2"
echo Invalid syntax!
goto "SureRecentAll"

:"SureRecent"
echo.
set SureRecent=
set /p SureRecent="Are you sure you want to view the %Recent% most recent CHKDSK logs? (Yes/No) "
if /i "%SureRecent%"=="Yes" goto "wevtutilMost"
if /i "%SureRecent%"=="No" goto "2"
echo Invalid syntax!
goto "SureRecent"

:"wevtutilAll"
"%windir%\System32\wevtutil.exe" qe Application "/q:*[System[Provider[@Name='chkdsk'] or Provider[@Name='wininit']]]" /f:text
if not "%errorlevel%"=="0" goto "wevtutilError"
goto "Start"

:"wevtutilMost"
"%windir%\System32\wevtutil.exe" qe Application "/q:*[System[Provider[@Name='chkdsk'] or Provider[@Name='wininit']]]" /f:text /c:%Recent%
if not "%errorlevel%"=="0" goto "wevtutilError"
goto "Start"

:"wevtutilError"
echo There has been an error! You can try again.
goto "2"

:"3"
echo.
set OnlineOffline=
set /p OnlineOffline="Are you checking an online or offline Windows installation? (Online/Offline) "
if /i "%OnlineOffline%"=="Online" goto "CheckOnline"
if /i "%OnlineOffline%"=="Offline" goto "InstallationCheck"
echo Invalid syntax!
goto "3"

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
if not exist "%InstallationCheck%\Windows" goto "NotExistCheck"
if "%InstallationCheck%"=="%SystemDrive%" goto "InstallationCheckIsOnline"
goto "CheckOffline"

:"NotExistCheck"
echo "%InstallationCheck%" does not exist or is not an offline Windows installation! Please try again.
goto "InstallationCheck"

:"InstallationCheckIsOnline"
echo "%InstallationCheck%" is an online Windows installation!
goto "3"

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

:"4"
echo.
set OnlineOffline=
set /p OnlineOffline="Are you scanning an online or offline Windows installation? (Online/Offline) "
if /i "%OnlineOffline%"=="Online" goto "ScanOnline"
if /i "%OnlineOffline%"=="Offline" goto "InstallationScan"
echo Invalid syntax!
goto "4"

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
if not exist "%InstallationScan%\Windows" goto "NotExistScan"
if "%InstallationScan%"=="%SystemDrive%" goto "InstallationScanIsOnline"
goto "ScanOffline"

:"NotExistCheck"
echo "%InstallationScan%" does not exist or is not an offline Windows installation! Please try again.
goto "InstallationCScan"

:"InstallationScanIsOnline"
echo "%InstallationScan%" is an online Windows installation!
goto "4"

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
if not exist "%InstallationScane%\Windows\Logs\DISM" md "%InstallationScan%\Windows\Logs\DISM" > nul 2>&1
"%windir%\System32\Dism.exe" /Image:"%InstallationScan%" /Cleanup-Image /ScanHealth /LogPath:"%InstallationScan%"\Windows\Logs\DISM\dism.log
if not "%errorlevel%"=="0" goto "InstallationScan"
echo Scanned health on Windows installation "%InstallationScan%".
goto "Start"

:"5"
echo.
set OnlineOffline=
set /p OnlineOffline="Are you restoring an online or offline Windows installation? (Online/Offline) "
if /i "%OnlineOffline%"=="Online" goto "Update"
if /i "%OnlineOffline%"=="Offline" goto "InstallationRestore"
echo Invalid syntax!
goto "5"

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
if not exist "%InstallationRestore%\Windows" goto "NotExistRestore"
if "%InstallationRestore%"=="%SystemDrive%" goto "InstallationRestoreIsOnline"
goto "Update"

:"NotExistRestore"
echo "%InstallationRestore%" does not exist or is not an offline Windows installation! Please try again.
goto "InstallationRestore"

:"InstallationRestoreIsOnline"
echo "%InstallationRestore%" is an online Windows installation!
goto "5"

:"Update"
echo.
set Update=
set /p Update="Do you want to use Windows Update? (Yes/No) "
if /i "%Update%"=="Yes" goto "Media"
if /i "%Update%"=="No" goto "Media"
echo Invalid sytax!
goto "Update"

:"Media"
echo.
set Media=
set /p Media="Do you want to use a Windows Disk Image? (Yes/No) "
if /i "%Media%"=="Yes" goto "MountedWindowsimageWindowsimageSxS"
if /i "%OnlineOffline%"=="Online" if /i "%Media%"=="No" goto "DISMUpdateCheckOnlineNoImage"
if /i "%OnlineOffline%"=="Offline" if /i "%Media%"=="No" goto "DISMUpdateCheckOfflineNoImage"
echo Invalid sytax!
goto "Media"

:"MountedWindowsimageWindowsimageSxS"
echo.
set MountedWindowsimageWindowsimageSxS=
set /p MountedWindowsimageWindowsimageSxS="Do you want to use a mounted Windows image, Windows image or side by side (SxS) folder? (Mounted Windows image/Windows image/SxS) "
if /i "%MountedWindowsimageWindowsimageSxS%"=="Mounted Windows image" goto "Download"
if /i "%MountedWindowsimageWindowsimageSxS%"=="Windows image" goto "Download"
if /i "%MountedWindowsimageWindowsimageSxS%"=="SxS" goto "Download"
echo Invalid sytax!
goto "MountedWindowsimageWindowsimageSxS"

:"Download"
echo.
echo [1] Download Windows 10 22H2 x86/x64 Windows Disk Image.
echo [2] Download Windows 11 24H2 x64 Windows Disk Image.
echo [3] Download Windows 11 24H2 Arm64 Windows Disk Image.
echo [4] Already have downloaded Windows 10 22H2 x86/x64 Windows Disk Image or Windows 11 24H2 x64/Arm64 Windows Disk Image.
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
if /i "%Download%"=="1" set /p SureDownload="Are you sure you want to download Windows 10 22H2 x86/x64 Windows Disk Image? (Yes/No) "
if /i "%Download%"=="2" set /p SureDownload="Are you sure you want to download Windows 11 24H2 x64 Windows Disk Image? (Yes/No) "
if /i "%Download%"=="3" set /p SureDownload="Are you sure you want to download Windows 11 24H2 Arm64 Windows Disk Image? (Yes/No) "
if /i "%Download%"=="4" set /p SureDownload="Are you sure you have downloaded Windows 10 22H2 x86/x64 Windows Disk Image or Windows 11 24H2 x64/Arm64 Windows Disk Image? (Yes/No) "
if /i "%SureDownload%"=="Yes" goto "DownloadGo"
if /i "%SureDownload%"=="No" goto "Download"
echo Invalid syntax!
goto "SureDownload"

:"DownloadGo"
if /i "%Download%"=="1" goto "10"
if /i "%Download%"=="2" goto "11x64"
if /i "%Download%"=="3" goto "11Arm64"
if /i "%Download%"=="4" goto "Mount"

:"10"
echo.
echo Download Windows 10 22H2 x86/x64 Disk Image from here. ^-^-^> https://www.microsoft.com/software-download/windows10
echo Press any key to open the website.
pause > nul 2>&1
start https://www.microsoft.com/software-download/windows10
echo.
echo Press any key to continue once you have downloaded the Windows 10 22H2 x86/x64 Disk Image.
pause > nul 2>&1
goto "Mount"

:"11x64"
echo.
echo Download Windows 11 24H2 x64 Disk Image from here. ^-^-^> https://www.microsoft.com/software-download/windows11
echo Press any key to open the website.
pause > nul 2>&1
start https://www.microsoft.com/software-download/windows11
echo.
echo Press any key to continue once you have downloaded the Windows 11 24H2 x64 Disk Image.
pause > nul 2>&1
goto "Mount"

:"11Arm64"
echo.
echo Download Windows 11 24H2 Arm64 Disk Image from here. ^-^-^> https://www.microsoft.com/software-download/windows11arm64
echo Press any key to open the website.
pause > nul 2>&1
start https://www.microsoft.com/software-download/windows11arm64
echo.
echo Press any key to continue once you have downloaded the Windows 11 24H2 Arm64 Disk Image.
pause > nul 2>&1
goto "Mount"

:"Mount"
echo.
echo Please mount your Windows Disk Image then press any key to continue.
pause > nul 2>&1
goto "DriveLetter"

:"DriveLetter"
echo.
set DriveLetter=
set /p DriveLetter="What is your drive letter of your Windows Disk Image? (A:-Z:) "
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
set /p SureDriveLetter="Are you sure "%DriveLetter%" is the drive letter of your Windows Disk Image? (Yes/No) "
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
if exist "%DriveLetter%\sources" set Source=%DriveLetter%\sources
if /i "%MountedWindowsimageWindowsimageSxS%"=="Mounted Windows image" if exist "%DriveLetter%\sources" goto "ESDSWMWIM"
if /i "%MountedWindowsimageWindowsimageSxS%"=="Windows image" if exist "%DriveLetter%\sources" goto "ESDSWMWIM"
if /i "%MountedWindowsimageWindowsimageSxS%"=="SxS" if exist "%DriveLetter%\sources" goto "SxS"
if exist "%DriveLetter%\x86\sources" goto "Bit"
if exist "%DriveLetter%\x64\sources" goto "Bit"
echo "%DriveLetter%" is not a Windows Disk Image!
goto "DriveLetter"

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
set /p SureBit="Are you sure you have a %Bit%-bit version of Windows? "
if /i "%SureBit%"=="Yes" goto "BitSources"
if /i "%SureBit%"=="No" goto "Bit"
echo Invalid syntax!
goto "SureBit"

:"BitSources"
if /i "%Bit%"=="32" set Source=%DriveLetter%\x86\sources
if /i "%Bit%"=="64" set Source=%DriveLetter%\x64\sources
if /i "%MountedWindowsimageWindowsimageSxS%"=="Mounted Windows image" goto "ESDSWMWIM"
if /i "%MountedWindowsimageWindowsimageSxS%"=="Windows image" goto "ESDSWMWIM"
if /i "%MountedWindowsimageWindowsimageSxS%"=="SxS" goto "SxS"

:"ESDSWMWIM"
if exist "%Source%\install.esd" set Install=install.esd
if exist "%Source%\install.swm" set Install=install.swm
if exist "%Source%\install.wim" set Install=install.wim
goto "IndexSet"

:"IndexSet"
set Index=
goto "DISM"

:"DISM"
if exist "Index.txt" goto "IndexExist"
echo.
echo Getting index details for Windows Disk Image "%DriveLetter%".
"%windir%\System32\Dism.exe" /Get-ImageInfo /ImageFile:"%Source%\%Install%" | find /c /i "Index" > "Index.txt"
set /p IndexNumber=< "Index.txt"
del "Index.txt" /f /q > nul 2>&1
"%windir%\System32\Dism.exe" /Get-ImageInfo /ImageFile:"%Source%\%Install%"
if not "%errorlevel%"=="0" goto "DriveLetter"
echo Got index details for Windows Disk Image "%DriveLetter%".
if "%Index%"=="True" goto "IndexDone"
if "%IndexNumber%"=="3" goto "Index3"
if "%IndexNumber%"=="7" goto "Index7"
if "%IndexNumber%"=="11" goto "Index11"
echo.
echo Invalid Windows Disk Image!
goto "DriveLetter"

:"IndexExist"
set Index=True
echo.
echo Please temporary rename to something else or temporary move to another location "Index.txt" in order for this batch file to proceed. "Index.txt" is not a system file. "Index.txt" is located in the folder you ran this batch file from. Press any key to continue when "Index.txt" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
pause > nul 2>&1
goto "DISM"

:"IndexDone"
echo.
echo You can now rename or move back the file back to "Index.txt".
if "%IndexNumber%"=="3" goto "Index3"
if "%IndexNumber%"=="7" goto "Index7"
if "%IndexNumber%"=="11" goto "Index11"
echo.
echo Invalid Windows Disk Image!
goto "DriveLetter"

:"Index3"
echo.
set Index=
set /p Index="Which one do you have on your PC? (1-3)? "
if /i "%Index%"=="1" goto "SureIndex3"
if /i "%Index%"=="2" goto "SureIndex3"
if /i "%Index%"=="3" goto "SureIndex3"
echo Invalid syntax!
goto "Index3"

:"SureIndex3"
echo.
set SureIndex=
set /p SureIndex="Are you sure you want Index %Index%? (Yes/No) "
if /i "%MountedWindowsimageWindowsimageSxS%"=="Mounted Windows image" if /i "%SureIndex%"=="Yes" goto "Mount"
if /i "%MountedWindowsimageWindowsimageSxS%"=="Windows image" if /i "%SureIndex%"=="Yes" goto "Windowsimage"
if /i "%SureIndex%"=="No" goto "Index3"
echo Invalid syntax!
goto "SureIndex3"

:"Index7"
echo.
set Index=
set /p Index="Which one do you have on your PC? (1-7)? "
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
if /i "%MountedWindowsimageWindowsimageSxS%"=="Mounted Windows image" if /i "%SureIndex%"=="Yes" goto "Mount"
if /i "%MountedWindowsimageWindowsimageSxS%"=="Windows image" if /i "%SureIndex%"=="Yes" goto "Windowsimage"
if /i "%SureIndex%"=="No" goto "Index7"
echo Invalid syntax!
goto "SureIndex7"

:"Index11"
echo.
set Index=
set /p Index="Which one do you have on your PC? (1-11)? "
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
if /i "%MountedWindowsimageWindowsimageSxS%"=="Mounted Windows image" if /i "%SureIndex%"=="Yes" goto "Mount"
if /i "%MountedWindowsimageWindowsimageSxS%"=="Windows image" if /i "%SureIndex%"=="Yes" goto "Windowsimage"
if /i "%SureIndex%"=="No" goto "Index11"
echo Invalid syntax!
goto "SureIndex11"

:"Mount"
if exist "%SystemDrive%\Mount" goto "MountExist"
echo.
echo Mounting Windows image to "%SystemDrive%\Mount".
md "%SystemDrive%\Mount" > nul 2>&1
"%windir%\System32\Dism.exe" /Mount-Image /ImageFile:"%Source%\%Install%" /Index:%Index% /MountDir:"%SystemDrive%\Mount" /ReadOnly
if not "%errorlevel%"=="0" goto "MountError"
echo Windows image mounted to "%SystemDrive%\Mount".
if /i "%OnlineOffline%"=="Online" goto "DISMUpdateCheckOnlineMountedWindowsimage"
if /i "%OnlineOffline%"=="Offline" goto "DISMUpdateCheckOfflineMountedWindowsimage"

:"MountExist"
set Mount=True
echo.
echo Please temporary rename to something else or temporary move to another location "%SystemDrive%\Mount" in order for this batch file to proceed. "%SystemDrive%\Mount" is not a system file. Press any key to continue when "%SystemDrive%\Mount" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
pause > nul 2>&1
goto "Bit3MountedWindowsimage"

:"MountError"
echo.
echo Unmounting Windows image from "%SystemDrive%\Mount".
"%windir%\System32\Dism.exe" /Unmount-Image /MountDir:"%SystemDrive%\Mount" /Discard
if not "%errorlevel%"=="0" goto "MountErrorError"
rd "%SystemDrive%\Mount" /s /q > nul 2>&1
echo Windows image unmounted from "%SystemDrive%\Mount".
if /i "%Mount%"=="True" goto "MountDone"
goto "Update"

:"MountErrorError"
echo There has been an error an all images need to be unmounted! Make sure to save all changes you have made to your mounted images before pressing any key to unmount all images. Press any key to unmount all images when you are ready to unmount all images.
pause > nul 2>&1
echo.
echo Cleaning up mounted images.
"%windir%\System32\Dism.exe" /Cleanup-Mountpoints
rd "%SystemDrive%\Mount" /s /q > nul 2>&1
echo Mounted images cleaned up.
if /i "%Mount%"=="True" goto "MountDone"
goto "Update"

:"Windowsimage"
if /i "%OnlineOffline%"=="Online" goto "DISMUpdateCheckOnlineWindowsimage"
if /i "%OnlineOffline%"=="Offline" goto "DISMUpdateCheckOfflineWindowsimage"

:"SxS"
if /i "%OnlineOffline%"=="Online" goto "DISMUpdateCheckOnlineSxS"
if /i "%OnlineOffline%"=="Offline" goto "DISMUpdateCheckOfflineSxS"

:"DISMUpdateCheckOnlineNoImage"
if /i "%Update%"=="Yes" goto "DISMOnlineNoImage""
if /i "%Update%"=="No" goto "DISMNoUpdateOnlineNoImage"

:"DISMOnlineNoImage"
echo.
echo Restoring health on Windows installation "%SystemDrive%".
"%windir%\System32\Dism.exe" /Online /Cleanup-Image /RestoreHealth
if not "%errorlevel%"=="0" goto "Update"
echo Health restored on Windows installation "%SystemDrive%".
goto "Start"

:"DISMNoUpdateOnlineNoImage"
echo.
echo Restoring health on Windows installation "%SystemDrive%".
"%windir%\System32\Dism.exe" /Online /Cleanup-Image /RestoreHealth /LimitAccess
if not "%errorlevel%"=="0" goto "Update"
echo Health restored on Windows installation "%SystemDrive%".
goto "Start"

:"DISMUpdateCheckOnlineMountedWindowsimage"
if /i "%Update%"=="Yes" goto "DISMOnlineMountedWindowsimage"
if /i "%Update%"=="No" goto "DISMNoUpdateOnlineMountedWindowsimage"

:"DISMOnlineMountedWindowsimage"
echo.
echo Restoring health on Windows installation "%SystemDrive%".
"%windir%\System32\Dism.exe" /Online /Cleanup-Image /RestoreHealth /Source:"%SystemDrive%\Mount\Windows"
if not "%errorlevel%"=="0" goto "Update"
echo Health restored on Windows installation "%SystemDrive%".
goto "Unmount"

:"DISMNoUpdateOnlineMountedWindowsimage"
echo.
echo Restoring health on Windows installation "%SystemDrive%".
"%windir%\System32\Dism.exe" /Online /Cleanup-Image /RestoreHealth /Source:"%SystemDrive%\Mount\Windows" /LimitAccess
if not "%errorlevel%"=="0" goto "Update"
echo Health restored on Windows installation "%SystemDrive%".
goto "Unmount"

:"DISMUpdateCheckOnlineWindowsimage"
if /i "%Update%"=="Yes" goto "DISMOnlineWindowsimage"
if /i "%Update%"=="No" goto "DISMNoUpdateOnlineWindowsimage"

:"DISMOnlineWindowsimage"
echo.
echo Restoring health on Windows installation "%SystemDrive%".
"%windir%\System32\Dism.exe" /Online /Cleanup-Image /RestoreHealth /Source:"%Source%\%Install%":%Index%
if not "%errorlevel%"=="0" goto "Update"
echo Health restored on Windows installation "%SystemDrive%".
goto "Start"

:"DISMNoUpdateOnlineWindowsimage"
echo.
echo Restoring health on Windows installation "%SystemDrive%".
"%windir%\System32\Dism.exe" /Online /Cleanup-Image /RestoreHealth /Source:"%Source%\%Install%":%Index% /LimitAccess
if not "%errorlevel%"=="0" goto "Update"
echo Health restored on Windows installation "%SystemDrive%".
goto "Start"

:"DISMUpdateCheckOnlineSxS"
if /i "%Update%"=="Yes" goto "DISMOnlineSxS"
if /i "%Update%"=="No" goto "DISMNoUpdateOnlineSxS"

:"DISMOnlineSxS"
echo.
echo Restoring health on Windows installation "%SystemDrive%".
"%windir%\System32\Dism.exe" /Online /Cleanup-Image /RestoreHealth /Source:"%Source%\sxs"
if not "%errorlevel%"=="0" goto "Update"
echo Health restored on Windows installation "%SystemDrive%".
goto "Start"

:"DISMNoUpdateOnlineSxS"
echo.
echo Restoring health on Windows installation "%SystemDrive%".
"%windir%\System32\Dism.exe" /Online /Cleanup-Image /RestoreHealth /Source:"%Source%\sxs" /LimitAccess
if not "%errorlevel%"=="0" goto "Update"
echo Health restored on Windows installation "%SystemDrive%".
goto "Start"

:"DISMUpdateCheckOfflineNoImage"
if /i "%Update%"=="Yes" goto "DISMOfflineNoImage"
if /i "%Update%"=="No" goto "DISMNoUpdateOfflineNoImage"

:"DISMOfflineNoImage"
echo.
echo Restoring health on Windows installation "%InstallationRestore%".
if not exist "%InstallationRestore%\Windows\Logs\DISM" md "%InstallationRestore%\Windows\Logs\DISM" > nul 2>&1
"%windir%\System32\Dism.exe" /Image:"%InstallationRestore%" /Cleanup-Image /RestoreHealth /LogPath:"%InstallationRestore%\Windows\Logs\DISM\dism.log"
if not "%errorlevel%"=="0" goto "UpdateOffline"
echo Health restored on Windows installation "%InstallationRestore%".
goto "Start"

:"DISMNoUpdateOfflineNoImage"
echo.
echo Restoring health on Windows installation "%InstallationRestore%".
if not exist "%InstallationRestore%\Windows\Logs\DISM" md "%InstallationRestore%\Windows\Logs\DISM" > nul 2>&1
"%windir%\System32\Dism.exe" /Image:"%InstallationRestore%" /Cleanup-Image /RestoreHealth /LimitAccess /LogPath:"%InstallationRestore%\Windows\Logs\DISM\dism.log"
if not "%errorlevel%"=="0" goto "UpdateOffline"
echo Health restored on Windows installation "%InstallationRestore%".
goto "Start"

:"DISMUpdateCheckOfflineMountedWindowsimage"
if /i "%Update%"=="Yes" goto "DISMOfflineMountedWindowsimage"
if /i "%Update%"=="No" goto "DISMNoUpdateOfflineMountedWindowsimage"

:"DISMOfflineMountedWindowsimage"
echo.
echo Restoring health on Windows installation "%InstallationRestore%".
if not exist "%InstallationRestore%\Windows\Logs\DISM" md "%InstallationRestore%\Windows\Logs\DISM" > nul 2>&1
"%windir%\System32\Dism.exe" /Image:"%InstallationRestore%" /Cleanup-Image /RestoreHealth /Source:"%SystemDrive%\Mount\Windows" /LogPath:"%InstallationRestore%\Windows\Logs\DISM\dism.log"
if not "%errorlevel%"=="0" goto "UpdateOffline"
echo Health restored on Windows installation "%InstallationRestore%".
goto "Unmount"

:"DISMNoUpdateOfflineMountedWindowsimage"
echo.
echo Restoring health on Windows installation "%InstallationRestore%".
if not exist "%InstallationRestore%\Windows\Logs\DISM" md "%InstallationRestore%\Windows\Logs\DISM" > nul 2>&1
"%windir%\System32\Dism.exe" /Image:"%InstallationRestore%" /Cleanup-Image /RestoreHealth /Source:"%SystemDrive%\Mount\Windows" /LimitAccess /LogPath:"%InstallationRestore%\Windows\Logs\DISM\dism.log"
if not "%errorlevel%"=="0" goto "UpdateOffline"
goto "Unmount"

:"DISMUpdateCheckOfflineWindowsimage"
if /i "%Update%"=="Yes" goto "DISMOfflineWindowsimage"
if /i "%Update%"=="No" goto "DISMNoUpdateOfflineWindowsimage"

:"DISMOfflineWindowsimage"
echo.
echo Restoring health on Windows installation "%InstallationRestore%".
if not exist "%InstallationRestore%\Windows\Logs\DISM" md "%InstallationRestore%\Windows\Logs\DISM" > nul 2>&1
"%windir%\System32\Dism.exe" /Image:"%InstallationRestore%" /Cleanup-Image /RestoreHealth /Source:"%Source%\%Install%":%Index% /LogPath:"%InstallationRestore%\Windows\Logs\DISM\dism.log"
if not "%errorlevel%"=="0" goto "UpdateOffline"
echo Health restored on Windows installation "%InstallationRestore%".
goto "Start"

:"DISMNoUpdateOfflineWindowsimage"
echo.
echo Restoring health on Windows installation "%InstallationRestore%".
if not exist "%InstallationRestore%\Windows\Logs\DISM" md "%InstallationRestore%\Windows\Logs\DISM" > nul 2>&1
"%windir%\System32\Dism.exe" /Image:"%InstallationRestore%" /Cleanup-Image /RestoreHealth /Source:"%Source%\%Install%":%Index% /LimitAccess /LogPath:"%InstallationRestore%\Windows\Logs\DISM\dism.log"
if not "%errorlevel%"=="0" goto "UpdateOffline"
goto "Start"

:"DISMUpdateCheckOfflineSxS"
if /i "%Update%"=="Yes" goto "DISMOfflineSxS"
if /i "%Update%"=="No" goto "DISMNoUpdateOfflineSxS"

:"DISMOfflineSxS"
echo.
echo Restoring health on Windows installation "%InstallationRestore%".
if not exist "%InstallationRestore%\Windows\Logs\DISM" md "%InstallationRestore%\Windows\Logs\DISM" > nul 2>&1
"%windir%\System32\Dism.exe" /Image:"%InstallationRestore%" /Cleanup-Image /RestoreHealth /Source:"%Source%\sxs" /LogPath:"%InstallationRestore%\Windows\Logs\DISM\dism.log"
if not "%errorlevel%"=="0" goto "UpdateOffline"
echo Health restored on Windows installation "%InstallationRestore%".
goto "Start"

:"DISMNoUpdateOfflineSxS"
echo.
echo Restoring health on Windows installation "%InstallationRestore%".
if not exist "%InstallationRestore%\Windows\Logs\DISM" md "%InstallationRestore%\Windows\Logs\DISM" > nul 2>&1
"%windir%\System32\Dism.exe" /Image:"%InstallationRestore%" /Cleanup-Image /RestoreHealth /Source:"%Source%\sxs" /LimitAccess /LogPath:"%InstallationRestore%\Windows\Logs\DISM\dism.log"
if not "%errorlevel%"=="0" goto "UpdateOffline"
goto "Start"

:"Unmount"
echo.
echo Unmounting Windows image from "%SystemDrive%\Mount".
"%windir%\System32\Dism.exe" /Unmount-Image /MountDir:"%SystemDrive%\Mount" /Discard
if not "%errorlevel%"=="0" goto "UnmountError"
rd "%SystemDrive%\Mount" /s /q > nul 2>&1
echo Windows image unmounted from "%SystemDrive%\Mount".
if /i "%Mount%"=="True" goto "MountDone"
goto "Start"

:"UnmountError"
echo There has been an error an all images need to be unmounted! Make sure to save all changes you have made to your mounted images before pressing any key to unmount all images. Press any key to unmount all images when you are ready to unmount all images.
pause > nul 2>&1
echo.
echo Cleaning up mounted images.
"%windir%\System32\Dism.exe" /Cleanup-Mountpoints
rd "%SystemDrive%\Mount" /s /q > nul 2>&1
echo Mounted images cleaned up.
if /i "%Mount%"=="True" goto "MountDone"
goto "Start"

:"MountDone"
echo.
echo You can now rename or move back the file back to "%SystemDrive%\Mount". Press any key to continue.
pause > nul 2>&1
goto "Start"

:"6"
echo.
set OnlineOffline=
set /p OnlineOffline="Are you viewings the logs of an online or offline Windows installation? (Online/Offline) "
if /i "%OnlineOffline%"=="Online" goto "CheckExistDISMOnlineLog"
if /i "%OnlineOffline%"=="Offline" goto "DISMLogDriveLetter"
echo Invalid syntax!
goto "6"

:"DISMLogDriveLetter"
echo.
set DISMLogDriveLetter=
set /p DISMLogDriveLetter="What is the drive letter of the offline Windows installation? (A:-Z:) "
if /i "%DISMLogDriveLetter%"=="A:" goto "CheckExistDISMOfflineLog"
if /i "%DISMLogDriveLetter%"=="B:" goto "CheckExistDISMOfflineLog"
if /i "%DISMLogDriveLetter%"=="C:" goto "CheckExistDISMOfflineLog"
if /i "%DISMLogDriveLetter%"=="D:" goto "CheckExistDISMOfflineLog"
if /i "%DISMLogDriveLetter%"=="E:" goto "CheckExistDISMOfflineLog"
if /i "%DISMLogDriveLetter%"=="F:" goto "CheckExistDISMOfflineLog"
if /i "%DISMLogDriveLetter%"=="G:" goto "CheckExistDISMOfflineLog"
if /i "%DISMLogDriveLetter%"=="H:" goto "CheckExistDISMOfflineLog"
if /i "%DISMLogDriveLetter%"=="I:" goto "CheckExistDISMOfflineLog"
if /i "%DISMLogDriveLetter%"=="J:" goto "CheckExistDISMOfflineLog"
if /i "%DISMLogDriveLetter%"=="K:" goto "CheckExistDISMOfflineLog"
if /i "%DISMLogDriveLetter%"=="L:" goto "CheckExistDISMOfflineLog"
if /i "%DISMLogDriveLetter%"=="M:" goto "CheckExistDISMOfflineLog"
if /i "%DISMLogDriveLetter%"=="N:" goto "CheckExistDISMOfflineLog"
if /i "%DISMLogDriveLetter%"=="O:" goto "CheckExistDISMOfflineLog"
if /i "%DISMLogDriveLetter%"=="P:" goto "CheckExistDISMOfflineLog"
if /i "%DISMLogDriveLetter%"=="Q:" goto "CheckExistDISMOfflineLog"
if /i "%DISMLogDriveLetter%"=="R:" goto "CheckExistDISMOfflineLog"
if /i "%DISMLogDriveLetter%"=="S:" goto "CheckExistDISMOfflineLog"
if /i "%DISMLogDriveLetter%"=="T:" goto "CheckExistDISMOfflineLog"
if /i "%DISMLogDriveLetter%"=="U:" goto "CheckExistDISMOfflineLog"
if /i "%DISMLogDriveLetter%"=="V:" goto "CheckExistDISMOfflineLog"
if /i "%DISMLogDriveLetter%"=="W:" goto "CheckExistDISMOfflineLog"
if /i "%DISMLogDriveLetter%"=="X:" goto "CheckExistDISMOfflineLog"
if /i "%DISMLogDriveLetter%"=="Y:" goto "CheckExistDISMOfflineLog"
if /i "%DISMLogDriveLetter%"=="Z:" goto "CheckExistDISMOfflineLog"
echo Invalid syntax!
goto "DISMLogDriveLetter"

:"CheckExistDISMOnlineLog"
if not exist "%windir%\Logs\DISM\dism.log" goto "DISMOnlineLogNotExist"
"%windir%\notepad.exe" "%windir%\Logs\DISM\dism.log"
if not "%errorlevel%"=="0" goto "ErrorDISMLog"
goto "Start"

:"DISMOnlineLogNotExist"
echo DISM log file ("%windir%\Logs\DISM\dism.log") does not exist!
goto "Start"

:"CheckExistDISMOfflineLog"
if not exist "%DISMLogDriveLetter%\Windows\Logs\DISM\dism.log" goto "DISMOfflineLogNotExist"
"%windir%\notepad.exe" "%DISMLogDriveLetter%\Windows\Logs\DISM\dism.log"
if not "%errorlevel%"=="0" goto "ErrorDISMLog"
goto "Start"

:"DISMOfflineLogNotExist"
echo DISM log file ("%DISMLogDriveLetter%\Windows\Logs\DISM\dism.log") does not exist!
goto "Start"

:"ErrorDISMLog"
echo There has been an error! Please try again.
goto "6"

:"7"
echo.
set OnlineOffline=
set /p OnlineOffline="Are you scanning an online or offline Windows installation? (Online/Offline) "
if /i "%OnlineOffline%"=="Online" goto "ScanNowOnline"
if /i "%OnlineOffline%"=="Offline" goto "ScanNowDriveLetter"
echo Invalid syntax!
goto "7"

:"ScanNowDriveLetter"
echo.
set ScanNowDriveLetter=
set /p ScanNowDriveLetter="What is the drive letter of the offline Windows installation? (A:-Z:) "
if /i "%ScanNowDriveLetter%"=="A:" goto "CheckExistScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="B:" goto "CheckExistScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="C:" goto "CheckExistScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="D:" goto "CheckExistScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="E:" goto "CheckExistScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="F:" goto "CheckExistScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="G:" goto "CheckExistScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="H:" goto "CheckExistScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="I:" goto "CheckExistScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="J:" goto "CheckExistScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="K:" goto "CheckExistScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="L:" goto "CheckExistScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="M:" goto "CheckExistScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="N:" goto "CheckExistScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="O:" goto "CheckExistScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="P:" goto "CheckExistScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="Q:" goto "CheckExistScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="R:" goto "CheckExistScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="S:" goto "CheckExistScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="T:" goto "CheckExistScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="U:" goto "CheckExistScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="V:" goto "CheckExistScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="W:" goto "CheckExistScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="X:" goto "CheckExistScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="Y:" goto "CheckExistScanNowDriveLetter"
if /i "%ScanNowDriveLetter%"=="Z:" goto "CheckExistScanNowDriveLetter"
echo Invalid syntax!
goto "ScanNowDriveLetter"

:"CheckExistScanNowDriveLetter"
if not exist "%ScanNowDriveLetter%" goto "ScanNowDriveLetterNotExist"
if "%ScanNowDriveLetter%"=="%SystemDrive%" goto "ScanNowDriveLetterIsOnline"
if not exist "%ScanNowDriveLetter%\Windows" goto "ScanNowDriveLetterNotWindows"
goto "ScanNowOffline"

:"ScanNowDriveLetterNotExist"
echo "%ScanNowDriveLetter%" does not exist.
goto "ScanNowDriveLetter"

:"ScanNowDriveLetterIsOnline"
echo "%ScanNowDriveLetter%" is an online Windows installation!
goto "7"

:"ScanNowDriveLetterNotWindows"
echo "%ScanNowDriveLetter%" is not an offline WIndows installation!
goto "ScanNowDriveLetter"

:"ScanNowOnline"
echo.
echo Scanning Windows installation "%SystemDrive%".
"%windir%\System32\sfc.exe" /scannow
if not "%errorlevel%"=="0" goto "7"
echo Windows installation "%SystemDrive%" scanned.
goto "Start"

:"ScanNowOffline"
echo.
echo Scanning Windows installation "%ScanNowDriveLetter%".
if not exist "%ScanNowDriveLetter%\Windows\Logs\CBS" md "%ScanNowDriveLetter%\Windows\Logs\CBS" > nul 2>&1
"%windir%\System32\sfc.exe" /scannow /offbootdir="%ScanNowDriveLetter%" /offwindir="%ScanNowDriveLetter%\Windows" /offlogfile="%ScanNowDriveLetter%\Windows\Logs\CBS\CBS.log"
if not "%errorlevel%"=="0" goto "7"
echo Windows installation "%ScanNowDriveLetter%" scanned.
goto "Start"

:"8"
echo.
set OnlineOffline=
set /p OnlineOffline="Are you verifying an online or offline Windows installation? (Online/Offline) "
if /i "%OnlineOffline%"=="Online" goto "VerifyOnlyOnline"
if /i "%OnlineOffline%"=="Offline" goto "VerifyOnlyDriveLetter"
echo Invalid syntax!
goto "8"

:"VerifyOnlyDriveLetter"
echo.
set VerifyOnlyDriveLetter=
set /p VerifyOnlyDriveLetter="What is the drive letter of the offline Windows installation? (A:-Z:) "
if /i "%VerifyOnlyDriveLetter%"=="A:" goto "CheckExistVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="B:" goto "CheckExistVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="C:" goto "CheckExistVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="D:" goto "CheckExistVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="E:" goto "CheckExistVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="F:" goto "CheckExistVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="G:" goto "CheckExistVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="H:" goto "CheckExistVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="I:" goto "CheckExistVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="J:" goto "CheckExistVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="K:" goto "CheckExistVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="L:" goto "CheckExistVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="M:" goto "CheckExistVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="N:" goto "CheckExistVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="O:" goto "CheckExistVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="P:" goto "CheckExistVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="Q:" goto "CheckExistVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="R:" goto "CheckExistVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="S:" goto "CheckExistVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="T:" goto "CheckExistVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="U:" goto "CheckExistVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="V:" goto "CheckExistVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="W:" goto "CheckExistVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="X:" goto "CheckExistVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="Y:" goto "CheckExistVerifyOnlyDriveLetter"
if /i "%VerifyOnlyDriveLetter%"=="Z:" goto "CheckExistVerifyOnlyDriveLetter"
echo Invalid syntax!
goto "VerifyOnlyDriveLetter"

:"CheckExistVerifyOnlyDriveLetter"
if not exist "%VerifyOnlyDriveLetter%" goto "VerifyOnlyDriveLetterNotExist"
if "%VerifyOnlyDriveLetter%"=="%SystemDrive%" goto "VerifyOnlyDriveLetterIsOnline"
if not exist "%VerifyOnlyDriveLetter%\Windows" goto "VerfiyOnlyDriveLetterNotWindows"
goto "VerifyOnlyOffline"

:"VerifyOnlyDriveLetterNotExist"
echo "%VerifyOnlyDriveLetterNotExist%" does not exist!
goto "VerifyOnlyDriveLetter"

:"VerifyOnlyDriveLetterIsOnline"
echo "%VerifyOnlyDriveLetter%" is an online Windows installation!
goto "8"

:"VerfiyOnlyDriveLetterNotWindows"
echo "%VerifyOnlyDriveLetter%" is not an offline WIndows installation!
goto "VerifyOnlyDriveLetter"

:"VerifyOnlyOnline"
echo.
echo Verifing Windows installtion "%SystemDrive%".
"%windir%\System32\sfc.exe" /verifyonly
if not "%errorlevel%"=="0" goto "8"
echo Windows installation "%SystemDrive%" verified.
goto "Start"

:"VerifyOnlyOffline"
echo.
echo Verifing Windows installtion "%VerifyOnlyDriveLetter%".
if not exist "%VerifyOnlyDriveLetter%\Windows\Logs\CBS" md "%VerifyOnlyDriveLetter%\Windows\Logs\CBS" > nul 2>&1
"%windir%\System32\sfc.exe" /verifyonly /offbootdir="%VerifyOnlyDriveLetter%" /offwindir="%VerifyOnlyDriveLetter%\Windows" /offlogfile="%VerifyOnlyDriveLetter%\Windows\Logs\CBS\CBS.log"
if not "%errorlevel%"=="0" goto "8"
echo Windows installation "%VerifyOnlyDriveLetter%" verified.
goto "Start"

:"9"
echo.
set OnlineOffline=
set /p OnlineOffline="Are you scanning an online or offline Windows installation file? (Online/Offline) "
if /i "%OnlineOffline%"=="Online" goto "ScanFileFile"
if /i "%OnlineOffline%"=="Offline" goto "ScanFileFile"
echo Invalid syntax!
goto "9"

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
if /i "%ScanFileDriveLetter%"=="A:" goto "CheckExistScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="B:" goto "CheckExistScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="C:" goto "CheckExistScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="D:" goto "CheckExistScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="E:" goto "CheckExistScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="F:" goto "CheckExistScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="G:" goto "CheckExistScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="H:" goto "CheckExistScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="I:" goto "CheckExistScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="J:" goto "CheckExistScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="K:" goto "CheckExistScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="L:" goto "CheckExistScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="M:" goto "CheckExistScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="N:" goto "CheckExistScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="O:" goto "CheckExistScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="P:" goto "CheckExistScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="Q:" goto "CheckExistScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="R:" goto "CheckExistScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="S:" goto "CheckExistScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="T:" goto "CheckExistScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="U:" goto "CheckExistScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="V:" goto "CheckExistScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="W:" goto "CheckExistScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="X:" goto "CheckExistScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="Y:" goto "CheckExistScanFileDriveLetter"
if /i "%ScanFileDriveLetter%"=="Z:" goto "CheckExistScanFileDriveLetter"
echo Invalid syntax!
goto "ScanFileDriveLetter"

:"CheckExistScanFileDriveLetter"
if not exist "%ScanFileDriveLetter%" goto "ScanFileDriveLetterNotExist"
if "%ScanFileDriveLetter%"=="%SystemDrive%" goto "ScanFileDriveLetterIsOnline"
if not exist "%ScanFileDriveLetter%\Windows" goto "ScanFileDriveLetterNotWindows"
goto "ScanFileOffline"

:"ScanFileDriveLetterNotExist"
echo "%ScanFileDriveLetterNotExist%" does not exist!
goto "ScanFileDriveLetter"

:"ScanFileDriveLetterIsOnline"
echo "%ScanFileDriveLetter%" is an online Windows installation!
goto "9"

:"ScanFileDriveLetterNotWindows"
echo "%ScanFileDriveLetter%" is not an offline WIndows installation!
goto "ScanFileDriveLetter"

:"ScanFileOnline"
echo.
echo Scanning file "%File%".
"%windir%\System32\sfc.exe" /scannfile="%File%"
if not "%errorlevel%"=="0" goto "9"
echo File "%File%" scanned.
goto "Start"

:"ScanFileOffline"
echo.
echo Scanning file "%File%".
if not exist "%ScanFileDriveLetter%\Windows\Logs\CBS" md "%ScanFileDriveLetter%\Windows\Logs\CBS" > nul 2>&1
"%windir%\System32\sfc.exe" /scannfile="%File%" /offbootdir="%ScanFileDriveLetter%" /offwindir="%ScanFileDriveLetter%\Windows" /offlogfile="%ScanFileDriveLetter%\Windows\Logs\CBS\CBS.log"
if not "%errorlevel%"=="0" goto "9"
echo File "%File%" scanned.
goto "Start"

:"10"
echo.
set OnlineOffline=
set /p OnlineOffline="Are you verifying an online or offline Windows installation file? (Online/Offline) "
if /i "%OnlineOffline%"=="Online" goto "VerifyFileFile"
if /i "%OnlineOffline%"=="Offline" goto "VerifyFileFile"
echo Invalid syntax!
goto "10"

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
if "%VerifyFileDriveLetter%"=="%SystemDrive%" goto "VerifyFileDriveLetterIsOnline"
if not exist "%VerifyFileDriveLetter%\Windows" goto "VerifyFileDriveLetterNotWindows"
goto "VerifyFileOffline"

:"VerifyFileDriveLetterNotExist"
echo "%VerifyFileDriveLetterNotExist%" does not exist!
goto "VerifyFileDriveLetter"

:"VerifyFileDriveLetterIsOnline"
echo "%VerifyFileDriveLetter%" is an online Windows installation!
goto "10"

:"VerifyFileDriveLetterNotWindows"
echo "%VerifyFileDriveLetter%" is not an offline WIndows installation!
goto "VerifyFileDriveLetter"

:"VerifyFileOnline"
echo.
echo Verifying file "%File%".
"%windir%\System32\sfc.exe" /verifyfile="%File%"
if not "%errorlevel%"=="0" goto "10"
echo File "%File%" verified.
goto "Start"

:"VerifyFileOffline"
echo.
echo Verifying file "%File%".
if not exist "%VerifyFileDriveLetter%\Windows\Logs\CBS" md "%VerifyFileDriveLetter%\Windows\Logs\CBS" > nul 2>&1
"%windir%\System32\sfc.exe" /verifyfile="%File%" /offbootdir="%VerifyFileDriveLetter%" /offwindir="%VerifyFileDriveLetter%\Windows" /offlogfile="%VerifyFileDriveLetter%\Windows\Logs\CBS\CBS.log"
if not "%errorlevel%"=="0" goto "10"
echo File "%File%" verified.
goto "Start"

:"11"
echo.
set OnlineOffline=
set /p OnlineOffline="Are you viewings the logs of an online or offline Windows installation? (Online/Offline) "
if /i "%OnlineOffline%"=="Online" goto "CheckExistSFCOnlineLog"
if /i "%OnlineOffline%"=="Offline" goto "SFCLogDriveLetter"
echo Invalid syntax!
goto "11"

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

:"CheckExistSFCOnlineLog"
if not exist "%windir%\Logs\CBS\CBS.log" goto "SFCOnlineLogNotExist"
"%windir%\notepad.exe" "%windir%\Logs\CBS\CBS.log"
if not "%errorlevel%"=="0" goto "ErrorSFCLog"
goto "Start"

:"SFCOnlineLogNotExist"
echo SFC log file ("%windir%\Logs\CBS\CBS.log") does not exist!
goto "Start"

:"CheckExistSFCOfflineLog"
if not exist "%SFCLogDriveLetter%\Windows\Logs\CBS\CBS.log" goto "SFCOfflineLogNotExist"
"%windir%\notepad.exe" "%SFCLogDriveLetter%\Windows\Logs\CBS\CBS.log"
if not "%errorlevel%"=="0" goto "ErrorSFCLog"
goto "Start"

:"SFCOfflineLogNotExist"
echo SFC log file ("%SFCLogDriveLetter%\Windows\Logs\CBS\CBS.log") does not exist!
goto "Start"

:"ErrorSFCLog"
echo There has been an error! Please try again.
goto "11"

:"Done"
endlocal
exit
