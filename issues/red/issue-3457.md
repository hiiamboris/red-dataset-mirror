
#3457: load-thru/path-thru doesn't load a molded cached image
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
[type.bug]
<https://github.com/red/red/issues/3457>

[July 5, 2018 11:53 PM](https://gitter.im/red/bugs?at=5b3e855681816669a433fd2b)

### Actual behavior
`? (load-thru https://picsum.photos/100/100?random)`

works once (sometimes twice??)
then it complains:
```
>> ? (load-thru https://picsum.photos/100/100?random)
*** Script Error: word-is-value-str does not allow block! for its word argument
*** Where: word-is-value-str
*** Stack: ? help-string
```
It saves the image as `make image! [...]` script, but then loads it as a block! (`?` complains when given a block)
Temporary workaround: `img: do load-thru https://picsum.photos/100/100?random` works fine.
(random image url is coincidental, I know it doesn't make sense to cache a random image)

### Expected behavior
`load-thru` should load molded image directly as an `image!`

### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 779 date: 5-Jul-2018/15:38:08 commit: #963ec55a6bab860f8b259246f794bde6ea0172be ]
PLATFORM: [ name: "Windows 7 Service Pack 1" OS: 'Windows arch: 'x86-64 version: 6.1.1 build: 7601 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2019-11-21T21:03:26Z, hiiamboris, commented:
<https://github.com/red/red/issues/3457#issuecomment-557270835>

    Still buggy, but differently now.
    `? (load https://picsum.photos/100/100?random)` displays the image
    `? (load-thru https://picsum.photos/100/100?random)` probes a block (requires `do` before `load-thru` to work)
    
    Perhaps it won't be fixed until we finish the serialized form (mold/all).

--------------------------------------------------------------------------------

On 2022-11-12T14:36:04Z, hiiamboris, commented:
<https://github.com/red/red/issues/3457#issuecomment-1312495493>

    So it's even more broken now. It saves first 10'000 bytes only, then can't load crap. "Invalid binary"

