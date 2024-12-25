#!/bin/bash
# Mod By SL
#echo "$crot    ALL=(ALL:ALL) ALL" >> /etc/sudoers;

# Mengunduh file konfigurasi sshd
wget -qO- -O /etc/ssh/sshd_config https://raw.githubusercontent.com/tabraklari/rootvps/refs/heads/master/sshd_config
# Restart layanan SSH
systemctl restart sshd

# Clear screen
clear

# Meminta password
echo -e "Masukkan Password:"
read -e pwe

# Mengubah password root menggunakan crypt
usermod -p "$(perl -e "print crypt('$pwe', 'Q4')")" root

# Clear screen
clear

# Menampilkan informasi akun
printf "Mohon Simpan Informasi Akun VPS Ini\n"
printf "===========================================\n"
printf "Akun Root (Akun Utama)\n"
printf "Ip address = $(curl -Ls http://ipinfo.io/ip)\n"
printf "Username   = root\n"
printf "Password   = $pwe\n"
printf "===========================================\n\n"

# Keluar dari skrip
exit

