# x11docker/trinity

Trinity desktop environment based on debian jessie. Trinity is the successor of KDE 3. 
 - Run Trinity desktop in docker.
 - Use x11docker to run image to run GUI applications and desktop environments in docker images.
 - Get [x11docker from github](https://github.com/mviereck/x11docker)

# Example commands
 - Single application: `x11docker x11docker/trinity konquerer`
 - Full desktop: `x11docker --desktop x11docker/trinity` 
 
# Additional options
 - You can add hardware acceleration with option `--gpu`
 - You can create a persistent home folder with option `--home`
 - You can share clipboard with host with option `--clipboard`
 - See `x11docker --help` for further options.
 
# Extend base image
This image contains a lot of standard applications; more are available in [Trinity repository](http://ftp.fau.de/trinity/trinity-r14.0.0/debian/pool/main/). To add further desired applications, create your own Dockerfile based on `x11docker/trinity`. Example:
```
# Trinity with kaffeine
FROM x11docker/trinity
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y kaffeine-trinity
```

 # Screenshot
 Trinity desktop in a Weston window running with x11docker:
 
 ![screenshot](https://raw.githubusercontent.com/mviereck/x11docker/screenshots/screenshot-trinity.png "Trinity desktop running in Weston window using x11docker")
 

