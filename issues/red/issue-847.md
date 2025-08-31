
#847: NaN comparision doesn't follow IEEE754 spec.
================================================================================
Issue is closed, was reported by qtxie and has 22 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/847>

Using the code below to do the test.

```
Red []

foo-test: routine [][
    inf: 1e308 + 1e308
    nan: 0.0 * inf
    print-line inf
    print-line nan
    print-line ["inf > nan: " inf > nan]
    print-line ["inf < nan: " inf < nan]
    print-line ["inf <> nan: " inf <> nan]
    print-line ["inf = nan: " inf = nan]
]

foo-test
```

Results on Windows

```
1.#INF
-1.#IND
inf > nan: false
inf < nan: true                 ;@@ should be false
inf <> nan: false               ;@@ should be true
inf = nan: true                 ;@@ should be false
```

Results on ARM
On ARM (QEMU VM), we find that it doesn't generate INF and NaN, don't know why.

```
1.060479830104e-314             ;@@ should be INF ?
1.0607388627933e-314            ;@@ should be NaN ?
inf > nan: true
inf < nan: false
inf <> nan: true
inf = nan: false
```

```
```



Comments:
--------------------------------------------------------------------------------

On 2014-06-18T04:32:32Z, dockimbel, commented:
<https://github.com/red/red/issues/847#issuecomment-46395068>

    This is probably caused by the FPU flags in both cases not being set as we need.

--------------------------------------------------------------------------------

On 2014-07-01T12:50:20Z, qtxie, commented:
<https://github.com/red/red/issues/847#issuecomment-47651535>

    @dockimbel  FYI, In both C and Red/System, the value of `EFLAGS` is the same when doing comparasion.
    
    ```
    #include <stdio.h>
    int main()
    {
        double NaN = 0.0 / 0.0;
        double b = 0.5;
    
        if (NaN < b) {               // false
            printf("1\n");
        }
        if (NaN > b) {               // false
            printf("2\n");
        }
        if (b < NaN) {               // false
            printf("3\n");
        }
        if (b != NaN) {              // true
            printf("4\n");         
        }
        return 0;
    }
    ```
    
    Generated ASM
    
    ```
        .file   "printf-test.c"
        .def    ___main;    .scl    2;  .type   32; .endef
        .section .rdata,"dr"
    LC2:
        .ascii "1\0"
    LC3:
        .ascii "2\0"
    LC4:
        .ascii "3\0"
    LC5:
        .ascii "4\0"
        .text
        .globl  _main
        .def    _main;  .scl    2;  .type   32; .endef
    _main:
        pushl   %ebp
        movl    %esp, %ebp
        andl    $-16, %esp
        subl    $32, %esp
        call    ___main
        fldz
        fldz
        fdivrp  %st, %st(1)
        fstpl   24(%esp)
        fldl    LC1
        fstpl   16(%esp)
        fldl    16(%esp)
        fldl    24(%esp)
        fxch    %st(1)
        fucomip %st(1), %st
        fstp    %st(0)
        jbe L2
        movl    $LC2, (%esp)
        call    _puts
    L2:
        fldl    24(%esp)
        fldl    16(%esp)
        fxch    %st(1)
        fucomip %st(1), %st
        fstp    %st(0)
        jbe L4
        movl    $LC3, (%esp)
        call    _puts
    L4:
        fldl    24(%esp)
        fldl    16(%esp)
        fxch    %st(1)
        fucomip %st(1), %st
        fstp    %st(0)
        jbe L6
        movl    $LC4, (%esp)
        call    _puts
    L6:
        fldl    16(%esp)
        fldl    24(%esp)
        fucomip %st(1), %st
        fstp    %st(0)
        jp  L14
        fldl    16(%esp)
        fldl    24(%esp)
        fucomip %st(1), %st
        fstp    %st(0)
        je  L8
    L14:
        movl    $LC5, (%esp)
        call    _puts
    L8:
        movl    $0, %eax
        leave
        ret
        .section .rdata,"dr"
        .align 8
    LC1:
        .long   0
        .long   1071644672
        .ident  "GCC: (tdm-2) 4.8.1"
        .def    _puts;  .scl    2;  .type   32; .endef
    ```

