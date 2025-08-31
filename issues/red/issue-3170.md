
#3170: [wish] forall restores index on series in case of early exit
================================================================================
Issue is closed, was reported by maximvl and has 2 comment(s).
<https://github.com/red/red/issues/3170>

In a code like this:
```
Red []

l: [1 2 3 4 5]

forall l [ if l/1 = 3 [ break ]]

probe l
```

### Expected behavior
last statement prints whole list, eg after forall `l` is at head

### Actual behavior
last statement prints `[3 4 5]`, eg index is at 3

### Steps to reproduce the problem
run the code

### Red version and build date, operating system with version.
```
>> system/build
== make object! [
    date: 27-Dec-2017/13:48:35+01:00
```

### Why?
`forall` loop changes series (it's index value) while this may be used as a feature it also can be very unexpected especially in case of error in the body. At least it worth refinement like `/keep-index`.


Comments:
--------------------------------------------------------------------------------

On 2017-12-28T06:32:54Z, greggirwin, commented:
<https://github.com/red/red/issues/3170#issuecomment-354237302>

    This is by design. It allows you to iterate over a series and break where you may want to perform other actions. Without that, you have to store the position yourself before breaking. No new refinement is needed either. Just use a separate word as your iterator.
    ```
    l: [1 2 3 4 5]
    l`: :l
    
    forall l` [ if l`/1 = 3 [ break ]]
    
    probe l
    ```

