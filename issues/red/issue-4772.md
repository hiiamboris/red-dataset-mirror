
#4772: PWD var is not updated on Linux leading to unexpected behavior
================================================================================
Issue is open, was reported by hiiamboris and has 14 comment(s).
[type.review]
<https://github.com/red/red/issues/4772>

discussion [starts here](https://gitter.im/red/bugs?at=5fc04b847850f66b6046cc04)

**Describe the bug**

```
>> pwd
%/home/test/
>> cd %1
== %/home/test/1/
>> pwd
%/home/test/1/
>> call/output "pwd" s: "" s
== "/home/test/1^/"
>> call/output "echo $PWD" s: "" s
== "/home/test^/"                   ;) <-- this is an outlier
>> write %script.sh "echo $PWD"
>> call/output "bash script.sh" s: "" s
== "/home/test/1^/"
```

**Expected behavior**

It is believed that `pwd` and `$PWD` are equivalents up to symlink handling: https://stackoverflow.com/a/10795195
As I understand it `pwd` command asks directory from the kernel, but kernel doesn't care about `PWD` variable, only shell does. As such, hard to find bugs may surface in user code.
I propose Red should update PWD env var after each directory change to
> ...an absolute pathname of the current working directory. It shall not contain any components that are dot or dot-dot.

**Platform version**
```
Red 0.6.4 for Linux built 19-Dec-2020/15:56:50+03:00 commit #d082313
Mac syncs PWD automatically, only Linux is bugged.
```



Comments:
--------------------------------------------------------------------------------

On 2021-02-22T08:56:11Z, hiiamboris, commented:
<https://github.com/red/red/issues/4772#issuecomment-783209868>

    related https://github.com/red/red/issues/4832

--------------------------------------------------------------------------------

On 2021-02-22T10:07:13Z, Oldes, commented:
<https://github.com/red/red/issues/4772#issuecomment-783256735>

    I agree with changing PWD env. on linux with the directory change (if it's true that it is what's done on Mac automatically)

--------------------------------------------------------------------------------

On 2021-02-22T10:35:27Z, Oldes, commented:
<https://github.com/red/red/issues/4772#issuecomment-783274748>

    Maybe the `PWD` environment variable could be set also on Windows... just for consistency?

--------------------------------------------------------------------------------

On 2021-02-22T10:58:55Z, Oldes, commented:
<https://github.com/red/red/issues/4772#issuecomment-783289242>

    Also my opinion is, that `pwd` in Red should not `print` the working directory (like shell `pwd` utility), but instead just return the value as in Red there is no concept of pipes like in bash.
    
    I believe this should be possible test:
    ```red
    >> pwd = to-red-file get-env "PWD"
    == true
    ```

--------------------------------------------------------------------------------

On 2021-02-22T14:26:34Z, hiiamboris, commented:
<https://github.com/red/red/issues/4772#issuecomment-783412660>

    > 
    > 
    > Maybe the `PWD` environment variable could be set also on Windows... just for consistency?
    
    It's CD on Windows:
    ```
    >> call/console/shell "echo %cd%"
    D:\devel\red\common
    == 0
    >> call/console/shell "cd"
    D:\devel\red\common
    == 0
    ```
    Not a usual envvar though, Red can't read it with get-env.

--------------------------------------------------------------------------------

On 2021-02-22T16:25:35Z, greggirwin, commented:
<https://github.com/red/red/issues/4772#issuecomment-783496565>

    @Oldes `pwd` is only intended for console use, and the `p` in `pwd` stands for `print`. :^) To get the dir for use, use `what-dir` (which is named that way for R2 compatibility, but not a name I love. 

--------------------------------------------------------------------------------

On 2021-02-22T16:48:37Z, Oldes, commented:
<https://github.com/red/red/issues/4772#issuecomment-783512210>

    @greggirwin `pwd` can be pretty well translated to `process' working directory`. And I personally prefer to have:
    ```rebol
    >> same? :what-dir :pwd
    == true
    
    >> pwd
    == %/C/Dev/
    ```
    with the `==` printed as well, instead of:
    ```red
    >> pwd
    %/C/Dev/
    ```
    Having it just to `print` the directory is limiting its possible usability.

