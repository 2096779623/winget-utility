:winget
@echo off
cls
title wingetʵ�ýű� By 2096779623
IF EXIST "C:\Users\Administrator\AppData\Local\Microsoft\WindowsApps\winget.exe" (cls) ELSE (echo �밲װwinget��&&pause>nul && exit)
echo �����[    �����[    �����[    �������[   �����[     �������������[     ���������������[    �����������������[
echo �����U    �����U    �����U    ���������[  �����U    �����X�T�T�T�T�a     �����X�T�T�T�T�a    �^�T�T�����X�T�T�a
echo �����U ���[ �����U    �����U    �����X�����[ �����U    �����U  �������[    �����������[         �����U   
echo �����U�������[�����U    �����U    �����U�^�����[�����U    �����U   �����U    �����X�T�T�a         �����U   
echo �^�������X�������X�a    �����U    �����U �^���������U    �^�������������X�a    ���������������[       �����U   
echo  �^�T�T�a�^�T�T�a     �^�T�a    �^�T�a  �^�T�T�T�a     �^�T�T�T�T�T�a     �^�T�T�T�T�T�T�a       �^�T�a  
echo 1.��װ���    2.�鿴�������    3.�������    4.ж�����          
echo 5.�鿴�����    6.�鿴����汾    7.�鿴���ID    8.Դ���    9.�鿴winget�汾    10.�鿴winget������Ϣ
echo 11.����winget 12.�����ϣֵ     13.�������   14.������װ�����б� 15.��֤�嵥�ļ�
set /p wingetinput=��������Ҫִ�еĲ���:
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
set /p installname=�������������:
set /p prolj=�Ƿ�Ҫָ��·����װ���?(Y/N):
if %propj% equ Y set /p lj=������·��: && winget install %installname% -l %lj%
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
set /p find=������Ҫ���ҵ����:
winget search %find%
pause
cls
goto winget

:wingetuninstallpkgs
@echo off
cls
winget uninstall
set /p unname=������Ҫж�ص����������
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
set /p pkgname=�����������:
winget show %pkgname%|findstr Version
pause
cls
goto winget

:wingetshowpkgs
@echo off
cls
set /p pkgname=�����������:
winget show --id ""|findstr QQ
pause
cls
goto winget

:wingetsources
@echo off
cls
echo 1.�鿴��ǰԴ
echo 2.���Դ
echo 3.���µ�ǰԴ
echo 4.ɾ����ǰԴ
echo 5.����Դ
echo 6.������ǰԴ
set /p input=��������Ҫִ�еĲ���:
if %input% equ 1 winget source list
if %input% equ 2 set /p sourcesname=������Դ����: && set /p sourcestype-������Դ����: && winget source add -n %$sourcesname% -t %sourcestype%
if %input% equ 3 winget source update
if %input% equ 4 set /p sourcename=������Դ����: && winget remove %sourcename%
if %input% equ 5 set /p rename1=������Դ����: && winget source remove %rename1% --force
if %input% equ 6 winget source export
set /p input1=�㻹��Ҫִ��wingetԴ��صĲ�����?(Y/N):
if %input1% equ Y goto wingetsources
if %input1% equ N goto winget


:wingetshowversion
@echo off
cls
winget -v > %temp%\wingetversion
for /f %%a in (%temp%\wingetversion) do (echo ��ǰwinget�汾��%%a)
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
echo С�����˳��˽ű���&pause>nul
winget settings
pause
cls
goto winget

:wingetcalchash
@echo off
cls
set /p lj=�������ļ�·��:
set /p msix=�Ƿ����ǩ����ϣ?(����ǩ���ļ���ЧY/N):
if %msix% equ Y set /p msixf=������msix: && winget hash -f %lj% -m %msixf%
if %msix% equ N winget hash -f %lj%
pause
cls
goto winget

:wingetupdate
@echo off
cls
echo ��ǰ�ɸ������:
winget upgrade
set /p pkgname-�����������:
winget upgrade %pkgname%
pause
cls
goto winget

:wingetexport
@echo off
cls
set /p out=�����뵼��·��:
winget export -o %out% --include-versions
pause
cls
goto winget

:wingetvalidate
@echo off
cls
set /p lj=���������֤�ĳ����嵥·��:
winget validate --manifest %lj%
pause
cls
goto winget