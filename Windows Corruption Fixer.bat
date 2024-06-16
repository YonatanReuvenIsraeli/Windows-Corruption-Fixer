@echo off
setlocal
title Windows Corruption Fixer
echo Program Name: Windows Corruption Fixer
echo Version: 5.0.3
echo Developer: @YonatanReuvenIsraeli
echo Website: https://www.yonatanreuvenisraeli.dev
echo License: GNU General Public License v3.0
net session > nul 2>&1
if not "%errorlevel%"=="0" goto NotAdministrator
goto Start

:NotAdministrator
echo.
echo Please run this batch file as an administrator. Press any key to close this batch file.
pause > nul 2>&1
goto Done

:Start
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
set Input=
set /p Input="Which one do you want to do? (1-11) "
if /i "%Input%"=="1" goto 1
if /i "%Input%"=="2" goto 2
if /i "%Input%"=="3" goto 3
if /i "%Input%"=="4" goto 4
if /i "%Input%"=="5" goto 5
if /i "%Input%"=="6" goto 6
if /i "%Input%"=="7" goto 7
if /i "%Input%"=="8" goto 8
if /i "%Input%"=="9" goto 9
if /i "%Input%"=="10" goto 10
if /i "%Input%"=="11" goto Done
echo Invalid syntax
goto Start

:1
echo.
set DriveLetter=
set /p DriveLetter="Which drive do you want to run Check Disk on? (A:-Z:) "
if /i "%DriveLetter%"=="A:" goto SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="B:" goto SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="C:" goto SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="D:" goto SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="E:" goto SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="F:" goto SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="G:" goto SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="H:" goto SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="I:" goto SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="J:" goto SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="K:" goto SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="L:" goto SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="M:" goto SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="N:" goto SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="O:" goto SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="P:" goto SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="Q:" goto SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="R:" goto SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="S:" goto SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="T:" goto SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="U:" goto SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="V:" goto SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="W:" goto SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="X:" goto SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="Y:" goto SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="Z:" goto SureDriveLetterCHKDSK
echo Invalid syntax!
goto 1

:SureDriveLetterCHKDSK
echo.
set SureDriveLetter=
set /p SureDriveLetter="Are you sure %DriveLetter% is the drive letter of your Windows Disk Image? (Yes/No) "
if /i "%SureDriveLetter%"=="Yes" goto CHKDSK
if /i "%SureDriveLetter%"=="No" goto DriveLetter
echo Invalid syntax!
goto SureDriveLetterCHKDSK

:CHKDSK
chkdsk "%DriveLetter%" /f /r
goto Start

:2
DISM /Online /Cleanup-Image /CheckHealth
goto Start

:3
DISM /Online /Cleanup-Image /ScanHealth
goto Start

:4
echo.
set /p Update="Do you want to use Windows Update? (Yes/No) "
if /i "%Update%"=="Yes" goto Media
if /i "%Update%"=="No" goto Media
echo Invalid Sytax!
goto 4

:Media
echo.
set Media=
set /p Media="Do you want to use a Windows Disk Image? (Yes/No) "
if /i "%Media%"=="Yes" goto DriveLetter
if /i "%Media%"=="No" goto DISMUpdateCheck

:DriveLetter
echo.
set DriveLetter=
set /p DriveLetter="What is your drive letter of your Windows Disk Image? (A:-Z:) "
if /i "%DriveLetter%"=="A:" goto SureDriveLetterDISM
if /i "%DriveLetter%"=="B:" goto SureDriveLetterDISM
if /i "%DriveLetter%"=="C:" goto SureDriveLetterDISM
if /i "%DriveLetter%"=="D:" goto SureDriveLetterDISM
if /i "%DriveLetter%"=="E:" goto SureDriveLetterDISM
if /i "%DriveLetter%"=="F:" goto SureDriveLetterDISM
if /i "%DriveLetter%"=="G:" goto SureDriveLetterDISM
if /i "%DriveLetter%"=="H:" goto SureDriveLetterDISM
if /i "%DriveLetter%"=="I:" goto SureDriveLetterDISM
if /i "%DriveLetter%"=="J:" goto SureDriveLetterDISM
if /i "%DriveLetter%"=="K:" goto SureDriveLetterDISM
if /i "%DriveLetter%"=="L:" goto SureDriveLetterDISM
if /i "%DriveLetter%"=="M:" goto SureDriveLetterDISM
if /i "%DriveLetter%"=="N:" goto SureDriveLetterDISM
if /i "%DriveLetter%"=="O:" goto SureDriveLetterDISM
if /i "%DriveLetter%"=="P:" goto SureDriveLetterDISM
if /i "%DriveLetter%"=="Q:" goto SureDriveLetterDISM
if /i "%DriveLetter%"=="R:" goto SureDriveLetterDISM
if /i "%DriveLetter%"=="S:" goto SureDriveLetterDISM
if /i "%DriveLetter%"=="T:" goto SureDriveLetterDISM
if /i "%DriveLetter%"=="U:" goto SureDriveLetterDISM
if /i "%DriveLetter%"=="V:" goto SureDriveLetterDISM
if /i "%DriveLetter%"=="W:" goto SureDriveLetterDISM
if /i "%DriveLetter%"=="X:" goto SureDriveLetterDISM
if /i "%DriveLetter%"=="Y:" goto SureDriveLetterDISM
if /i "%DriveLetter%"=="Z:" goto SureDriveLetterDISM
echo Invalid syntax!
goto DriveLetterdDISM

