rem @echo off
setlocal
set workdir=%CD%
set path=%workdir%\openocd_tool\cygwin64\bin;%path%
set workdirpath=%workdir:\=/%
set tclpath=%workdir%\openocd_tool\tcl

cd %tclpath%
@echo on
%workdir%\openocd_tool\openocd.exe ^
-f %tclpath%\interface\xds110.cfg ^
-f %tclpath%\board\ti_mspm0_launchpad.cfg ^
-c "init" ^
-c "halt" ^
-c "flash protect 1 0 last off" ^
-c "flash erase_sector 1 0 last" ^
-c "reset" ^
-c "exit"
pause