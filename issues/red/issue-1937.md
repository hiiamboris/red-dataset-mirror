
#1937: Output invisible in GUI-Console
================================================================================
Issue is closed, was reported by ghost and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/1937>

In GUI-Console

```
probe system
probe system
```

Now scroll up, you will find invisible lines of text which becomes visible on click.
If you scroll to the top, there is unformatted text on top which does not occur if `probe` is used only once.

![animation](https://cloud.githubusercontent.com/assets/16458742/15570865/d11d9458-2355-11e6-9e6f-d566ce46bbb6.gif)



Comments:
--------------------------------------------------------------------------------

On 2016-05-27T03:22:58Z, qtxie, commented:
<https://github.com/red/red/issues/1937#issuecomment-222051416>

    Note with this fix, the first few lines still corrupts when `probe system` twice. This is the right behaviour as we use a ring buffer for output. 
    
    We'll let the user to configure the buffer size in the next version, so if someone want to get a big complete output, he can just enlarge the buffer size.

