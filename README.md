# x11docker/trinity

Full Trinity desktop environment on debian jessie. Trinity is the successor of KDE 3.
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

 # Screenshot
 Trinity desktop in a Weston window running with x11docker:
 
 ![screenshot](https://raw.githubusercontent.com/mviereck/x11docker/screenshots/screenshot-trinity.png "Trinity desktop running in Weston window using x11docker")
 

