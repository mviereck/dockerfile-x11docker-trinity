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
# You can add hardware acceleration with option --gpu
# You can create a persistent home folder with option --home
# You can share clipboard with host with option --clipboard
# See x11docker --help for further options.

FROM debian:jessie
ENV DEBIAN_FRONTEND noninteractive

# Language/locale settings
ENV LANG=en_US.UTF-8
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    echo "LANG=en_US.UTF-8" > /etc/default/locale

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y apt-utils dbus-x11 locales \
            mesa-utils mesa-utils-extra libxv1

# some utils to have proper menus, mime file types etc.
RUN apt-get install -y --no-install-recommends xdg-utils xdg-user-dirs \
            menu menu-xdg mime-support desktop-file-utils desktop-base

# Trinity desktop sources list
RUN echo " \n\
deb http://mirror.ppa.trinitydesktop.org/trinity/trinity-r14.0.0/debian jessie main\n\
deb-src http://mirror.ppa.trinitydesktop.org/trinity/trinity-r14.0.0/debian jessie main\n\
deb http://mirror.ppa.trinitydesktop.org/trinity/trinity-builddeps-r14.0.0/debian jessie main\n\
deb-src http://mirror.ppa.trinitydesktop.org/trinity/trinity-builddeps-r14.0.0/debian jessie main \n\
" >/etc/apt/sources.list.d/trinity.list

# Trinity desktop installation. Remove tde-trinity to get tde-core-trinity only
RUN apt-get install -y gnupg && \
    apt-key adv --keyserver keyserver.quickbuild.io --recv-keys F5CFC95C && \
    apt-get update && \
    apt-get install -y --no-install-recommends tde-core-trinity && \
    apt-get install -y --no-install-recommends tde-trinity

# create startscript 
RUN echo '#! /bin/bash\n\
[ -e "$HOME/.config" ] || cp -R /etc/skel/. $HOME/ \n\
exec starttde \n\
' > /usr/local/bin/start 
RUN chmod +x /usr/local/bin/start 

ENV PATH="/opt/trinity/bin:$PATH"
CMD start
