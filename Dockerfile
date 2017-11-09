FROM zasdfgbnmsystem/basic

# setup
COPY yaourt /

USER root
RUN cat custom_repo.conf >> /etc/pacman.conf
RUN pacman -Syu --noconfirm archlinuxcn-keyring

# install packages
USER user
RUN yaourt -S --noconfirm $(grep '^\w.*' /yaourt)
USER root

# cleanups
RUN yes | pacman -Scc
