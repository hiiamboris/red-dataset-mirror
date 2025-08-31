
#3637: [Compiler] Object namespace corruption?
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
[type.compiler]
<https://github.com/red/red/issues/3637>

**Describe the bug**

When compiled the following script produces a set of unexpected results. As a consequence, running the `recycle-test.red` after `object-test.red` becomes impossible in the test suite.

May be of relevance: https://github.com/red/red/issues/3597 https://github.com/red/red/issues/3408

**To Reproduce**
```
Red []

d: context [
   f: does [100]
]
h: :d/f

probe :h
print mold :h
print [mold :h]

o: make object! [
	f: make object! copy [
	h: make object! copy [
		data: 1
] ] ]

print ["1. o=" mold :o]
probe :o
print ["2. o/f=" mold :o/f]
probe :o/f
print ["3. o/f/h=" mold :o/f/h]
probe :o/f/h
print ["4. o/f/h/data=" mold :o/f/h/data]
probe o/f/h/data
```

**The compiled results are:**
```
unset            <- this should be `func [][100]`
unset            <- this should be `func [][100]`
func [][100]
1. o= make object! [
    f: make object! [
        h: make object! [
            data: 1
        ]
    ]
]
make object! [
    f: make object! [
        h: make object! [
            data: 1
        ]
    ]
]
2. o/f= make object! [
    h: make object! [
        data: 1
    ]
]
make object! [
    h: make object! [
        data: 1
    ]
]
3. o/f/h= make object! [
    data: 1
]
*** Script Error: cannot access f in path none      <- mold couldn't get access to o/f/h
*** Where: eval-path
*** Stack:
```

**Expected behavior**
In the interpreted everything is OK:
```
func [][100]
func [][100]
func [][100]
1. o= make object! [
    f: make object! [
        h: make object! [
            data: 1
        ]
    ]
]
make object! [
    f: make object! [
        h: make object! [
            data: 1
        ]
    ]
]
2. o/f= make object! [
    h: make object! [
        data: 1
    ]
]
make object! [
    h: make object! [
        data: 1
    ]
]
3. o/f/h= make object! [
    data: 1
]
make object! [
    data: 1
]
4. o/f/h/data= 1
1
```

**Platform version(please complete the following information):**
```
Red 0.6.4 for Windows built 7-Dec-2018/8:41:53+03:00 commit #1bdbdc2
```


Comments:
--------------------------------------------------------------------------------

On 2018-12-10T12:10:48Z, dockimbel, commented:
<https://github.com/red/red/issues/3637#issuecomment-445794279>

    @hiiamboris "As a consequence..." Can you elaborate on that? How does compiling a given script influences in any way the tests suite?

--------------------------------------------------------------------------------

On 2018-12-10T14:20:53Z, hiiamboris, commented:
<https://github.com/red/red/issues/3637#issuecomment-445831456>

    @dockimbel this scenario was taken from two tests in the suite (and minimized to an extent). I believe it was https://github.com/red/red/blob/master/tests/source/units/object-test.red#L522 and https://github.com/red/red/blob/master/tests/source/units/recycle-test.red#L706. So when these two test files occur in a sequence in one of the `run-all-comp*` files, the run fails.

