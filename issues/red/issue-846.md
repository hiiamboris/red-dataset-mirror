
#846: float! arithmetical operation result inconsistent between ARM and x86
================================================================================
Issue is closed, was reported by qtxie and has 14 comment(s).
[status.built] [status.tested] [type.review] [Red/System]
<https://github.com/red/red/issues/846>

Print float! using following code.

```
Red/System []

uint64!: alias struct! [int1 [byte-ptr!] int2 [byte-ptr!]]

print-float-hex: func [
    number  [float!]
    /local
        f   [float!]
        a   [uint64!]
        d   [int-ptr!]
][
    f: number + 6755399441055744.0
    a: as uint64! :f
    print-line [a/int2 a/int1]
]

print-float-hex 0.5
print-float-hex 0.501
print-float-hex 0.5001
```

Result on ARM

```
4338000000000000
4338000000000001
4338000000000001          ;@@
```

Result on X86

```
4338000000000000
4338000000000001
4338000000000000         ;@@
```



Comments:
--------------------------------------------------------------------------------

On 2014-06-26T06:30:24Z, qtxie, commented:
<https://github.com/red/red/issues/846#issuecomment-47191929>

    I think it's a bug on X86 platform. I write this test in C, the results on both ARM and X86 are the same.
    Output by C:
    
    ```
    4338000000000000
    4338000000000001
    4338000000000001
    ```

--------------------------------------------------------------------------------

On 2014-06-26T09:58:40Z, dockimbel, commented:
<https://github.com/red/red/issues/846#issuecomment-47207892>

    This is not a bug, the result is right from the x87 FPU. It is most probably about the FPU default settings for rounding that are different on both backends. I need to implement FPU options support for ARM in order to check and compare the settings with the x87 FPU.

--------------------------------------------------------------------------------

On 2014-06-26T11:01:06Z, qtxie, commented:
<https://github.com/red/red/issues/846#issuecomment-47212774>

    Yes, seems the rounding mode on  ARM is round-to-nearest-even. 

--------------------------------------------------------------------------------

On 2014-06-29T07:49:09Z, dockimbel, commented:
<https://github.com/red/red/issues/846#issuecomment-47448122>

    I have troubles getting the same results on both backends... Notice that Rebol3 gives the same result as Red on x86:
    
    ```
    >> to-binary a + 6755399441055744.0
    == #{4338000000000000}
    ```

--------------------------------------------------------------------------------

On 2014-06-29T08:42:46Z, dockimbel, commented:
<https://github.com/red/red/issues/846#issuecomment-47448956>

    @qtxie, could you display the content of the FPU control word for both cases in your C test program?

--------------------------------------------------------------------------------

On 2014-06-29T11:44:39Z, qtxie, commented:
<https://github.com/red/red/issues/846#issuecomment-47452249>

    @dockimbel Here is the C test program. Using this lib (http://linasm.sourceforge.net/docs/api/fpu.php) to display FPU control word.
    
    ```
    #include <stdio.h>
    #include "FPU.h"
    
    void print_double_hex( double d )
    {
        union UD
        {
            double d;
            int i[2];
        } c;
        c.d = d + 6755399441055744.0;
        printf("0x%08x 0x%08x\n", c.i[1], c.i[0]);
    }
    
    int main()
    {
        double a = .5;
        double b = 0.501;
        double c = 0.5001;
        int fpu = 0;
        printf("before arithmetic\n");
        fpu = FPU::GetMode();
        printf("FPU control word 0x%08x\n", fpu);
        printf("FPU rounding mode 0x%08x\n", GetRoundMode(fpu));
        printf("FPU precision mode 0x%08x\n", GetPrecisionMode(fpu));
        printf("FPU status 0x%08x\n", FPU::GetStatus());
    
        print_double_hex(a);
        print_double_hex(b);
        print_double_hex(c);
    
        printf("after arithmetic\n");
        fpu = FPU::GetMode();
        printf("FPU control word 0x%08x\n", fpu);
        printf("FPU rounding mode 0x%08x\n", GetRoundMode(fpu));
        printf("FPU precision mode 0x%08x\n", GetPrecisionMode(fpu));
        printf("FPU status 0x%08x\n", FPU::GetStatus());
    
        return 0;
    }
    ```
    
    Results on Windows (gcc v4.8.2)
    
    ```
    before arithmetic
    FPU control word 0x0000037f
    FPU rounding mode 0x00000000       // Round to nearest even integer
    FPU precision mode 0x00000003      // Extended precision (long double)
    FPU status 0x00000000
    0x43380000 0x00000000
    0x43380000 0x00000001
    0x43380000 0x00000001
    after arithmetic
    FPU control word 0x0000037f
    FPU rounding mode 0x00000000
    FPU precision mode 0x00000003
    FPU status 0x00000000
    ```

--------------------------------------------------------------------------------

On 2014-07-25T03:34:11Z, dockimbel, commented:
<https://github.com/red/red/issues/846#issuecomment-50104819>

    Fixed by commit [fde74929](https://github.com/red/red/commit/fde7492912084acf424316406e680011ab0fd6a3).

