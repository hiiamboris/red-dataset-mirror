
#3766: It is possible to unset a word using SET with BLOCK without /ANY refinement
================================================================================
Issue is closed, was reported by Oldes and has 10 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/3766>

**Describe the bug**
It is possible to unset a word using `set` with `block`?
```
>> b: 1 set [A B] reduce [4 ()]
== [4 unset]
>> b
*** Script Error: b has no value
*** Where: catch
*** Stack:
```
While it is not possible when using `set` with `word` directly:
```
>> b: 1 set 'b ()
*** Script Error: b needs a value
*** Where: set
*** Stack:  

>> b
== 1
```
It should be possible only when used with `/any` refinement.

```
Red 0.6.4 for Windows built 26-Nov-2018/12:26:10+01:00
```


Comments:
--------------------------------------------------------------------------------

On 2019-02-01T17:18:12Z, Oldes, commented:
<https://github.com/red/red/issues/3766#issuecomment-459797695>

    Also:
    ```
    >> o1: object [a: 1 b: 2 ]
    == make object! [
        a: 1
        b: 2
    ]
    >> o2: object [a: 10 b: 20 ] set/any 'o2/b ()
    >> set o1 o2
    == make object! [
        a: 10
        b: unset
    ]
    >> o1
    == make object! [
        a: 10
        b: unset ;<----- I would prefer if the original value was not changed
    ]
    ```

--------------------------------------------------------------------------------

On 2019-02-01T17:39:12Z, Oldes, commented:
<https://github.com/red/red/issues/3766#issuecomment-459804282>

    Here are proposed unit tests:
    ```
    	--test-- "set-12"
    		o1: object [a: 1 b: 2 ]
    		o2: object [a: 10 b: 20 ] set/any 'o2/b () ;source has unset value
    		--assert o2 = set o1 o2
    		--assert all [o1/a = 10 o1/b = 2]
    
    	--test-- "set-13"
    		o1: object [a: 1 b: 2 ]
    		o2: object [a: 10 b: 20 ] set/any 'o2/b () ;source has unset value
    		--assert o2 = set/any o1 o2
    		--assert all [o1/a = 10 unset? o1/b]
    
    	--test-- "set-14"
    		a: b: 1
    		--assert error? try [ set [A B] reduce [4 ()] ]
    		--assert all [a = 1 b = 1]
    
    	--test-- "set-15"
    		a: b: 1 d: reduce [4 ()] 
    		--assert d = set/any [A B] d
    		--assert all [a = 4 unset? :b]
    ```

--------------------------------------------------------------------------------

On 2019-02-01T22:19:10Z, greggirwin, commented:
<https://github.com/red/red/issues/3766#issuecomment-459887484>

    Thanks for including proposed tests @Oldes!

--------------------------------------------------------------------------------

On 2020-03-22T14:33:54Z, 9214, commented:
<https://github.com/red/red/issues/3766#issuecomment-602215474>

    Do we agree that this one should hold?
    ```red
    >> foreach [a b] reduce [() 1 2 ()][probe :a probe :b]
    unset
    1
    2
    unset
    ```

--------------------------------------------------------------------------------

On 2020-03-22T15:17:07Z, 9214, commented:
<https://github.com/red/red/issues/3766#issuecomment-602224162>

    And what should value of `a` be in this case? `1` or `3`?
    ```red
    a: 1 b: 2
    set [a b] reduce [3 ()]
    ```
    
    In R2 its `[3 unset]` and in R3 it correctly errors out, with `a` retaining `1`. R3's way is more sensible, but also more costly, as you need to run a pre-check on all values before setting the words to them.

