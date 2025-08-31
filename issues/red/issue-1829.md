
#1829: Corruption between words of different casing in mixed compiled/interpreted code
================================================================================
Issue is closed, was reported by x8x and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1829>

After compiling and running this code:

``` rebol
Red []

md5: func [
    s [string! file!]
    return: [string!]
][
    if file? s [s: read s]
    copy/part lowercase next next mold checksum s 'MD5 32
]

#include %/red/environment/console/console.red
```

`md5` function results unset:

``` rebol
red>> md5 
*** Script error: md5 has no value
*** Where: do
```

while compiling and running this code:

``` rebol
Red []

md5: func [
    s [string! file!]
    return: [string!]
][
    if file? s [s: read s]
    copy/part lowercase next next mold checksum s 'md5 32
]

#include %/red/environment/console/console.red
```

works as expected and the `md5` function is set:

``` rebol
red>> md5
*** Script error: md5 is missing its s argument
*** Where: md5
```

Now, the only difference between the 2 is the `'MD5` uppercase VS `'md5` lowercase

(verified on Linux and MacOS)



Comments:
--------------------------------------------------------------------------------

On 2016-06-08T10:45:24Z, x8x, commented:
<https://github.com/red/red/issues/1829#issuecomment-224553769>

    Updated test script to conform with latest checksum changes.
    Issue is still there.

--------------------------------------------------------------------------------

On 2016-06-17T12:11:22Z, dockimbel, commented:
<https://github.com/red/red/issues/1829#issuecomment-226753284>

    Issue can be reproduced with:
    
    ```
    md5: does ['MD5]
    probe same? 'a 'A
    
    #include %../environment/console/console.red
    ```

--------------------------------------------------------------------------------

On 2016-06-18T05:11:19Z, dockimbel, commented:
<https://github.com/red/red/issues/1829#issuecomment-226922594>

    Smallest code to reproduce the issue:
    
    ```
    Red []
    
    md5: does ['MD5]
    do "probe :md5"
    ```
    
    gives:
    
    ```
    unset
    ```

