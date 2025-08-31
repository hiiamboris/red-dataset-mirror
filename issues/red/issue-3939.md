
#3939: Compiling error when use `-u` on GTK backend
================================================================================
Issue is closed, was reported by qtxie and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3939>

**To reproduce**
Comments [L379](https://github.com/red/red/blob/GTK/modules/view/backends/platform.red#L379) in /red/modules/view/backends/platform.red and compiles %red/tests/gtk3/vid.red with `-u` on GTK backend.
```
do/args %red/red.r "-t Linux -u red/tests/gtk3/vid.red"
```

Error as below:
```
-=== Red Compiler 0.6.4 ===- 

Compiling /home/qt/dev/red/tests/gtk3/vid.red ...
...compilation time : 1466 ms

Target: Linux 

Compiling to native code...
libRedRT-extras.r file generated, recompiling... 

Compiling /home/qt/dev/red/tests/gtk3/vid.red ...
Compiling libRedRT...
...compilation time : 898 ms

Compiling to native code...
...compilation time : 26473 ms
...linking time     : 409 ms
...output file size : 705288 bytes
...output file      : /home/qt/dev/red/libRedRT.so 

...compilation time : 682 ms

Target: Linux 

Compiling to native code...
*** Red/System Compiler Internal Error: Script Error : Cannot use add on none! value 
*** Where: emit-stack-align-prolog 
*** Near:  [all [
args/1 = #variadic 
fspec/3 <> 'cdecl 
offset: offset + 12
] 
call-arguments-size? args/2
] 
```

**Platform version (please complete the following information)**
Linux, Red GTK branch



Comments:
--------------------------------------------------------------------------------

On 2019-07-22T13:54:08Z, qtxie, commented:
<https://github.com/red/red/issues/3939#issuecomment-513800993>

    Here is a temporary fix for the crash happening once the runtime can be compiled with libRedRT:
    ```
    emit-stack-align-prolog: func [args [block!] fspec [block!] /local offset extra][
        if compiler/job/stack-align-16? [
            emit #{89E7}                            ;-- MOV edi, esp
            emit #{83E4F0}                          ;-- AND esp, -16
            
            offset: 4 + either issue? args/1 [      ;-- account for saved edi
                all [
                    args/1 = #variadic
                    fspec/3 <> 'cdecl
                    extra: 12                       ;-- account for extra variadic slots
                ]
                call-arguments-size? args/2
            ][
                emitter/arguments-size? fspec/4
            ]
            offset: offset + any [extra 0]
            unless zero? offset: offset // 16 [
                emit #{83EC}                        ;-- SUB esp, offset     ; ensure call will be 16-bytes aligned
                emit to-bin8 16 - offset
            ]
            emit #{57}                              ;-- PUSH edi
        ]
    ]
    ```

