FROM zasdfgbnmsystem/archlinux-kde

# install packages
COPY yaourt /
USER user
RUN  yaourt -Syua --noconfirm && yaourt -S --noconfirm $(grep '^\w.*' /yaourt)
USER root

# setting up mkinitcpio
RUN sed -i 's/archlinux-kde/desktop/g' /etc/docker-btrfs.json

# setting up services
RUN systemctl enable docker netdata
