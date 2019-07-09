# x11docker/trinity

Trinity desktop environment based on Debian. Trinity is the successor of KDE 3. 
 - Run Trinity desktop in docker.
 - Use x11docker to run GUI applications and desktop environments in docker images. 
 - Get [x11docker from github](https://github.com/mviereck/x11docker)

# Command examples: 
 - Single application: `x11docker x11docker/trinity konquerer`
 - Full desktop: `x11docker --desktop x11docker/trinity`

# Options:
 - Persistent home folder stored on host with   `--home`
 - Share host files with                        `--share PATH`
 - Hardware acceleration with option            `--gpu`
 - Clipboard sharing with option                `--clipboard`
 - Sound support with option                    `--alsa`
 - With pulseaudio in image, sound support with `--pulseaudio`
 - Language locale settings with                `--lang [=$LANG]`

Look at `x11docker --help` for further options.
 
# Extend base image
This image contains a lot of standard applications; more are available in [Trinity repository](http://ftp.fau.de/trinity/trinity-r14.0.0/debian/pool/main/). To add further desired applications, create your own Dockerfile based on `x11docker/trinity`. Example:
```
# Trinity with kaffeine, vlc and pulseaudio
FROM x11docker/trinity
RUN apt-get update
RUN apt-get install -y kaffeine-trinity vlc pulseaudio
```

 # Screenshot
 Trinity desktop in a Weston window running with x11docker:
 
 ![screenshot](https://raw.githubusercontent.com/mviereck/x11docker/screenshots/screenshot-trinity.png "Trinity desktop running in Weston window using x11docker")
 

