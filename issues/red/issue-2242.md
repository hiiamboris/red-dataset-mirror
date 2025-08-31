
#2242: Wish: Command line ARGs
================================================================================
Issue is closed, was reported by dsunanda and has 0 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/2242>

Red does not (it seems) yet handle command line arguments:

```
red-061 my-script.red -- arg1 arg2
```

will run my-script.red. But system/options/args contains "my-script.red", not the expected args

It would be neat if it could :)



