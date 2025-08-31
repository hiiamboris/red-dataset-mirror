
#4041: Float dividing gives different result between ARM and x86 backend in some cases
================================================================================
Issue is open, was reported by qtxie and has 2 comment(s).
[status.deferred] [type.review]
<https://github.com/red/red/issues/4041>

**To reproduce**
```
Red []
to-binary 2.2250738585072014e-308 / 1.1
```
This result:
```
On ARM: #{000E8BA2E8BA2E8B}      ;-- correct
On x86: #{000E8BA2E8BA2E8C}      ;-- wrong?
```

**Platform version (please complete the following information)**
red master 9d0a4e709e961fcc915c249eb03d185ba4c8de05



Comments:
--------------------------------------------------------------------------------

On 2021-09-22T12:17:32Z, dockimbel, commented:
<https://github.com/red/red/issues/4041#issuecomment-924875140>

    It is probably caused by the 80-bit extended precision on x87. Once we move to SSE for floats support, I think it will solve this difference without any extra effort.

