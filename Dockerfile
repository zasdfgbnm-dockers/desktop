FROM zasdfgbnmsystem/archlinux-kde

# install packages
USER root
COPY yaourt pacman install_netdata_nv_plugin.sh /
COPY dockersh /usr/bin/
RUN  pacman -Syu --noconfirm && pacman -S --noconfirm $(grep '^\w.*' /pacman)
USER user
RUN  yaourt -Syua --noconfirm || true
RUN for i in $(grep '^\w.*' /yaourt); do yaourt -S --noconfirm $i || true; done
USER root

# install netdata_nv_plugin
RUN /install_netdata_nv_plugin.sh

# system settings
RUN sed -i 's/archlinux-kde/desktop/g' /etc/docker-btrfs.json
RUN echo 'fs.inotify.max_user_watches=524288' > /etc/sysctl.d/inotify.conf

# setting up services
RUN systemctl enable docker netdata libvirtd
RUN pip install xonsh-docker-tabcomplete xonsh-vox-tabcomplete

COPY sddm.conf /etc/sddm.conf
COPY qemu.conf /etc/libvirt