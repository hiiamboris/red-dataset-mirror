
#1550: `do` `file!` not relative to the currently interpreted file
================================================================================
Issue is closed, was reported by WiseGenius and has 6 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1550>

If a file is being interpreted, it should `do` files relative to itself as Rebol does. Currently, this is not the case:

Consider the following 4 files:

`H:\a.red`

```
Red []

do %folder/b.red
```

`H:\folder\b.red`

```
Red []

do %c.red
```

`H:\folder\c.red`

```
Red []

print "correct result"
```

`H:\c.red`

```
Red []

print "incorrect result"
```

The current result is:

```
H:\>red a.red
incorrect result
```



Comments:
--------------------------------------------------------------------------------

On 2016-02-10T17:49:59Z, WiseGenius, commented:
<https://github.com/red/red/issues/1550#issuecomment-182501006>

    The same is also true of `load`, `save`, `read` and `write`.
    
    Consider the following 2 files:
    
    `H:\a.red`
    
    ```
    Red []
    
    do %folder/b.red
    ```
    
    `H:\folder\b.red`
    
    ```
    Red []
    
    save %saved-file.txt "saved text"
    print load %saved-file.txt
    
    write %written-file.txt "written text"
    print read %written-file.txt
    ```
    
    The printed result of `%a.red` is correct:
    
    ```
    H:\>red a.red
    saved text
    written text
    ```
    
    But the resulting files are:
    `H:\saved-file.txt`
    `H:\written-file.txt`
    
    Not where they should be, which is:
    `H:\folder\saved-file.txt`
    `H:\folder\written-file.txt`

--------------------------------------------------------------------------------

On 2016-06-26T06:28:19Z, dockimbel, commented:
<https://github.com/red/red/issues/1550#issuecomment-228586739>

    Implemented by commit https://github.com/red/red/pull/2071/commits/fdee65883ba7cb0581ce0560f42aec1cfff23738. 
    
    @WiseGenius Let us know if it works fine for you.

--------------------------------------------------------------------------------

On 2016-06-27T07:08:07Z, WiseGenius, commented:
<https://github.com/red/red/issues/1550#issuecomment-228669126>

    Passes all tests I can think of when both interpreted and compiled on both Windows XP and Windows 7.
    Yay!

