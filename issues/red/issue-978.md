
#978: Can't ouput correctly with an editor tool
================================================================================
Issue is closed, was reported by WayneCui and has 16 comment(s).
[status.resolved]
<https://github.com/red/red/issues/978>

I used an editor to write and run Red scripts, configuring a external tool with a Red binary, but when running the script, it can only output one character. But it's fine with Rebol and other tools. Have tried on [EverEdit](http://www.everedit.net) and Editplus. I think there may be something wrong with the output.

```
Red []

print "Hello world"
print "Hello world"
```

ouput:
H

```
Red []

print "你好"
```

ouput: 
*

My configuration is something like this:
![t0sda6x](https://cloud.githubusercontent.com/assets/3457234/4933556/64c54c46-6598-11e4-911f-2db3efae915b.png)



Comments:
--------------------------------------------------------------------------------

On 2014-11-06T11:14:46Z, qtxie, commented:
<https://github.com/red/red/issues/978#issuecomment-61964801>

    @WayneTsui  Seems `red` doesn't output to the channel which the editor expected.
    
    Try to run a script in cmd, you will see the difference between `red` and `rebol`.
    
    ```
    C:\>red-043.exe test.red
    你好！
    
    C:\>rebol.exe test.r                ;; no output in current cmd
    ```

--------------------------------------------------------------------------------

On 2014-11-08T11:29:25Z, qtxie, commented:
<https://github.com/red/red/issues/978#issuecomment-62254595>

    @WayneTsui I have discussed with the author of EverEdit about this issue. It is caused by two reasons:
    1. `red` output UTF-16 string on Windows.
    2. `EverEdit` doesn't support UTF-16 in external tool (外部工具).
    
    He also proposal a solution, but I can't figure out it as his description is too concise. :/
    So I think it is mostly the editor's issue rather than `red`.

--------------------------------------------------------------------------------

On 2014-11-08T14:26:19Z, WayneCui, commented:
<https://github.com/red/red/issues/978#issuecomment-62259500>

    @qtxie Thanks for your kind help! :-) I have thought it might be the editor's issue as `red` runs well in console, but for other tools the editor works well. It's confusing. As I think it may be a bit of easier for users to test code this way, so I submitted an issue there.
    
    So, if it's the editor's issue, this ticket can be closed. 

--------------------------------------------------------------------------------

On 2014-11-08T14:34:41Z, dockimbel, commented:
<https://github.com/red/red/issues/978#issuecomment-62259768>

    @qtxie Would it work if Red outputs UTF-8? Maybe we could add a config option for forcing the output format to a given encoding?

--------------------------------------------------------------------------------

On 2014-11-09T08:56:38Z, qtxie, commented:
<https://github.com/red/red/issues/978#issuecomment-62296349>

    @WayneTsui Using [this script](https://gist.github.com/qtxie/38f5871d53bbc22314ce#file-run-red-mac) would solve you problem. If you don't how to use it, please check the [docs](http://cn.everedit.net/doc.html) of everedit.

--------------------------------------------------------------------------------

On 2014-11-09T09:01:59Z, qtxie, commented:
<https://github.com/red/red/issues/978#issuecomment-62296453>

    @dockimbel In my previous attempts, only UTF-16 characters displayed correctly in cmd. Maybe I miss something...
    
    _Forcing the output encoding_ I think it is doable.

--------------------------------------------------------------------------------

On 2014-11-09T23:28:14Z, WayneCui, commented:
<https://github.com/red/red/issues/978#issuecomment-62325301>

    @qtxie I have tested your script. It works well! Thanks a lot! :-)

--------------------------------------------------------------------------------

On 2014-11-09T23:29:18Z, qtxie, commented:
<https://github.com/red/red/issues/978#issuecomment-62325338>

    @WayneTsui You're welcome. :-)

