
#5538: Invalid make date! result when mixed time and integer values in a block
================================================================================
Issue is closed, was reported by Oldes and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5538>

This is OK:
```red
>> make date! [1978 2 3 5:0:0 2]
== 3-Feb-1978/5:00:00+02:00

>> make date! [1978 2 3 5:0:0 2:30]
== 3-Feb-1978/5:00:00+02:30
```
But this is not:
```red
>> make date! [1978 2 3 5:0:0 2 30]
== 3-Feb-1978/0:02:30 ;<--- SHOULD BE: 3-Feb-1978/5:00:00+02:30 or an error
```


Comments:
--------------------------------------------------------------------------------

On 2024-10-01T13:55:48Z, dockimbel, commented:
<https://github.com/red/red/issues/5538#issuecomment-2386033645>

    `Date!` values dynamic creation specs are now expanded to support [more formats](https://github.com/red/docs/commit/9191f41c543d14a49b25d83348c003bf1fb965b7).

