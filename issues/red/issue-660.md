
#660: [MacOS 10.9.1/Red 0.4.1]red emits "Driver Internal Error: Script Error : Cannot use lesser? on date! value" error, except the first run
================================================================================
Issue is closed, was reported by cofyc and has 24 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/660>

In the first run, it's ok:

```
<user>@host: ~ $ red
Pre-compiling Red console...

-=== Red Console alpha version ===-
(only ASCII input supported)

red>> 
```

but, in the second run, 

```
<user>@host: ~ $ red
*** Driver Internal Error: Script Error : Cannot use lesser? on date! value 
*** Where: run-console 
*** Near:  [if any [
not exists? exe 
(modified? exe) < modified? sob
] [
write script read-cache %red/tests/console.red 
opts: make system-dialect/options-class [
link?: yes 
unicode?: yes 
config-name: to word! default-target 
build-basename: %console 
build-prefix: temp-dir
] 
opts: make opts select load-targets opts/config-name 
print "Pre-compiling Red console..." 
result: red/compile script opts 
system-dialect/compile/options/loaded script opts result/1 
delete script 
if all [Windows? not lib?] [
print "Please run red.exe again to access the console." 
quit/return 1
]
] 
exe:
] 
```

Using abosulte path `/usr/local/bin/red`, it's ok:

```
<user>@host: ~ $ /usr/local/bin/red

-=== Red Console alpha version ===-
(only ASCII input supported)

red>> 
```

I think it's a problem to find console data under `/tmp/red` directory, I tried to run `red` under `/tmp` directory, it's ok:

```
<user>@host:/tmp $ red

-=== Red Console alpha version ===-
(only ASCII input supported)

red>> 
```



Comments:
--------------------------------------------------------------------------------

On 2014-01-17T01:17:09Z, qtxie, commented:
<https://github.com/red/red/issues/660#issuecomment-32571407>

    Hi, @Cofyc
    
    ```
    *** Driver Internal Error: Script Error : Cannot use lesser? on date! value
    ......
    (modified? exe) < modified? sob
    ```
    
    It seems that Rebol do not support compare the `date!` type in `MacOS 10.9.1`.
    I don't have a MacBook, so it is just my guess. ;-) 
    If you want to comfirm it and have some free time, you can download Rebol and have a try.
    
    ```
    (modified? %file1) < modified? %file2
    ```

--------------------------------------------------------------------------------

On 2014-01-17T02:44:57Z, cofyc, commented:
<https://github.com/red/red/issues/660#issuecomment-32575725>

    Hi, @qtxie 
    
    It works:
    
    ``` rebol
    REBOL/Core 2.7.8.2.5 (2-Jan-2011)
    Copyright 2011 REBOL Technologies
    REBOL is a Trademark of REBOL Technologies
    All rights reserved.
    
    Finger protocol loaded
    Whois protocol loaded
    Daytime protocol loaded
    SMTP protocol loaded
    ESMTP protocol loaded
    POP protocol loaded
    IMAP protocol loaded
    HTTP protocol loaded
    FTP protocol loaded
    NNTP protocol loaded
    >> (modified? %1) < modified? %2
    == true
    >> (modified? %1) > modified? %2
    == false
    >> (modified? %1) = modified? %2
    == false
    >> 
    ```

--------------------------------------------------------------------------------

