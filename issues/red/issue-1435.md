
#1435: invalid draw input in base face crashes without error
================================================================================
Issue is closed, was reported by WiseGenius and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1435>

Invalid input in the draw dialect usually has a sensible error message:

```
red>> draw 100x100 [dark-matter]
*** Script error: invalid Draw dialect input at: dark-matter
*** Where: draw-image
red>>
```

However, when viewing a `'base` face with invalid draw dialect input, Red crashes without providing an error message.

```
red>> win: make face! [type: 'window text: "Example" offset: 50x50 size: 200x200]
== make object! [
    type: 'window
    offset: 50x50
    size: 200x2...
red>> win/pane: reduce [make face! [type: 'base offset: 50x50 size: 100x100 draw: [dark-matter]]]
== [make object! [
    type: 'base
    offset: 50x50
    size: 100x10...
red>> view win

H:\Work\Red\Tests Red\2015-11-12-23-21-35-red-gui\red-gui>
```

This also applies when the code is compiled.



Comments:
--------------------------------------------------------------------------------

On 2016-02-05T07:32:35Z, qtxie, commented:
<https://github.com/red/red/issues/1435#issuecomment-180234902>

    Not crash anymore with latest version. 
    I remember it is caused by some stack issue. Will close it after all the bug fix.

--------------------------------------------------------------------------------

On 2016-02-26T04:33:09Z, dockimbel, commented:
<https://github.com/red/red/issues/1435#issuecomment-189109937>

    @qtxie When I try to reproduce it in GUI console, I get proper error messages, though, when I close the GUI console, it crashes on an assertion:
    
    ```
    *** Script error: invalid Draw dialect input at: dark-matter
    *** Where: make-view
    
    *** Runtime Error 98: assertion failed
    *** in file: /C/dev/Red/modules/view/backends/windows/gui.reds
    *** at line: 165
    ```

