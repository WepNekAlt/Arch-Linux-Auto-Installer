cfdisk
mkfs.fat -F32 /dev/vda1 
mkfs.ext4 /dev/vda2  

mount /dev/vda2 /mnt  
mkdir /mnt/boot
mount /dev/vda1 /mnt/boot/  

pacman-key --init 
pacman-key --populate  
pacstrap /mnt base base-devel linux linux-firmware nano vim dhcpcd  

genfstab -U -p /mnt >> /mnt/etc/fstab  
 
arch-chroot /mnt


