
#5269: Sort ignores the datatype order
================================================================================
Issue is open, was reported by hiiamboris and has 10 comment(s).
[type.bug] [status.reviewed]
<https://github.com/red/red/issues/5269>

**Describe the bug**

```
>> sort [a /a]
== [a /a]
>> sort/reverse [a /a]
== [a /a]
>> sort/case [a /a]
== [a /a]
>> sort/case/reverse [a /a]
== [a /a]
```
Similar results with `[1 1.0]`.

**Expected behavior**

R2:
```
>> sort [a /a]
== [a /a]
>> sort/reverse [a /a]
== [/a a]
>> sort/case [a /a]
== [a /a]
>> sort/case/reverse [a /a]
== [/a a]
```

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4623 date: 29-Dec-2022/20:00:14 commit: #6af0b708408aeab6ca70dcdf7522d03278b7586e ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-02-23T02:01:11Z, qtxie, commented:
<https://github.com/red/red/issues/5269#issuecomment-1441127233>

    So `sort/reverse list` is just another way to do `reverse sort list`. I don't see performance gain by doing it inside `sort`.

--------------------------------------------------------------------------------

On 2023-02-23T20:35:40Z, hiiamboris, commented:
<https://github.com/red/red/issues/5269#issuecomment-1442396530>

    @qtxie performance-wise:
    ```
    >> b: map-each i 100 [100 - i]
    == [99 98 97 96 95 94 93 92 91 90 89 88 87 86 85 84 83 82 81 80 79 78 77 76 75 74 7...
    >> loop 5 [clock/times [sort/reverse copy b] 5e3]
    10.9 μs	[sort/reverse copy b]
    9.86 μs	[sort/reverse copy b]
    10.3 μs	[sort/reverse copy b]
    10.6 μs	[sort/reverse copy b]
    11.3 μs	[sort/reverse copy b]
    == [99 98 97 96 95 94 93 92 91 90 89 88 87 86 85 84 83 82 81 80 79 78 77 76 75 74 7...
    >> loop 5 [clock/times [reverse sort copy b] 5e3]
    18.7 μs	[reverse sort copy b]
    14.2 μs	[reverse sort copy b]
    13.9 μs	[reverse sort copy b]
    17.8 μs	[reverse sort copy b]
    15.5 μs	[reverse sort copy b]
    == [99 98 97 96 95 94 93 92 91 90 89 88 87 86 85 84 83 82 81 80 79 78 77 76 75 74 7...
    ```
    
    However `reverse` native doesn't support `/skip`, `/all` or `/stable`, so they're not equivalent.

--------------------------------------------------------------------------------

On 2023-02-24T01:41:56Z, qtxie, commented:
<https://github.com/red/red/issues/5269#issuecomment-1442675712>

    @hiiamboris Thank you. No separate `reverse` process in current `sort/reverse` implementation. That's why it's faster. 
    
    The current `sort/reverse` means reverse the compare result for each pairs. Regarding `a` and `/a`, they are `equal`, no ordering for them. In order to fix this issue, we need to change the implementation to make `reverse` a separate process.
    

--------------------------------------------------------------------------------

On 2023-02-24T09:38:58Z, hiiamboris, commented:
<https://github.com/red/red/issues/5269#issuecomment-1443354467>

    I think `CMP_SORT` should simply consider datatypes in comparison (and NaNs).

--------------------------------------------------------------------------------

On 2023-02-27T02:49:54Z, qtxie, commented:
<https://github.com/red/red/issues/5269#issuecomment-1445605493>

    > I think `CMP_SORT` should simply consider datatypes in comparison (and NaNs).
    
    That's a solution. We need to do an extra check for each comparison and the order of datatypes is implementation dependent.

