# Issue #5644: [CSV] Abruptly stops decoding at an arbitrary point
<https://github.com/red/red/issues/5644>

**Describe the bug**

I have 4088 rows in my file, but CSV only reads 244 of them. There's no error of any kind.

**To reproduce**

1. Download this file: [red-issues-list.csv](https://github.com/user-attachments/files/21912049/red-issues-list.csv)
2. Decode and inspect the data:
   ```
   >> data: load-csv/with text: read %red-issues-list.csv tab
   == [["5641" "OPEN" "LOAD-CSV returns error instead of throwing it" "status.duplicate" "2025-08-19T13:00:07Z"] ["5640" "CLOSED" "TEXT-LIST isn't updated on...
   >> length? text
   == 463019
   >> length? data
   == 244
   >> last data
   == ["5365" "CLOSED" {Transcode on file! scans different than previous Red version} {status.built, status.tested, type.bug, test.written} "2025-04-03T21:21...
   ```

**Expected behavior**

`length? data` should be 4088

**Platform version**
```
Red 0.6.6 for Windows built 13-Jul-2025/14:44:33
```



## greggirwin on 2025-09-02T03:13:10Z
Seems to be when a quoted string appears immediately after the delimiter. Based on this and some other testing.
```
>> text: read-clip
== {5363^-CLOSED^-"invalid function definition" on `return:` docstring^-status.built, status.tested, type.bug, test.written^...
>> data: load-csv/with text tab
== [["5363" "CLOSED" "invalid function definition"]]
```



## greggirwin on 2025-09-03T01:47:25Z
Per https://datatracker.ietf.org/doc/html/rfc4180, which our CSV codec implements, fields containing quotes must be enclosed in quotes, and the embedded quotes must be escaped by doubling them. Right now the behavior is different, based on where the quotes fall, but either case should throw an error IMO.


## hiiamboris on 2025-09-03T07:20:47Z
I would like codecs to be forgiving on input and strict on output. With optional warnings issued when input data is not conformant. This way we won't have to fix manually all the issues that can be fixed automatically.


## greggirwin on 2025-09-03T18:51:36Z
I often support Postel's Robustness Principle, but it's just a different set of tradeoffs. In the case of CSV the RFC is strictly informational as well. There is no actual standard. @rebolek did include a `strict?` flag that, so far, only checks field alignment. It's not accessible, but brings us back to DocKimbel's https://gist.github.com/dockimbel/8db123c382d76014b2232f09acb82e73 draft for codec interfaces.

I don't understand how optional warnings affect manual vs automatic fixing, or exactly what those mean. e.g. do you mean "fixing" by handling the loaded, malformed data, or in what generates it? If the latter, won't an error clue you in the same way as an optional warning? Or do you mean warnings like "There were 4'088 lines in the file, but 88 of them couldn't be loaded, so the result contains only 4'000 records."? Maybe with that data available as well, for debugging and analysis.


## hiiamboris on 2025-09-04T04:26:22Z
> I don't understand how...

If codec can load data that's not standard that means I don't have to waste *my own time* to manually make the data conformant.


## greggirwin on 2025-09-04T05:16:49Z
That's going to be a moving target though, isn't it? That is, how malformed can it be, how should the loader behave, and how does that affect what you eventually have to do to deal with bad data? Every source could be broken in different ways. Handling all those cases, as they arise, will likely make a mess of the decoder.


## GiuseppeChillemi on 2025-09-05T00:18:39Z
I am actually working with CSV managers and buiding my own.
When there are malformed rows the software points it but loads the data, fixing or  throwing the offending lines. I find this very helpful because together with the error type and position, I am able also to find and fix it on the source CSV.

I would like Red to load the data and auto fix when possibile, giving me useful information where this has happened. I could suggest having
`/strict` refinement for throwing an error when there is a problem
`/info word-here` to have `LOAD` set a word with debug information like all the fixed lines and their position
 



## hiiamboris on 2025-09-05T08:32:49Z
@greggirwin IMO it's already a total mess ;) But no, I don't think handling common cases like typical TSV are going to introduce any noticeable complexity. In any case, codec silently stopping at an arbitrary point without any error is a thing to address.


## greggirwin on 2025-09-10T21:23:05Z
1) I agree completely that failing silently is the big problem. 
2) For line oriented files, we *can* catch errors on a given line and separate those results. This is what I'm thinking about now.
3) ...

Never hit Send on this, and now I've lost my train of thought. Back to all this shortly.


