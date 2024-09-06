@echo off
setlocal
title Windows Corruption Fixer
echo Program Name: Windows Corruption Fixer
echo Version: 8.0.0
echo Developer: @YonatanReuvenIsraeli
echo Website: https://www.yonatanreuvenisraeli.dev
echo License: GNU General Public License v3.0
net session > nul 2>&1
if not "%errorlevel%"=="0" goto "NotAdministrator"
goto "Start"

:"NotAdministrator"
echo.
echo Please run this batch file as an administrator. Press any key to close this batch file.
pause > nul 2>&1
goto "Done"

:"Start"
echo.
echo [1] Check Disk
echo [2] DISM Check Health
echo [3] DISM Scan Health
echo [4] DISM Restore Health
echo [5] View DISM Logs
echo [6] SFC Scan Now
echo [7] SFC Verify Only
echo [8] SFC Scan File
echo [9] SFC Verify File
echo [10] View SFC Logs
echo [11] Close
echo.
set Input=
set /p Input="Which one do you want to do? (1-11) "
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
if /i "%Input%"=="11" goto "Done"
echo Invalid syntax
goto "Start"

:"1"
echo.
set DriveLetter=
set /p DriveLetter="Which drive do you want to run Check Disk on? (A:-Z:) "
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
set /p SureDriveLetter="Are you sure %DriveLetter% is the drive letter that you want to run Check Disk on? (Yes/No) "
if /i "%SureDriveLetter%"=="Yes" goto "CHKDSK"
if /i "%SureDriveLetter%"=="No" goto "DriveLetter"
echo Invalid syntax!
goto "SureDriveLetterCHKDSK"

:"CHKDSK"
chkdsk "%DriveLetter%" /f /r
goto "Start"

:"2"
echo.
set OnlineOffline=
set /p OnlineOffline="Are you repairing an online or offline Windows installation? (Online/Offline) "
if /i "%OnlineOffline%"=="Online" goto "CheckOnline"
if /i "%OnlineOffline%"=="Offline" goto "InstallationCheck"
echo Invalid syntax
goto "2"

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
goto "InstallationCheck"

:"SureInstallationCheck"
echo.
set SureInstallationCheck=
set /p SureInstallationCheck="Are you sure "%DriveLetter%" is the drive letter of your offline Winddows installation? (Yes/No) "
if /i "%SureInstallationCheck%"=="Yes" goto "CheckExistInstallationCheck"
if /i "%SureInstallationCheck%"=="No" goto "InstallationCheck"
echo Invalid syntax!
goto "SureInstallationCheck"

:"CheckExistInstallationCheck"
if not exist "%InstallationCheck%" goto "NotExistCheck"
goto "CheckOffline"

:"NotExistCheck"
echo "%InstallationCheck%" does not exist. Please try again.
goto "InstallationCheck"

:"CheckOnline"
DISM /Online /Cleanup-Image /CheckHealth
goto "Start"

:"CheckOffline"
DISM /Image:"%InstallationCheck%" /Cleanup-Image /CheckHealth
goto "Start"

:"3"
echo.
set OnlineOffline=
set /p OnlineOffline="Are you repairing an online or offline Windows installation? (Online/Offline) "
if /i "%OnlineOffline%"=="Online" goto "ScanOnline"
if /i "%OnlineOffline%"=="Offline" goto "InstallationScan"
echo Invalid syntax
goto "3"

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
goto "InstallationScan"

:"SureSureInstallationScan"
echo.
set SureInstallationScan=
set /p SureInstallationCheck="Are you sure "%DriveLetter%" is the drive letter of your offline Winddows installation? (Yes/No) "
if /i "%SureInstallationScan%"=="Yes" goto "CheckExistInstallationScan"
if /i "%SureInstallationScan%"=="No" goto "InstallationScan"
echo Invalid syntax!
goto "SureInstallationScan"

:"CheckExistInstallationScan"
if not exist "%InstallationScan%" goto "NotExistScan"
goto "ScanOffline"

:"NotExistCheck"
echo "%InstallationScan%" does not exist. Please try again.
goto "InstallationCScan"

:"ScanOnline"
DISM /Online /Cleanup-Image /ScanHealth
goto "Start"

:"ScanOffline"
DISM /Image:"%%" /Cleanup-Image /ScanHealth
goto "Start"

:"4"
echo.
set OnlineOffline=
set /p OnlineOffline="Are you repairing an online or offline Windows installation? (Online/Offline) "
if /i "%OnlineOffline%"=="Online" goto "UpdateOnline"
if /i "%OnlineOffline%"=="Offline" goto "UpdateOffline"
echo Invalid syntax
goto "4"

:"UpdateOnline"
echo.
set /p Update="Do you want to use Windows Update? (Yes/No) "
if /i "%Update%"=="Yes" goto "MediaOnline"
if /i "%Update%"=="No" goto "MediaOnline"
echo Invalid Sytax!
goto "UpdateOnline"

