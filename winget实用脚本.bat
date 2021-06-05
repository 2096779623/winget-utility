:winget
@echo off
cls
title winget实用脚本 By 2096779623
IF EXIST "C:\Users\Administrator\AppData\Local\Microsoft\WindowsApps\winget.exe" (cls) ELSE (echo 请安装winget！&&pause>nul && exit)
echo ██╗    ██╗    ██╗    ███╗   ██╗     ██████╗     ███████╗    ████████╗
echo ██║    ██║    ██║    ████╗  ██║    ██╔════╝     ██╔════╝    ╚══██╔══╝
echo ██║ █╗ ██║    ██║    ██╔██╗ ██║    ██║  ███╗    █████╗         ██║   
echo ██║███╗██║    ██║    ██║╚██╗██║    ██║   ██║    ██╔══╝         ██║   
echo ╚███╔███╔╝    ██║    ██║ ╚████║    ╚██████╔╝    ███████╗       ██║   
echo  ╚══╝╚══╝     ╚═╝    ╚═╝  ╚═══╝     ╚═════╝     ╚══════╝       ╚═╝  
echo 1.安装软件    2.查看所有软件    3.查找软件    4.卸载软件          
echo 5.查看软件包    6.查看软件版本    7.查看软件ID    8.源相关    9.查看winget版本    10.查看winget常规信息
echo 11.设置winget 12.计算哈希值     13.升级软件   14.导出安装程序列表 15.验证清单文件
set /p wingetinput=请输入你要执行的操作:
if %wingetinput% equ 1 goto wingetinstall
if %wingetinput% equ 2 goto wingetpkgs
if %wingetinput% equ 3 goto wingetfindpkgs
if %wingetinput% equ 4 goto wingetuninstallpkgs
if %wingetinput% equ 5 goto wingetshow
if %wingetinput% equ 6 goto wingetshowver
if %wingetinput% equ 7 goto wingetshowpkgs
if %wingetinput% equ 8 goto wingetsources
if %wingetinput% equ 9 goto wingetshowversion
if %wingetinput% equ 10 goto wingetdeuinfo
if %wingetinput% equ 11 goto wingetsettings
if %wingetinput% equ 12 goto wingetcalchash
if %wingetinput% equ 13 goto wingetupdate
if %wingetinput% equ 14 goto wingetexport
if %wingetinput% equ 15 goto wingetvalidate

:wingetinstall
 @echo off
cls
set /p installname=请输入软件名称:
set /p prolj=是否要指定路径安装软件?(Y/N):
if %propj% equ Y set /p lj=请输入路径: && winget install %installname% -l %lj%
if %propj% equ N echo.
winget install %installname%
pause
cls
goto winget

:wingetpkgs
@echo off
cls
winget search
pause
cls
goto winget

:wingetfubdpkgs
@echo off
cls
set /p find=请输入要查找的软件:
winget search %find%
pause
cls
goto winget

:wingetuninstallpkgs
@echo off
cls
winget uninstall
set /p unname=请输入要卸载的软件包名：
winget uninstall %uname%
pause
cls
goto winget

:wingetshow
@echo off
cls
winget list
pause
cls
goto winget

:wingetshowver
@echo off
cls
set /p pkgname=请输入软件名:
winget show %pkgname%|findstr Version
pause
cls
goto winget

:wingetshowpkgs
@echo off
cls
set /p pkgname=请输入软件名:
winget show --id ""|findstr QQ
pause
cls
goto winget

:wingetsources
@echo off
cls
echo 1.查看当前源
echo 2.添加源
echo 3.更新当前源
echo 4.删除当前源
echo 5.重置源
echo 6.导出当前源
set /p input=请输入你要执行的操作:
if %input% equ 1 winget source list
if %input% equ 2 set /p sourcesname=请输入源名称: && set /p sourcestype-请输入源类型: && winget source add -n %$sourcesname% -t %sourcestype%
if %input% equ 3 winget source update
if %input% equ 4 set /p sourcename=请输入源名称: && winget remove %sourcename%
if %input% equ 5 set /p rename1=请输入源名称: && winget source remove %rename1% --force
if %input% equ 6 winget source export
set /p input1=你还想要执行winget源相关的操作吗?(Y/N):
if %input1% equ Y goto wingetsources
if %input1% equ N goto winget


:wingetshowversion
@echo off
cls
winget -v > %temp%\wingetversion
for /f %%a in (%temp%\wingetversion) do (echo 当前winget版本：%%a)
pause
cls
goto winget

:wingetdeuinfo
@echo off
cls
winget --info
pause
cls
goto winget

:wingetsettings
@echo off
cls
echo 小白请退出此脚本！&pause>nul
winget settings
pause
cls
goto winget

:wingetcalchash
@echo off
cls
set /p lj=请输入文件路径:
set /p msix=是否计算签名哈希?(仅对签名文件有效Y/N):
if %msix% equ Y set /p msixf=请输入msix: && winget hash -f %lj% -m %msixf%
if %msix% equ N winget hash -f %lj%
pause
cls
goto winget

:wingetupdate
@echo off
cls
echo 当前可更新软件:
winget upgrade
set /p pkgname-请输入软件名:
winget upgrade %pkgname%
pause
cls
goto winget

:wingetexport
@echo off
cls
set /p out=请输入导出路径:
winget export -o %out% --include-versions
pause
cls
goto winget

:wingetvalidate
@echo off
cls
set /p lj=请输入待验证的程序清单路径:
winget validate --manifest %lj%
pause
cls
goto winget