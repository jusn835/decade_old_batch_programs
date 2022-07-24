cls
cls
chcp 65001
cls
@echo off
mode con lines=10 cols=22
title *
setlocal enableextensions enabledelayedexpansion
goto :MainMenu

:MainMenu
cls
echo.
echo  █ █   ██  █████ █████
echo █ █ █ █  █     █ █
echo █ █ █ ████  ███  ███
echo █ █ █ █  █ █     █
echo █ █ █ █  █ █████ █████
echo ______________________
echo        1: Start
echo        2: Quit
choice /c 12 /n /m ">"
if %errorlevel%==1 goto :tut
if %errorlevel%==2 exit
goto :eof

:tut
cls
mode con lines=12 cols=15
echo To move, use...
echo.
echo        W
echo      A S D
echo ---------------
echo    To win...
echo.
echo   Get the ∆^^!
echo ---------------
echo Press any key..
pause>nul
goto :maze


:maze
cls
set d=0
set switch=0
set pos=12
call :layout
set a12=*
goto :redir

:screen
cls
echo   %a1%%a2%%a3%%a4%%a5%%a6%%a7%%a8%%a9%%a10%
echo   %a11%%a12%%a13%%a14%%a15%%a16%%a17%%a18%%a19%%a20%
echo   %a21%%a22%%a23%%a24%%a25%%a26%%a27%%a28%%a29%%a30%
echo   %a31%%a32%%a33%%a34%%a35%%a36%%a37%%a38%%a39%%a40%
echo   %a41%%a42%%a43%%a44%%a45%%a46%%a47%%a48%%a49%%a50%
echo   %a51%%a52%%a53%%a54%%a55%%a56%%a57%%a58%%a59%%a60%
echo   %a61%%a62%%a63%%a64%%a65%%a66%%a67%%a68%%a69%%a70%
echo   %a71%%a72%%a73%%a74%%a75%%a76%%a77%%a78%%a79%%a80%
echo   %a81%%a82%%a83%%a84%%a85%%a86%%a87%%a88%%a89%%a90%
echo   %a91%%a92%%a93%%a94%%a95%%a96%%a97%%a98%%a99%%a100%
goto :eof

:redir
call :screen

:prompt
choice /c wasd /n
if %errorlevel%==1 (
set /a pos=%pos%-10
goto :check
)
if %errorlevel%==2 (
set /a pos=%pos%-1
goto :check
)
if %errorlevel%==3 (
set /a pos=%pos%+10
goto :check
)
if %errorlevel%==4 (
set /a pos=%pos%+1
goto :check
)