:"MediaOnline"
echo.
set Media=
set /p Media="Do you want to use a Windows Disk Image? (Yes/No) "
if /i "%Media%"=="Yes" goto "DriveLetterOnline"
if /i "%Media%"=="No" goto "DISMUpdateCheckOnline"
echo Invalid Sytax!
goto "MediaOnline"

:"DriveLetterOnline"
echo.
set DriveLetter=
set /p DriveLetter="What is your drive letter of your Windows Disk Image? (A:-Z:) "
if /i "%DriveLetter%"=="A:" goto "SureDriveLetterDISMOnline"
if /i "%DriveLetter%"=="B:" goto "SureDriveLetterDISMOnline"
if /i "%DriveLetter%"=="C:" goto "SureDriveLetterDISMOnline"
if /i "%DriveLetter%"=="D:" goto "SureDriveLetterDISMOnline"
if /i "%DriveLetter%"=="E:" goto "SureDriveLetterDISMOnline"
if /i "%DriveLetter%"=="F:" goto "SureDriveLetterDISMOnline"
if /i "%DriveLetter%"=="G:" goto "SureDriveLetterDISMOnline"
if /i "%DriveLetter%"=="H:" goto "SureDriveLetterDISMOnline"
if /i "%DriveLetter%"=="I:" goto "SureDriveLetterDISMOnline"
if /i "%DriveLetter%"=="J:" goto "SureDriveLetterDISMOnline"
if /i "%DriveLetter%"=="K:" goto "SureDriveLetterDISMOnline"
if /i "%DriveLetter%"=="L:" goto "SureDriveLetterDISMOnline"
if /i "%DriveLetter%"=="M:" goto "SureDriveLetterDISMOnline"
if /i "%DriveLetter%"=="N:" goto "SureDriveLetterDISMOnline"
if /i "%DriveLetter%"=="O:" goto "SureDriveLetterDISMOnline"
if /i "%DriveLetter%"=="P:" goto "SureDriveLetterDISMOnline"
if /i "%DriveLetter%"=="Q:" goto "SureDriveLetterDISMOnline"
if /i "%DriveLetter%"=="R:" goto "SureDriveLetterDISMOnline"
if /i "%DriveLetter%"=="S:" goto "SureDriveLetterDISMOnline"
if /i "%DriveLetter%"=="T:" goto "SureDriveLetterDISMOnline"
if /i "%DriveLetter%"=="U:" goto "SureDriveLetterDISMOnline"
if /i "%DriveLetter%"=="V:" goto "SureDriveLetterDISMOnline"
if /i "%DriveLetter%"=="W:" goto "SureDriveLetterDISMOnline"
if /i "%DriveLetter%"=="X:" goto "SureDriveLetterDISMOnline"
if /i "%DriveLetter%"=="Y:" goto "SureDriveLetterDISMOnline"
if /i "%DriveLetter%"=="Z:" goto "SureDriveLetterDISMOnline"
echo Invalid syntax!
goto "DriveLetterOnline"

:"SureDriveLetterDISMOnline"
echo.
set SureDriveLetter=
set /p SureDriveLetter="Are you sure "%DriveLetter%" is the drive letter of your Windows Disk Image? (Yes/No) "
if /i "%SureDriveLetter%"=="Yes" goto "CheckExistDriveLetterOnline"
if /i "%SureDriveLetter%"=="No" goto "DriveLetterOnline"
echo Invalid syntax!
goto "SureDriveLetterDISMOnline"

:"CheckExistDriveLetterOnline"
if not exist "%DriveLetter%" goto "NotExistOnline"
goto "BitDetectionOnline"

:"NotExistOnline"
echo "%DriveLetter%" does not exist. Please try again.
goto "DriveLetterOnline"

:"BitDetectionOnline"
if exist "%DriveLetter%\sources" goto "ESDSWMWIMOnline"
if exist "%DriveLetter%\x86\sources" goto "Bit1Online"
if exist "%DriveLetter%\x64\sources" goto "Bit1Online"
echo Invalid drive letter!
goto "DriveLetterOnline"

:"Bit1Online"
echo.
set Bit=
set /p Bit="Do you have a 32-bit or 64-bit version of Windows? (32/64) "
if /i "%Bit%"=="32" goto "SureBitOnline"
if /i "%Bit%"=="64" goto "SureBitOnline"
echo Invalid syntax!
goto "Bit1Online"

:"SureBitOnline"
echo.
set SureBit=
set /p SureBit="Are you sure you have a %Bit%-bit version of Windows? "
if /i "%SureBit%"=="Yes" goto "Bit2Online"
if /i "%SureBit%"=="No" goto "Bit1Online"
echo Invalid syntax!
goto "SureBitOffline"

