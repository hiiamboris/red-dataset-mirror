
#1625: console-call has stopped working
================================================================================
Issue is closed, was reported by WiseGenius and has 4 comment(s).
[type.review] [status.wontfix]
<https://github.com/red/red/issues/1625>

Attempting to compile `%tests/console-call.red` gives an error beginning with:

```
*** Compilation Error: include file not found: help.red
```

Once this is remedied with `%environment/console/help.red`, the compilation succeeds. However, when running the executable, any line typed crashes the console with:

```
red>> print "Hello, World!"
*** Syntax error: invalid none at "^@"
*** Where: do
*** Stack: do-console while unless switch do code load either transcode unless ctx168~throw-error cause-error do
```

Even an empty line:

```
red>>
*** Syntax error: invalid none at "^@"
*** Where: do
*** Stack: do-console while unless switch do code load either transcode unless ctx168~throw-error cause-error do
```

But not a commented line:

```
red>> ;Wow! But this works!?
red>>
```



Comments:
--------------------------------------------------------------------------------

On 2016-02-17T02:54:08Z, dockimbel, commented:
<https://github.com/red/red/issues/1625#issuecomment-184989126>

    `%tests/console-call.red` will be deprecated in 0.6.0, as CALL feature will be provided as a module later, once the Unicode support will be properly implemented. So, we won't upgrade that script.

--------------------------------------------------------------------------------

On 2017-02-16T09:17:18Z, dockimbel, commented:
<https://github.com/red/red/issues/1625#issuecomment-280276378>

    As `call` feature will be integrated inside Red runtime, the `%console-call.red` script will be removed.

