FROM archlinux
ARG USER=dotfiletest
ARG HOME=/home/$USER
RUN pacman -Syu --noconfirm \
            wget sudo \
    && find /var/cache/pacman/ -type f -delete
RUN echo "%wheel      ALL=(ALL:ALL) ALL" >> /etc/sudoers
RUN /sbin/useradd -m -G wheel -s /bin/bash $USER && echo "${USER}:Docker!" | chpasswd
USER $USER
WORKDIR $HOME
RUN mkdir .config/
COPY --chown=$USER:$USER . src/