:"Bit2Online"
if /i "%Bit%"=="32" goto "32ESDSWMWIMOnline"
if /i "%Bit%"=="64" goto "64ESDSWMWIMOnline"

:"ESDSWMWIMOnline"
if exist "%DriveLetter%\sources\install.esd" set Install=install.esd
if exist "%DriveLetter%\sources\install.swm" set Install=install.swm
if exist "%DriveLetter%\sources\install.wim" set Install=install.wim
goto "DISMOOnline"

:"32ESDSWMWIMOnline"
if exist "%DriveLetter%\x86\sources\install.esd" set Install=install.esd
if exist "%DriveLetter%\x86\sources\install.swm" set Install=install.swm
if exist "%DriveLetter%\x86\sources\install.wim" set Install=install.wim
goto "32DISMOnline"

:"64ESDSWMWIMOnline"
if exist "%DriveLetter%\x64\sources\install.esd" set Install=install.esd
if exist "%DriveLetter%\x64\sources\install.swm" set Install=install.swm
if exist "%DriveLetter%\x64\sources\install.wim" set Install=install.wim
goto "64DISMOnline"

:"DISMOnline"
DISM /Get-WimInfo /WimFile:"%DriveLetter%\sources\%Install%"
if not "%errorlevel%"=="0" goto "DriveLetterOnline"
goto "Index:"32DISMOnline"

:"32DISMOnline"
DISM /Get-WimInfo /WimFile:"%DriveLetter%\x86\sources\%Install%"
if not "%errorlevel%"=="0" goto "DriveLetterOnline"
goto "IndexOnline"

:"64DISMOnline"
DISM /Get-WimInfo /WimFile:"%DriveLetter%\x64\sources\%Install%"
if not "%errorlevel%"=="0" goto "DriveLetterOnline"
goto "IndexOnline"

:"IndexOnline"
echo.
set Index=
set /p Index="Which one do you have on your PC? (1-7/11)? "
if /i "%Index%"=="1" goto "SureIndexOnline"
if /i "%Index%"=="2" goto "SureIndexOnline"
if /i "%Index%"=="3" goto "SureIndexOnline"
if /i "%Index%"=="4" goto "SureIndexOnline"
if /i "%Index%"=="5" goto "SureIndexOnline"
if /i "%Index%"=="6" goto "SureIndexOnline"
if /i "%Index%"=="7" goto "SureIndexOnline"
if /i "%Index%"=="8" goto "SureIndexOnline"
if /i "%Index%"=="9" goto "SureIndexOnline"
if /i "%Index%"=="10" goto "SureIndexOnline"
if /i "%Index%"=="11" goto "SureIndexOnline
echo Invalid syntax!
goto "IndexOnline"

:"SureIndexOnline"
echo.
set IndexNumber=
set /p IndexNumber="Are you sure you want Index %Index%? (Yes/No) "
if /i "%IndexNumber%"=="Yes" goto "Bit3Online"
if /i "%IndexNumber%"=="No" goto "IndexOnline"
goto "SureIndexOnline"

:"Bit3Offline"
if /i "%Bit%"=="32" goto "32DISMInstallUpdateCheckOnline"
if /i "%Bit%"=="64" goto "64DISMInstallUpdateCheckOnline"
goto "DISMInstallUpdateCheckOnline"

:"DISMUpdateCheckOffline"
if /i "%Update%"=="Yes" goto "DISMNoUpdateOnline"
if /i "%Update%"=="No" goto "DISMOnline"

:"DISMOnline"
DISM /Online /Cleanup-Image /RestoreHealth
goto "Start"

:"DISMNoUpdateOnline"
DISM /Online /Cleanup-Image /RestoreHealth /LimitAccess
goto "Start"

:"DISMUpdateCheckOnline"
if /i "%Update%"=="Yes" goto "DISMNoUpdateOnline"
if /i "%Update%"=="No" goto "DISMOnline"

:"DISMOnline"
DISM /Online /Cleanup-Image /RestoreHealth /Source:"%DriveLetter%:\Sources\%Install%":%Index%
goto "Start"

:"DISMNoUpdateOnline"
DISM /Online /Cleanup-Image /RestoreHealth /Source:"%DriveLetter%:\Sources\%Install%":%Index% /LimitAccess
goto "Start"

:"32DISMUpdateCheckOnline"
if /i "%Update%"=="Yes" goto "32DISMNoUpdateOnline"
if /i "%Update%"=="No" goto "32DISMOnline"

:"32DISMOnline"
DISM /Online /Cleanup-Image /RestoreHealth /Source:"%DriveLetter%:\x86\Sources\%Install%":%Index%
goto "Start"

:"32DISMNoUpdateOffline"
DISM /Online /Cleanup-Image /RestoreHealth /Source:"%DriveLetter%:\x86\Sources\%Install%":%Index% /LimitAccess
goto "Start"

