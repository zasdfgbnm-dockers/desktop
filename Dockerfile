FROM zasdfgbnmsystem/desktop-small
RUN sudo -u user yaourt -S --noconfirm texlive-most cuda cudnn kde-applications-meta slack-desktop
