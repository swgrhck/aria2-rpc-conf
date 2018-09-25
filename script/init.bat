@echo off & title Aria2 Init
@echo | call check
if errorlevel 1 pause && exit /b %errorlevel%

set src=%cd%\..
set dst=%userprofile%\.aria2\rpc

xcopy %src%\aria2.conf %dst%\ /v /f & echo.
xcopy %src%\script %dst%\script /s /i /v /f & echo.

set files=cookies log serverstat session
for %%s in (%files%) do (
    echo create file %dst%\aria2.%%s
    type nul >> %dst%\aria2.%%s
)

echo.
echo if you want to run aria2 on current user logging, run auto-run.bat please
pause 