:"64DISMUpdateCheckOnline"
if /i "%Update%"=="Yes" goto "64DISMNoUpdateOnline"
if /i "%Update%"=="No" goto "64DISMOnline"

:"64DISMOnline"
DISM /Online /Cleanup-Image /RestoreHealth /Source:"%DriveLetter%:\x64\Sources\%Install%":%Index%
goto "Start"

:"64DISMNoUpdateOnline"
DISM /Online /Cleanup-Image /RestoreHealth /Source:"%DriveLetter%:\x64\Sources\%Install%":%Index% /LimitAccess
goto "Start"

:"UpdateOffline"
echo.
set /p Update="Do you want to use Windows Update? (Yes/No) "
if /i "%Update%"=="Yes" goto "MediaOffline"
if /i "%Update%"=="No" goto "MediaOffline"
echo Invalid Sytax!
goto "UpdateOffline"

:"MediaOffline"
echo.
set Media=
set /p Media="Do you want to use a Windows Disk Image? (Yes/No) "
if /i "%Media%"=="Yes" goto "OfflineInstallationRestore"
if /i "%Media%"=="No" goto "DISMUpdateCheckOffline"
echo Invalid Sytax!
goto "MediaOffline"

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
goto "InstallationRestore"

:"SureInstallationRestore"
echo.
set SureInstallationRestore=
set /p SureInstallationRestore="Are you sure "%DriveLetter%" is the drive letter of your offline Winddows installation? (Yes/No) "
if /i "%SureInstallationRestore%"=="Yes" goto "CheckExistInstallationRestore"
if /i "%SureInstallationRestore%"=="No" goto "InstallationRestore"
echo Invalid syntax!
goto "SureInstallationRestore"

:"CheckExistInstallationRestore"
if not exist "%OfflineInstallation%" goto "NotExistRestore"
goto "DriveLetterOffline"

:"NotExistRestore"
echo "%OfflineInstallation%" does not exist. Please try again.
goto "InstallationRestore"

:"DriveLetterOffline"
echo.
set DriveLetter=
set /p DriveLetter="What is your drive letter of your Windows Disk Image? (A:-Z:) "
if /i "%DriveLetter%"=="A:" goto "SureDriveLetterDISMOffline"
if /i "%DriveLetter%"=="B:" goto "SureDriveLetterDISMOffline"
if /i "%DriveLetter%"=="C:" goto "SureDriveLetterDISMOffline"
if /i "%DriveLetter%"=="D:" goto "SureDriveLetterDISMOffline"
if /i "%DriveLetter%"=="E:" goto "SureDriveLetterDISMOffline"
if /i "%DriveLetter%"=="F:" goto "SureDriveLetterDISMOffline"
if /i "%DriveLetter%"=="G:" goto "SureDriveLetterDISMOffline"
if /i "%DriveLetter%"=="H:" goto "SureDriveLetterDISMOffline"
if /i "%DriveLetter%"=="I:" goto "SureDriveLetterDISMOffline"
if /i "%DriveLetter%"=="J:" goto "SureDriveLetterDISMOffline"
if /i "%DriveLetter%"=="K:" goto "SureDriveLetterDISMOffline"
if /i "%DriveLetter%"=="L:" goto "SureDriveLetterDISMOffline"
if /i "%DriveLetter%"=="M:" goto "SureDriveLetterDISMOffline"
if /i "%DriveLetter%"=="N:" goto "SureDriveLetterDISMOffline"
if /i "%DriveLetter%"=="O:" goto "SureDriveLetterDISMOffline"
if /i "%DriveLetter%"=="P:" goto "SureDriveLetterDISMOffline"
if /i "%DriveLetter%"=="Q:" goto "SureDriveLetterDISMOffline"
if /i "%DriveLetter%"=="R:" goto "SureDriveLetterDISMOffline"
if /i "%DriveLetter%"=="S:" goto "SureDriveLetterDISMOffline"
if /i "%DriveLetter%"=="T:" goto "SureDriveLetterDISMOffline"
if /i "%DriveLetter%"=="U:" goto "SureDriveLetterDISMOffline"
if /i "%DriveLetter%"=="V:" goto "SureDriveLetterDISMOffline"
if /i "%DriveLetter%"=="W:" goto "SureDriveLetterDISMOffline"
if /i "%DriveLetter%"=="X:" goto "SureDriveLetterDISMOffline"
if /i "%DriveLetter%"=="Y:" goto "SureDriveLetterDISMOffline"
if /i "%DriveLetter%"=="Z:" goto "SureDriveLetterDISMOffline"
echo Invalid syntax!
goto "DriveLetterOffline"

:"SureDriveLetterDISMOffline"
echo.
set SureDriveLetter=
set /p SureDriveLetter="Are you sure "%DriveLetter%" is the drive letter of your Windows Disk Image? (Yes/No) "
if /i "%SureDriveLetter%"=="Yes" goto "CheckExistDriveLetterOffline"
if /i "%SureDriveLetter%"=="No" goto "DriveLetterOffline"
echo Invalid syntax!
goto "SureDriveLetterDISMOffline"