--------------------------------------------------------------------------------

On 2014-07-01T12:55:27Z, qtxie, commented:
<https://github.com/red/red/issues/847#issuecomment-47652039>

    Then rewrite it in Red/System.
    
    ```
    Red/System []
    NaN: 0.0 / 0.0
    b: 0.5
    if NaN < b [print-line "1"]                ; true, should be false
    if NaN > b [print-line "2"]                ; false
    if b < NaN [print-line "3"]                ; true, should be false
    if b <> NaN [print-line "4"]               ; false, should be true
    ```
    
    Generated ASM
    
    ```
     Command                                       Comments
     WAIT
     FINIT
     CALL 00401445
     MOV EAX,27F
     MOV DWORD PTR DS:[402000],EAX
     FLDCW WORD PTR DS:[402000]
     MOV EAX,EBP
     PUSH EAX
     MOV EAX,ESP
     MOV EDX,EAX
     MOV EBP,EAX
     PUSH -1
     PUSH 0
     FLD QWORD PTR DS:[402058]                     ; FLOAT 0.0
     FLD QWORD PTR DS:[402060]                     ; FLOAT 0.0
     FDIVP ST(1),ST
     FSTP QWORD PTR DS:[402068]                    ; FLOAT 0.0
     FLD QWORD PTR DS:[402070]                     ; FLOAT 0.5000000000000000
     FLD QWORD PTR DS:[402068]                     ; FLOAT 0.0
     FCOMIP ST,ST(1)
     FSTP ST
     JAE SHORT 00401062
     PUSH 0
     PUSH OFFSET 00402078
     PUSH 6
     PUSH 0C
     LEA ESI,[LOCAL.5]
     PUSH ESI
     PUSH 1
     CALL 004017EE
     FLD QWORD PTR DS:[402070]                     ; FLOAT 0.5000000000000000
     FLD QWORD PTR DS:[402068]                     ; FLOAT 0.0
     FCOMIP ST,ST(1)
     FSTP ST
     JBE SHORT 0040108B
     PUSH 0
     PUSH OFFSET 0040207A
     PUSH 6
     PUSH 0C
     LEA ESI,[ESP+4]
     PUSH ESI
     PUSH 1
     CALL 004017EE
     FLD QWORD PTR DS:[402068]                     ; FLOAT 0.0
     FLD QWORD PTR DS:[402070]                     ; FLOAT 0.5000000000000000
     FCOMIP ST,ST(1)
     FSTP ST
     JAE SHORT 004010B4
     PUSH 0
     PUSH OFFSET 0040207C
     PUSH 6
     PUSH 0C
     LEA ESI,[ESP+4]
     PUSH ESI
     PUSH 1
     CALL 004017EE
     FLD QWORD PTR DS:[402068]                     ; FLOAT 0.0
     FLD QWORD PTR DS:[402070]                     ; FLOAT 0.5000000000000000
     FCOMIP ST,ST(1)
     FSTP ST
     JE SHORT 004010DD
     PUSH 0
     PUSH OFFSET 0040207E
     PUSH 6
     PUSH 0C
     LEA ESI,[ESP+4]
     PUSH ESI
     PUSH 1
     CALL 004017EE
    ```

--------------------------------------------------------------------------------

On 2014-07-01T15:27:16Z, dockimbel, commented:
<https://github.com/red/red/issues/847#issuecomment-47670512>

    @qtxie Thank you for the very useful comparison! :-)

--------------------------------------------------------------------------------

On 2014-07-02T01:35:37Z, qtxie, commented:
<https://github.com/red/red/issues/847#issuecomment-47728450>

    @dockimbel Actually only compare with `NaN` has this issue.
    The problems is when compare with a `NaN`, `CF`, `PF` and `ZF` will be set to `1`. 
    This is why C use `JBE` for both `<` and `>`. 
    For the last case, it uses `JP` to test `PF` before perform `JE`.
    FYI.
    `JAE     Jump short if above or equal (CF=0).`
    `JBE     Jump short if below or equal (CF=1 or ZF=1).`

--------------------------------------------------------------------------------

