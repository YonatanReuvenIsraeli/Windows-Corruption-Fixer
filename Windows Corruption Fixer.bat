@echo off
setlocal
title Windows Corruption Fixer
echo Please run this batch file as an administrator.
goto :Start

:Start
echo.
echo Do you want to-
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
set /p input="Which one do you want to do? (1/12) "
if /i "%input%"=="1" goto :1
if /i "%input%"=="2" goto :2
if /i "%input%"=="3" goto :3
if /i "%input%"=="4" goto :4
if /i "%input%"=="5" goto :5
if /i "%input%"=="6" goto :6
if /i "%input%"=="7" goto :7
if /i "%input%"=="8" goto :8
if /i "%input%"=="9" goto :9
if /i "%input%"=="10" goto :10
if /i "%input%"=="11" goto :Done
echo Invalid Syntax
goto :Main

:1
echo.
set /p DriveLetter="Which drive do you want to run Check Disk on? (A:-Z:) "
if /i "%DriveLetter%"=="A:" goto :SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="B:" goto :SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="C:" goto :SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="D:" goto :SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="E:" goto :SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="F:" goto :SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="G:" goto :SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="H:" goto :SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="I:" goto :SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="J:" goto :SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="K:" goto :SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="L:" goto :SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="M:" goto :SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="N:" goto :SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="O:" goto :SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="P:" goto :SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="Q:" goto :SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="R:" goto :SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="S:" goto :SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="T:" goto :SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="U:" goto :SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="V:" goto :SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="W:" goto :SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="X:" goto :SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="Y:" goto :SureDriveLetterCHKDSK
if /i "%DriveLetter%"=="Z:" goto :SureDriveLetterCHKDSK
echo Invalid Syntax!
goto :10

:SureDriveLetterCHKDSK
echo.
set /p SureDriveLetter="Are you sure %DriveLetter% is the drive letter of your Windows Disk Image? (Yes/No) "
if /i "%SureDriveLetter%"=="Yes" goto :CHKDSK
if /i "%SureDriveLetter%"=="No" goto :DriveLetter
echo Invalid Syntax!
goto :SureDriveLetterCHKDSK

:CHKDSK
chkdsk %DriveLetter% /f /r
goto :Start

:2
DISM /Online /Cleanup-Image /CheckHealth
goto :Start

:3
DISM /Online /Cleanup-Image /ScanHealth
goto :Start

:4
echo.
set /p Media="Do you want to use a Windows installation Media? (Yes/No) "
if /i "%Media%"=="Yes" goto :Install
if /i "%Media%"=="No" goto :DISM

:Install
echo Go to X:\sources, where X: is the drive letter of you monted disk image and look for install.esd or install.wim and then press any key to continue.
pause
goto ESDWIM

:ESDWIM
echo.
set /p install="Do you have install.esd or install.wim? (install.esd/install.wim) "
if "%install%"=="install.esd" goto :DriveLetter
if "%install%"=="install.wim" goto :DriveLetter
echo Invalid Syntax!
goto :ESDWIM

:DriveLetter
echo.
set /p DriveLetter="What is your drive letter of your Windows Installation Media? (A:-Z:) "
if /i "%DriveLetter%"=="A:" goto :SureDriveLetterDISM
if /i "%DriveLetter%"=="B:" goto :SureDriveLetterDISM
if /i "%DriveLetter%"=="C:" goto :SureDriveLetterDISM
if /i "%DriveLetter%"=="D:" goto :SureDriveLetterDISM
if /i "%DriveLetter%"=="E:" goto :SureDriveLetterDISM
if /i "%DriveLetter%"=="F:" goto :SureDriveLetterDISM
if /i "%DriveLetter%"=="G:" goto :SureDriveLetterDISM
if /i "%DriveLetter%"=="H:" goto :SureDriveLetterDISM
if /i "%DriveLetter%"=="I:" goto :SureDriveLetterDISM
if /i "%DriveLetter%"=="J:" goto :SureDriveLetterDISM
if /i "%DriveLetter%"=="K:" goto :SureDriveLetterDISM
if /i "%DriveLetter%"=="L:" goto :SureDriveLetterDISM
if /i "%DriveLetter%"=="M:" goto :SureDriveLetterDISM
if /i "%DriveLetter%"=="N:" goto :SureDriveLetterDISM
if /i "%DriveLetter%"=="O:" goto :SureDriveLetterDISM
if /i "%DriveLetter%"=="P:" goto :SureDriveLetterDISM
if /i "%DriveLetter%"=="Q:" goto :SureDriveLetterDISM
if /i "%DriveLetter%"=="R:" goto :SureDriveLetterDISM
if /i "%DriveLetter%"=="S:" goto :SureDriveLetterDISM
if /i "%DriveLetter%"=="T:" goto :SureDriveLetterDISM
if /i "%DriveLetter%"=="U:" goto :SureDriveLetterDISM
if /i "%DriveLetter%"=="V:" goto :SureDriveLetterDISM
if /i "%DriveLetter%"=="W:" goto :SureDriveLetterDISM
if /i "%DriveLetter%"=="X:" goto :SureDriveLetterDISM
if /i "%DriveLetter%"=="Y:" goto :SureDriveLetterDISM
if /i "%DriveLetter%"=="Z:" goto :SureDriveLetterDISM
echo Invalid Syntax!
goto :DriveLetter

:SureDriveLetterDISM
echo.
set /p SureDriveLetter="Are you sure %DriveLetter% is the drive letter of your Windows Disk Image? (Yes/No) "
if /i "%SureDriveLetter%"=="Yes" goto :ESDWIM1
if /i "%SureDriveLetter%"=="No" goto :DriveLetter
echo Invalid Syntax!
goto :SureDriveLetter

:ESDWIM2
if /i "%install%"=="install.esd" goto :DISMESD
if /i "%install%"=="install.wim" goto :DISMWIM

:DISMESD
DISM /Online /Cleanup-Image /RestoreHealth /Source:%DriveLetter%:\Sources\install.esd
if errorlevel 1 goto :8
goto :Start

:DISMWIM
DISM /Online /Cleanup-Image /RestoreHealth /Source:%DriveLetter%:\Sources\install.wim
if errorlevel 1 goto :8
goto :Start

:DISM
DISM /Online /Cleanup-Image /RestoreHealth
goto :Start

:5
%SystemDrive%
cd Windows\Logs\DISM
start dism.log
goto :Start

:6
sfc /scannow
goto :Start

:7
sfc /verifyonly
goto :Start

:8
echo. 
set /p ScanFile="Please specify a file. You can add /offwindir, /offbootdir and/or /offlogfile as part of the file if needed. "
sfc /scanfile="%ScanFile%"
goto :Start

:9
echo.
set /p VerifyFile="Please specify a file. You can add /offwindir, /offbootdir and/or /offlogfile as part of the file if needed. "
sfc /verifyfile="%VerifyFile%"
goto :Start

:10
%SystemDrive%
cd Windows\Logs\CBS
start CBS.log
goto :Start

:Done
endlocal
exit
