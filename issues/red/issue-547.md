
#547: 0.4.0 Release broken
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 4 comment(s).
[type.bug] [status.resolved]
<https://github.com/red/red/issues/547>

~/Red/0.4.0 $ ./red-040 
Pre-compiling Red REPL...

-=== Red Console alpha version ===-
(only ASCII input supported)

red>> system/version
== "0.3.3, 6-Oct-2013/18:07:26+2:00"

~/Red/0.4.0 $ wine red-040.exe 

-=== Red Console alpha version ===-
(only ASCII input supported)

red>> system/version
== "0.3.3, 6-Oct-2013/18:08:49+1:00"



Comments:
--------------------------------------------------------------------------------

On 2013-10-06T22:20:33Z, dockimbel, commented:
<https://github.com/red/red/issues/547#issuecomment-25778205>

    The v0.4.0 git tag is split in two:
    
    ```
    576cceb4947814f23a3925e6262e4cff3bdc63db        refs/tags/v0.4.0
    1e749cb844e7bf9426429403ed4bba583950edb5        refs/tags/v0.4.0^{}
    ```
    
    The build farm is doing a `git checkout tags/v0.4.0` and points to the _annotated_ version at commit 576cceb4, which is the old one...

--------------------------------------------------------------------------------

On 2013-10-06T22:42:56Z, dockimbel, commented:
<https://github.com/red/red/issues/547#issuecomment-25778614>

    Fixed the local repo on the build farm servers, so that the correct tag version is now taken into account. Red stable binary releases have been refreshed and correspond now to commit `1e749cb8`.