:"CheckExistDriveLetterOffline"
if not exist "%DriveLetter%" goto "NotExistOffline"
goto "BitDetectionOffline"

:"NotExistOffline"
echo "%DriveLetter%" does not exist. Please try again.
goto "DriveLetterOffline"

:"BitDetectionOffline"
if exist "%DriveLetter%\sources" goto "ESDSWMWIMOffline"
if exist "%DriveLetter%\x86\sources" goto "Bit1Offline"
if exist "%DriveLetter%\x64\sources" goto "Bit1Offline"
echo Invalid drive letter!
goto "DriveLetterOffline"

:"Bit1Offline"
echo.
set Bit=
set /p Bit="Do you have a 32-bit or 64-bit version of Windows? (32/64) "
if /i "%Bit%"=="32" goto "SureBitOffline"
if /i "%Bit%"=="64" goto "SureBitOffline"
echo Invalid syntax!
goto "Bit1Offline"

:"SureBitOffline"
echo.
set SureBit=
set /p SureBit="Are you sure you have a %Bit%-bit version of Windows? "
if /i "%SureBit%"=="Yes" goto "Bit2Offline"
if /i "%SureBit%"=="No" goto "Bit1Offline"
echo Invalid syntax!
goto "SureBitOffline"

:"Bit2Offline"
if /i "%Bit%"=="32" goto "32ESDSWMWIMOffline"
if /i "%Bit%"=="64" goto "64ESDSWMWIMOffline"

:"ESDSWMWIMOffline"
if exist "%DriveLetter%\sources\install.esd" set Install=install.esd
if exist "%DriveLetter%\sources\install.swm" set Install=install.swm
if exist "%DriveLetter%\sources\install.wim" set Install=install.wim
goto "DISMOffline"

:"32ESDSWMWIMOffline"
if exist "%DriveLetter%\x86\sources\install.esd" set Install=install.esd
if exist "%DriveLetter%\x86\sources\install.swm" set Install=install.swm
if exist "%DriveLetter%\x86\sources\install.wim" set Install=install.wim
goto "32DISMOffline"

:"64ESDSWMWIMOffline"
if exist "%DriveLetter%\x64\sources\install.esd" set Install=install.esd
if exist "%DriveLetter%\x64\sources\install.swm" set Install=install.swm
if exist "%DriveLetter%\x64\sources\install.wim" set Install=install.wim
goto "64DISMOffline"

:"DISMOffline"
DISM /Get-WimInfo /WimFile:"%DriveLetter%\sources\%Install%"
if not "%errorlevel%"=="0" goto "DriveLetterOffline"
goto "IndexOffline"

:"32DISMOffline"
DISM /Get-WimInfo /WimFile:"%DriveLetter%\x86\sources\%Install%"
if not "%errorlevel%"=="0" goto "DriveLetterOffline"
goto "IndexOffline"

:"64DISMOffline"
DISM /Get-WimInfo /WimFile:"%DriveLetter%\x64\sources\%Install%"
if not "%errorlevel%"=="0" goto "DriveLetterOffline"
goto "IndexOffline"

:"IndexOffline"
echo.
set Index=
set /p Index="Which one do you have on your PC? (1-7/11)? "
if /i "%Index%"=="1" goto "SureIndexOffline"
if /i "%Index%"=="2" goto "SureIndexOffline"
if /i "%Index%"=="3" goto "SureIndexOffline"
if /i "%Index%"=="4" goto "SureIndexOffline"
if /i "%Index%"=="5" goto "SureIndexOffline"
if /i "%Index%"=="6" goto "SureIndexOffline"
if /i "%Index%"=="7" goto "SureIndexOffline"
if /i "%Index%"=="8" goto "SureIndexOffline"
if /i "%Index%"=="9" goto "SureIndexOffline"
if /i "%Index%"=="10" goto "SureIndexOffline"
if /i "%Index%"=="11" goto "SureIndexOffline"
echo Invalid syntax!
goto "IndexOffline"

:"SureIndexOffline"
echo.
set IndexNumber=
set /p IndexNumber="Are you sure you want Index %Index%? (Yes/No) "
if /i "%IndexNumber%"=="Yes" goto "Bit3Offline"
if /i "%IndexNumber%"=="No" goto "IndexOffline"
goto "SureIndexOffline"

:"Bit3Offline"
if /i "%Bit%"=="32" goto "32DISMInstallUpdateCheckOffline"
if /i "%Bit%"=="64" goto "64DISMInstallUpdateCheckOffline"
goto "DISMInstallUpdateCheckOffline"

:"DISMUpdateCheckOffline"
if /i "%Update%"=="Yes" goto "DISMNoUpdateOffline"
if /i "%Update%"=="No" goto "DISMOffline"

