
#5509: 16-bit vector! math error
================================================================================
Issue is closed, was reported by ldci and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5509>

**Describe the bug**
Under macOS, there is a bug for 16-bit vectors

a: make vector! [integer! 8 [3 8 4 6]]
b: make vector! [integer! 8 [4 0 1 -9]]
a + b 
**correct: make vector! [integer! 8 [7 8 5 -3]]**

a: make vector! [integer! 16 [3 8 4 6]]
b: make vector! [integer! 16 [4 0 1 -9]]
a + b 
**incorrect:  make vector! [integer! 16 [1792 2048 1280 -513]]**
a: make vector! [integer! 32 [3 8 4 6]]
b: make vector! [integer! 32 [4 0 1 -9]]
a + b 
**correct: make vector! [integer! 8 [7 8 5 -3]]**

**Platform version**
Red 0.6.5 for macOS built 24-May-2024/15:27:10+02:00  commit #22290c9



Comments:
--------------------------------------------------------------------------------

On 2024-05-31T13:17:24Z, dockimbel, commented:
<https://github.com/red/red/issues/5509#issuecomment-2142145784>

    All platforms, not just macOS.

