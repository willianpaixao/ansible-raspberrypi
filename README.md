# ansible-raspberrypi

[![pipeline status](https://gitlab.com/willianpaixao/ansible-raspberrypi/badges/master/pipeline.svg)](https://gitlab.com/willianpaixao/ansible-raspberrypi/commits/master)

[[_TOC_]]

# Inventory

| hostname       | IP address   | architecture | groups     | services            |
| -------------- | ------------ | ------------ | ---------- | ------------------- |
| logos          | 192.168.0.3  | ARM64        |            |                     |
| mjolnir        | 192.168.0.4  | ARM64        |            |                     |
| vigilant       | 192.168.0.5  | ARMv6        |            |                     |
| icarus         | 192.168.0.7  | ARMv6        |            |                     |
| mnemosyne      | 192.168.0.13 | ARM64        |            |                     |

# Manual

/boot/firmware/config.txt
dtoverlay=disable-bt
dtoverlay=disable-wifi

/boot/firmware/cmdline.txt
usb-storage.quirks=152d:0583:u fsck.mode=force fsck.repair=yes

sudo mkdir /etc/systemd/resolved.conf.d/
mv web3-art-br.conf /etc/systemd/resolved.conf.d/

sudo apt-get purge snapd unattended-upgrades
sudo rm -rfv /var/log/unattended-upgrades

sudo rpi-eeprom-update -d -a

sudo apt-get install linux-modules-extra-raspi
sudo apt-get update && sudo apt-get --yes dist-upgrade && sudo apt-get autoremove && sudo apt-get autoclean

/etc/modprobe.d/disable-uas.conf
options usb-storage quirks=152d:0583:u
