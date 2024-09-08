@echo off
setlocal
title Windows Corruption Fixer
echo Program Name: Windows Corruption Fixer
echo Version: 8.4.22
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
goto "CheckOffline"

:"NotExistCheck"
echo "%InstallationCheck%" does not exist or is not an offline Windows installation! Please try again.
goto "InstallationCheck"

:"CheckOnline"
DISM /Online /Cleanup-Image /CheckHealth
goto "Start"

:"CheckOffline"
DISM /Image:"%InstallationCheck%" /Cleanup-Image /CheckHealth /LogPath:"%InstallationCheck%"\Windows\Logs\DISM\dism.log
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
goto "ScanOffline"

:"NotExistCheck"
echo "%InstallationScan%" does not exist or is not an offline Windows installation! Please try again.
goto "InstallationCScan"

:"ScanOnline"
DISM /Online /Cleanup-Image /ScanHealth
goto "Start"

:"ScanOffline"
DISM /Image:"%InstallationScan%" /Cleanup-Image /ScanHealth /LogPath:"%InstallationScan%"\Windows\Logs\DISM\dism.log
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
if /i "%Media%"=="No" goto "DISMUpdateCheckOnlineNoImage"
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
echo "%DriveLetter%" does not exist! Please try again.
goto "DriveLetterOnline"

:"BitDetectionOnline"
if exist "%DriveLetter%\sources" goto "ESDSWMWIMOnline"
if exist "%DriveLetter%\x86\sources" goto "Bit1Online"
if exist "%DriveLetter%\x64\sources" goto "Bit1Online"
echo %DriveLetter% is not a Windows Disk Image!
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
goto "SureBitOnline"

:"Bit2Online"
if /i "%Bit%"=="32" goto "32ESDSWMWIMOnline"
if /i "%Bit%"=="64" goto "64ESDSWMWIMOnline"

:"ESDSWMWIMOnline"
if exist "%DriveLetter%\sources\install.esd" set Install=install.esd
if exist "%DriveLetter%\sources\install.swm" set Install=install.swm
if exist "%DriveLetter%\sources\install.wim" set Install=install.wim
goto "DISMOnline"

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
goto "IndexOnline"

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
if /i "%Index%"=="11" goto "SureIndexOnline"
echo Invalid syntax!
goto "IndexOnline"

:"SureIndexOnline"
echo.
set IndexNumber=
set /p IndexNumber="Are you sure you want Index %Index%? (Yes/No) "
if /i "%IndexNumber%"=="Yes" goto "Bit3Online"
if /i "%IndexNumber%"=="No" goto "IndexOnline"
goto "SureIndexOnline"

:"Bit3Online"
if /i "%Bit%"=="32" goto "32DISMUpdateCheckOnline"
if /i "%Bit%"=="64" goto "64DISMUpdateCheckOnline"
goto "DISMUpdateCheckOnline"

:"DISMUpdateCheckOnlineNoImage"
if /i "%Update%"=="Yes" goto "DISMNoUpdateOnlineNoImage"
if /i "%Update%"=="No" goto "DISMOnlineNoImage"

:"DISMOnlineNoImage"
DISM /Online /Cleanup-Image /RestoreHealth
goto "Start"

:"DISMNoUpdateOnlineNoImage"
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

:"32DISMNoUpdateOnline"
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
if /i "%Media%"=="Yes" goto "InstallationRestore"
if /i "%Media%"=="No" goto "InstallationRestore"
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
if /i "%Media%"=="Yes" goto "DriveLetterOffline"
if /i "%Media%"=="No" goto "DISMUpdateCheckOfflineNoImage"

:"NotExistRestore"
echo "%InstallationRestore%" does not exist or is not an offline Windows installation! Please try again.
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
echo "%DriveLetter%" does not exist! Please try again.
goto "DriveLetterOffline"

