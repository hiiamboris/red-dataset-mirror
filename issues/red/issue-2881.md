
#2881: Wish: Be able to compile code in console. 
================================================================================
Issue is closed, was reported by JenniferLee520 and has 6 comment(s).
<https://github.com/red/red/issues/2881>

I wish I could compile my red code in console.
```Red
>> compile/output %my-clock.red %clock.exe
```


Comments:
--------------------------------------------------------------------------------

On 2017-07-14T11:15:58Z, geekyi, commented:
<https://github.com/red/red/issues/2881#issuecomment-315335398>

    This shouldn't be so hard to do on your own, I think `call %red.exe args` is enough? ;)

--------------------------------------------------------------------------------

On 2018-03-17T09:29:38Z, dockimbel, commented:
<https://github.com/red/red/issues/2881#issuecomment-373906852>

    Indeed, it's a one-liner function that can be implement easily.
    
    That said, we plan in the future to support operating the Red toolchain from the Red console. So, I will close this ticket, as it's already a feature in our roadmap.

--------------------------------------------------------------------------------

On 2018-03-20T21:24:18Z, greggirwin, commented:
<https://github.com/red/red/issues/2881#issuecomment-374761884>

    +1. I started a dialected func design along these lines some time back.

