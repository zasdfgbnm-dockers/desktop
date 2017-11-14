FROM zasdfgbnmsystem/archlinux-kde

# setup
COPY yaourt startkde /

# install packages
USER user
RUN yaourt -Syua --noconfirm $(grep '^\w.*' /yaourt)
USER root

# cleanups
RUN yes | pacman -Scc

CMD [ "dbus-launch", "--exit-with-session", "/startkde" ]
