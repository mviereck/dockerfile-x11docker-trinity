# x11docker/trinity
# 
# Run trinity desktop environment in docker. 
# Use x11docker to run image. 
# Get x11docker from github: 
#   https://github.com/mviereck/x11docker 
#
# Examples: x11docker --desktop x11docker/trinity
#           x11docker x11docker/trinity konquerer
#
# Options:
# Persistent home folder stored on host with   --home
# Shared host file or folder with              --share PATH
# Hardware acceleration with option            --gpu
# Clipboard sharing with option                --clipboard
# ALSA sound support with option               --alsa
# Pulseaudio sound support with option         --pulseaudio
# Language setting with                        --lang [=$LANG]
# Printing over CUPS with                      --printer
# Webcam support with                          --webcam
#
# See x11docker --help for further options.

FROM debian:buster
 
RUN apt-get update && \
    env DEBIAN_FRONTEND=noninteractive apt-get install -y \
      dbus-x11 \
      procps \
      psmisc && \
    env DEBIAN_FRONTEND=noninteractive apt-get install -y \
      mesa-utils \
      mesa-utils-extra && \
    env DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      xdg-utils \
      xdg-user-dirs \
      menu-xdg \
      mime-support \
      desktop-file-utils

# Language/locale settings
# replace en_US by your desired locale setting, 
# for example de_DE for german.
ENV LANG en_US.UTF-8
RUN echo $LANG UTF-8 > /etc/locale.gen && \
    env DEBIAN_FRONTEND=noninteractive apt-get install -y \
      locales && \
    update-locale --reset LANG=$LANG

# Trinity desktop sources list
RUN echo " \n\
deb http://mirror.ppa.trinitydesktop.org/trinity/deb/trinity-sb buster deps-r14 main-r14 \n\
deb-src http://mirror.ppa.trinitydesktop.org/trinity/deb/trinity-sb buster deps-r14 main-r14 \n\
" >/etc/apt/sources.list.d/trinity.list && \
    env DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends wget && \
    wget http://mirror.ppa.trinitydesktop.org/trinity/deb/trinity-keyring.deb && \
    apt-get install -y ./trinity-keyring.deb && \
    apt-get update

# Trinity desktop installation.
RUN env DEBIAN_FRONTEND=noninteractive apt-get install -y tde-trinity

ENV PATH="/opt/trinity/bin:$PATH"

CMD ["starttde"]
