FROM zasdfgbnmsystem/basic

USER root
COPY yaourt pacman install_netdata_nv_plugin.sh /

# do a full upgrade first
RUN pacman -Sy --noconfirm archlinuxcn-keyring archlinux-keyring
RUN sudo -u user yaourt -Syua --noconfirm || true

# install all packages
RUN pacman -S --noconfirm $(grep '^\w.*' /pacman)
RUN for i in $(grep '^\w.*' /yaourt); do yaourt -S --noconfirm $i || true; done

# install netdata_nv_plugin
RUN /install_netdata_nv_plugin.sh

# system settings
RUN systemctl enable libvirtd sddm NetworkManager
RUN sed -i 's/basic/desktop/g' /etc/docker-btrfs.json
RUN echo 'fs.inotify.max_user_watches=524288' > /etc/sysctl.d/inotify.conf

COPY sddm.conf /etc/sddm.conf
COPY qemu.conf /etc/libvirt

USER user
