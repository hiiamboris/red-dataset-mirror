
#690: allow unset arguments in functions (like any-type! in Rebol)
================================================================================
Issue is closed, was reported by IngoHohmann and has 0 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/690>

I think this is mainly useful in the console, e.g. for calling 'help without an argument. So mainly it would fall under "new user first impression".

Currently:

```
red>> help
*** Interpreter Error: missing argument...
```

With this change it would be possible to have:

```
red>> help
To use HELP, supply a word or value as its argument, e.g.:
help insert
....
```



