
#3219: -u compiler option does not seem to generate libRedRT correctly
================================================================================
Issue is closed, was reported by PeterWAWood and has 4 comment(s).
[status.tested] [status.resolved] [type.review]
<https://github.com/red/red/issues/3219>

### Expected behaviour
The program (below) when compiled with the `-u` option and run under Windows:
```text
PS E:\Red\red> ./test
FF
100
PS E:\Red\red>
```

### Actual behaviour
Under macOS
```text
mbp:red peter$ ./test
dyld: lazy symbol binding failed: Symbol not found: _red/string/byte-to-hex
  Referenced from: /Users/peter/VMShare/Red/red/./test
  Expected in: flat namespace

dyld: Symbol not found: _red/string/byte-to-hex
  Referenced from: /Users/peter/VMShare/Red/red/./test
  Expected in: flat namespace

Abort trap: 6
mbp:red peter$ 
```
### Steps to reproduce the problem
Compile this program with the `-u` option:
```text
Red []

#system [
	print [string/byte-to-hex 255 lf]
]

print 100

```

### Red version and build date, operating system with version.
```text
>> system/build
== make object! [
    date: 5-Feb-2018/7:28:22+08:00
    config: make object! 

commit 5cfbe25b6c96d6aab09f553264642c338d40c1bb (HEAD -> master, upstream/master) 
```


Comments:
--------------------------------------------------------------------------------

On 2018-03-13T12:52:15Z, dockimbel, commented:
<https://github.com/red/red/issues/3219#issuecomment-372654624>

    It works fine as long as you ensure that no other libRedRT library instance is present:
    ```
    red clear
    red -u test.red
    ```
    
    I will see if forcing the deletion of a previous libRedRT instance could be added when `-u` is used.

--------------------------------------------------------------------------------

On 2018-03-13T13:23:21Z, dockimbel, commented:
<https://github.com/red/red/issues/3219#issuecomment-372663213>

    Now, a previous libRedRT instance if found, will be deleted upon using `-u` option.

