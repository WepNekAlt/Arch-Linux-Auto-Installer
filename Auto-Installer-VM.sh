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

ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc
nano /etc/locale.gen
locale-gen
echo KEYMAP=br-abnt2 >> /etc/vconsole.conf

hostnamectl set-hostname nomedoseuhost
passwd
useradd -m -g users -G wheel,storage,power -s /bin/bash gabriel
passwd gabriel

pacman -Sy dosfstools os-prober mtools network-manager-applet networkmanager wpa_supplicant
dialog

pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=Arch --recheck
grub-mkconfig -o /boot/grub/grub.cfg
reboot
