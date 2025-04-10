#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt
# Function: Diy script (After Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/immortalwrt/immortalwrt / Branch: master
#========================================================================================================================

# ------------------------------- Main source started -------------------------------
# Add the default password for the 'root' user
sed -i 's/root:::0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.::0:99999:7:::/g' package/base-files/files/etc/shadow

# Set etc/openwrt_release
sed -i "s|DISTRIB_REVISION='.*'|DISTRIB_REVISION='R$(date +%Y.%m.%d)'|g" package/base-files/files/etc/openwrt_release
echo "DISTRIB_SOURCECODE='immortalwrt'" >>package/base-files/files/etc/openwrt_release

# ------------------------------- Main source ends -------------------------------

# ------------------------------- Other started -------------------------------

# Add luci-app-amlogic
rm -rf package/luci-app-amlogic
git clone https://github.com/ophub/luci-app-amlogic.git package/luci-app-amlogic

git clone https://github.com/linkease/istore.git package/istore
git clone https://github.com/linkease/istore-ui.git package/istore-ui
git clone https://github.com/linkease/nas-packages.git package/nas-packages
git clone https://github.com/linkease/nas-packages-luci.git package/nas-packages-luci

# Enable BBR network acceleration
echo "net.ipv4.tcp_congestion_control=bbr" >> package/base-files/files/etc/sysctl.conf
sysctl -p

# Enable additional software packages and kernel modules
# ------------------------------- Other started -------------------------------

# Clean up existing duplicate entries in .config
sed -i '/CONFIG_PACKAGE_MINIDLNA/d' .config
sed -i '/CONFIG_PACKAGE_F2FS_TOOLS/d' .config
sed -i '/CONFIG_KERNEL_F2FS_FS/d' .config
sed -i '/CONFIG_PACKAGE_SAMBA4_SERVER/d' .config
sed -i '/CONFIG_PACKAGE_SAMBA4_CLIENT/d' .config
sed -i '/CONFIG_PACKAGE_QOS/d' .config
sed -i '/CONFIG_PACKAGE_IPERF3/d' .config
sed -i '/CONFIG_PACKAGE_HTTPS_DNS_PROXY/d' .config
sed -i '/CONFIG_PACKAGE_HTOP/d' .config
sed -i '/CONFIG_KERNEL_OVERLAY_FS/d' .config
sed -i '/CONFIG_PACKAGE_firewall4-fullconenat/d' .config
sed -i '/CONFIG_PACKAGE_luci-app-docker/d' .config
sed -i '/CONFIG_PACKAGE_luci-app-store/d' .config
sed -i '/CONFIG_PACKAGE_luci-compat/d' .config
sed -i '/CONFIG_PACKAGE_luci-lib-ipkg/d' .config
sed -i '/CONFIG_PACKAGE_luci-app-fileassistant/d' .config
sed -i '/CONFIG_PACKAGE_luci-lib-fs/d' .config
sed -i '/CONFIG_PACKAGE_curl/d' .config
sed -i '/CONFIG_PACKAGE_wget-ssl/d' .config
sed -i '/CONFIG_PACKAGE_attendedsysupgrade-common/d' .config
sed -i '/CONFIG_PACKAGE_autocore/d' .config
sed -i '/CONFIG_PACKAGE_automount/d' .config
sed -i '/CONFIG_PACKAGE_kmod-phy-realtek/d' .config
sed -i '/CONFIG_PACKAGE_kmod-siit/d' .config
sed -i '/CONFIG_PACKAGE_libltdl/d' .config
sed -i '/CONFIG_PACKAGE_luci-app-acme/d' .config
sed -i '/CONFIG_PACKAGE_luci-app-adblock-fast/d' .config
sed -i '/CONFIG_PACKAGE_luci-app-advanced-reboot/d' .config
sed -i '/CONFIG_PACKAGE_luci-app-attendedsysupgrade/d' .config
sed -i '/CONFIG_PACKAGE_luci-app-commands/d' .config
sed -i '/CONFIG_PACKAGE_luci-app-filebrowser/d' .config
sed -i '/CONFIG_PACKAGE_luci-app-irqbalance/d' .config
sed -i '/CONFIG_PACKAGE_luci-app-openclash/d' .config
sed -i '/CONFIG_PACKAGE_luci-app-ser2net/d' .config
sed -i '/CONFIG_PACKAGE_luci-app-siitwizard/d' .config
sed -i '/CONFIG_PACKAGE_luci-app-softether/d' .config
sed -i '/CONFIG_PACKAGE_luci-app-statistics/d' .config
sed -i '/CONFIG_PACKAGE_luci-app-tor/d' .config
sed -i '/CONFIG_PACKAGE_luci-theme-argon/d' .config

