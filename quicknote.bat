@echo off
title QuickNote v1.0
color 0f
setlocal enabledelayedexpansion
if not exist "C:/Users/%username%/Documents/QuickNote/data/" (
mkdir "C:/Users/%username%/Documents/QuickNote/data/"
break >"C:/Users/!username!/Documents/QuickNote/data/ttl.txt"
break >"C:/Users/!username!/Documents/QuickNote/data/clr.txt"
)
::run on startup
for /f "tokens=1 delims= " %%b in (C:/Users/!username!/Documents/QuickNote/data/clr.txt) do set c=%%b
if !c!==1 color 0c
if !c!==2 color 09
if !c!==3 color 0a
if !c!==4 color 0f

::setlocalvars
set titl
set /a c
goto :main

:main
mode con lines=15 cols=30
cls
echo QuickNote
echo ----------
echo 1:Start
echo 2:Settings
echo 3:Exit
choice /c 123 /n /m ""
if !errorlevel!==1 goto start
if !errorlevel!==2 goto opts
if !errorlevel!==3 exit
goto :main
goto :eof

:opts
mode con lines=15 cols=30
cls
echo Settings:
echo.
echo 1:Text Color
echo 2:File name
echo 3:Back
choice /c 123 /n /m ""
if !errorlevel!==1 call :colorc
if !errorlevel!==2 goto :tit
if !errorlevel!==3 goto :main
goto :opts
goto :eof

:tit
cls
echo Enter default file name:
echo (~/Desktop/NAME.txt)
echo.
set /p title=^>
echo !title! >C:/Users/!username!/Documents/QuickNote/data/ttl.txt
goto :opts
goto :eof

:colorc
cls
echo 1:Red
echo 2:Blue
echo 3:Green
echo 4:White
echo 5:Back to Settings
choice /c 12345 /n /m ""
if !errorlevel!==1 (
color 0c
set /a c=1
echo !c!>"C:/Users/!username!/Documents/QuickNote/data/clr.txt"
)
if !errorlevel!==2 (
color 09
set /a c=2
echo !c!>"C:/Users/!username!/Documents/QuickNote/data/clr.txt"
)
if !errorlevel!==3 (
color 0a
set /a c=3
echo !c!>"C:/Users/!username!/Documents/QuickNote/data/clr.txt"
)
if !errorlevel!==4 (
color 0f
set /a c=4
echo !c!>"C:/Users/!username!/Documents/QuickNote/data/clr.txt"
)
if !errorlevel!==5 goto :opts
goto :colorc
goto :colorc

:start
mode con lines=40 cols=80
cls
set /p txt=^>
for /f "tokens=1 delims= " %%a in (C:/Users/!username!/Documents/QuickNote/data/ttl.txt) do set titl=%%a
echo !txt! >>"C:/Users/!username!/Desktop/!titl!.txt"
goto :main