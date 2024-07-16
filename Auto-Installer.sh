cfdisk
mkfs.fat -F32 /dev/sda1 
mkfs.ext4 /dev/sda2  

mount /dev/sda2 /mnt  
mkdir /mnt/boot
mkdir /mnt/boot/efi
mount /dev/sda1 /mnt/boot/  

pacman-key --init 
pacman-key --populate  
pacstrap /mnt base base-devel linux linux-firmware nano vim dhcpcd  

genfstab -U -p /mnt >> /mnt/etc/fstab  
 
arch-chroot /mnt
