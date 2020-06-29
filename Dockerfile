FROM zasdfgbnmsystem/basic
RUN yaourt -Syua --noconfirm virtualbox-host-modules-arch
RUN yaourt -Syua --noconfirm xorg xorg-drivers texlive-most zasdfgbnmsystem-desktop
COPY install-cuda11 /
RUN sudo /install-cuda11