:"DISMOffline"
DISM /Image:"%OfflineInstallation%" /Cleanup-Image /RestoreHealth
goto "Start"

:"DISMNoUpdateOffline"
DISM /Image:"%OfflineInstallation%" /Cleanup-Image /RestoreHealth /LimitAccess
goto "Start"

:"DISMUpdateCheckOffline"
if /i "%Update%"=="Yes" goto "DISMNoUpdateOffline"
if /i "%Update%"=="No" goto "DISMOffline"

:"DISMOffline"
DISM /Image:"%OfflineInstallation%" /Cleanup-Image /RestoreHealth /Source:"%DriveLetter%:\Sources\%Install%":%Index%
goto "Start"

:"DISMNoUpdateOffline"
DISM /Image:"%OfflineInstallation%" /Cleanup-Image /RestoreHealth /Source:"%DriveLetter%:\Sources\%Install%":%Index% /LimitAccess
goto "Start"

:"32DISMUpdateCheckOffline"
if /i "%Update%"=="Yes" goto "32DISMNoUpdateOffline"
if /i "%Update%"=="No" goto "32DISMOffline"

:"32DISMOffline"
DISM /Image:"%OfflineInstallation%" /Cleanup-Image /RestoreHealth /Source:"%DriveLetter%:\x86\Sources\%Install%":%Index%
goto "Start"

:"32DISMNoUpdateOffline"
DISM /Image:"%OfflineInstallation%" /Cleanup-Image /RestoreHealth /Source:"%DriveLetter%:\x86\Sources\%Install%":%Index% /LimitAccess
goto "Start"

:"64DISMUpdateCheckOffline"
if /i "%Update%"=="Yes" goto "64DISMNoUpdateOffline"
if /i "%Update%"=="No" goto "64DISMOffline"

:"64DISMOffline"
DISM /Image:"%OfflineInstallation%" /Cleanup-Image /RestoreHealth /Source:"%DriveLetter%:\x64\Sources\%Install%":%Index%
goto "Start"

:"64DISMNoUpdateOffline"
DISM /Image:"%OfflineInstallation%" /Cleanup-Image /RestoreHealth /Source:"%DriveLetter%:\x64\Sources\%Install%":%Index% /LimitAccess
goto "Start"

:"5"
"%SystemDrive%\Windows\Logs\DISM\dism.log"
goto "Start"

:"6"
sfc /scannow
goto "Start"

:"7"
sfc /verifyonly
goto "Start"

:"8"
echo.
set DriveLetter=
set /p DriveLetter="What is the drive letter of the Windows installation you are trying to scan file? (A:-Z:) "
if /i "%DriveLetter%"=="A:" goto "CheckExistDriveLetterSFCScanFile"
if /i "%DriveLetter%"=="B:" goto "CheckExistDriveLetterSFCScanFile"
if /i "%DriveLetter%"=="C:" goto "CheckExistDriveLetterSFCScanFile"
if /i "%DriveLetter%"=="D:" goto "CheckExistDriveLetterSFCScanFile"
if /i "%DriveLetter%"=="E:" goto "CheckExistDriveLetterSFCScanFile"
if /i "%DriveLetter%"=="F:" goto "CheckExistDriveLetterSFCScanFile"
if /i "%DriveLetter%"=="G:" goto "CheckExistDriveLetterSFCScanFile"
if /i "%DriveLetter%"=="H:" goto "CheckExistDriveLetterSFCScanFile"
if /i "%DriveLetter%"=="I:" goto "CheckExistDriveLetterSFCScanFile"
if /i "%DriveLetter%"=="J:" goto "CheckExistDriveLetterSFCScanFile"
if /i "%DriveLetter%"=="K:" goto "CheckExistDriveLetterSFCScanFile"
if /i "%DriveLetter%"=="L:" goto "CheckExistDriveLetterSFCScanFile"
if /i "%DriveLetter%"=="M:" goto "CheckExistDriveLetterSFCScanFile"
if /i "%DriveLetter%"=="N:" goto "CheckExistDriveLetterSFCScanFile"
if /i "%DriveLetter%"=="O:" goto "CheckExistDriveLetterSFCScanFile"
if /i "%DriveLetter%"=="P:" goto "CheckExistDriveLetterSFCScanFile"
if /i "%DriveLetter%"=="Q:" goto "CheckExistDriveLetterSFCScanFile"
if /i "%DriveLetter%"=="R:" goto "CheckExistDriveLetterSFCScanFile"
if /i "%DriveLetter%"=="S:" goto "CheckExistDriveLetterSFCScanFile"
if /i "%DriveLetter%"=="T:" goto "CheckExistDriveLetterSFCScanFile"
if /i "%DriveLetter%"=="U:" goto "CheckExistDriveLetterSFCScanFile"
if /i "%DriveLetter%"=="V:" goto "CheckExistDriveLetterSFCScanFile"
if /i "%DriveLetter%"=="W:" goto "CheckExistDriveLetterSFCScanFile"
if /i "%DriveLetter%"=="X:" goto "CheckExistDriveLetterSFCScanFile"
if /i "%DriveLetter%"=="Y:" goto "CheckExistDriveLetterSFCScanFile"
if /i "%DriveLetter%"=="Z:" goto "CheckExistDriveLetterSFCScanFile"
echo Invalid syntax!
goto "8"

