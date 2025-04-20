#!/bin/bash

# Encerra processos do Termux X11 (caso estejam rodando)
pkill -f com.termux.x11
killall -9 termux-x11 Xwayland pulseaudio virgl_test_server_android termux-wake-lock

# Configuração do ambiente
sudo busybox mount --bind $PREFIX/tmp /data/local/tmp/chrootarch/tmp
sudo chmod -R 1777 /data/data/com.termux/files/usr/tmp

# Inicia o PipeWire (substitui o PulseAudio)
XDG_RUNTIME_DIR=${TMPDIR} pipewire &
XDG_RUNTIME_DIR=${TMPDIR} pipewire-pulse &
XDG_RUNTIME_DIR=${TMPDIR} wireplumber &

# Inicia o servidor VirGL (se necessário)
virgl_test_server_android &

# Inicia o WayVNC (substituindo o Termux X11)
sleep 3
XDG_RUNTIME_DIR=${TMPDIR} wayvnc -r 1920x1080 :0 &

# Inicia o ambiente Arch Linux
su -c "sh /data/local/tmp/start_arch.sh"
