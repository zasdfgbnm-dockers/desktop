FROM zasdfgbnmsystem/desktop-small
COPY PKGBUILD /zasdfgbnmsystem-desktop/PKGBUILD
RUN yaourt -P -i --noconfirm /zasdfgbnmsystem-desktop
