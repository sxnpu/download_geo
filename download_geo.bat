@echo off
setlocal

set "DEST_DIR=%~dp0"
set "GEOIP_URL=https://mirror.ghproxy.com/https://github.com/MetaCubeX/meta-rules-dat/releases/download/latest/geoip-lite.dat"
set "GEOSITE_URL=https://mirror.ghproxy.com/https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat"

echo Downloading geoip.dat...
powershell -Command "Invoke-WebRequest -Uri '%GEOIP_URL%' -OutFile '%DEST_DIR%geoip.dat.tmp'"

:: 检查文件大小，1KB=1024字节，150KB=153600字节
set "MIN_SIZE=153600"
for /f "usebackq" %%A in (`powershell -Command "(Get-Item '%DEST_DIR%geoip.dat.tmp').length"`) do set "ACTUAL_SIZE=%%A"

if %ACTUAL_SIZE% geq %MIN_SIZE% (
    echo File size is sufficient, updating geoip.dat.
    move /Y "%DEST_DIR%geoip.dat.tmp" "%DEST_DIR%geoip.dat"
) else (
    echo Downloaded geoip.dat is too small, not updating.
    del "%DEST_DIR%geoip.dat.tmp"
)

echo Downloading geosite.dat...
powershell -Command "Invoke-WebRequest -Uri '%GEOSITE_URL%' -OutFile '%DEST_DIR%geosite.dat'"

echo Download complete.
endlocal
