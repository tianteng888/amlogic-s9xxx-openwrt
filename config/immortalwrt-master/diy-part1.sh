#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt
# Function: Diy script (Before Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/immortalwrt/immortalwrt / Branch: master
#========================================================================================================================
sed -i '/lienol/d' feeds.conf.default

# 添加 lienol 源，避免重复
add_feed() {
    local feed_url=$1
    local feed_name=$2
    if ! grep -q "$feed_name" feeds.conf.default; then
        echo "src-git $feed_name $feed_url" >> feeds.conf.default
    fi
}

# 添加 lienol 源
add_feed "https://github.com/Lienol/openwrt-package" "lienol"
add_feed "https://github.com/kenzok8/openwrt-packages" "lienol"
add_feed "https://github.com/zwrt/openwrt-packages" "lienol"
add_feed "https://github.com/openwrt/packages" "lienol"
add_feed "https://github.com/NueXini/NueXini_Packages" "lienol"
add_feed "http://downloads.openwrt.org/releases/24.10.0/packages/aarch64_cortex-a53/packages/" "lienol"
add_feed "https://mirrors.tuna.tsinghua.edu.cn/openwrt/releases/24.10.0/packages/aarch64_cortex-a53/packages/" "lienol"

# 添加 iStore 官方仓库
add_feed "https://github.com/linkease/istore"

# 其他
# rm -rf package/emortal/{autosamba,ipv6-helper}
rm -rf feeds/lienol/luci-app-nginx-pingos
