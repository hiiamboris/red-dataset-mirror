
#581: Regression after fix on #570
================================================================================
Issue is closed, was reported by dockimbel and has 4 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/581>

The following code:

```
do "S: 1 S"
```

returns:

```
*** Error: word has no value!
```



Comments:
--------------------------------------------------------------------------------

On 2013-11-27T20:40:37Z, iArnold, commented:
<https://github.com/red/red/issues/581#issuecomment-29418391>

    The 'S word is not defined here. 
    Also does not work without the do construction.
    ( with or without Red>>S: 1)
    Red>>s: 12
    ==12
    Red>>S
    **\* Error: word has no value!
    
    Did you forget a translation from capital to lower case (+ 32) when storing the value and/or when retrieving?

--------------------------------------------------------------------------------

On 2013-11-27T23:53:25Z, dockimbel, commented:
<https://github.com/red/red/issues/581#issuecomment-29429962>

    @iArnold It was bit more complicated than that. The mismatch was occuring when creating the word in the global context.

