
#2879: Crash after trying to set BINARY! key in MAP!
================================================================================
Issue is closed, was reported by rebolek and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2879>

```
>> m: #()
== #()
>> extend m ["abcd" 123]
== #(
    "abcd" 123
)
>> extend m [#{abcd} 123]
*** Script Error: binary! type is not allowed here
*** Where: extend
*** Stack: 
>> extend m [{abcd} 123]

*** Runtime Error 1: access violation
*** at: 0806D805h
```

Also, Red should support `binary!` as a key. It's possible with a simple workaround anyway and making it native would save CPU and memory:
```
>> key: enbase to binary! mold system
== {bWFrZSBvYmplY3QhIFsKICAgIHZlcnNpb246IDAuNi4yCiAgICBidWlsZDogbWFrZSBvYmplY3QhIFsKICAgICAgICBkYXRlOiAiNy1KdWwtMjAxNy8xMzoxMjoyNisyOjAwIgogICAgI...
>> m: make map! reduce [key true]
== #(
    {bWFrZSBvYmplY3QhIFsKICAgIHZlcnNpb246IDAuNi4yCiAgICBidWlsZDogbWFrZSBvYmplY3QhIFsKICAgICAgICBkYXRlOiAiNy1KdWwtMjAxNy8xMzoxMjoyNisyOjAwIg...
>> select m key
== true
```


Comments:
--------------------------------------------------------------------------------

On 2017-07-11T02:38:12Z, qtxie, commented:
<https://github.com/red/red/issues/2879#issuecomment-314306410>

    Seems the error mess up the red stack.

