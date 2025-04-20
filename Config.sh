clear
echo Starting autoconfig
sed -i '/^CheckSpace$/s/^/#/' /etc/pacman.conf
rm -r /etc/pacman.d/gnupg > /dev/null 2>&1
pacman-key --init > /dev/null 2>&1
pacman-key --populate archlinuxarm > /dev/null 2>&1
pacman-key --refresh-keys > /dev/null 2>&1

bash -c 'PS3="Select the desired server(Better for Brazil: EUA - Flórida): "; select server in "Padrão (mirror.archlinuxarm.org)" "Dinamarca (dk)" "Alemanha - Aachen (de3)" "Alemanha - Berlin (de)" "Alemanha - Coburg (de4)" "Alemanha - Falkenstein (eu/de5)" "Grécia (gr)" "Hungria (hu)" "Japão (jp)" "Singapura (sg)" "Taiwan - Hsinchu (tw2)" "Taiwan - New Taipei (tw)" "Reino Unido (uk)" "EUA - Califórnia (ca)" "EUA - Flórida (fl)" "EUA - Nova Jersey (nj)"; do case $server in "Padrão"*) new_server="http://mirror.archlinuxarm.org/\$arch/\$repo";; "Dinamarca"*) new_server="http://dk.mirror.archlinuxarm.org/\$arch/\$repo";; "Alemanha - Aachen"*) new_server="http://de3.mirror.archlinuxarm.org/\$arch/\$repo";; "Alemanha - Berlin"*) new_server="http://de.mirror.archlinuxarm.org/\$arch/\$repo";; "Alemanha - Coburg"*) new_server="http://de4.mirror.archlinuxarm.org/\$arch/\$repo";; "Alemanha - Falkenstein"*) new_server="http://eu.mirror.archlinuxarm.org/\$arch/\$repo";; "Grécia"*) new_server="http://gr.mirror.archlinuxarm.org/\$arch/\$repo";; "Hungria"*) new_server="http://hu.mirror.archlinuxarm.org/\$arch/\$repo";; "Japão"*) new_server="http://jp.mirror.archlinuxarm.org/\$arch/\$repo";; "Singapura"*) new_server="http://sg.mirror.archlinuxarm.org/\$arch/\$repo";; "Taiwan - Hsinchu"*) new_server="http://tw2.mirror.archlinuxarm.org/\$arch/\$repo";; "Taiwan - New Taipei"*) new_server="http://tw.mirror.archlinuxarm.org/\$arch/\$repo";; "Reino Unido"*) new_server="http://uk.mirror.archlinuxarm.org/\$arch/\$repo";; "EUA - Califórnia"*) new_server="http://ca.us.mirror.archlinuxarm.org/\$arch/\$repo";; "EUA - Flórida"*) new_server="http://fl.us.mirror.archlinuxarm.org/\$arch/\$repo";; "EUA - Nova Jersey"*) new_server="http://nj.us.mirror.archlinuxarm.org/\$arch/\$repo";; esac; sed -i "/^Server = /c\Server = $new_server" /etc/pacman.d/mirrorlist; echo "Servidor alterado para: $server"; break; done'

groupadd -g 3003 aid_inet > /dev/null 2>&1
groupadd -g 3004 aid_net_raw > /dev/null 2>&1
groupadd -g 1003 aid_graphics > /dev/null 2>&1
usermod -G 3003 -a root > /dev/null 2>&1

pacman -Syu -y > /dev/null 2>&1
pacman -S vim net-tools sudo git -y > /dev/null 2>&1

groupadd storage
groupadd wheel
useradd -m -g users -G wheel,audio,video,storage,aid_inet -s /bin/bash hypr
passwd hypr
sed -i '/^root\s\+ALL=(ALL:ALL) ALL$/a hypr ALL=(ALL:ALL) ALL' /etc/sudoers > /dev/null 2>&1
sed -i 's/^#\(en_US\.UTF-8 UTF-8\)/\1/' /etc/locale.gen > /dev/null 2>&1
locale-gen
