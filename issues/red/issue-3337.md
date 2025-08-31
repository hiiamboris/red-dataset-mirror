
#3337: React isn't triggered by a change in the parts of source scalars
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/3337>

### Steps to reproduce the problem
```
r: make reactor! [x: 1x1  y: is [x * 2]]
q: make reactor! [x: 1.1.1  y: is [x * 2]]
s: make reactor! [x: 1:0:0  y: is [x * 2]]
loop 3 [r/x/x: r/x/x + 1  ? r/y]
loop 3 [q/x/1: q/x/1 + 1  ? q/y]
loop 3 [s/x/minute: s/x/minute + 1  ? s/y]
```
### Expected behavior
2x2 3x3 4x4
2.2.2 3.3.3 4.4.4
2:00:00 2:02:00 2:04:00
### Actual behavior
```
R/Y is a pair! value: 2x2
R/Y is a pair! value: 2x2
R/Y is a pair! value: 2x2
Q/Y is a tuple! value: 2.2.2
Q/Y is a tuple! value: 2.2.2
Q/Y is a tuple! value: 2.2.2
S/Y is a time! value: 2:00:00
S/Y is a time! value: 2:00:00
S/Y is a time! value: 2:00:00
```
`r` and `q` will work with deep-reactor! only, `s` won't work even like that
### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 633 date: 12-Apr-2018/10:39:17 commit: #f56b72e152d47fea33ba9e38937077cb9356d04d ]
PLATFORM: [ name: "Windows 7" OS: 'Windows arch: 'x86-64 version: 6.1.0 build: 7601 ]
--------------------------------------------
```
0.6.3 stable behaves the same


Comments:
--------------------------------------------------------------------------------

On 2019-09-05T17:57:07Z, dockimbel, commented:
<https://github.com/red/red/issues/3337#issuecomment-528502174>

    You need to use `deep-reactor!` as prototype object if you want reactions on "deep" changes. Doing so, you'll get something closer:
    ```
    r: make deep-reactor! [x: 1x1  y: is [x * 2]]
    q: make deep-reactor! [x: 1.1.1  y: is [x * 2]]
    s: make deep-reactor! [x: 1:0:0  y: is [x * 2]]
    loop 3 [r/x/x: r/x/x + 1  ? r/y]
    loop 3 [q/x/1: q/x/1 + 1  ? q/y]
    loop 3 [s/x/minute: s/x/minute + 1  ? s/y]
    ```
    will give you:
    ```
    4x2
    6x2
    8x2
    4.2.2
    6.2.2
    8.2.2
    2:00:00
    2:00:00
    2:00:00
    ```
    The first 6 results are the correct ones (your expected results are wrong). The last 3 are wrong as `time!` seems to be lacking a trigger for deep reactions, so it needs fixing.

--------------------------------------------------------------------------------

On 2019-09-06T18:23:03Z, hiiamboris, commented:
<https://github.com/red/red/issues/3337#issuecomment-528962364>

    @dockimbel thanks for fixing it. Though I wonder, shouldn't `face!` work as a deep-reactor too? It doesn't support any of the listed reactions.

