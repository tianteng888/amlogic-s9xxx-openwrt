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
echo "CONFIG_PACKAGE_luci-app-docker" =y .config
echo "CONFIG_PACKAGE_luci-app-store=y" >> .config
echo "CONFIG_PACKAGE_luci-compat=y" >> .config
echo "CONFIG_PACKAGE_luci-lib-ipkg=y" >> .config
echo "CONFIG_PACKAGE_luci-app-fileassistant=y >> .config
echo "CONFIG_PACKAGE_luci-lib-fs"=y >> .config
echo "CONFIG_PACKAGE_curl"=y >> .config
echo "CONFIG_PACKAGE_curl"=y >> .config
echo "CONFIG_PACKAGE_wget-ssl"=y .config
# ------------------------------- Other ends -------------------------------
