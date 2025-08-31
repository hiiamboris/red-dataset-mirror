
#605: LENGTH? of NONE reports weird numbers instead of NONE or error
================================================================================
Issue is closed, was reported by hostilefork and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/605>

in Rebol:

```
>> length? none
== none
```

...in current Red console I'm using ("0.4.1, 13-Dec-2013/23:19:35-5:00"):

```
>> length? none
== 97216
```

...recently [RebolBot reported 134723535](http://chat.stackoverflow.com/transcript/message/13523026#13523026)



Comments:
--------------------------------------------------------------------------------

On 2013-12-14T18:17:28Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/605#issuecomment-30582458>

    There are many more such missing guards for missing features.

