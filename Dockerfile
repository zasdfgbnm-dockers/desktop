FROM zasdfgbnmsystem/archlinux-kde

# install packages
COPY yaourt /
USER user
RUN yaourt -Syua --noconfirm $(grep '^\w.*' /yaourt)
USER root

COPY startkde /

CMD [ "dbus-launch", "--exit-with-session", "/startkde" ]
