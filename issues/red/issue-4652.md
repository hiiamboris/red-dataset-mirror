
#4652: Contributing to the project from macOS Catalina
================================================================================
Issue is closed, was reported by drkameleon and has 10 comment(s).
[status.duplicate]
<https://github.com/red/red/issues/4652>

I'm a huge fan of Rebol and Red and as a matter of fact I am the creator of a programming language inspired by it (written in C & Nim).

I'm also willing to contribute to Red.

The problem is Red depends on the Rebol2 binary and Rebol2 in practically unrunnable on Catalina. (I use them both via Docker, but cannot be the way to go)

Any ideas on how I could solve the issue?


Comments:
--------------------------------------------------------------------------------

On 2020-09-19T16:39:29Z, hiiamboris, commented:
<https://github.com/red/red/issues/4652#issuecomment-695329813>

    Hi @drkameleon ;)
    Please use the [official Gitter chat](https://gitter.im/red/red) for questions ;)
    
    Re: 64 bits. This is a well known limitation and [here is the team's stance on it](https://gitter.im/red/red?at=5e09152cd5a7f357e6a1af83). In the mean time there were [attempts to dockerize Red for Catalina users](https://github.com/rcqls/red-gtk-macOS), but you may want to ask around Gitter for an up to date info. @x8x and @rcqls may know more.
    
    I'm closing this issue as a dupe of https://github.com/red/red/issues/4359

--------------------------------------------------------------------------------

On 2020-09-21T14:30:59Z, vazub, commented:
<https://github.com/red/red/issues/4652#issuecomment-696154167>

    @drkameleon Here is the solution I am using, scratching the very same itch:
    https://gitlab.com/vazub/rebol2-docker
    https://gitlab.com/vazub/red-docker

--------------------------------------------------------------------------------

On 2021-10-25T14:11:54Z, hiiamboris, commented:
<https://github.com/red/red/issues/4652#issuecomment-950970882>

    Full list of docker builds: https://github.com/red/red/wiki/[LINKS]-Unofficial-Red-images

--------------------------------------------------------------------------------

On 2023-08-01T13:03:35Z, rozek, commented:
<https://github.com/red/red/issues/4652#issuecomment-1660269229>

    > @drkameleon Here is the solution I am using, scratching the very same itch: https://gitlab.com/vazub/rebol2-docker https://gitlab.com/vazub/red-docker
    
    Dockerfile and instructions do not seem to work any more (e.g., there is no "red-latest" any more) For that reason, I've made my own Docker image (as described [here](https://github.com/rozek/docker-red)) and figured out how to run RED/Rebol CLI/GUI scripts under macOS Ventura on "Mac Silicon"
    
    The Dockerfile should also be useful for Windows and Linux users - but the commands to start GUI scripts may certainly differ...

--------------------------------------------------------------------------------

On 2023-08-01T17:22:10Z, greggirwin, commented:
<https://github.com/red/red/issues/4652#issuecomment-1660776632>

    Thanks for diving into this @rozek.

