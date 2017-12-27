FROM zasdfgbnmsystem/archlinux-kde

# install packages
COPY yaourt /
USER user
RUN  yaourt -Syua --noconfirm && yaourt -S --noconfirm $(grep '^\w.*' /yaourt)
USER root

# setting up mkinitcpio
RUN sed -i 's/archlinux\/base/zasdfgbnmsystem\/desktop/g' /etc/docker-btrfs.json
RUN perl -i -p -e 's/(?<=^HOOKS=\()(.*)(?=\))/$1 docker-btrfs/g' /etc/mkinitcpio.conf

# setting up sshd
RUN sed -i 's/.*PasswordAuthentication .*/PasswordAuthentication no/g' /etc/ssh/sshd_config

# setting up services
RUN systemctl enable sshd docker sddm netdata

# clean up
RUN rm /boot/*.img

# copy gen_boot
COPY gen_boot /usr/bin

# allow running as xsession
COPY startkde /
CMD [ "dbus-launch", "--exit-with-session", "/startkde" ]
