#!/bin/sh

# 设置目标目录
DEST_DIR="/usr/share/v2ray"

# 下载和更新 geoip.dat 文件
GEOIP_URL="https://raw.githubusercontent.com/Loyalsoldier/geoip/release/geoip-only-cn-private.dat"
wget -O "$DEST_DIR/geoip.dat.tmp" $GEOIP_URL
if [ -f "$DEST_DIR/geoip.dat.tmp" ]; then
    mv -f "$DEST_DIR/geoip.dat.tmp" "$DEST_DIR/geoip.dat"
    echo "geoip.dat downloaded and updated."
else
    echo "Failed to download geoip.dat."
fi

# 下载和更新 geosite.dat 文件
GEOSITE_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat"
wget -O "$DEST_DIR/geosite.dat.tmp" $GEOSITE_URL
if [ -f "$DEST_DIR/geosite.dat.tmp" ]; then
    mv -f "$DEST_DIR/geosite.dat.tmp" "$DEST_DIR/geosite.dat"
    echo "geosite.dat downloaded and updated."
else
    echo "Failed to download geosite.dat."
fi
