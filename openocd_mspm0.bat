@echo off

setlocal
set workdir=%CD%
set path=%workdir%\cygwin64\bin;%path%
rem set path=C:\cygwin64\bin;%path%
echo %path%
set workdirpath=%workdir:\=/%
set tclpath=%workdir%\tcl
for %%i in ("%workdirpath%\image\*.hex") do (
    set FileName=%%~nxi
)

cd %tclpath%
@echo on
%workdir%\openocd.exe ^
-f %tclpath%\interface\xds110.cfg ^
-f %tclpath%\board\ti_mspm0_launchpad.cfg ^
-c "init" ^
-c "flash info 1" ^
-c "halt" ^
-c "flash protect 1 0 last off" ^
-c "flash erase_sector 1 0 last" ^
-c "program %workdirpath%/image/%FileName%" ^
-c "reset" ^
-c "exit"
pause