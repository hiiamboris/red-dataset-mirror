
#1117: Access violation when function "specialization" is attempted
================================================================================
Issue is closed, was reported by hostilefork and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1117>

If you write:

```
>> foo: :append/only 
>> foo/dup [a b c] [d e] 2
```

You will get:

```
*** Runtime Error 1: access violation
*** at: 0809AFFAh
```

Ordinary function getting works as expected:

```
>> foo: :append 
>> foo/dup [a b c] [d e] 2
== [a b c d e d e]
```

While the implementation of partial function specialization of some kind would be nice to have for various reasons...it's understandable to not be implemented.  But being not implemented, it should trap an error at the moment of `foo: :append/only` as opposed to crashing.

_(Note: Rebol does not crash in this case, it merely treats `foo: :append/only` as if you had written `foo: :append`.  An error is preferable IMO.)_



