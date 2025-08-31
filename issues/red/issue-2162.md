
#2162: Write/info crashes when a custom header is used 
================================================================================
Issue is closed, was reported by dockimbel and has 6 comment(s).
[type.bug] [status.resolved]
<https://github.com/red/red/issues/2162>

It seems like a regression:

```
red>> write/info https://api.github.com/user [GET [User-Agent: "me"]]
<runtime crash>
```

If no header is passed, it doesn't crash:

```
red>> write/info https://api.github.com/user [GET []]
== [401 #(
    Date: "Mon, 08 Aug 2016 11:03:37 GMT"
    Content-Length: "91"
    Content-Type: "applicati..
```



Comments:
--------------------------------------------------------------------------------

On 2016-08-08T14:01:18Z, StephaneVeneri, commented:
<https://github.com/red/red/issues/2162#issuecomment-238247143>

    A clue: works fine in terminal Window and macOS, but it crash in Gui Console.

--------------------------------------------------------------------------------

On 2016-08-08T14:21:33Z, StephaneVeneri, commented:
<https://github.com/red/red/issues/2162#issuecomment-238252772>

    Correction:
    Works fine with macOS
    Crash are random in cmd.exe and Gui Console (Windows 10):
    
    ```
    *** Runtime Error 13: integer divide by zero
    *** at: 004139EEh
    ```

--------------------------------------------------------------------------------

On 2016-08-30T17:17:05Z, rebolek, commented:
<https://github.com/red/red/issues/2162#issuecomment-243512375>

    Crashes for me under OSX (using latest commit fa7ec196faa41e21680f84c65ada1ba4cbb29483).

