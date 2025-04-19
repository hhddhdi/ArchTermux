echo "Updating..."
pkg update > /dev/null 2>&1

echo "installing git package..."
pkg install git -y > /dev/null 2>&1

echo "installing wget package..."
pkg install wget -y > /dev/null 2>&1

echo "installing x11 package..."
pkg install x11-repo -y > /dev/null 2>&1

echo "installing root package..."
pkg install root-repo -y > /dev/null 2>&1

echo "installing termux-x11-nightly package..."
pkg install termux-x11-nightly -y > /dev/null 2>&1

echo "Updating again..."
pkg update > /dev/null 2>&1

echo "installing tsu package..."
pkg install tsu -y > /dev/null 2>&1

echo "installing PulseAudio package..."
pkg install pulseaudio -y > /dev/null 2>&1
clear
echo "Run the command "./install.sh””
su -c 'curl -o install.sh https://raw.githubusercontent.com/hhddhdi/ArchTermux/main/installsu.sh' > /dev/null 2>&1
su -c 'chmod +x install.sh'
su
