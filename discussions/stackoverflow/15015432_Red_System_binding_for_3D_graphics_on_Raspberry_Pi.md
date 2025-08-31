# Red/System binding for 3D graphics on Raspberry Pi

**Link:**
<https://stackoverflow.com/questions/15015432/red-system-binding-for-3d-graphics-on-raspberry-pi>

**Asked:** 2013-02-22 01:34:05 UTC

------------------------------------------------------------------------

For someone getting started with Red/System programming on the Raspberry
Pi, what is the best way to access the GPU for 3D rendering? Can this
method also be used for Rebol3 on the Raspberry Pi?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by Kaj de Vos

My OpenGL binding for Red/System would be the starting point:

[http://red.esperconsultancy.nl/Red-OpenGL](http://red.esperconsultancy.nl/Red-OpenGL){rel="nofollow"}

I\'m currently working on extending it for the Raspberry Pi. The current
binding is for desktop OpenGL. For Raspberry Pi and other small
platforms, I\'m working on an OpenGL-ES binding. Further, OpenGL needs
an environment on the target platform. The binding has several backends,
such as SDL, but these don\'t work on the Raspberry Pi as it uses EGL in
combination with its own environment as defined by Broadcom. I\'m also
working on extra backends for those.

Bindings for Red, including this one when Raspberry Pi support is
finished, can be used to base REBOL 3 extensions on, with my Red/REBOL 3
bridge:

[http://red.esperconsultancy.nl/Red-REBOL-3](http://red.esperconsultancy.nl/Red-REBOL-3){rel="nofollow"}

However, writing such an extension is an extra effort.

*Comment by Alexander Ryan Baggett:* Have you put this on github? I am
asking because the link no longer works.

------------------------------------------------------------------------

### Answer (score: 1) --- by Eran W

The site in the answer by Kaj de Vos is no longer works.

You may find its mirror useful:
[https://github.com/red/RS-fossil-mirror](https://github.com/red/RS-fossil-mirror){rel="nofollow noreferrer"}

Or the red/code repository:
[https://github.com/red/code/tree/master/Library/OpenGL](https://github.com/red/code/tree/master/Library/OpenGL){rel="nofollow noreferrer"}

------------------------------------------------------------------------

## Comments on question