# Add the necessary configuration lines to .config
echo "CONFIG_PACKAGE_MINIDLNA=y" >> .config
echo "CONFIG_PACKAGE_F2FS_TOOLS=y" >> .config
echo "CONFIG_KERNEL_F2FS_FS=y" >> .config
echo "CONFIG_PACKAGE_SAMBA4_SERVER=y" >> .config
echo "CONFIG_PACKAGE_SAMBA4_CLIENT=y" >> .config
echo "CONFIG_PACKAGE_QOS=y" >> .config
echo "CONFIG_PACKAGE_IPERF3=y" >> .config
echo "CONFIG_PACKAGE_HTTPS_DNS_PROXY=y" >> .config
echo "CONFIG_PACKAGE_HTOP=y" >> .config
echo "CONFIG_KERNEL_OVERLAY_FS=y" >> .config
echo "CONFIG_PACKAGE_firewall4-fullconenat=y" >> .config
echo "CONFIG_PACKAGE_luci-app-docker=y" >> .config
echo "CONFIG_PACKAGE_luci-app-store=y" >> .config
echo "CONFIG_PACKAGE_luci-compat=y" >> .config
echo "CONFIG_PACKAGE_luci-lib-ipkg=y" >> .config
echo "CONFIG_PACKAGE_luci-app-fileassistant=y" >> .config
echo "CONFIG_PACKAGE_luci-lib-fs=y" >> .config
echo "CONFIG_PACKAGE_curl=y" >> .config
echo "CONFIG_PACKAGE_wget-ssl=y" >> .config
echo "CONFIG_PACKAGE_attendedsysupgrade-common=y" >> .config
echo "CONFIG_PACKAGE_autocore=y" >> .config
echo "CONFIG_PACKAGE_automount=y" >> .config
echo "CONFIG_PACKAGE_kmod-phy-realtek=y" >> .config
echo "CONFIG_PACKAGE_kmod-siit=y" >> .config
echo "CONFIG_PACKAGE_libltdl=y" >> .config
echo "CONFIG_PACKAGE_luci-app-acme=y" >> .config
echo "CONFIG_PACKAGE_luci-app-adblock-fast=y" >> .config
echo "CONFIG_PACKAGE_luci-app-advanced-reboot=y" >> .config
echo "CONFIG_PACKAGE_luci-app-attendedsysupgrade=y" >> .config
echo "CONFIG_PACKAGE_luci-app-commands=y" >> .config
echo "CONFIG_PACKAGE_luci-app-filebrowser=y" >> .config
echo "CONFIG_PACKAGE_luci-app-irqbalance=y" >> .config
echo "CONFIG_PACKAGE_luci-app-openclash=y" >> .config
echo "CONFIG_PACKAGE_luci-app-ser2net=y" >> .config
echo "CONFIG_PACKAGE_luci-app-siitwizard=y" >> .config
echo "CONFIG_PACKAGE_luci-app-softether=y" >> .config
echo "CONFIG_PACKAGE_luci-app-statistics=y" >> .config
echo "CONFIG_PACKAGE_luci-app-tor=y" >> .config
echo "CONFIG_PACKAGE_luci-theme-argon=y" >> .config
# ------------------------------- Other ends -------------------------------


# 更新并安装 iStore
./scripts/feeds update istore
./scripts/feeds install -p istore luci-compat
./scripts/feeds install -d y -p istore luci-app-store
