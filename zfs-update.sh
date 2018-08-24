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
$CP /boot/vm-linuz-linux-stable /boot/vmlinuz-linux-oldstable
$CP /boot/initramfs-linux-stable.img /boot/initramfs-linux-oldstable.img

