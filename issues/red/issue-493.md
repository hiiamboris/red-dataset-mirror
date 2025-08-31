
#493: Error with 'print-line and integer!s
================================================================================
Issue is closed, was reported by Respectech and has 2 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/493>

I am running this on Windows currently.  XP 32-bit.  Here's the complete code:
# include #../C-library/ANSI.reds

img1: as-binary 0
size1: 0

img1: read-file-binary "img1.bin" :size1

i: 0
r: 0
g: 0
b: 0
im1: 0
until [
    r: i + 2
    g: i + 3
    b: i + 4
    im1: as-integer ((img1/r / 3) + (img1/g / 3) + (img1/b / 3))
    print-line im1
    i: i + 4
    i >= size1
]

---

Output:

...
4260192
4260451
4260203
4260207
4259945
4259944
4259940
4260451
4260196
4260194

---

If I change the line

```
print-line im1
```

to

```
print-line as-integer ((img1/r / 3) + (img1/g / 3) + (img1/b / 3))
```

I get the expected output as follows:

...
96
99
107
111
105
104
100
99
100
98



Comments:
--------------------------------------------------------------------------------

On 2013-07-08T18:44:21Z, dockimbel, commented:
<https://github.com/red/red/issues/493#issuecomment-20626980>

    The emitted code does not save intermediary values properly. This will wait my return from the devcon to be fixed.

