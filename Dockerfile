FROM zasdfgbnmsystem/basic
RUN yaourt -Syua --noconfirm virtualbox-host-modules-arch
RUN yaourt -Syua --noconfirm xorg xorg-drivers texlive-most zasdfgbnmsystem-desktop
