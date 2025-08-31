
#3246: Interpreter allows return to be called outside of a function in "lower-level" scripts
================================================================================
Issue is closed, was reported by PeterWAWood and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3246>

### Expected behavior
When return is called outside of a function, an error should be thrown.
*** Throw Error: return or exit not in function
*** Where: return
*** Stack: 

### Actual behavior
An error is not thrown

### Steps to reproduce the problem
Create two scripts:
```text
;; %c,red 
Red[]
do %b.red
```
```text
;; %b.red
Red[]
print "in b"
return 0
```
 Then run them both:
```text
$ ./test-console ../../Code/Red/modules/c.red
in b
$ ./test-console ../../Code/Red/modules/b.red
in b
*** Throw Error: return or exit not in function
*** Where: return
*** Stack: 
```

### Red version and build date, operating system with version.
>> system/build
== make object! [
    date: 5-Mar-2018/10:33:35+08:00
    config: make object! 
>> 
 macOS 10.12.6


Comments:
--------------------------------------------------------------------------------

On 2018-03-14T09:49:29Z, dockimbel, commented:
<https://github.com/red/red/issues/3246#issuecomment-372962917>

    The provided fix should also help avoid the unwanted change of working folder when DOing a script in a different folder, and the script fails to load.

--------------------------------------------------------------------------------

On 2018-04-05T09:10:47Z, dockimbel, commented:
<https://github.com/red/red/issues/3246#issuecomment-378870526>

    This change causes a regression in error reports from files run with `do`:
    ```
    >> do %rich-text.red
    *** Script Error: cannot compare 1 with none
    *** Where: do
    *** Stack: do-file  
    
    >> do load %rich-text.red
    *** Script Error: cannot compare 1 with none
    *** Where: <
    *** Stack: probe rtd-layout
    ```