:SureDriveLetterDISM
echo.
set SureDriveLetter=
set /p SureDriveLetter="Are you sure "%DriveLetter%" is the drive letter of your Windows Disk Image? (Yes/No) "
if /i "%SureDriveLetter%"=="Yes" goto BitDetection
if /i "%SureDriveLetter%"=="No" goto DriveLetter
echo Invalid syntax!
goto SureDriveLetter

:BitDetection
if exist "%DriveLetter%\sources" goto ESDSWMWIM1
if exist "%DriveLetter%\x86\sources" goto Bit1
if exist "%DriveLetter%\x64\sources" goto Bit1
echo Invalid Drive Letter!
goto DriveLetter

:Bit1
echo.
set Bit=
set /p Bit="Do you have a 32-bit or 64-bit version of Windows? (32/64) "
if /i "%Bit%"=="32" goto SureBit
if /i "%Bit%"=="64" goto SureBit
echo Invalid syntax!
goto Bit1

:SureBit
echo.
set SureBit=
set /p SureBit="Are you sure you have a %Bit%-bit version of Windows? "
if /i "%SureBit%"=="Yes" goto Bit2
if /i "%SureBit%"=="No" goto Bit1
echo Invalid syntax!
goto SureBit

:Bit2
if /i "%Bit%"=="32" goto 32ESDSWMWIM1
if /i "%Bit%"=="64" goto 64ESDSWMWIM1

:ESDSWMWIM1
if exist "%DriveLetter%\sources\install.esd" goto DISMESD1
if exist "%DriveLetter%\sources\install.swm" goto DISMSWM1
if exist "%DriveLetter%\sources\install.wim" goto DISMWIM1

:32ESDSWMWIM1
if exist "%DriveLetter%\x86\sources\install.esd" goto 32DISMESD1
if exist "%DriveLetter%\x86\sources\install.swm" goto 32DISMSWM1
if exist "%DriveLetter%\x86\sources\install.wim" goto 32DISMWIM1

:64ESDSWMWIM1
if exist "%DriveLetter%\x64\sources\install.esd" goto 64DISMESD1
if exist "%DriveLetter%\x64\sources\install.swm" goto 64DISMSWM1
if exist "%DriveLetter%\x64\sources\install.wim" goto 64DISMWIM1

:DISMESD1
set install=install.esd
DISM /Get-WimInfo /WimFile:"%DriveLetter%\sources\install.esd"
if not "%errorlevel%"=="0" goto DriveLetter
goto Index

:DISMSWM1
set install=install.swm
DISM /Get-WimInfo /WimFile:"%DriveLetter%\sources\install.swm"
if not "%errorlevel%"=="0" goto DriveLetter
goto Index

:DISMWIM1
set install=install.wim
DISM /Get-WimInfo /WimFile:"%DriveLetter%\sources\install.wim"
if not "%errorlevel%"=="0" goto DriveLetter
goto Index

:32DISMESD1
set install=install.esd
DISM /Get-WimInfo /WimFile:"%DriveLetter%\x86\sources\install.esd"
if not "%errorlevel%"=="0" goto DriveLetter
goto Index

:32DISMSWM1
set install=install.swm
DISM /Get-WimInfo /WimFile:"%DriveLetter%\x86\sources\install.swm"
if not "%errorlevel%"=="0" goto DriveLetter
goto Index

:32DISMWIM1
set install=install.wim
DISM /Get-WimInfo /WimFile:"%DriveLetter%\x86\sources\install.wim"
if not "%errorlevel%"=="0" goto DriveLetter
goto Index

:64DISMESD1
set install=install.esd
DISM /Get-WimInfo /WimFile:"%DriveLetter%\x64\sources\install.esd"
if not "%errorlevel%"=="0" goto DriveLetter
goto Index

