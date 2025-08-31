
#5521: CSV decoder should raise its errors
================================================================================
Issue is open, was reported by hiiamboris and has 6 comment(s).
<https://github.com/red/red/issues/5521>

**Describe the bug**

I've tripped on this like 5 times already. When CSV decoder can't load a file, it just returns an `error!` object. Which propagates the error further, and requires a debugging effort.

Besides, when loading a generic file (user-specified), this behavior is indistinguishable from if we were loading a Redbin file with an `error!` object in it.

**To reproduce**
```
>> type? load/as {# CSV with comments...^/a,b,c^/1,2,3} 'csv
== error!
```

**Expected behavior**

An error should be raised: behavior aligned with the rest of the language's runtime.

**Platform version**
`Red 0.6.5 for Windows built 2-Jul-2024/1:21:21+08:00  commit #bbecb7e`


Comments:
--------------------------------------------------------------------------------

On 2024-07-08T20:14:17Z, greggirwin, commented:
<https://github.com/red/red/issues/5521#issuecomment-2215179416>

    Image codecs just return `none` if the data isn't valid. 
    
    Loading serialized data that has error values in it seems to lean in favor of errors as data. But if you mean that a genuine error, because of corrupt redbin data, being indistinguishable from an error value it loads successfully, let's come up with a how-to for dealing with that. If we generalize the redbin error of `Script Error: data not in correct format:` so other codecs are consistent with that, now we have a real problem to solve.

--------------------------------------------------------------------------------

On 2024-07-08T20:15:46Z, greggirwin, commented:
<https://github.com/red/red/issues/5521#issuecomment-2215183794>

    I'm not disagreeing with the ticket, just adding things to consider.

--------------------------------------------------------------------------------

On 2024-07-09T08:04:13Z, hiiamboris, commented:
<https://github.com/red/red/issues/5521#issuecomment-2216883063>

    > Image codecs just return `none` if the data isn't valid.
    
    That probably deserves another ticket.