On 2014-01-17T05:38:23Z, PeterWAWood, commented:
<https://github.com/red/red/issues/660#issuecomment-32581360>

    Hi @Cofyc
    
    Looking at the error message, I suspect that it is a permissions / sandboxing issue. The error message is the same as you would get with:
    
    ```
    >> 21-12-2013 < none
    ** Script Error: Cannot use lesser? on date! value
    ** Near: 21-Dec-2013 < none
    ```
    
    This gives a hint that modified? exe is returning none. Perhaps you could check by trying:
    
    ```
    modified? %/usr/local/bin/red
    ```
    
    (I am unable to test as I'm still running OS X 10.7.5).
    
    Cheers
    
    Peter
    
    On 17 Jan 2014, at 10:44, Yecheng Fu wrote:
    
    > Hi, @qtxie
    > 
    > It works:
    > 
    > REBOL/Core 2.7.8.2.5 (2-Jan-2011)
    > Copyright 2011 REBOL Technologies
    > REBOL is a Trademark of REBOL Technologies
    > All rights reserved.
    > 
    > Finger protocol loaded
    > Whois protocol loaded
    > Daytime protocol loaded
    > SMTP protocol loaded
    > ESMTP protocol loaded
    > POP protocol loaded
    > IMAP protocol loaded
    > HTTP protocol loaded
    > FTP protocol loaded
    > NNTP protocol loaded
    > 
    > > > (modified? %1) < modified? %2
    > > > == true
    > > > (modified? %1) > modified? %2
    > > > == false
    > > > (modified? %1) = modified? %2
    > > > == false
    > > > 
    > > > —
    > > > Reply to this email directly or view it on GitHub.

--------------------------------------------------------------------------------

On 2014-01-17T05:50:19Z, cofyc, commented:
<https://github.com/red/red/issues/660#issuecomment-32581778>

    Hi, @PeterWAWood 
    
    Permission is right.
    
    ``` rebol
    >> modified? %/usr/local/bin/red
    == 15-Jan-2014/13:07:18+8:00
    ```
    
    Maybe red got wrong `sob` path?
    
    ``` rebol
    >> modified? %/path/does/not/exist
    == none
    ```

--------------------------------------------------------------------------------

On 2014-01-17T06:44:40Z, PeterWAWood, commented:
<https://github.com/red/red/issues/660#issuecomment-32583603>

    Hi @Cofyc 
    
    Yes you are most probably correct, if the problem was caused by modified? exe the error message would have been different.
    
    ```
    >> none < 21-12-2013
    ** Script Error: Cannot use lesser? on none! value
    ** Near: none < 21-Dec-2013
    >> 21-12-2013 < none
    ** Script Error: Cannot use lesser? on date! value
    ** Near: 21-Dec-2013 < none
    ```
    
    Looking at this a little further, the issue appears to be that modified? returns none when the file has been accessed via the PATH. This may explain better than the last sentence:
    
    ```
    >> system/options/boot   ; sob  
    == %rebol
    >> modified? system/options/boot 
    == none
    >> modified? %/usr/bin/rebol    
    == 3-Jan-2011/7:46:46+8:00
    ```
    
    I don't think that it is possible to work around this issue other than find a different method of working out if the console needs re-building.

--------------------------------------------------------------------------------

On 2014-01-17T07:47:00Z, PeterWAWood, commented:
<https://github.com/red/red/issues/660#issuecomment-32585791>

    Actually calling the following function (modified-sob?) in place of modified? sob should work. (Though I have only tested the function under OS X).
    
    ```
    modified-sob?: func [
        /local
            mod
            sob
            splitter
    ][
        either 3 = fourth system/version [
            splitter: ";"
        ][
            splitter: ":"
        ]
        sob: system/options/boot
        if none = mod: modified? sob [
            foreach dir parse get-env "PATH" splitter [
                mod: modified? to file! join dir ["/" sob]
                if none <> mod [break]
            ]
        ]
        mod
    ]
    ```

--------------------------------------------------------------------------------

On 2014-02-23T06:22:56Z, 7hi4g0, commented:
<https://github.com/red/red/issues/660#issuecomment-35824974>

    I got the same error on Ubuntu 13.10.
    
    Unfortunately I cannot test if @PeterWAWood 's code works since I don't have Rebol/SDK.

--------------------------------------------------------------------------------

On 2014-02-23T07:17:09Z, PeterWAWood, commented:
<https://github.com/red/red/issues/660#issuecomment-35825609>

    Thiago, the workaround is simply to specify the full path to Red at the command line.

--------------------------------------------------------------------------------

On 2014-02-23T07:36:53Z, 7hi4g0, commented:
<https://github.com/red/red/issues/660#issuecomment-35825842>

    @PeterWAWood That's right, I should be able to test the code anyway :confounded: 
    
    The point I made about the Rebol/SDK is because it seems to me that this check for the modified date only occurs when running the encapsulated version.
    
    Running the @PeterWAWood 's code from console works fine on Ubuntu 13.10 for me.

--------------------------------------------------------------------------------

On 2014-02-23T08:11:19Z, PeterWAWood, commented:
<https://github.com/red/red/issues/660#issuecomment-35826388>

    Yes, you are correct Thiago. Thanks for checking the code in the console on Ubuntu.

--------------------------------------------------------------------------------

On 2014-02-23T18:34:51Z, 7hi4g0, commented:
<https://github.com/red/red/issues/660#issuecomment-35838852>

    Tested on Windows 8 and starting by double-clicking ´rebol.exe´ and by calling ´rebol´ on PowerShell with Rebol directory on PATH, ´modified? system/options/boot´ works directly no need to search ´PATH´. But starting by calling ´rebol´ on cmd doesn't work neither directly nor searching ´PATH´ with @PeterWAWood 's function. The reason is that it is missing the ´.exe´ extension. 

--------------------------------------------------------------------------------

On 2014-03-07T17:05:58Z, dockimbel, commented:
<https://github.com/red/red/issues/660#issuecomment-37044439>

    I have changed the method for determining if the console needs to be rebuilt or not. It now relies on an internal build timestamp generated during the encapping process.

