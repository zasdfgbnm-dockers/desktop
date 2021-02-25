FROM zasdfgbnmsystem/desktop-small
RUN yaourt -Sy --noconfirm virtualbox-host-modules-arch
RUN yaourt -Syua --noconfirm xorg xorg-drivers texlive-most zasdfgbnmsystem-desktop
RUN sudo pip install xonsg-tcg

# disable cgroup usage of nvidia docker as a workaround for https://github.com/NVIDIA/libnvidia-container/issues/111#issuecomment-782332657
RUN sed -i 's/#no-cgroups = false/no-cgroups = true/g' /etc/nvidia-container-runtime/config.toml
