#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt
# Function: Diy script (Before Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/immortalwrt/immortalwrt / Branch: master
#========================================================================================================================

# Add a feed source
sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
sed -i '$a src-git lienol https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '$a src-git lienol https://github.com/zwrt/openwrt-packages' feeds.conf.default
sed -i '$a src-git lienol https://github.com/openwrt/packages' feeds.conf.default
sed -i '$a src-git lienol https://github.com/NueXini/NueXini_Packages' feeds.conf.default
sed -i '$a src-git lienol http://downloads.openwrt.org/releases/24.10.0/packages/aarch64_cortex-a53/packages/' feeds.conf.default
sed -i '$a src-git lienol https://mirrors.tuna.tsinghua.edu.cn/openwrt/releases/24.10.0/packages/aarch64_cortex-a53/packages/' feeds.conf.default
echo >> feeds.conf.default
echo 'src-git istore https://github.com/linkease/istore;main' >> feeds.conf.default

# 添加 iStore 官方仓库
echo 'src-git istore https://github.com/linkease/istore.git;main' >> feeds.conf.default

# other
# rm -rf package/emortal/{autosamba,ipv6-helper}


