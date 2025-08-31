
#830: REPL always returns "?"
================================================================================
Issue is closed, was reported by marcioAlmada and has 6 comment(s).
<https://github.com/red/red/issues/830>

So I was really exited to test Red and downloaded [red-042](http://static.red-lang.org/dl/linux/red-042). But something seems to be wrong:

``` bash
_> red # run red
_> 1 + 1
_> ?
```

Running on Fedora 20 Linux 3.14.3-200.fc20.x86_64 #1 SMP Tue May 6 19:00:18 UTC 2014 x86_64 x86_64 x86_64 GNU/Linux.



Comments:
--------------------------------------------------------------------------------

On 2014-05-23T06:37:45Z, PeterWAWood, commented:
<https://github.com/red/red/issues/830#issuecomment-43975679>

    It looks as though the REPL has not been started. This is what the REPL should look like:
    
    ```
    Red$ ./red-042-linux
    
    -=== Red Console alpha version ===-
    (only ASCII input supported)
    
    red>> 1 + 1
    == 2
    red>> 
    ```
    
    The first time you open Red, it should compile the REPL (a message will be displayed).
    
    The current Red alpha is 32-bit, do you have the 32-bit libraries installed?

--------------------------------------------------------------------------------

On 2014-05-23T13:04:46Z, marcioAlmada, commented:
<https://github.com/red/red/issues/830#issuecomment-44006039>

    Oh, my bad. I was so rushed to try it that I simply forgot to install the 32-bit packages. Better to run it on a VM, don't want all those 32-bit stuff on my main OS.

--------------------------------------------------------------------------------

On 2014-05-23T13:05:09Z, marcioAlmada, commented:
<https://github.com/red/red/issues/830#issuecomment-44006062>

    Thanks for the support!

