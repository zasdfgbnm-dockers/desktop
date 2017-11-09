FROM zasdfgbnmsystem/basic

# setup
COPY yaourt custom_repo.conf /

USER root
RUN cat custom_repo.conf >> /etc/pacman.conf
RUN pacman -Sy --noconfirm archlinuxcn-keyring

# install packages
USER user
RUN yaourt -Syu --noconfirm $(grep '^\w.*' /yaourt)
USER root

# cleanups
RUN yes | pacman -Scc
