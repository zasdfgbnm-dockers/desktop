FROM zasdfgbnmsystem/desktop-small
RUN sudo pacman -Syu --noconfirm virtualbox-host-modules-arch nerd-fonts

# disable cgroup usage of nvidia docker as a workaround for https://github.com/NVIDIA/libnvidia-container/issues/111#issuecomment-782332657
# RUN sudo sed -i 's/#no-cgroups = false/no-cgroups = true/g' /etc/nvidia-container-runtime/config.toml

COPY desktop /usr/local/share/packages/desktop
COPY desktop /tmp/desktop
USER user
RUN sudo chown -R user:user /tmp/desktop
WORKDIR /tmp/desktop
RUN makepkg -p ./PKGBUILD --printsrcinfo | awk '{$1=$1};1' | grep -oP '(?<=^depends = ).*' | xargs yay -Syu --noconfirm
RUN makepkg -i --noconfirm