On 2014-07-02T03:39:20Z, qtxie, commented:
<https://github.com/red/red/issues/847#issuecomment-47734318>

    @dockimbel So for now I can come up with two ways to handle `NaN` comparision.
    1. Handle it as the same behavious as the `proposal` described in Red wiki page. https://github.com/red/red/wiki/%5BProposal%5D-The-Handling-of-NaNs,-INFs-and-signed-zeros.
    2. Throw an error (Current behavious, if control-word set to 0222h correctly). Since 99.99% cases will no need to do comparision with `NaN`, so it's reasonable to throw an error. If user really want to handle `NaN`, we would provide a `NaN?` native to do the tests.
    
    I perfer plan `2`. Plan `1` need to add more test instructions just for some rarely used case, I think it is not worth doing it.

--------------------------------------------------------------------------------

On 2014-07-03T15:21:12Z, dockimbel, commented:
<https://github.com/red/red/issues/847#issuecomment-47943816>

    Plan 2 looks like a better option right now.

--------------------------------------------------------------------------------

On 2015-01-29T02:58:31Z, qtxie, commented:
<https://github.com/red/red/issues/847#issuecomment-71960873>

    @dockimbel We already supported plan 2 now.

--------------------------------------------------------------------------------

On 2018-05-22T14:29:49Z, hiiamboris, commented:
<https://github.com/red/red/issues/847#issuecomment-391011887>

    look, more bugs came up (not `#inf`, normal numbers):
    ```
    >> 1.0 < 1.#nan
    == true
    >> 1.#nan > 1.0
    == false
    >> 1.0 > 1.#nan
    == false
    >> 1.#nan < 1.0
    == true
    ```
    (all should yield `false`)
    ```
    -----------RED & PLATFORM VERSION----------- 
    RED: [ branch: "master" tag: #v0.6.3 ahead: 703 date: 10-May-2018/3:19:55 commit: #7c5f402062ac67fbd6078592ca477bbe91a56f92 ]
    PLATFORM: [ name: "Windows 7 Service Pack 1" OS: 'Windows arch: 'x86-64 version: 6.1.1 build: 7601 ]
    --------------------------------------------
    ```

--------------------------------------------------------------------------------

On 2019-09-18T19:52:01Z, qtxie, commented:
<https://github.com/red/red/issues/847#issuecomment-532839719>

    > look, more bugs came up (not `#inf`, normal numbers):
    > 
    > ```
    > >> 1.0 < 1.#nan
    > == true
    > >> 1.#nan > 1.0
    > == false
    > >> 1.0 > 1.#nan
    > == false
    > >> 1.#nan < 1.0
    > == true
    > ```
    > 
    > (all should yield `false`)
    > 
    > ```
    > -----------RED & PLATFORM VERSION----------- 
    > RED: [ branch: "master" tag: #v0.6.3 ahead: 703 date: 10-May-2018/3:19:55 commit: #7c5f402062ac67fbd6078592ca477bbe91a56f92 ]
    > PLATFORM: [ name: "Windows 7 Service Pack 1" OS: 'Windows arch: 'x86-64 version: 6.1.1 build: 7601 ]
    > --------------------------------------------
    > ```
    
    No more bugs. This issue has never been fixed. 

--------------------------------------------------------------------------------

On 2023-09-24T21:18:11Z, dockimbel, commented:
<https://github.com/red/red/issues/847#issuecomment-1732671623>

    
    ```
    >> 1.#nan >= 1.#nan
    == true
    >> 1.#nan <= 1.#nan
    == true
    >> 1.#nan <= 1
    == true
    >> 1.#nan >= 1
    == true
    >> 1 <= 1.#nan
    == true
    >> 1 >= 1.#nan
    == true
    ```
    
    **To reproduce**
    ```
    1.#nan >= 1.#nan
    1.#nan <= 1.#nan
    1.#nan <= 1
    1.#nan >= 1
    1 <= 1.#nan
    1 >= 1.#nan
    ```
    
    **Expected behavior**
    
    All false
    
    **Platform version**
    ```
    Red 0.6.4 for Windows built 11-Sep-2023/10:40:41+03:00  commit #def4b65
    ```