:64DISMSWM1
set install=install.swm
DISM /Get-WimInfo /WimFile:"%DriveLetter%\x64\sources\install.swm"
if not "%errorlevel%"=="0" goto DriveLetter
goto Index

:64DISMWIM1
set install=install.wim
DISM /Get-WimInfo /WimFile:"%DriveLetter%\x64\sources\install.wim"
if not "%errorlevel%"=="0" goto DriveLetter
goto Index

:Index
echo.
set Index=
set /p Index="Which one do you have on your PC? (1-7/11)? "
if /i "%Index%"=="1" goto SureIndex
if /i "%Index%"=="2" goto SureIndex
if /i "%Index%"=="3" goto SureIndex
if /i "%Index%"=="4" goto SureIndex
if /i "%Index%"=="5" goto SureIndex
if /i "%Index%"=="6" goto SureIndex
if /i "%Index%"=="7" goto SureIndex
if /i "%Index%"=="8" goto SureIndex
if /i "%Index%"=="9" goto SureIndex
if /i "%Index%"=="10" goto SureIndex
if /i "%Index%"=="11" goto SureIndex
echo Invalid syntax!
goto Index

:SureIndex
echo.
set IndexNumber=
set /p IndexNumber="Are you sure you want Index %Index%? (Yes/No) "
if /i "%IndexNumber%"=="Yes" goto Bit3
if /i "%IndexNumber%"=="No" goto Index
goto SureIndex

:Bit3
if /i "%Bit%"=="32" goto 32ESDSWMWIM2
if /i "%Bit%"=="64" goto 64ESDSWMWIM2
goto ESDSWMWIM2

:ESDSWMWIM2
if exist "%DriveLetter%\sources\install.esd" goto DISMESDUpdateCheck
if exist "%DriveLetter%\sources\install.swm" goto DISMSWMUpdateCheck
if exist "%DriveLetter%\sources\install.wim" goto DISMWIMUpdateCheck
echo Invalid Drive Letter!
goto DriveLetter

:32ESDSWMWIM2
if exist "%DriveLetter%\x86\sources\install.esd" goto 32DISMESDUpdateCheck
if exist "%DriveLetter%\x86\sources\install.swm" goto 32DISMSWMUpdateCheck
if exist "%DriveLetter%\x86\sources\install.wim" goto 32DISMWIMUpdateCheck
echo Invalid Drive Letter!
goto DriveLetter

:64ESDSWMWIM2
if exist "%DriveLetter%\x64\sources\install.esd" goto 64DISMESDUpdateCheck
if exist "%DriveLetter%\x64\sources\install.swm" goto 64DISMSWMUpdateCheck
if exist "%DriveLetter%\x64\sources\install.wim" goto 64DISMWIMUpdateCheck
echo Invalid Drive Letter!
goto DriveLetter

:DISMUpdateCheck
if /i "%Update%"=="Yes" goto DISMESDNoUpdate
if /i "%Update%"=="No" goto DISMESD

:DISM
DISM /Online /Cleanup-Image /RestoreHealth
goto Start

:DISMNoUpdate
DISM /Online /Cleanup-Image /RestoreHealth /LimitAccess

:DISMESDUpdateCheck
if /i "%Update%"=="Yes" goto DISMESDNoUpdate
if /i "%Update%"=="No" goto DISMESD

:DISMESD
DISM /Online /Cleanup-Image /RestoreHealth /Source:"%DriveLetter%:\Sources\install.esd":%Index%
if not "%errorlevel%"=="0" goto 4
goto Start

:DISMESDNoUpdate
DISM /Online /Cleanup-Image /RestoreHealth /Source:"%DriveLetter%:\Sources\install.esd":%Index% /LimitAccess

:DISMSWMUpdateCheck
if /i "%Update%"=="Yes" goto DISMSWMNoUpdate
if /i "%Update%"=="No" goto DISMSWM

:DISMSWM
DISM /Online /Cleanup-Image /RestoreHealth /Source:"%DriveLetter%:\Sources\install.swm":%Index%
if not "%errorlevel%"=="0" goto 4
goto Start

:DISMSWMNoUpdate
DISM /Online /Cleanup-Image /RestoreHealth /Source:"%DriveLetter%:\Sources\install.swm":%Index% /LimitAccess

:DISMWIMUpdateCheck
if /i "%Update%"=="Yes" goto DISMWIMNoUpdate
if /i "%Update%"=="No" goto DISMWIM

:DISMWIM
DISM /Online /Cleanup-Image /RestoreHealth /Source:"%DriveLetter%:\Sources\install.wim":%Index%
if not "%errorlevel%"=="0" goto 4
goto Start

