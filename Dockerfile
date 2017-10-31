FROM base/devel:latest
EXPOSE 0-65535

# setup
COPY yaourt custom_repo.conf /
COPY zshrc /etc/zsh/
RUN cat custom_repo.conf >> /etc/pacman.conf
RUN pacman -Syu --noconfirm sudo yaourt archlinuxcn-keyring
RUN echo "ALL ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN useradd -ms /bin/bash unprivileged

# install packages
USER unprivileged
RUN yaourt -S --noconfirm $(grep '^\w.*' /yaourt)
USER root

# cleanups
RUN yes | pacman -Scc
