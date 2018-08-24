#!/bin/sh
ZFS=/usr/bin/zfs
ZPOOL=/usr/bin/zpool
RM=/usr/bin/rm
CP=/usr/bin/cp
REFLC=/usr/bin/reflector
PAC=/usr/bin/pacman

##Old Stable

$ZFS destroy -R zroot/ROOT/default@oldstable
$ZFS rename zroot/ROOT/default@stable zroot/ROOT/default@oldstable
$ZFS rename zroot/ROOT/STABLE zroot/ROOT/OLDSTABLE
$CP /boot/vmlinuz-linux-stable /boot/vmlinuz-linux-oldstable
$CP /boot/initramfs-linux-stable.img /boot/initramfs-linux-oldstable.img

##Stable
ZFS snapshot zroot/ROOT/default@stable
$ZFS clone zroot/ROOT/default@stable zroot/ROOT/STABLE
$ZFS set canmount=noauto zroot/ROOT/STABLE
$ZFS set mountpoint=/ zroot/ROOT/STABLE
$CP /boot/vmlinuz-linux /boot/vmlinuz-linux-stable
$CP /boot/initramfs-linux.img /boot/initramfs/linux-stable.img

##Update System

$REFLC -l 5 -p https --sort rate --save /etc/pacman.d/mirrorlist
$PAC -Syu

#Log

$ZFS snapshot zroot/ROOT/default@upgrade
$DATE >> var/log/upgrade/upgrade.log
$ZFS diff zroot/ROOT/default@stable zroot/ROOT/default@upgrade >> /varr/log/upgrade/upgrade.log
$ZFS destroy zroot/ROOT/default@upgrade