:"CheckExistDriveLetterSFCScanFile"
if not exist "%DriveLetter%" goto "DriveLetterSFCScanFileNotExist"
if /i not "%DriveLetter%"=="%SystemDrive%" goto "OfflineSFCScanFilePath"
goto "SFCScanFilePath"

:"SFCScanFilePath"
echo.
set SFCScanFile=
set /p SFCScanFile="What is the full path to the file you want to scan? "
if not exist "%SFCScanFile%" goto "SFCScanFileNotExist"
goto "SFCScanFile"

:"SFCScanFileNotExist"
echo "%SFCScanFile%" does not exist! Please try again.
goto "SFCScanFilePath"

:SFCScanFile
sfc /scanfile="%SFCScanFile%"
goto "Start"

:"DriveLetterSFCScanFileNotExist"
echo "%DriveLetter%" does not exist! Please try again.
goto "8"

:"OfflineSFCScanFilePath"
echo.
set OfflineSFCScanFile=
set /p OfflineSFCScanFile="What is the full path to the file you want to scan? "
if not exist "%OfflineSFCScanFile%" goto "OfflineSFCScanFileNotExist"
goto "OfflineSFCScanFileLog"

:"OfflineSFCScanFileNotExist"
echo "%OfflineSFCScanFile%" does not exist! Please try again.
goto "OfflineSFCScanFilePath"

:"OfflineSFCScanFileLog"
echo.
set OfflineSFCScanLog=
set /p OfflineSFCScanLog="Do you want to set a custom log file location? (Yes/No) "
if /i "%OfflineSFCScanLog%"=="Yes" goto "OfflineSFCScanLogLocation"
if /i "%OfflineSFCScanLog%"=="No" goto "OfflineSFCScanFile"
echo Invalid syntax!
goto "OfflineSFCScanFileLog"

:"OfflineSFCScanFile"
sfc /scanfile="%OfflineSFCScanFile%" /offbootdir="%DriveLetter%" /offwindir="%DriveLetter%\Windows"
goto "Start"

:"OfflineSFCScanLogLocation"
echo.
set OfflineSFCScanLogLocation=
set /p OfflineSFCscanLogLocation="What is the full path to the location you want to save the log file to? "
if not exist "%OfflineSFCScanLogLocation%\nul" goto "OfflineSFCScanLogLocationNotExist"
goto "OfflineSFCScanLogSFCScanFile"

:"OfflineSFCScanLogLocationNotExist"
echo "%OfflineSScanLogLocation%" does not exist! Please try again.
goto "OfflineSFCScanLogLocation"

:"OfflineSFCScanLogSFCScanFile"
sfc /scanfile="%OfflineSFCScanFile%" /offbootdir="%DriveLetter%" /offwindir="%DriveLetter%\Windows" /offlogfile="%OfflineSFCScanLogLocation%"
goto "Start"

