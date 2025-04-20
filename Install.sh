echo "Updating..."
pkg update -y > /dev/null 2>&1
pkg upgrade -y > /dev/null 2>&1
echo "installing packages..."
pkg install x11-repo -y > /dev/null 2>&1
pkg install termux-x11-nightly -y > /dev/null 2>&1
pkg install tur-repo -y > /dev/null 2>&1
pkg install pulseaudio -y > /dev/null 2>&1
pkg install proot-distro -y > /dev/null 2>&1
pkg install wget -y > /dev/null 2>&1
pkg install git -y > /dev/null 2>&1
pkg update -y > /dev/null 2>&1
pkg install x11-repo -y > /dev/null 2>&1
pkg install root-repo -y > /dev/null 2>&1
pkg install termux-x11-nightly -y > /dev/null 2>&1
pkg update -y > /dev/null 2>&1
pkg install tsu -y > /dev/null 2>&1
pkg install pulseaudio -y > /dev/null 2>&1



clear
echo "Run the command './install.sh'"
su -c 'curl -o install.sh https://raw.githubusercontent.com/hhddhdi/ArchTermux/main/installsu.sh' > /dev/null 2>&1
su -c 'chmod +x install.sh'
su
