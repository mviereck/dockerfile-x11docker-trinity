# x11docker/trinity

Base image Trinity desktop (on debian jessie)
 - Run Trinity desktop in docker.
 - Use x11docker to run image to run GUI applications and desktop environments in docker images.
 - Get [x11docker from github](https://github.com/mviereck/x11docker)
 
For full Trinity desktop environment, see `x11docker/trinity-full`.

# Example commands: 
 - Single application: `x11docker x11docker/trinity konquerer`
 - Full desktop: `x11docker --desktop x11docker/trinity` 
 
 # Screenshot
 Trinity desktop in a Weston window running with x11docker:
 
 ![screenshot](https://raw.githubusercontent.com/mviereck/x11docker/screenshots/screenshot-trinity.png "Trinity desktop running in Weston window using x11docker")
 