:"9"
echo.
set DriveLetter=
set /p DriveLetter="What is the drive letter of the Windows installation you are trying to verify file? (A:-Z:) "
if /i "%DriveLetter%"=="A:" goto "CheckExistDriveLetterSFCVerifyFile"
if /i "%DriveLetter%"=="B:" goto "CheckExistDriveLetterSFCVerifyFile"
if /i "%DriveLetter%"=="C:" goto "CheckExistDriveLetterSFCVerifyFile"
if /i "%DriveLetter%"=="D:" goto "CheckExistDriveLetterSFCVerifyFile"
if /i "%DriveLetter%"=="E:" goto "CheckExistDriveLetterSFCVerifyFile"
if /i "%DriveLetter%"=="F:" goto "CheckExistDriveLetterSFCVerifyFile"
if /i "%DriveLetter%"=="G:" goto "CheckExistDriveLetterSFCVerifyFile"
if /i "%DriveLetter%"=="H:" goto "CheckExistDriveLetterSFCVerifyFile"
if /i "%DriveLetter%"=="I:" goto "CheckExistDriveLetterSFCVerifyFile"
if /i "%DriveLetter%"=="J:" goto "CheckExistDriveLetterSFCVerifyFile"
if /i "%DriveLetter%"=="K:" goto "CheckExistDriveLetterSFCVerifyFile"
if /i "%DriveLetter%"=="L:" goto "CheckExistDriveLetterSFCVerifyFile"
if /i "%DriveLetter%"=="M:" goto "CheckExistDriveLetterSFCVerifyFile"
if /i "%DriveLetter%"=="N:" goto "CheckExistDriveLetterSFCVerifyFile"
if /i "%DriveLetter%"=="O:" goto "CheckExistDriveLetterSFCVerifyFile"
if /i "%DriveLetter%"=="P:" goto "CheckExistDriveLetterSFCVerifyFile"
if /i "%DriveLetter%"=="Q:" goto "CheckExistDriveLetterSFCVerifyFile"
if /i "%DriveLetter%"=="R:" goto "CheckExistDriveLetterSFCVerifyFile"
if /i "%DriveLetter%"=="S:" goto "CheckExistDriveLetterSFCVerifyFile"
if /i "%DriveLetter%"=="T:" goto "CheckExistDriveLetterSFCVerifyFile"
if /i "%DriveLetter%"=="U:" goto "CheckExistDriveLetterSFCVerifyFile"
if /i "%DriveLetter%"=="V:" goto "CheckExistDriveLetterSFCVerifyFile"
if /i "%DriveLetter%"=="W:" goto "CheckExistDriveLetterSFCVerifyFile"
if /i "%DriveLetter%"=="X:" goto "CheckExistDriveLetterSFCVerifyFile"
if /i "%DriveLetter%"=="Y:" goto "CheckExistDriveLetterSFCVerifyFile"
if /i "%DriveLetter%"=="Z:" goto "CheckExistDriveLetterSFCVerifyFile"
echo Invalid syntax!
goto "9"

:"CheckExistDriveLetterSFCVerifyFile"
if not exist "%DriveLetter%" goto "DriveLetterSFCVerifyFileNotExist"
if /i not "%DriveLetter%"=="%SystemDrive%" goto "OfflineSFCVerifyFilePath"
goto "SFCVerifyFilePath"

:"SFCVerifyFilePath"
echo.
set SFCVerifyFile=
set /p SFCVerifyFile="What is the full path to the file you want to verify? "
if not exist "%SFCVerifyFile%" goto "SFCVerifyFileNotExist"
goto "SFCVerifyFile"

:"SFCVerifyFileNotExist"
echo "%SFCVerifyFile%" does not exist! Please try again.
goto "SFCVerifyFilePath"

:"SFCVerifyFile"
sfc /verifyfile="%SFCVerifyFile%"
goto "Start"

:"DriveLetterSFCVerifyFileNotExist"
echo.
echo "%SFCVerifyFile%" does not exist! Please try again.
goto "SFCVerifyFilePath"

:"OfflineSFCVerifyFilePath"
echo.
set OfflineSFCVerifyFile=
set /p OfflineSFCVerifyFile="What is the full path to the file you want to verify? "
if not exist "%OfflineSFCVerifyFile%" goto "OfflineSFCVerifyFileNotExist"
goto "OfflineSFCVerifyFileLog"

:"OfflineSFCVerifyFileNotExist"
echo "%OfflineSFCVerifyFile%" does not exist! Please try again.
goto "OfflineSFCVerifyFilePath"

:"OfflineSFCVerifyFileLog"
echo.
set OfflineSFCVerifyLog=
set /p OfflineSFCVerifyLog="Do you want to set a custom log file location? (Yes/No) "
if /i "%OfflineSFCVerifyLog%"=="Yes" goto "OfflineSFCVerifyLogLocation"
if /i "%OfflineSFCVerifyLog%"=="No" goto "OfflineSFCVerifyFile"
echo Invalid syntax!
goto "OfflineSFCVerifyFileLog"

:"OfflineSFCSVerifyFile"
sfc /Verifyfile="%OfflineSFCVerifyFile%" /offbootdir="%DriveLetter%" /offwindir="%DriveLetter%\Windows"
goto "Start"

:"OfflineSFCVerifyLogLocation"
echo.
set OfflineSFCVerifyLogLocation=
set /p OfflineSFCVerifyLogLocation="What is the full path to the location you want to save the log file to? "
if not exist "%OfflineSFCVerifyLogLocation%\nul" goto "OfflineSFCVerifyLogLocationNotExist"
goto "OfflineSFCVerifyLogVerifyVerifyFile"

:"OfflineSFCVerifyLogLocationNotExist"
echo "%OfflineSFCSVerifyLogLocation%" does not exist! Please try again.
goto "OfflineSFCVerifyLogLocation"

:OfflineSFCVerifyLogVerifyVerifyFile
sfc /verifyfile="%OfflineSFCVerifyFile%" /offbootdir="%DriveLetter%" /offwindir="%DriveLetter%\Windows" /offlogfile="%OfflineSFCVerifyLogLocation%"
goto "Start"

:"10"
"%SystemDrive%\Windows\Logs\CBS\CBS.log"
goto "Start"

:"Done"
endlocal
exit