:DISMWIMNoUpdate
DISM /Online /Cleanup-Image /RestoreHealth /Source:"%DriveLetter%:\Sources\install.wim":%Index% /LimitAccess

:32DISMESDUpdateCheck
if /i "%Update%"=="Yes" goto 32DISMESDNoUpdate
if /i "%Update%"=="No" goto 32DISMESD

:32DISMESD
DISM /Online /Cleanup-Image /RestoreHealth /Source:"%DriveLetter%:\x86\Sources\install.esd":%Index%
if not "%errorlevel%"=="0" goto 4
goto Start

:32DISMNoUpdate
DISM /Online /Cleanup-Image /RestoreHealth /Source:"%DriveLetter%:\x86\Sources\install.esd":%Index% /LimitAccess

:32DISMSWMUpdateCheck
if /i "%Update%"=="Yes" goto 32DISMSWMNoUpdate
if /i "%Update%"=="No" goto 32DISM

:32DISMSWM
DISM /Online /Cleanup-Image /RestoreHealth /Source:"%DriveLetter%:\x86\Sources\install.swm":%Index%
if not "%errorlevel%"=="0" goto 4
goto Start

:32DISMSWMNoUpdate
DISM /Online /Cleanup-Image /RestoreHealth /Source:"%DriveLetter%:\x86\Sources\install.swm":%Index% /LimitAccess

:32DISMWIMUpdateCheck
if /i "%Update%"=="Yes" goto 32DISMWIMNoUpdate
if /i "%Update%"=="No" goto 32DISMWIM

:32DISMWIM
DISM /Online /Cleanup-Image /RestoreHealth /Source:"%DriveLetter%:\x86\Sources\install.wim":%Index%
if not "%errorlevel%"=="0" goto 4
goto Start

:32DISMWIMNoUpdate
DISM /Online /Cleanup-Image /RestoreHealth /Source:"%DriveLetter%:\x86\Sources\install.wim":%Index% /LimitAccess

:64DISMESDUpdateCheck
if /i "%Update%"=="Yes" goto 64DISMESDNoUpdate
if /i "%Update%"=="No" goto 64DISMESD

:64DISMESD
DISM /Online /Cleanup-Image /RestoreHealth /Source:"%DriveLetter%:\x64\Sources\install.esd":%Index%
if not "%errorlevel%"=="0" goto 4
goto Start

:64DISMNoUpdate
DISM /Online /Cleanup-Image /RestoreHealth /Source:"%DriveLetter%:\x64\Sources\install.esd":%Index% /LimitAccess

:64DISMSWMUpdateCheck
if /i "%Update%"=="Yes" goto 64DISMSWMNoUpdate
if /i "%Update%"=="No" goto 64DISMSWM

:64DISMSWM
DISM /Online /Cleanup-Image /RestoreHealth /Source:"%DriveLetter%:\x64\Sources\install.swm":%Index%
if not "%errorlevel%"=="0" goto 4
goto Start

:64DISMNoUpdate
DISM /Online /Cleanup-Image /RestoreHealth /Source:"%DriveLetter%:\x64\Sources\install.swm":%Index% /LimitAccess

:64DISMWIMUpdateCheck
if /i "%Update%"=="Yes" goto 64DISMSWMNoUpdate
if /i "%Update%"=="No" goto 64DISMSWM

:64DISMWIM
DISM /Online /Cleanup-Image /RestoreHealth /Source:"%DriveLetter%:\x64\Sources\install.wim":%Index%
if not "%errorlevel%"=="0" goto 4
goto Start

:64DISMNoUpdate
DISM /Online /Cleanup-Image /RestoreHealth /Source:"%DriveLetter%:\x64\Sources\install.wim":%Index% /LimitAccess

:5
"%SystemDrive%"
cd\
cd "Windows\Logs\DISM"
dism.log
goto Start

:6
sfc /scannow
goto Start

:7
sfc /verifyonly
goto Start

:8
echo. 
set ScanFile=
set /p ScanFile="Please specify a file. You can add /offwindir, /offbootdir and/or /offlogfile as part of the file if needed. "
sfc /scanfile="%ScanFile%"
goto Start

:9
echo.
set VerifyFile=
set /p VerifyFile="Please specify a file. You can add /offwindir, /offbootdir and/or /offlogfile as part of the file if needed. "
sfc /verifyfile="%VerifyFile%"
goto Start

:10
"%SystemDrive%"
cd\
cd "Windows\Logs\CBS"
CBS.log
goto Start

:Done
endlocal
exit