:check
if %pos%==87 set switch=1
if %pos%==13 set d=1
if %pos%==22 set d=2
if %pos%==14 set d=3
if %pos%==34 set d=4
if %pos%==15 set d=5
if %pos%==26 set d=6
if %pos%==35 set d=7
if %pos%==32 set d=8
if %pos%==44 set d=9
if %pos%==17 set d=10
if %pos%==37 set d=11
if %pos%==36 set d=12
if %pos%==54 set d=13
if %pos%==64 set d=14
if %pos%==65 set d=15
if %pos%==56 set d=16
if %pos%==18 set d=17
if %pos%==29 set d=18
if %pos%==66 set d=19
if %pos%==75 set d=20
if %pos%==39 set d=21
if %pos%==49 set d=22
if %pos%==58 set d=23
if %pos%==59 set d=24
if %pos%==68 set d=25
if %pos%==78 set d=26
if %pos%==87 set d=27
if %pos%==85 set d=28
if %pos%==84 set d=29
if %pos%==83 set d=30
if %pos%==72 set d=31
if %pos%==62 set d=32
if %pos%==52 set d=33
if %pos%==52 goto :win
if %pos%==1 set pos=12
if %pos%==2 set pos=12
if %pos%==3 set pos=13
if %pos%==4 set pos=14
if %pos%==5 set pos=15
if %pos%==6 set pos=16
if %pos%==7 set pos=17
if %pos%==8 set pos=18
if %pos%==9 set pos=19
if %pos%==10 set pos=19
if %pos%==11 set pos=12
if %pos%==21 set pos=22
if %pos%==31 set pos=32
if %pos%==41 set pos=42
if %pos%==51 set pos=52
if %pos%==61 set pos=62
if %pos%==71 set pos=72
if %pos%==81 set pos=82
if %pos%==91 set pos=82
if %pos%==92 set pos=82
if %pos%==93 set pos=83
if %pos%==94 set pos=84
if %pos%==95 set pos=85
if %pos%==96 set pos=86
if %pos%==97 set pos=87
if %pos%==98 set pos=88
if %pos%==99 set pos=89
if %pos%==100 set pos=89
if %pos%==90 set pos=89
if %pos%==80 set pos=79
if %pos%==70 set pos=69
if %pos%==60 set pos=59
if %pos%==50 set pos=49
if %pos%==40 set pos=39
if %pos%==30 set pos=29
if %pos%==20 set pos=19
if %pos%==43 set pos=44
if %pos%==89 set pos=88
if %pos%==23 if %d%==2 set pos=22
if %pos%==23 if %d%==1 set pos=13
if %pos%==24 if %d%==3 set pos=14
if %pos%==24 if %d%==4 set pos=34
if %pos%==33 if %d%==4 set pos=34
if %pos%==25 if %d%==5 set pos=15
if %pos%==25 if %d%==6 set pos=26
if %pos%==27 if %d%==6 set pos=26
if %pos%==25 if %d%==7 set pos=35
if %pos%==33 if %d%==8 set pos=32
if %pos%==45 if %d%==9 set pos=44
if %pos%==27 if %d%==10 set pos=17
if %pos%==27 if %d%==11 set pos=37
if %pos%==42 if %d%==8 set pos=32
if %pos%==45 if %d%==7 set pos=35
if %pos%==46 if %d%==12 set pos=36
if %pos%==55 if %d%==13 set pos=54
if %pos%==53 if %d%==13 set pos=54
if %pos%==63 if %d%==14 set pos=64
if %pos%==74 if %d%==14 set pos=64
if %pos%==55 if %d%==15 set pos=65
if %pos%==55 if %d%==16 set pos=56
if %pos%==46 if %d%==16 set pos=56
if %pos%==57 if %d%==16 set pos=56
if %pos%==38 if %d%==11 set pos=37
if %pos%==28 if %d%==17 set pos=18
if %pos%==28 if %d%==18 set pos=29
if %pos%==47 if %d%==11 set pos=37
if %pos%==67 if %d%==19 set pos=66
if %pos%==76 if %d%==19 set pos=66
if %pos%==74 if %d%==20 set pos=75
if %pos%==76 if %d%==20 set pos=75
if %pos%==38 if %d%==21 set pos=39
if %pos%==48 if %d%==22 set pos=49
if %pos%==48 if %d%==23 set pos=58
if %pos%==69 if %d%==24 set pos=59
if %pos%==57 if %d%==23 set pos=58
if %pos%==67 if %d%==25 set pos=68
if %pos%==69 if %d%==25 set pos=68
if %pos%==77 if %d%==26 set pos=78
if %pos%==79 if %d%==26 set pos=78
if %pos%==86 if %d%==27 set pos=87
if %pos%==86 if %d%==28 set pos=85
if %pos%==77 if %d%==27 set pos=87
if %pos%==74 if %d%==29 set pos=84
if %pos%==73 if %d%==30 set pos=83
if %pos%==73 if %d%==31 set pos=72
if %pos%==63 if %d%==32 set pos=62
if %pos%==53 if %d%==33 set pos=52
if %pos%==42 if %d%==33 set pos=52
if %pos%==75 if %switch%==0 set pos=65
call :layout
set a%pos%=*
goto :redir

:layout
set a1=█
set a2=█
set a3=█
set a4=█
set a5=█
set a6=█
set a7=█
set a8=█
set a9=█
set a10=█
set a11=█
set a12=░
set a13=░
set a14=░
set a15=░
set a16=░
set a17=░
set a18=░
set a19=░
set a20=█
set a21=█
set a22=░
set a23=█
set a24=█
set a25=█
set a26=░
set a27=█
set a28=█
set a29=░
set a30=█
set a31=█
set a32=░
set a33=█
set a34=░
set a35=░
set a36=░
set a37=░
set a38=█
set a39=░
set a40=█
set a41=█
set a42=█
set a43=█
set a44=░
set a45=█
set a46=█
set a47=█
set a48=█
set a49=░
set a50=█
set a51=█
set a52=∆
set a53=█
set a54=░
set a55=█
set a56=░
set a57=█
set a58=░
set a59=░
set a60=█
set a61=█
set a62=░
set a63=█
set a64=░
set a65=░
set a66=░
set a67=█
set a68=░
set a69=█
set a70=█
set a71=█
set a72=░
set a73=█
set a74=█
set a75=-
set a76=█
set a77=█
set a78=░
set a79=█
set a80=█
set a81=█
set a82=░
set a83=░
set a84=░
set a85=░
set a86=█
set a87=#
set a88=░
set a89=█
set a90=█
set a91=█
set a92=█
set a93=█
set a94=█
set a95=█
set a96=█
set a97=█
set a98=█
set a99=█
set a100=█
if %switch%==1 set a75=░
goto :eof

:win
mode con lines=10 cols=22
cls
echo     You have won^^!
echo     .............
ping localhost -n 2 1000 > nul
echo     Press any key
echo    to exit the app.
pause>nul