:"BitDetectionOffline"
if exist "%DriveLetter%\sources" goto "ESDSWMWIMOffline"
if exist "%DriveLetter%\x86\sources" goto "Bit1Offline"
if exist "%DriveLetter%\x64\sources" goto "Bit1Offline"
echo %DriveLetter% is not a Windows Disk Image!
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
if /i "%Bit%"=="32" goto "32DISMUpdateCheckOffline"
if /i "%Bit%"=="64" goto "64DISMUpdateCheckOffline"
goto "DISMUpdateCheckOffline"

:"DISMUpdateCheckOfflineNoImage"
if /i "%Update%"=="Yes" goto "DISMNoUpdateOfflineNoImage"
if /i "%Update%"=="No" goto "DISMOfflineNoImage"

:"DISMOfflineNoImage"
if not exist "%InstallationRestore%\Windows\Logs\DISM" md "%InstallationRestore%\Windows\Logs\DISM"
DISM /Image:"%InstallationRestore%" /Cleanup-Image /RestoreHealth /LogPath:"%InstallationRestore%\Windows\Logs\DISM\dism.log"
goto "Start"

:"DISMNoUpdateOfflineNoImage"
if not exist "%InstallationRestore%\Windows\Logs\DISM" md "%InstallationRestore%\Windows\Logs\DISM"
DISM /Image:"%InstallationRestore%" /Cleanup-Image /RestoreHealth /LimitAccess /LogPath:"%InstallationRestore%\Windows\Logs\DISM\dism.log"
goto "Start"

:"DISMUpdateCheckOffline"
if /i "%Update%"=="Yes" goto "DISMNoUpdateOffline"
if /i "%Update%"=="No" goto "DISMOffline"

:"DISMOffline"
if not exist "%InstallationRestore%\Windows\Logs\DISM" md "%InstallationRestore%\Windows\Logs\DISM"
DISM /Image:"%InstallationRestore%" /Cleanup-Image /RestoreHealth /Source:"%DriveLetter%:\sources\%Install%":%Index% /LogPath:"%InstallationRestore%\Windows\Logs\DISM\dism.log"
goto "Start"

:"DISMNoUpdateOffline"
if not exist "%InstallationRestore%\Windows\Logs\DISM" md "%InstallationRestore%\Windows\Logs\DISM"
DISM /Image:"%InstallationRestore%" /Cleanup-Image /RestoreHealth /Source:"%DriveLetter%:\sources\%Install%":%Index% /LimitAccess /LogPath:"%InstallationRestore%\Windows\Logs\DISM\dism.log"
goto "Start"

:"32DISMUpdateCheckOffline"
if /i "%Update%"=="Yes" goto "32DISMNoUpdateOffline"
if /i "%Update%"=="No" goto "32DISMOffline"

:"32DISMOffline"
if not exist "%InstallationRestore%\Windows\Logs\DISM" md "%InstallationRestore%\Windows\Logs\DISM"
DISM /Image:"%InstallationRestore%" /Cleanup-Image /RestoreHealth /Source:"%DriveLetter%:\x86\sources\%Install%":%Index% /LogPath:"%InstallationRestore%\Windows\Logs\DISM\dism.log"
goto "Start"

:"32DISMNoUpdateOffline"
if not exist "%InstallationRestore%\Windows\Logs\DISM" md "%InstallationRestore%\Windows\Logs\DISM"
DISM /Image:"%InstallationRestore%" /Cleanup-Image /RestoreHealth /Source:"%DriveLetter%:\x86\sources\%Install%":%Index% /LimitAccess /LogPath:"%InstallationRestore%\Windows\Logs\DISM\dism.log"
goto "Start"

:"64DISMUpdateCheckOffline"
if /i "%Update%"=="Yes" goto "64DISMNoUpdateOffline"
if /i "%Update%"=="No" goto "64DISMOffline"

