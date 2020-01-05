FROM zasdfgbnmsystem/desktop-small
RUN sudo pacman -S --noconfirm $(grep '^\w.*' /pacman)
