@echo off
for %%i in ("C:\ti\openocd_tool\image\*.hex") do (
    set FileName=%%~nxi
)
echo,%FileName%
pause