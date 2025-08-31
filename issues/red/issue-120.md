
#120: Type-casting of string element to integer does not work
================================================================================
Issue is closed, was reported by meijeru and has 14 comment(s).
[status.problem]
<https://github.com/red/red/issues/120>

A string element is a byte, and can be cast to integer. But, ...

```
s: "abcd" printf as integer! s/1 ; should give 97, gives an address value
s: "abcd" b: s/1 printf as integer! b ; gives 97 alright
```



Comments:
--------------------------------------------------------------------------------

On 2011-06-30T20:10:44Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/120#issuecomment-1477720>

    I can see how this can be very useful, but we probably need more extensive use of get-values to do it right.

--------------------------------------------------------------------------------

On 2011-07-02T20:20:52Z, dockimbel, commented:
<https://github.com/red/red/issues/120#issuecomment-1490406>

    I have used the `prin-int` buit-in function instead of your `printf` and it works fine:
    
    ```
    s: "abcd"
    prin-int as integer! s/1
    prin newline
    b: s/1
    prin-int as integer! b
    ```
    
    gives:
    
    ```
    C:\Dev\Red\red-system\builds>test
    97
    97
    ```
    
    So, the issue is related to `printf` implementation (or binding, not sure how you have defined it).

--------------------------------------------------------------------------------

On 2011-07-02T22:14:32Z, meijeru, commented:
<https://github.com/red/red/issues/120#issuecomment-1490727>

    `prin-int` is - in Dockimbels's words -  a dumbed-down version of my `printf`. The basic algorithm is the same. It remains very curious... 

--------------------------------------------------------------------------------

On 2011-07-02T22:38:51Z, dockimbel, commented:
<https://github.com/red/red/issues/120#issuecomment-1490790>

    I will try by using your `printf` version from your gist then. Basically the difference is that `printf` is using `allocate` to get a string buffer while `prin-int` relies on a statically allocated one.
    
    EDIT: `prin-int` shares the same code as `form-hex` not `printf`...I cannot find the gist where you have put your `printf` definition?

--------------------------------------------------------------------------------

On 2011-07-03T06:54:45Z, meijeru, commented:
<https://github.com/red/red/issues/120#issuecomment-1491543>

    ```
    printf: func [
        i [integer!]
    ][
        print form-signed i
    ]
    ```

--------------------------------------------------------------------------------

On 2011-07-03T08:54:31Z, dockimbel, commented:
<https://github.com/red/red/issues/120#issuecomment-1491681>

    I have extracted the dependencies from your gists. I had to add a `return: [integer!]` declaration to your `max` and `min` functions to make them compile.
    
    Using now `printf` and your gists, I still correctly get `97` twice as result. I have put the test source code in gist [1062078](https://gist.github.com/1062078)

--------------------------------------------------------------------------------

On 2011-07-03T09:50:44Z, meijeru, commented:
<https://github.com/red/red/issues/120#issuecomment-1491772>

    This issue can now be closed AFAIC.The source code in your gist runs OK at my place also.

