
#1176: Non-existant address when invoking function via numbered path
================================================================================
Issue is closed, was reported by hostilefork and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1176>

This works as expected...

```
>> blk: reduce [does [print "Hello"]]
>> blk/1
Hello
```

But if the function execution fails, you get an access violation:

```
blk: reduce [does [asdf]]
blk/1
*** Runtime Error 27: non-existant physical address
*** at: 0001CD0Bh
```

In Red 0.5.3.

Note also, english spelling is [_existent_](http://en.wiktionary.org/wiki/existant)



