FROM zasdfgbnmsystem/desktop-small
RUN yaourt -Sy --noconfirm virtualbox-host-modules-arch
RUN yaourt -Syua --noconfirm xorg xorg-drivers texlive-most zasdfgbnmsystem-desktop
RUN xpip install xonsg-tcg
