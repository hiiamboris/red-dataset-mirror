
#4774: [Compiler] I: none or something cause an error
================================================================================
Issue is closed, was reported by tinulac-leinad and has 2 comment(s).
[status.duplicate]
<https://github.com/red/red/issues/4774>

Red []
I: non ;-- or whatever else
cause compilation error (only with the "-r" option)
this is case sensitive and don't occur with i:
daniel@daniel-Lenovo-ideapad-500-15ISK:~/Apps/red/red-projects/dn-abc-tools$ red-lastest -r test.red 

-=== Red Compiler 0.6.4 ===- 

Compiling /home/daniel/Apps/red/red-projects/dn-abc-tools/test.red ...
...compilation time : 1057 ms

Target: Linux 

Compiling to native code...
*** Compilation Error: argument type mismatch on calling: red/natives/repeat-init* 
*** expected: [struct! [
        header [integer!] 
        data1 [integer!] 
        data2 [integer!] 
        data3 [integer!]
    ]], found: [struct! [
        header [integer!] 
        ctx [pointer! [integer!]] 
        symbol [integer!] 
        index [integer!]
    ]] 
*** in file: %/home/daniel/Apps/red/red-projects/dn-abc-tools/test.red 
*** in function: exec/f_ctx||393~value-path?
*** at line: 1 
*** near: [
    r3: 0 
    stack/reset integer/push 0 
    stack/mark-loop ~repeat 
    while
]


Comments:
--------------------------------------------------------------------------------

On 2020-12-21T09:57:30Z, hiiamboris, commented:
<https://github.com/red/red/issues/4774#issuecomment-748884630>

    Closing as a messy duplicate of https://github.com/red/red/issues/4770

