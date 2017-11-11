# x11docker/trinity
# 
# Run trinity desktop environment in docker. 
# Use x11docker to run image. 
# Get x11docker from github: 
#   https://github.com/mviereck/x11docker 
#
# Examples: x11docker --desktop x11docker/trinity
#           x11docker x11docker/trinity konquerer

FROM debian:jessie

RUN apt-get        update
RUN apt-get install -y apt-utils dbus-x11

# OpenGL support
RUN apt-get install -y libxv1 mesa-utils mesa-utils-extra libgl1-mesa-glx \
                       libglu1-mesa libgl1-mesa-dri libdrm2 libgles2-mesa libegl1-mesa

# Language/locale settings
ENV LANG=en_US.UTF-8
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
RUN echo "LANG=en_US.UTF-8" > /etc/default/locale
RUN apt-get install -y locales

# some utils to have proper menus, mime file types etc.
RUN apt-get install -y --no-install-recommends xdg-utils xdg-user-dirs
RUN apt-get install -y menu menu-xdg mime-support desktop-file-utils desktop-base

ENV DEBIAN_FRONTEND noninteractive

# Trinity desktop
RUN echo " \n\
deb http://mirror.ppa.trinitydesktop.org/trinity/trinity-r14.0.0/debian jessie main\n\
deb-src http://mirror.ppa.trinitydesktop.org/trinity/trinity-r14.0.0/debian jessie main\n\
deb http://mirror.ppa.trinitydesktop.org/trinity/trinity-builddeps-r14.0.0/debian jessie main\n\
deb-src http://mirror.ppa.trinitydesktop.org/trinity/trinity-builddeps-r14.0.0/debian jessie main \n\
" >/etc/apt/sources.list.d/trinity.list
RUN apt-get install -y gnupg
RUN apt-key adv --keyserver keyserver.quickbuild.io --recv-keys F5CFC95C
RUN apt-get update
RUN apt-get install -y --no-install-recommends tde-core-trinity

# create startscript 
RUN echo '#! /bin/bash\n\
[ -e "$HOME/.config" ] || cp -R /etc/skel/. $HOME/ \n\
starttde \n\
' > /usr/local/bin/start 
RUN chmod +x /usr/local/bin/start 

ENV PATH="/opt/trinity/bin:$PATH"
CMD start
