
#2977: FOREACH over PARENS! behaves strangely
================================================================================
Issue is closed, was reported by WiseGenius and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2977>

`foreach` over `parens!` behaves strangely:

```
>> foreach [a b] quote [10 20 30 40] [?? a ?? b]
a: 10
b: 20
a: 30
b: 40
```
So far so good.


```
>> foreach [a b] quote (10 20 30 40) [?? a ?? b]
a: (10 20 30 40)
b: (10 20 30 40)
a: (30 40)
b: (30 40)
```
Strange!


```
>> foreach a quote (10 20 30 40) [?? a]
a: 10
a: 20
a: 30
a: 40
```
That looks right.


```
>> foreach [a] quote (10 20 30 40) [?? a]
a: (10 20 30 40)
a: (20 30 40)
a: (30 40)
a: (40)
```
Strange again!


Comments:
--------------------------------------------------------------------------------

On 2017-08-16T11:03:24Z, webcpu, commented:
<https://github.com/red/red/issues/2977#issuecomment-322736786>

    There is no regression test for this bug. :)

--------------------------------------------------------------------------------

On 2017-08-16T12:30:46Z, dockimbel, commented:
<https://github.com/red/red/issues/2977#issuecomment-322755478>

    @unchartedworks Our resources are limited, so we write regression tests for the most important ones only as we close tickets. From time to time, we revisit some closed tickets and add more tests. Anyway, we are very welcoming contributions in that area. ;-)

--------------------------------------------------------------------------------

On 2017-08-16T21:14:04Z, webcpu, commented:
<https://github.com/red/red/issues/2977#issuecomment-322901312>

    @dockimbel I see. I am still learning Red. I hope I can add some tests after I become more familiar with Red. :)

