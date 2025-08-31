
#4044: view opening unexpectedly on macOS
================================================================================
Issue is closed, was reported by ralfwenske and has 0 comment(s).
[status.built] [GUI]
<https://github.com/red/red/issues/4044>

**Describe the bug**
calling view and unview/only several times leads to unexpected opening of two windows (seems to behave as expected in win10)

**To reproduce**
```
Red []
win1: layout [
    title "Win1"
    h1 "test window 1"
    button "Close" [unview/only win1 print ["closed win1"]]
]
win2: layout  [
    title "Win2"
    h1 "test window 2"
    button "Close" [unview/only win2 print ["closed win2"]]
]
win3: layout  [
    title "Win2"
    h1 "test window 3"
    button "Close" [unview/only win3 print ["closed win3"]]
]
view win1
print ["showing win2"]
view win2
print ["showing win3"]
view win3
print "Done"
```
1. close win1 (click on button)
2. win2 and win3 open immediately

**Expected behavior**
win3 should open only after win2 is closed

**Console output**
```
closed win1
showing win2
showing win3
closed win2
Done
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for macOS built 21-Sep-2019/2:03:51+10:00 commit #04daa5e
```



