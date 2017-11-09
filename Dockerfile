FROM zasdfgbnmsystem/archlinux-kde

# setup
COPY yaourt /

# install packages
USER user
RUN yaourt -Syua --noconfirm $(grep '^\w.*' /yaourt)
USER root

# cleanups
RUN yes | pacman -Scc