:"64DISMOffline"
if not exist "%InstallationRestore%\Windows\Logs\DISM" md "%InstallationRestore%\Windows\Logs\DISM"
DISM /Image:"%InstallationRestore%" /Cleanup-Image /RestoreHealth /Source:"%DriveLetter%:\x64\sources\%Install%":%Index% /LogPath:"%InstallationRestore%\Windows\Logs\DISM\dism.log"
goto "Start"

:"64DISMNoUpdateOffline"
if not exist "%InstallationRestore%\Windows\Logs\DISM" md "%InstallationRestore%\Windows\Logs\DISM"
DISM /Image:"%InstallationRestore%" /Cleanup-Image /RestoreHealth /Source:"%DriveLetter%:\x64\sources\%Install%":%Index% /LimitAccess /LogPath:"%InstallationRestore%\Windows\Logs\DISM\dism.log"
goto "Start"

:"5"
echo.
set OnlineOffline=
set /p OnlineOffline="Are you viewings the logs of an online or offline WIndows installation? (Online/Offline) "
if /i "%OnlineOffline%"=="Online" goto "CheckExistDISMOnlineLog"
if /i "%OnlineOffline%"=="Offline" goto "DISMLogDriveLetter"
echo Invalid syntax!
goto "10"

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
"%windir%\Logs\DISM\dism.log"
goto "Start"

:"DISMOnlineLogNotExist"
echo DISM log file ("%windir%\Logs\DISM\dism.log") does not exist!
goto "Start"

:"CheckExistDISMOfflineLog"
if not exist "%DISMLogDriveLetter%\Windows\Logs\DISM\dism.log" goto "DISMOfflineLogNotExist"
"%DISMLogDriveLetter%\Windows\Logs\DISM\dism.log"
goto "Start"

:"DISMOfflineLogNotExist"
echo DISM log file ("%DISMLogDriveLetter%\Windows\Logs\DISM\dism.log") does not exist!
goto "Start"

:"6"
echo.
set OnlineOffline=
set /p OnlineOffline="Are you scanning an online or offline Windows installation? (Online/Offline) "
if /i "%OnlineOffline%"=="Online" goto "ScanNowOnline"
if /i "%OnlineOffline%"=="Offline" goto "ScanNowDriveLetter"
echo Invalid syntax
goto "6"

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
if not exist "%ScanNowDriveLetter%\Windows" goto "ScanNowDriveLetterNotExist"
goto "ScanNowOffline"

:"ScanNowDriveLetterNotExist"
echo "%ScanNowDriveLetter%" does not exist or is not an offline Windows installation!
goto "ScanNowDriveLetter"

:"ScanNowOnline"
sfc /scannow
goto "Start"

:"ScanNowOffline"
if not exist "%ScanNowDriveLetter%\Windows\Logs\CBS" md "%ScanNowDriveLetter%\Windows\Logs\CBS"
sfc /scannow /offbootdir="%ScanNowDriveLetter%" /offwindir="%ScanNowDriveLetter%\Windows" /offlogfile="%ScanNowDriveLetter%\Windows\Logs\CBS\CBS.log"
goto "Start"

:"7"
echo.
set OnlineOffline=
set /p OnlineOffline="Are you verifying an online or offline Windows installation? (Online/Offline) "
if /i "%OnlineOffline%"=="Online" goto "VerifyOnlyOnline"
if /i "%OnlineOffline%"=="Offline" goto "VerifyOnlyDriveLetter"
echo Invalid syntax
goto "7"

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
if not exist "%VerifyOnlyDriveLetter%\Windows" goto "VerifyOnlyDriveLetterNotExist"
goto "VerifyOnlyOffline"

:"VerifyOnlyDriveLetterNotExist"
echo "%VerifyOnlyDriveLetterNotExist%" does not exist or is not an offline Windows installation!
goto "VerifyOnlyDriveLetter"

:"VerifyOnlyOnline"
sfc /verifyonly
goto "Start"

