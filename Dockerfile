FROM zasdfgbnmsystem/desktop-small
RUN sudo pacman -Syu --noconfirm virtualbox-host-modules-arch

COPY desktop /usr/local/share/packages/desktop
COPY desktop /tmp/desktop
USER user
RUN sudo chown -R user:user /tmp/desktop
WORKDIR /tmp/desktop
RUN makepkg -p ./PKGBUILD --printsrcinfo | awk '{$1=$1};1' | grep -oP '(?<=^depends = ).*' | xargs yay -Syu --noconfirm
RUN makepkg -i --noconfirm
