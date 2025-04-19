# Su terminal
cd /data/local/tmp
wget http://os.archlinuxarm.org/os/ArchLinuxARM-aarch64-latest.tar.gz
mkdir chrootarch
cd chrootarch

tar xvf /data/local/tmp/ArchLinuxARM-aarch64-latest.tar.gz --numeric-owner

mkdir media
mkdir media/sdcard
mkdir dev/shm


echo -e "# Content\nnameserver 8.8.8.8\nnameserver 8.8.4.4" > resolv.conf
mv -vf resolv.conf etc/resolv.conf

echo -e "# Content\n127.0.0.1 localhost" > hosts
mv -vf hosts etc/hosts



cd /data/local/tmp

echo -e '#!/bin/sh\nmnt="/data/local/tmp/chrootarch"\nbusybox mount -o remount,dev,suid /data\nmount -o bind /dev $mnt/dev/\nbusybox mount -t proc proc $mnt/proc/\nbusybox mount -t sysfs sysfs $mnt/sys/\nbusybox mount -t devpts devpts $mnt/dev/pts/\nbusybox mount -o bind /sdcard $mnt/media/sdcard\nbusybox mount -t tmpfs /cache $mnt/var/cache\n# /dev/shm for Electron apps\nbusybox mount -t tmpfs -o size=256M tmpfs $mnt/dev/shm\n# chroot into Arch\nbusybox chroot $mnt /bin/su - root' > start_arch.sh



chmod +x start_arch.sh
sh start_arch.sh