:"VerifyOnlyOffline"
if not exist "%VerifyOnlyDriveLetter%\Windows\Logs\CBS" md "%VerifyOnlyDriveLetter%\Windows\Logs\CBS"
sfc /verifyonly /offbootdir="%VerifyOnlyDriveLetter%" /offwindir="%VerifyOnlyDriveLetter%\Windows" /offlogfile="%VerifyOnlyDriveLetter%\Windows\Logs\CBS\CBS.log"
goto "Start"

:"8"
echo.
set OnlineOffline=
set /p OnlineOffline="Are you scanning an online or offline Windows installation file? (Online/Offline) "
if /i "%OnlineOffline%"=="Online" goto "ScanFileFile"
if /i "%OnlineOffline%"=="Offline" goto "ScanFileFile"
echo Invalid syntax
goto "8"

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
if not exist "%ScanFileDriveLetter%\Windows" goto "ScanFileDriveLetterNotExist"
goto "ScanFileOffline"

:"ScanFileDriveLetterNotExist"
echo "%ScanFileDriveLetterNotExist%" does not exist or is not an offline Windows installation!
goto "ScanFileDriveLetter"

:"ScanFileOnline"
sfc /scannfile="%File%"
goto "Start"

:"ScanFileOffline"
if not exist "%ScanFileDriveLetter%\Windows\Logs\CBS" md "%ScanFileDriveLetter%\Windows\Logs\CBS"
sfc /scannfile="%File%" /offbootdir="%ScanFileDriveLetter%" /offwindir="%ScanFileDriveLetter%\Windows" /offlogfile="%ScanFileDriveLetter%\Windows\Logs\CBS\CBS.log"
goto "Start"

:"9"
echo.
set OnlineOffline=
set /p OnlineOffline="Are you verifying an online or offline Windows installation file? (Online/Offline) "
if /i "%OnlineOffline%"=="Online" goto "VerifyFileFile"
if /i "%OnlineOffline%"=="Offline" goto "VerifyFileFile"
echo Invalid syntax
goto "9"

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
if not exist "%VerifyFileDriveLetter%\Windows" goto "VerifyFileDriveLetterNotExist"
goto "VerifyFileOffline"

:"VerifyFileDriveLetterNotExist"
echo "%VerifyFileDriveLetterNotExist%" does not exist or is not an offline Windows installation!
goto "VerifyFileDriveLetter"

:"VerifyFileOnline"
sfc /verifyfile="%File%"
goto "Start"

:"VerifyFileOffline"
if not exist "%VerifyFileDriveLetter%\Windows\Logs\CBS" md "%VerifyFileDriveLetter%\Windows\Logs\CBS"
sfc /verifyfile="%File%" /offbootdir="%VerifyFileDriveLetter%" /offwindir="%VerifyFileDriveLetter%\Windows" /offlogfile="%VerifyFileDriveLetter%\Windows\Logs\CBS\CBS.log"
goto "Start"

:"10"
echo.
set OnlineOffline=
set /p OnlineOffline="Are you viewings the logs of an online or offline WIndows installation? (Online/Offline) "
if /i "%OnlineOffline%"=="Online" goto "CheckExistSFCOnlineLog"
if /i "%OnlineOffline%"=="Offline" goto "SFCLogDriveLetter"
echo Invalid syntax!
goto "10"

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
"%windir%\Logs\CBS\CBS.log"
goto "Start"

:"SFCOnlineLogNotExist"
echo SFC log file ("%windir%\Logs\CBS\CBS.log") does not exist!
goto "Start"

:"CheckExistSFCOfflineLog"
if not exist "%SFCLogDriveLetter%\Windows\Logs\CBS\CBS.log" goto "SFCOfflineLogNotExist"
"%SFCLogDriveLetter%\Windows\Logs\CBS\CBS.log"
goto "Start"

:"SFCOfflineLogNotExist"
echo SFC log file ("%SFCLogDriveLetter%\Windows\Logs\CBS\CBS.log") does not exist!
goto "Start"

:"Done"
endlocal
exit
