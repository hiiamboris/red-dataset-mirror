# Archived messages from: https://app.gitter.im/#/room/#red_codecs:gitter.im (https://app.gitter.im/#/room/!nGIlGGfGOXfFyPhrPN:gitter.im)

## 19-Jan-2021

[17:44:42](#u0eHwenz9G7PU6-j3Bz8s66jHR1RxX2TXMv495poINw) <greggirwin (Gregg Irwin)>:
New room for codec related chat. 

[17:47:33](#IgUR0ZOfamFRLDkXgX4HISM7tNHQ1_qgAFESkbeurEU) <greggirwin (Gregg Irwin)>:
We have some related wiki pages as well, for archiving things that come up here.

- [General](https://github.com/red/red/wiki/%5BHOWTO%5D-SYSTEM-CODECS,-LOAD-AS-and-SAVE-AS)
- [JSON](https://github.com/red/red/wiki/JSON-codec)
- [CSV}(https://github.com/red/red/wiki/CSV-codec)

[17:47:42](#hy-stroKI499Y25L8N0OF_wS27zJBSC6KtHwvA7vyVo) <greggirwin (Gregg Irwin)>:
* We have some related wiki pages as well, for archiving things that come up here.

- [General](https://github.com/red/red/wiki/%5BHOWTO%5D-SYSTEM-CODECS,-LOAD-AS-and-SAVE-AS)
- [JSON](https://github.com/red/red/wiki/JSON-codec)
- [CSV](https://github.com/red/red/wiki/CSV-codec)

[17:56:05](#OD2twZvWxSLPHNT-cxUtPw-zotHLJdxfo2LmGmkb4ms) <greggirwin (Gregg Irwin)>:
@GiuseppeChillemi started a conversation [here](https://gitter.im/red/chit-chat?at=6003a0b7d5f4bf2965ef53bc) having loaded an 80M JSON file. I did some tests and posted results and some analysis [here](https://gitter.im/red/red?at=600661c0cf8b8277343d15d2). Overnight @hiiamboris dove into the code and produced https://github.com/red/red/pull/4804. 

This is the power of Red, and why a full stack language is empowering. Without having to resort to C or external libraries, Reducers can combine high level features and low level optimizations.

[17:57:48](#n0v4DieQpCbO5O8FGZar_q1ezkRmcWYOkqeqJspDlk0) <greggirwin (Gregg Irwin)>:
Once @rebolek, who authored the JSON codec based on old R2 code, signs off on the PR we'll get it merged. What would be great, then, is to look for other JSON loader benchmarks and see how Red stacks up both in performance and code size.

[18:04:49](#6Hf8-6GEe4B-ohCS2SMMP49tiOE_MDEGyGsxB_9TncU) <hiiamboris (NOT THIS ONE)>:
I also recall Bolek working on it. However it says `Author:  "Gabriele Santilli"` in the header ������

[18:08:39](#W8ZEk5G_KFyAfw4Th5G00fAso6antTTAEvH9BK-j1ZI) <GiuseppeChillemi (GiuseppeChillemi)>:
Do we have other JSON codecs?

[18:17:09](#DVYZLqNkx0GKUeTl0t2b7QUqEJsW2oTi7mFUr-NHi-Q) <greggirwin (Gregg Irwin)>:
@rebolek should be in there as an author.

@GiuseppeChillemi with luck we won't need others, but a full R/S version is possible of course. And if someone wanted a different output format, they could do that. Ideally a single version covers almost every need, so we don't end up with a sprawl of competing libraries in the Red ecosystem.

[18:18:05](#qi0QwNIE_0ccKdewW9JPtoG1fO46dDfqgWvTRIx_kVI) <greggirwin (Gregg Irwin)>:
Oooh, or maybe I'm misremembering. Maybe @giesse did do JSON and Bolek did CSV. 

[18:18:31](#ur_rFGny7JO7pBuPDLxh4JWfXUHcaZX9amrXZYbQoQ0) <greggirwin (Gregg Irwin)>:
My brain melts a lot these days. :^\

[18:19:11](#lKjBH3M2jLTH5FlwfImgmtviFN8nsnbSO7lgUOGiTdk) <greggirwin (Gregg Irwin)>:
@giesse apologies for not remembering. Please also weigh in on the PR if you want.

[18:36:34](#aF0Jq67vUnkBFn0YZNQpaV-HdyG54zKAH_Z0bY2P4Ew) <giesse (Gabriele Santilli)>:
I did JSON, but based on your own code @greggirwin :) I only rewrote `to-json` because of a number of issues, `load-json` is mostly the original code.

[18:43:30](#52xuE5P5JcwnGE5IozfC93UdqppPgDD-b_xvESsy8WA) <GiuseppeChillemi (GiuseppeChillemi)>:
@greggirwin you have talked about other json codes, so I have asked about them.

[18:44:51](#Rs9EE3BNIpUf3FSwvETiu_jMo5d3G5UUZKuJHGkV7L0) <hiiamboris (NOT THIS ONE)>:
������

[18:45:39](#fnB1IjBQFdMYn-SSc0SveIaQAgIPs0ba77NbVfHI3Mg) <greggirwin (Gregg Irwin)>:
Thanks @giesse. I will take blame but not too much credit. :^) Romano did the original. I've just been the maintainer for 15 years or so.

@GiuseppeChillemi yes. I'm thrilled that we could get such a speed increase without having to do R/S for the entire thing.

[18:49:02](#S6cZ_dYFVYUBQix3xPVW9YlrU-j6Ge8hsbFa24fzRuc) <GiuseppeChillemi (GiuseppeChillemi)>:
@giesse have your changes been included in Red or there are still those issues?

[19:05:29](#YrEo470Sd72EMW05lIsETbHYKNExjK5A1EXaXD8FtLQ) <giesse (Gabriele Santilli)>:
@hiiamboris if you are interested the whole history of the changes I made is in https://github.com/giesse/red-json/commits/compiler

[19:05:53](#hOnpzS4wRoViRa4CT7Je2-fvVfOZmUJYWGUrMAzpHOg) <giesse (Gabriele Santilli)>:
@GiuseppeChillemi the codec was included after my changes

[19:13:34](#7e9bTIkrizLeK-xDTklDJUG4zBdqZaXH-g60aJ_b4Q4) <hiiamboris (NOT THIS ONE)>:
@giesse curiosity.. why did you try to change to non-recursive version and why changed it back later?

[21:48:08](#qgNh99hT1vz3QkcwaM9CaMuM6lJ8W4cCrfd_AjURpgo) <greggirwin (Gregg Irwin)>:
New JSON codec update merged. Here are some results:
```
change-dir to-red-file "C:\dev\giesse\red-json\tests\data"
big-100k: [load %really-big-1.json]
big-700k: [load %really-big-2.json]
big-2.5m: [load %really-big-3.json]
canada-5m: [load %canada.json]
twitter-600k: [load %twitter.json]

profile/show [canada-5m twitter-600k big-100k big-700k big-2.5m]
```
```
Time         | Time (Per)   | Memory      | Code
0:00:00.09   | 0:00:00.09   | 1486144     | big-100k
0:00:00.378  | 0:00:00.378  | 12368428    | twitter-600k
0:00:00.523  | 0:00:00.523  | 8389480     | big-700k
0:00:00.938  | 0:00:00.938  | 46031464    | canada-5m
0:00:01.994  | 0:00:01.994  | 32086040    | big-2.5m

Time         | Time (Per)   | Memory      | Code
0:00:00.036  | 0:00:00.036  | 1486644     | big-100k
0:00:00.206  | 0:00:00.206  | 8389480     | big-700k
0:00:00.783  | 0:00:00.783  | 32086040    | big-2.5m
0:00:00.992  | 0:00:00.992  | 46031464    | canada-5m
```

[21:48:41](#ld1kjBUoWVL_uoz6F_lf-ft7eHmi38eOU3YKt8T4rVs) <greggirwin (Gregg Irwin)>:
Note that %twitter.json isn't tested with the new code. It crashes the new codec.

[21:49:07](#_jwNJWZLic1G3f5-7GNbJ0fnoYmYBLDyckvWi-5auNU) <greggirwin (Gregg Irwin)>:
* New JSON codec update merged. Here are some results:
```
change-dir to-red-file "C:\dev\giesse\red-json\tests\data"
big-100k: [load %really-big-1.json]
big-700k: [load %really-big-2.json]
big-2.5m: [load %really-big-3.json]
canada-5m: [load %canada.json]
twitter-600k: [load %twitter.json]

profile/show [canada-5m twitter-600k big-100k big-700k big-2.5m]
```
```
; Original codec
Time         | Time (Per)   | Memory      | Code
0:00:00.09   | 0:00:00.09   | 1486144     | big-100k
0:00:00.378  | 0:00:00.378  | 12368428    | twitter-600k
0:00:00.523  | 0:00:00.523  | 8389480     | big-700k
0:00:00.938  | 0:00:00.938  | 46031464    | canada-5m
0:00:01.994  | 0:00:01.994  | 32086040    | big-2.5m

; Updated codec
Time         | Time (Per)   | Memory      | Code
0:00:00.036  | 0:00:00.036  | 1486644     | big-100k
0:00:00.206  | 0:00:00.206  | 8389480     | big-700k
0:00:00.783  | 0:00:00.783  | 32086040    | big-2.5m
0:00:00.992  | 0:00:00.992  | 46031464    | canada-5m
```

[21:52:19](#F_1Fr8OSNl0aPwzqfqzQm6Hl-NXrGcJi7VcMTgmfYwo) <greggirwin (Gregg Irwin)>:
For the original reference, a 10M Chrome bookmark file:
```
```

```
```

[21:55:35](#wlvfpfsY3NbOs5z3Kf4Jn_cluPAtBiQT5_wcaQTLDG4) <greggirwin (Gregg Irwin)>:
* The Chrome bookmark file that started all this also crashes it, so no speed comparison there yet.

[21:58:34](#vgmUi-i0JcRTX8uYvmcABDIAuUwBHi0ohDrIiEYDfPs) <greggirwin (Gregg Irwin)>:
Even a tiny Chrome bookmark file crashes it, so it's not size. @hiiamboris this crashes it:
```
{
   "checksum": "1e54fbb25d92a354f7aeaf576726429e",
   "roots": {
      "bookmark_bar": {
         "children": [  ],
         "date_added": "13250024635730629",
         "date_modified": "13250024643208696",
         "guid": "00000000-0000-4000-a000-000000000002",
         "id": "1",
         "name": "Bookmarks bar",
         "type": "folder"
      },
      "other": {
         "children": [  ],
         "date_added": "13250024635730662",
         "date_modified": "0",
         "guid": "00000000-0000-4000-a000-000000000003",
         "id": "2",
         "name": "Other bookmarks",
         "type": "folder"
      },
      "synced": {
         "children": [  ],
         "date_added": "13250024635730666",
         "date_modified": "0",
         "guid": "00000000-0000-4000-a000-000000000004",
         "id": "3",
         "name": "Mobile bookmarks",
         "type": "folder"
      }
   },
   "version": 1
}
```

[22:10:17](#bCKXRteaaUjEXYoSorO7XIoJaL01OJTmcu4gyD7Jk8k) <greggirwin (Gregg Irwin)>:
OK, all it takes is this:
```
s: {{
   "checksum": "1e54fbb25d92a354f7aeaf576726429e"
}}
j: load/as s 'json
```
Which loads fine in the old codec. Let's make sure we have a regression test for this once we know the cause.

[22:14:46](#tMntruJjL1cjHzSlkLq1AvziAJdOZuvUYkp3_Pdn2hQ) <greggirwin (Gregg Irwin)>:
<he he> Seems to only happen because the string is 32 chars long. Happens at 16 chars s well.

[22:16:39](#QnCH3HdqfWls6zVErsXhDlPVE_dS_agzDVnncmwL5Lo) <greggirwin (Gregg Irwin)>:
But not 4 or 8. Happens again at 64 chars.

[22:29:44](#47WAWMKsxcaySL2t_7f4MyxrAQlFKru0GH_CY2bHtGc) <hiiamboris (NOT THIS ONE)>:
interesting

[22:43:21](#UX4cFzc76o3SU1xQlaz5PBSAUsM1ZixVhKzg7rQOmoA) <greggirwin (Gregg Irwin)>:
This is excerpted from the twitter file, and also crashes it:
```
{
    "location": "関西    ↓詳しいプロ↓"
}
s: read-clip  j: load/as s 'json
```
But that's technically malformed JSON, as they should be `\uXXXX` format chars.

[22:47:13](#NSyYjeUtw5KiiOkwR6cQ9lxqWxdvLLb4dIhwmebyLZU) <greggirwin (Gregg Irwin)>:
Sorry, JSON allows that form as well. `\u` escapes are just an alternative.

## 20-Jan-2021

[7:43:04](#jK4Ua363Wwwa6fpnRSFJlXeHSOFsRx7LbNrIXUfO0dY) <rebolek (Boleslav Březovský)>:
@greggirwin No, I did just CSV, JSON is @giesse 's work. I just reported some problems, that's all.

[7:43:24](#NjjQoQUaqTrDrHo2Ta6D34aQk_FrnBVAdLn6FA-n_ko) <rebolek (Boleslav Březovský)>:
I did separate JSON that's not used in Red.

[7:45:10](#DldM9joo9RZI2JsTcY8Kdxs0aomBUeEooojtqEHrrQM) <rebolek (Boleslav Březovský)>:
* I did separate JSON codec that's not used in Red.

[9:55:10](#_9lvK_yrj7VuzIcJ_xtv972UBF8Dx_8mMWoFLfdiY1A) <giesse (Gabriele Santilli)>:
> @giesse curiosity.. why did you try to change to non-recursive version and why changed it back later?

The interpreter had a very small recursion limit and `to-json` just failed all tests. Eventually @dockimbel fixed it so I went back to an easier to read recursive version.

[10:12:24](#BJsm1ZvtyuZ6RpDL6A2HSeI8Wszp1tvvFu9xP5UuF5U) <giesse (Gabriele Santilli)>:
https://github.com/red/red/issues/3524

[10:13:22](#10LtQ__-vsN8kV83Z6i6GJCZfSs_LAqMlDAOacu7GyQ) <giesse (Gabriele Santilli)>:
"Just pushed a non-recursive version of `to-json`. It is up to 2x slower on very small data (eg. `to-json none`), however, it is up to 2x faster on bigger data (like some of the files in the test suite).
I'm about to run more tests, as well as add `/pretty` and `/ascii` refinements to `to-json`."

[10:13:53](#BRgNts5B4cdpLCqlsyj6rinwYi3JImaV3weR-KfHgc0) <giesse (Gabriele Santilli)>:
I think I had other performance notes somewhere but I haven't found them.

[10:26:16](#qf1oEgqtGYzkOzWgEkUEbOmH-dk0fz2HX_5Erp25aYg) <hiiamboris (NOT THIS ONE)>:
I see, thanks

[18:40:23](#p3gnsb4dYbjVeCoIzb6Fbso9HFXMtI-W1E3cnlp_eJ4) <greggirwin (Gregg Irwin)>:
@hiiamboris any clues on the crash?

[19:07:27](#pQJoRUTDoDLhvFJQih5M_fM_5kUesoooeJa0raD1zmY) <hiiamboris (NOT THIS ONE)>:
https://github.com/red/red/pull/4805

[19:13:23](#9qvmq-sXJQQp2XHqrVgtqZvDvga-HinJ2TRRr_b6e5I) <greggirwin (Gregg Irwin)>:
:+1: Thanks.

## 21-Jan-2021

[18:54:40](#n4Djwhvig6CaL1yVqoGRVZH4c7gxgAW9BgxKhClAm5I) <greggirwin (Gregg Irwin)>:
Thanks to @hiiamboris, with support from @qtxie and @dockimbel, the JSON crash is fixed, and some R/S string code is improved. Thanks all!

[19:04:38](#_z97RAiwp4pvdQbNUev4uOFe1ZGlaBk10DYTX_qQWes) <greggirwin (Gregg Irwin)>:
Here are the results from the old and new codec, for the Chrome bookmarks file test I did:
```
; Original
Time         | Time (Per)   | Memory      | Code
0:00:00.001  | 0:00:00.001  | 12288       | [load/as bf-nano 'json]  ; ~1K
0:00:00.714  | 0:00:00.714  | 24276068    | [load/as bf-sm 'json] ; ~1.5M
0:00:02.439  | 0:00:02.439  | 118880976   | [load/as bf-lg-no-meta 'json] ; ~5M
0:00:05.148  | 0:00:05.148  | 173835384   | [load/as bf-lg 'json] ; `10M

; New 
Count: 1
Time         | Time (Per)   | Memory      | Code
0:00:00      | 0:00:00      | 12288       | [load/as bf-nano 'json]
0:00:00.157  | 0:00:00.157  | 24274472    | [load/as bf-sm 'json]
0:00:00.954  | 0:00:00.954  | 118866608   | [load/as bf-lg-no-meta 'json]
0:00:01.091  | 0:00:01.091  | 173821016   | [load/as bf-lg 'json]
```
@GiuseppeChillemi would you use a new build of Red and test on your 80M file, to see how much faster it is for you?

[19:25:48](#meRUh9RMpayESZ_xoz5lyRG1b_Yempt3WjonDiqqggg) <GiuseppeChillemi (GiuseppeChillemi)>:
@greggirwin I'll do!

[21:50:06](#M-NuYu12v63iRIN1ZRi_CKsJRET9tgmqTiiiihtPd3E) <GiuseppeChillemi (GiuseppeChillemi)>:
@greggirwin This is the result of my spartan `profile`

```
>> probe now b: load/as %prj-bookmarks/bookmarks 'json probe now
21-Jan-2021/22:45:30+01:00
21-Jan-2021/22:45:46+01:00
```

16 Seconds in place of 120: **13x** faster! Congratulations to everyone!

[21:50:37](#VANfQKmRNAfryls9JtRPgIEYTqXNV7MEeeCjC-ZsHds) <GiuseppeChillemi (GiuseppeChillemi)>:
* @greggirwin This is the result of my spartan `profile`

```
>> probe now b: load/as %prj-bookmarks/bookmarks 'json probe now
21-Jan-2021/22:45:30+01:00
21-Jan-2021/22:45:46+01:00
```

16 Seconds in place of 120: **9+x** faster! Congratulations to everyone!

[21:50:43](#HuOzq1o-51TPcDgahrv1KBomUw_sXvgl8arMt1ar23A) <GiuseppeChillemi (GiuseppeChillemi)>:
* @greggirwin This is the result of my spartan `profile`

```
>> probe now b: load/as %prj-bookmarks/bookmarks 'json probe now
21-Jan-2021/22:45:30+01:00
21-Jan-2021/22:45:46+01:00
```

16 Seconds in place of 120: **9x** faster! Congratulations to everyone!

[21:51:13](#a0JbgPg4KitsFhY-9WhM7xgUkT1N0FHgLUXZkimjv1s) <GiuseppeChillemi (GiuseppeChillemi)>:
* @greggirwin This is the result of my spartan `profile`

```
>> probe now b: load/as %prj-bookmarks/bookmarks 'json probe now
21-Jan-2021/22:45:30+01:00
21-Jan-2021/22:45:46+01:00
```

16 Seconds in place of 120: **5x** faster! Congratulations to everyone!

[21:51:35](#bENhf13brfqRI7Gd8jT-WiTWt9lNSSqdA23BtRwI2vc) <GiuseppeChillemi (GiuseppeChillemi)>:
* @greggirwin This is the result of my spartan `profile`

```
>> probe now b: load/as %prj-bookmarks/bookmarks 'json probe now
21-Jan-2021/22:45:30+01:00
21-Jan-2021/22:45:46+01:00
```

16 Seconds in place of 80: **5x** faster! Congratulations to everyone!

[21:53:06](#vluqw1R2RnkrOfkUngf6E1UeJXz2ueLPkEIvo3OHMtc) <GiuseppeChillemi (GiuseppeChillemi)>:
`Red 0.6.4 for Windows built 21-Jan-2021/13:10:58+01:00 commit #e0bb1d5`

[21:53:17](#cbOuMrTHuHaWoOm-1_X5SIDTRm-SqvHxGE8S_W2hI3g) <greggirwin (Gregg Irwin)>:
Nice speedup indeed. 

Is there anyone who uses other JSON libs or tools that would like to start a wiki page for comparisons?

[21:53:52](#PGzs7OlaOxEsgHlvnjN-CUkc-P2smIL5sRkKkeVM-vI) <greggirwin (Gregg Irwin)>:
Even just finding and posting test data and benchmarks that we can run against Red.

[21:57:39](#nzjDbbzWWFwEN3Bkl3-cAfab7nkJs3lQb21xsiGzbWs) <greggirwin (Gregg Irwin)>:
Rather, we could add that info to the JSON codec page.

[21:58:56](#wbqUK3nnI7clAMrNDRbXB-Eg3g7sbnrtm3wptIYk9lM) <GiuseppeChillemi (GiuseppeChillemi)>:
@greggirwin But performance drops on subsequent runs. I suppose we suffer from garbage collector kicking in:

2nd run:
```
>> probe now b: load/as %prj-bookmarks/bookmarks 'json probe now
21-Jan-2021/22:54:18+01:00
21-Jan-2021/22:54:40+01:00
```

22 Secs

3rd run:
```
>> probe now b: load/as %prj-bookmarks/bookmarks 'json probe now
21-Jan-2021/22:54:50+01:00
21-Jan-2021/22:55:20+01:00
```

30 Secs

4th run:
```
== 21-Jan-2021/22:55:20+01:00
>> probe now b: load/as %prj-bookmarks/bookmarks 'json probe now
21-Jan-2021/22:55:28+01:00
21-Jan-2021/22:55:59+01:00
```

31 Secs

[22:00:31](#s1i84JKZSEDrMaLnr7897W_2WGi8x6Dtga-TflX_4uU) <GiuseppeChillemi (GiuseppeChillemi)>:
* @greggirwin But performance drops on subsequent runs. I suppose we suffer from garbage collector kicking in:

2nd run:
```
>> probe now b: load/as %prj-bookmarks/bookmarks 'json probe now
21-Jan-2021/22:54:18+01:00
21-Jan-2021/22:54:40+01:00
```

22 Secs

3rd run:
```
>> probe now b: load/as %prj-bookmarks/bookmarks 'json probe now
21-Jan-2021/22:54:50+01:00
21-Jan-2021/22:55:20+01:00
```

30 Secs

4th run:
```
>> probe now b: load/as %prj-bookmarks/bookmarks 'json probe now
21-Jan-2021/22:55:28+01:00
21-Jan-2021/22:55:59+01:00
```

31 Secs

[22:02:04](#f3vVxsKyopgtB25CFCkn-DeiCtmtwEcBR6jbeeWL-9U) <GiuseppeChillemi (GiuseppeChillemi)>:
From 4th on, all are at 31 secs. It seems it reaches an equilibrium.

[22:03:08](#emGHUs4N6tmdP4Gv_ALTX4FjqFEQYr-1HWTQKO11yf4) <greggirwin (Gregg Irwin)>:
That's interesting too. I don't see any increase with my smaller test files (up to 10M). Could very well be GC I suppose.

[22:10:32](#-jPudZTDH1EKkZbSoL1NYkC7gdAuyaebQbHLN30ptS0) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
@GiuseppeChillemi maybe it's time when you should learn `dt` as `delta-time` function:
```red
>> dt [wait 0:0:0.11]
== 0:00:00.11713
```

[22:11:38](#TF67upbgIqmtG08udoBd-mpzY3uTcGpi7emY01pwwlQ) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* @GiuseppeChillemi maybe it's good time when you should learn `dt` as `delta-time` function:
```red
>> dt [wait 0:0:0.11]
== 0:00:00.11713
```

[22:19:00](#Q9FJxgYZm-VV8LkT6haUrUF8dZdWEKiZSQBpZK9rckY) <GiuseppeChillemi (GiuseppeChillemi)>:
Old Version:

1st run
```
>> probe now b: load/as %prj-bookmarks/bookmarks 'json probe now
21-Jan-2021/23:02:43+01:00
21-Jan-2021/23:04:03+01:00
```
80 Secs

2nd run
```
>> probe now b: load/as %prj-bookmarks/bookmarks 'json probe now
21-Jan-2021/23:04:13+01:00
21-Jan-2021/23:05:38+01:00
```
85 secs

3rd run
```
>> probe now b: load/as %prj-bookmarks/bookmarks 'json probe now
21-Jan-2021/23:05:43+01:00
21-Jan-2021/23:07:15+01:00
```
92 secs

4th run
```
>> probe now b: load/as %prj-bookmarks/bookmarks 'json probe now
21-Jan-2021/23:07:42+01:00
21-Jan-2021/23:09:17+01:00
```
95 secs

5th run
```
>> probe now b: load/as %prj-bookmarks/bookmarks 'json probe now
21-Jan-2021/23:15:23+01:00
21-Jan-2021/23:16:58+01:00
```
95 secs

Again, the internal structures have stabilized. 


[22:19:12](#ju3PBgohsSm_dBesTN6l08TrLzj5jXhqzN05mx3cIHE) <GiuseppeChillemi (GiuseppeChillemi)>:
*      Old Version:

1st run
```
>> probe now b: load/as %prj-bookmarks/bookmarks 'json probe now
21-Jan-2021/23:02:43+01:00
21-Jan-2021/23:04:03+01:00
```
80 Secs

2nd run
```
>> probe now b: load/as %prj-bookmarks/bookmarks 'json probe now
21-Jan-2021/23:04:13+01:00
21-Jan-2021/23:05:38+01:00
```
85 secs

3rd run
```
>> probe now b: load/as %prj-bookmarks/bookmarks 'json probe now
21-Jan-2021/23:05:43+01:00
21-Jan-2021/23:07:15+01:00
```
92 secs

4th run
```
>> probe now b: load/as %prj-bookmarks/bookmarks 'json probe now
21-Jan-2021/23:07:42+01:00
21-Jan-2021/23:09:17+01:00
```
95 secs

5th run
```
>> probe now b: load/as %prj-bookmarks/bookmarks 'json probe now
21-Jan-2021/23:15:23+01:00
21-Jan-2021/23:16:58+01:00
```
95 secs

Again, the internal structures have stabilized. 


[22:19:23](#8nWNJYVY95JtMsD8dqvi4r4xc2AiSeQkP1IYhrWPaMg) <GiuseppeChillemi (GiuseppeChillemi)>:
* Old Version:

1st run
```
>> probe now b: load/as %prj-bookmarks/bookmarks 'json probe now
21-Jan-2021/23:02:43+01:00
21-Jan-2021/23:04:03+01:00
```
80 Secs

2nd run
```
>> probe now b: load/as %prj-bookmarks/bookmarks 'json probe now
21-Jan-2021/23:04:13+01:00
21-Jan-2021/23:05:38+01:00
```
85 secs

3rd run
```
>> probe now b: load/as %prj-bookmarks/bookmarks 'json probe now
21-Jan-2021/23:05:43+01:00
21-Jan-2021/23:07:15+01:00
```
92 secs

4th run
```
>> probe now b: load/as %prj-bookmarks/bookmarks 'json probe now
21-Jan-2021/23:07:42+01:00
21-Jan-2021/23:09:17+01:00
```
95 secs

5th run
```
>> probe now b: load/as %prj-bookmarks/bookmarks 'json probe now
21-Jan-2021/23:15:23+01:00
21-Jan-2021/23:16:58+01:00
```
95 secs

Again, the internal structures have stabilized. 


[22:19:38](#-9BNgVJOD5ux_8Ul21d7fKd8rL7kFcyCTvMMPngh_W8) <GiuseppeChillemi (GiuseppeChillemi)>:
* **Old Version:**

1st run
```
>> probe now b: load/as %prj-bookmarks/bookmarks 'json probe now
21-Jan-2021/23:02:43+01:00
21-Jan-2021/23:04:03+01:00
```
80 Secs

2nd run
```
>> probe now b: load/as %prj-bookmarks/bookmarks 'json probe now
21-Jan-2021/23:04:13+01:00
21-Jan-2021/23:05:38+01:00
```
85 secs

3rd run
```
>> probe now b: load/as %prj-bookmarks/bookmarks 'json probe now
21-Jan-2021/23:05:43+01:00
21-Jan-2021/23:07:15+01:00
```
92 secs

4th run
```
>> probe now b: load/as %prj-bookmarks/bookmarks 'json probe now
21-Jan-2021/23:07:42+01:00
21-Jan-2021/23:09:17+01:00
```
95 secs

5th run
```
>> probe now b: load/as %prj-bookmarks/bookmarks 'json probe now
21-Jan-2021/23:15:23+01:00
21-Jan-2021/23:16:58+01:00
```
95 secs

Again, the internal structures have stabilized. 


[22:20:43](#Co2WwG10f3oP3FGGnb7UG0NTfvaSglNmlLEIq3nbBio) <GiuseppeChillemi (GiuseppeChillemi)>:
@Oldes We are men here, we do all the time diffs mentally!

[22:20:56](#0pJtRwJGm88PXkK9kr3vtXuz7yg7Gv7VdlRMUwdhsfE) <GiuseppeChillemi (GiuseppeChillemi)>:
* @Oldes We are men here, we do all the time diffs using our own minds!

[22:21:12](#gOfljaRVMpz6XpFLDuOYu-YkxvZhMbFRcS-dbffZfu8) <GiuseppeChillemi (GiuseppeChillemi)>:
* @Oldes We are men here, we do all the time diffs using our own internal computation units!

[22:21:28](#LNSFnELlxQzx_2IGPcrVZobcS5XJL2UEKcuSdojY648) <GiuseppeChillemi (GiuseppeChillemi)>:
(Thank you, I' will learn delta-time

[22:21:37](#PIP3pPrz_ui6DucYPw58goNlWHU58MK2-S72wDlJtEs) <GiuseppeChillemi (GiuseppeChillemi)>:
* (Thank you, I' will learn delta-time)

[22:21:48](#ldw-e9eRPJ8q6HZSIdC2hPZ6E1HIM8A135yuk0mX_Vk) <GiuseppeChillemi (GiuseppeChillemi)>:
* (Thank you, I' will learn `delta-time`)

[22:22:20](#VWuJsc1RmWJXPogt0ZMEJRhUnmyntmjavuC3I_0xykw) <greggirwin (Gregg Irwin)>:
I still own an abacus, though I haven't used it in so long I imagine I've forgotten how.

[22:23:21](#X0h2E2J0g62ttg0H0UpuGvTyHteKKm9tappJKapcor8) <GiuseppeChillemi (GiuseppeChillemi)>:
* (Thank you, I will learn `delta-time`)

[22:30:25](#cnoNwJmnS3Rw5iY7KRpkVieML8IbL469ufI2XbqwMzg) <GiuseppeChillemi (GiuseppeChillemi)>:
������

[22:50:01](#K1dQZHEWc1P-nwEBfhkmm-af4gWbGYz6e1xwCn_WT_4) <GiuseppeChillemi (GiuseppeChillemi)>:
@Oldes 
Yes, it is simpler:

```
>> loop 5 [probe dt [b: load/as %prj-bookmarks/bookmarks 'json]]
0:00:17.1552
0:00:22.8579
0:00:32.3664
0:00:32.0836
0:00:31.8588
```



[22:53:22](#s8vU18nnVud6RMyRAvVeeUZ91tDfbhUrvCwjoGWBrYY) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
It looks like a GC issue... new allocations but no releases.

[23:01:37](#-nZUBl6n4uoJmUL5fvTb1VF_icW4MFjB92oMzWdP0ow) <GaryMiller (GaryMiller)>:
You could run the garbage collector manually between runs to test that theory out.

## 22-Jan-2021

[6:10:57](#KqJ9onM3nJtAkq6517IsjFkNNvAw_r0oUPgX1zZI3Ls) <GiuseppeChillemi (GiuseppeChillemi)>:
@GaryMiller how do I run it?

[7:14:02](#1ppEGKa5PCGN9Sw5JXPtf-joPpHh2BpqQOqI62Wqsyk) <greggirwin (Gregg Irwin)>:
@GiuseppeChillemi see `recycle`.

[10:33:24](#yJax_LAwdYq0qisWDc2GIlPDcQiW8LzoDYn_-yvj-Ys) <GiuseppeChillemi (GiuseppeChillemi)>:
Yes, it is the garbage collector:

With
```
>> loop 5 [probe dt [b: load/as %prj-bookmarks/bookmarks 'json]]
0:00:18.7711
0:00:28.5016
0:00:41.1943
0:00:43.6485
0:00:42.7504
== 0:00:42.7504
```

Without
```
>> recycle/off loop 5 [probe dt [b: load/as %prj-bookmarks/bookmarks 'json] recycle]
0:00:18.7421
0:00:18.4631
0:00:18.3451
0:00:18.306
0:00:18.3311
```


[11:55:06](#hU8ypnhvu_4QjAelP65Zu2fARQ9Rq79M_oJ1vWRwYvg) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Oh, quite big penalty, isn't it?

[14:03:38](#iyMbvCu8HlrZsU_DE0vtv86ugcUXKYeclrsVhto1qrY) <GiuseppeChillemi (GiuseppeChillemi)>:
Yes, it seems it is triggering during processing and taking more than the main code.

[14:11:00](#su-kOV-4F3Mk4YHUUE2RnO0EzFB7gEN_I7s9V_nUHi4) <GiuseppeChillemi (GiuseppeChillemi)>:
Well, it needs sone fine tuning on the parameters or a change of logic. The word goes to the experts.

[14:30:09](#ianac_56-bJOzVa0777-fZNZ5Fdm8u8qnzDkqPx0kQY) <hiiamboris (NOT THIS ONE)>:
What tuning? 80 MB of json is a *lot* of Red values. Just how big is your bookmark file when it's loaded?

[15:34:04](#h0gIb4YhEazGPYZqt078yGpthMQa9rreDlryg4GSrbg) <GiuseppeChillemi (GiuseppeChillemi)>:
I don't know the logic that drives the garbage collector and what triggers it but the trigger could be a memory threshold that could be too tight.

[15:37:13](#ah9BzoebQPZ4EsMtcuJgTvIIOm7tLKhZouEb54SFR5s) <hiiamboris (NOT THIS ONE)>:
TIP: you can use `profile` to see how much memory your file occupies

[17:37:28](#HmoCBnbb3Ki-p4UD7ChRLEnDGlDpYypzEmQ4g6FwTgg) <greggirwin (Gregg Irwin)>:
The current GC is, like simple I/O, a starting point. @dockimbel has said it's not the final version. But it's also a huge task so not a high priority. With the ability to disable it temporarily, which few GC langs have, you still have some control. e.g. you can disable it temporarily, do your processing, then `recycle` manually when your app can breathe a bit. 

[19:10:06](#Ny4_pD2aTyNS03GMMQf-6LYNUaO9ISY7-Jup5MD_tDk) <GiuseppeChillemi (GiuseppeChillemi)>:
I know this, in fact I do not complain about GC, I am thankful we have it. I am just curious about the causes that let it take half of the processing time. I will look at its code to try to understand how it works.

## 23-Jan-2021

[17:16:41](#-dXsmmlL6_gqiB6a55WZfkIKkCAe2hZ8yfAZX9KyhTI) <GiuseppeChillemi (GiuseppeChillemi)>:
@greggirwin Is this the [profile](https://gist.github.com/giesse/1232d7f71a15a3a8417ec6f091398811) function are you referring to?

[17:34:54](#c-zRvnlBz-wojh5hShnjAjSPrZEonJ4QJiszZ0JmFt4) <hiiamboris (NOT THIS ONE)>:
yes

[23:04:46](#GiVx_owcfF9Zkb43InLkbISIsUVr6m5kmN5f202yR2A) <BuilderGuy1 (BuilderGuy1)>:
Is the CSV functionality rolled in to the nightly builds yet?

[23:11:18](#hrnZao6a0cox-z2iKjP9ceFzYCfW3jFhzHW6EwJkcaY) <hiiamboris (NOT THIS ONE)>:
about 1.5 years ago: https://github.com/red/red/search?q=csv&type=commits

[23:20:28](#Is5w2eOnD5TtJIZXryh6eajvqSnsJnF8XapeUJZ0r1Q) <BuilderGuy1 (BuilderGuy1)>:
Ok. Has there been any new additions to that with the new codecs or is that just JSON?

[23:24:12](#9Uesr8ck3n-IcFqDAs5mYj8A7f0Okv1vrtRJ0mTslAo) <greggirwin (Gregg Irwin)>:
CSV and JSON are separate codecs. JSON has been around for quite a while as well though.

[23:30:00](#JwJ6WaV_bVCJmSOXcwKDE6CqhTC-keou6u4Eb9w1PpU) <BuilderGuy1 (BuilderGuy1)>:
Ok. I misinterpreted the new channel as an announcement I guess. Thanks!

[23:33:29](#ix3YL3BUseQeTbJfSocCJKu5If_sHUqG1oHb8B-ohrk) <greggirwin (Gregg Irwin)>:
We just didn't have a channel for codecs yet, but decided it would help.

## 24-Jan-2021

[6:52:29](#BsX-5Rib30BtEP4nCho1SvNJQJyCQvpxXSBsazISNi8) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Will XML codec come too? I do vaguely remember something coming for 1.0 release?

[6:54:48](#-w_nqfc1UJ42nFS7SQJfuhySyLMsc1fw7Oonv96h1PA) <rebolek (Boleslav Březovský)>:
It will but I think there's not yet an agreement how XML should be represented in Red.

[18:57:38](#XmDhorjypOuB4Lennr23jPqLOfFLStkCK1t9TFKEJH4) <greggirwin (Gregg Irwin)>:
@pekr yes. It raises a number of questions, hence the delay. Ironically, the codec won't be hard, and we could even work up the parser now, knowing that the output structure isn't finalized. It's also possible that the internal loader could be flexible like CSV, allowing more than one format to be returned based on refinements. The issue with XML is how to represent attributes, for which there is no right answer, just choices.

[20:03:32](#3C4hfyUaC8v6yN6U7C6CBC5Wk9hQgYQa2Q9UsSj5u28) <GiuseppeChillemi (GiuseppeChillemi)>:
@greggirwin is the discussion public, so I can read and understand?

[20:05:10](#ndcpauD7f_951uXluJWDpSk-wivZ6DJoSMIoeoqYFl8) <hiiamboris (NOT THIS ONE)>:
xml has attributes `<tag attr="value"></tag>` and elements `<tag><attr>value</attr></tag>`

[20:08:10](#3yKVZ2LgpeD0fSAr3DlH0k7pZJAf9RS8IGzdwGu1FDw) <hiiamboris (NOT THIS ONE)>:
I think question is how to at the same time:
- losslessly load/save this mess
- map both attributes and elements to words, so one doesn't have to look in both maps every time
(which is kinda impossible and requires tradeoffs)

[20:08:20](#FIKSo6ImEtjwv_xgrMKPw2ykzwIbj70yzC939sgWEo8) <hiiamboris (NOT THIS ONE)>:
* I think question is how to at the same time:
- losslessly load/save this mess
- map both attributes and elements to words, so one doesn't have to look in both maps every time

(which is kinda impossible and requires tradeoffs)

[20:11:44](#NQ36b_lBDbdL_BbUZvdX-p29rlKMJwH3AjkFg7P0fqs) <hiiamboris (NOT THIS ONE)>:
I would probably just reserve a name that's invalid for xml, e.g. `!attributes` and set it to a list of words that *are attributes*.

[20:49:06](#gJ3wq8zWTt53cBq_3fAUeS9Prgb32k7BfR4ReTgp8UE) <zentrog>:
I don’t think a map could be used for elements (at least if going for lossless) since an element name can repeat, and the repeats don’t need to be contiguous. In some cases it would be nice to collect all the elements with the same name into a list, but sometimes that doesn’t make any sense. For example, the Apple plist format

[20:49:33](#iyV8UCJ8HGa4ZR7fMXvy_f17F3y1odyhrlP39gOtjkM) <zentrog>:
I like the !attributes suggestion 

[22:55:01](#A9eJU3kUxL6e_cxmwlMChJDIH60g9GyACMRJ2R82814) <greggirwin (Gregg Irwin)>:
@GiuseppeChillemi some may be in https://gitter.im/red/HOF

Good, concise summary @hiiamboris. Even W3Cschools.com says:

> There are no rules about when to use attributes or when to use elements in XML.

I think we need to use a block as the output, no matter what. As @dander points out, elements can exist more than once. That raises another possible output option though. Repeated elements can be kept as they are found, or collected into a sub-block. This is now the public design chat. :^) Where this matters ties to HOF design as well, in how it navigates structures, and what we expect them to be for common cases like XML and DOMs.

What we *can* do, and probably came up in chat about it, is use a `map!` for attributes, which can't have repeating elements or deeper structures. We can also name it of course, but if each element is a block, the only time you have a `map!` is if there are attributes for it, and it's always the first value in the block. Don't get clever beyond that. If we name it, e.g. as @hiiamboris suggests, then each element is also a well-formed key-value block.

[23:00:43](#SK9nTI7f2-Ezc1tJa4saqoNh6zUeV4un54rP_Bc6JcM) <greggirwin (Gregg Irwin)>:
Now I need to find my notes, because things like XPath and XQuery also came up when thinking about it.

[23:01:43](#gqPeu9tNe5WrtggLRuZ6_ofxWqjbEwwkJHmBevW2AA4) <greggirwin (Gregg Irwin)>:
Found them. Whew!

[23:04:27](#QGemgWBjBjEpX_mjtbML-mAcI2ACuMU7c57EvBuZ344) <hiiamboris (NOT THIS ONE)>:
Value vs block-of-values is a good enough polymorphism I think. Not in the least since it can catch you on your assumptions, e.g. you access something as a value but get a block and likely receive an error, and fix your code. And when everything is as expected, it simplifies access to this structure. We load it so we wanna work with it.

[23:08:31](#SdMaLdc8BLa99DMF0hXjUxS6JVBT8LdTk2EBDyXWe7k) <hiiamboris (NOT THIS ONE)>:
Although, when you know something is a list, but this list for some reason becomes 1 item long, it gets turned into a value, and that's extra work...

[23:08:43](#DkJ9DhC400X3T1KC3DKIp1dY0awI6opcyAXMDYdHZ2s) <hiiamboris (NOT THIS ONE)>:
* Although, when you know something is a list, but this list for some reason becomes 1 item long, it gets turned into a value, and that's extra work to handle such a case...

[23:08:58](#fS_6kk_OWyl6DF4AuB8zIo_iHe81zO33ZVV44vdBya8) <hiiamboris (NOT THIS ONE)>:
Stupid format.

[23:11:28](#FbeEItwHKin1dw6gFSPGUxx6LnJLmKp_AhFF-FAVeGo) <greggirwin (Gregg Irwin)>:
Maybe we should collect some small XML examples, or even just one, that show each way you can express things, so we can see attr vs elements vs repeated elements that don't each need their own key. 

We'll never make everyone happy.

[23:13:38](#mdQiFqluuFNiOncQv87fxuKHsUwrYWh_BG27wr9XdJE) <hiiamboris (NOT THIS ONE)>:
Another idea: `[name "value" name "value" unique-name "value"]` so you can still use path access when addressing a unique element (without constant `/1/` clutter), but with a dedicated mezz can collect every `name`'s value.

[23:14:49](#4UDGHRiUJTzSlb-4ohPVLT-Qb5cjhFtikiAqu1jeCnM) <hiiamboris (NOT THIS ONE)>:
Could be a good extension for `extract` btw: extract by key.

## 25-Jan-2021

[6:44:37](#ANBZHK2EW2klbUCFxVXWkopRyV4iquTfOrdiSOJX9Tc) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
As for me, I prefer the one structure, sequenced. Not only can attributes and elements repeat, they also come in a nested structures. We should also remember the parsing aspects - e.g. I remember Doc considering a streamed XML version. IIRC, initial Postgress driver used parse everything, then provide output, later on was rewritten to parse as you go? Simply put - we should not require loading the whole XML file into memory first, but allow continuous parsing, if possible ....

[10:37:32](#550IrI_3yOeCKX1KaBh-moRNlIUNlafPoAlpL4BogTc) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
I was extensively using XML parsing using code based on this Rebol2 script: http://www.rebol.org/view-script.r?script=xml-parse.r

[11:11:22](#B0UaEUZOsJWqdTGtFaR-Rh25QwWfe6H4OEjyTCi8bLo) <hiiamboris (NOT THIS ONE)>:
@Oldes  I wonder how do you `find` or directly refer to something in a `[name attr [..children..] uri]` tree. By writing a tree traversal mezz.. and using callbacks?

[11:14:46](#HoOuBNlM0QVYeiWnUEfgKxdL15GndIkBA8mg2J6PYfQ) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
I'm using:
```
	get-node: func[dom path /flat /local tags node-name cont? result ][
		������robe path
		tags: parse path "/"
		node-name: last tags
		remove back tail tags
		foreach tag tags [
			cont?: false
			foreach node dom [
				������robe node
				if all [
					block? node
					node/1 = tag
				][
					dom: node/3
					cont?: true
					������om: third cont
					break
				]
			]
		]
		result: copy []

		foreach node dom [
			if all [block? node node/1 = node-name][
				either flat [
					repend result node
				][	append/only result node ]
			]
		]
		result
	]
	get-node-content: func[dom path][
		third get-node/flat dom path
	]
	get-nodes: func[dom path /flat /local tags node-name cont? result ][
		������robe path
		tags: parse path "/"
		node-name: take/last tags
		foreach tag tags [
			cont?: false
			foreach node dom [
				������robe node
				if all [
					block? node
					node/1 = tag
				][
					dom: node/3
					cont?: true
					������om: third cont
					break
				]
			]
			unless cont? [return none]
		]
		result: copy []
		foreach node dom [
			if all [block? node node/1 = node-name][
				either flat [
					repend result node
				][	append/only result node ]
			]
		]
		result
	]
```

[11:15:04](#3Tm3MUz0Zxtq03BU0FYUeRDew3tU_STgLr90BB_AuZs) <hiiamboris (NOT THIS ONE)>:
Haha. OK.

[11:16:29](#l4svWEjg0wSziu0fF0jgLgs-9Sg_6zo8FD5ntYg9wcU) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Used as:
```
shpNode: first get-nodes symbol %DOMSymbolItem/timeline/DOMTimeline/layers/DOMLayer/frames/DOMFrame/elements/DOMShape
```

[11:19:07](#_Y6a5MZWIrHvQ9ptoWJPdz4SJdg9TlrgZuca5gCGkqU) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
I'm sure it could be improved.. but you know... for me was important to have the job done... no need to write something which may use anybody for whatever else.

[11:19:35](#AlO_QMdwGAKr11-i50QX6Hy0Ihd9oj8hXYQCvmTO5OQ) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Also it's code several years old, but it's still in use.

[11:20:59](#nvNNT223yg9R0XLAefYf4LYGr9bJMnG5N7Rw0-SB3_4) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
I somehow feel, that it would be nice to have a datatype for tree structures.

[11:21:12](#hM-MT0VjBiiejb4yXsh0poWKLT3vnDNtWUVI2iphUzA) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* I somehow feel, that it would be nice to have an optimized datatype for tree structures.

[11:23:51](#5Rs0wk1WJbXorYBSvh2NJAifgGR6N5HtJCQ-eRkv0H4) <hiiamboris (NOT THIS ONE)>:
Of course.

[11:27:01](#buGh3NMDVANxVWKTT75mLAC1XsxdmM5YaoShfQJvb3k) <hiiamboris (NOT THIS ONE)>:
First thing to improve here is to build the output in a way that allows access it using Red paths.

[11:27:10](#s-AARw6jQ9IykFJ78PTk5Ocp109JXxXuSK6rTJrxBiQ) <hiiamboris (NOT THIS ONE)>:
* First thing to improve here is to build the output in a way that allows accessing it using Red paths.

[15:22:35](#YXUWLfMQlbyGypqu-irhd0ObKrHN9DWOv9xwgrJnkB0) <greggirwin (Gregg Irwin)>:
@Oldes, something that came up during chat on this was @giesse's [Niwashi](https://github.com/giesse/rebol-power-mezz/blob/master/mezz/niwashi.rlp), if you're interested in trees.

To add to @hiiamboris' thought, to design the XML structure we need to know all that has to be represented, and the relationships. e.g. the document/root part (prolog), elements, attributes, CDATA, etc. Who here knows all that from the XML side?

R2 kept everything as strings, including newlines as separate values. We could keep `new-line` markers when parsing, or normalize as we do JSON. 

In any case, it's a big task that touches other things on the design side, and needs a leader and champion. @hiiamboris, care to volunteer? :^)

[15:31:33](#m7cqEjI8Cr_5F93MHzUmO7wzqO135_hxltYuMp8iYQ0) <hiiamboris (NOT THIS ONE)>:
I never use xml so my experience with it is tiny (;

[15:35:20](#-cFWpNL5HeQZHawIDtc3aSoPZvikADJCDk0FwURPf90) <greggirwin (Gregg Irwin)>:
Same here. My notes were on the general design side. I'm buried but will try to make time to dig in a bit on the XML structure side if nobody else is already an expert.

[15:37:07](#mVrPbXv0_9cNXB51a72fmsHEN5zTKfkdSpH_8fMlrMY) <greggirwin (Gregg Irwin)>:
I do have some notes on path/structure/foreach access etc.

[15:37:50](#VZClYCNpdt09EX3Ji-JvCqsecPkcTxOc7yT3r7iHqjs) <hiiamboris (NOT THIS ONE)>:
Gregg "No Time" Irwin ������

[15:38:11](#-4I5vuBchBQaWNSOQb1FrkZ3tg95NLpaFl5dDaTOO1g) <greggirwin (Gregg Irwin)>:
Well, it's all priorities. :^\

[15:39:48](#0rqEFHaE9GNOVDPEXIsL02pUFzs_C841afou-UwTyKE) <hiiamboris (NOT THIS ONE)>:
I'll upload a few series related designs soon, to ensure you're busy ������

[15:40:27](#U0qLZi67GPRHLp2teNDvpGCb9o9umEFsLkFQFzIFv0o) <hiiamboris (NOT THIS ONE)>:
* I'll upload a few series related designs soon, to keep you busy ;)

[15:48:56](#rdPxcG63Y6Hp1p-SZ-DK0xYxUGDZ9AYz1mmg1tusbeo) <greggirwin (Gregg Irwin)>:
Oh joy. ;^)

@giesse's [parse-ml](https://github.com/giesse/rebol-power-mezz/blob/master/parsers/ml-parser.rlp), if it could be leveraged, along with Niwashi, is an existing infrastructure. @giesse are you interested in seeing it used, and able to help with porting and design input?

[15:49:03](#n3IlT8UTV9DEx_nCttS1-MmnZIMq07gAZU2MK_y609c) <rebolek (Boleslav Březovský)>:
I did XML codec some time ago https://github.com/rebolek/red-tools/blob/master/codecs/xml.red if anyone's interested.

[15:53:37](#OYUkJ6V-K8rjejtrWT_zJCh3owLfucTPQnMW-b01G4o) <greggirwin (Gregg Irwin)>:
Thanks @rebolek! Nice that you have [tests](https://github.com/rebolek/red-tools/blob/master/tests/xml.red) as well. Isn't it funny how we can be so torn as developers. I love both approaches, but for very different reasons. One the one hand we have a very direct `parse` implementation, which is instantly accessible as code. On the other hand, we have a dialect and advanced system that lets you think in terms of the content (tree, children, etc.).

[15:55:19](#J4aYl3lIZsJCD89cfQNwaICB4hYuGhyxJL1EydkVe-M) <hiiamboris (NOT THIS ONE)>:
```
>> xml/decode {<a b="v"></a>}
== [a [] #(
    "b" "v"
)]
>> xml/decode {<a><b>v</b></a>}
== [a [b [none "v" #()] #()] #()]
```

[15:55:47](#UsSsCjACztzfXNW0mESOjCuKiZ0YkdlnONKLoVqtL4g) <hiiamboris (NOT THIS ONE)>:
this is still too complicated for my head ������

[15:55:51](#rwS5urQApJmaB17r8nQmYRmRMToxRQ6OhNxyFrnKTNs) <rebolek (Boleslav Březovský)>:
I'm not happy with the format my XML codec is producing but that's what I came up with when working on it. 

[15:56:31](#UnnFDBLHMbQLGG-0vamzxRSeMpoUvSB_AFtoSyKKBbo) <rebolek (Boleslav Březovský)>:
@hiiamboris I agree, it's certainly not perfect. OTOH it's easy to use programmatically :-)

[15:56:58](#-4kyeiIArgpaWA7bybgxdMZabp35hSR9ImgrsmKJNbQ) <hiiamboris (NOT THIS ONE)>:
Yes and that's what I love about it when I decode server response! ������

[16:00:27](#_OlIR1BHLdy3KwpgH_ImeSD5crn2RP4sIS_VHC4gKfc) <greggirwin (Gregg Irwin)>:
From my notes, I hadn't found a perfect solution to this. For iterating, we need consistency, which means empty elements (potentially a LOT of them), and everyone pays that price. For path access we need keys. Parsing solves it all but variability makes other approaches harder. Then you have locality (attr distance from their related tag) if a human is reading it. Lower priority, but shouldn't be forgotten. 

[16:02:41](#KIAKMlR8KBYTmRRk17g2yVuR0F6bX2TZJgUYN58yN8U) <greggirwin (Gregg Irwin)>:
Paths are interesting because they don't *have to be* treated normally. If we want to treat them as generic Red structures they do, but if we have an accessor dialect it can do lookup magic internally.

[16:05:23](#01HAGqqEGZUjv8uCn2DVnlyAUIU4WuaG6ApSD8CPbWU) <greggirwin (Gregg Irwin)>:
Then you have the idea of virtual slots. e.g. if you have empty maps as above, you can manipulate the structure easily. If you don't have any value, or use `none`, it's a bit more work.

[20:01:59](#8aHxwQRGZS_q9pJf97r6iPntWnGjkAUwM5h8caKX4vo) <giesse (Gabriele Santilli)>:
@greggirwin https://github.com/giesse/parse-markup

[20:02:12](#QFD3ls1B0IZjzfomalDBQrKpJBaKzNOP5iwxkXDy-do) <giesse (Gabriele Santilli)>:
we were stuck on what it should return

[20:04:42](#aoJ0FksiLrxcoHkrBy6z0v6iuXrHEhfsVu8CDXLwKyw) <giesse (Gabriele Santilli)>:
```
>> parse-markup {<a b="v"></a>}
== [<a> #(
    b: "v"
) </a> none]
>> parse-markup {<a><b>v</b></a>}
== [<a> #() <b> #() text "v" </b> none </a> none]
>> parse-markup read https://www.red-lang.org/
== [declaration <!DOCTYPE html> whitespace "^/" <html> #(
    class: "v2"
    dir: "ltr"
    xmlns: "http://www.w3.org/1999/xh
```


[20:06:08](#iME0YGhImJanbVMOmJGOxI62X-gw9WyZd9xTggDxjTA) <giesse (Gabriele Santilli)>:
ideally you'd have something like https://giesse.github.io/rebol-power-mezz/mezz/load-html.html

[20:40:57](#hMydW_bcUIc9jNEFg_FNOQSEUqAxPCzmUBZvOhrEhE4) <greggirwin (Gregg Irwin)>:
How to hide in your own context: `parse-markup: ������arse-markup/parse-markup` :^)

[20:59:11](#RrNshvYcKe2K13QuuHWiqlW3FfCmrLwj34vn0phqqB4) <greggirwin (Gregg Irwin)>:
`Make` just keeps asking me for the path to Topaz parse. Doesn't like anything I tell it apparently. But now I see that %compiled-rules.red was created.

[21:53:29](#7YPAXnM_WH_LbyPuUp1vq96FMDLvIOCaRt-VVE3IuBg) <hiiamboris (NOT THIS ONE)>:
> How to hide in your own context: `parse-markup: ������arse-markup/parse-markup` :^)

Haha great!


## 26-Jan-2021

[13:54:46](#4oBnS05zJoOP87AKbnNaHA1Ceo2uf4shZLmZ9clB8xM) <giesse (Gabriele Santilli)>:
> `Make` just keeps asking me for the path to Topaz parse. Doesn't like anything I tell it apparently. But now I see that %compiled-rules.red was created.

I was trying to get the preprocessor to do the compiling, but couldn't get it to work, so I gave up and hastily made that make.red file... in other words, it's probably not the best approach. :)

[16:58:22](#lmpPESiD1BkE_R3aygyJXivazWZ8zXRkgKNq0eC3tCQ) <greggirwin (Gregg Irwin)>:
On closer inspection, %compiled-rules.red is an old one. I'll debug to see why it's not building.

[17:22:25](#F8v96FdAhw1PJEIA0mJUWZ1MIsHe8URjOkV2SRcBHNY) <greggirwin (Gregg Irwin)>:
`Make.red` doesn't show the error, just loops, but this is the problem.
```
*** Script Error: PARSE - invalid rule or usage of rule: keep/only
*** Where: do
*** Stack: do-file  
```

[19:56:15](#rCi2QI868JTh4-c-YJ-GC8WYtv1u6DpFcNwA_K6aIRI) <giesse (Gabriele Santilli)>:
note that precompiled version is here: https://github.com/giesse/parse-markup/releases

[19:56:34](#gD5r3WmpEVgnawNyDchUWjH-JfIlVQ-OsOx7-gMDwn4) <giesse (Gabriele Santilli)>:
(maybe you have an older version of `topaz-parse`?)

[20:17:57](#M2adQaZRWNOkWb30WkDNfla2n83izDUDhk5MdTXakwQ) <greggirwin (Gregg Irwin)>:
I thought that too, so synced it. Tried removing %compiled-rules.red so it would rebuild, but then got an error that it was missing. I'll check the releases, thanks.

[20:20:15](#LvbLlWZpL-gQYVw2k-zIQ_QqaC_7teG4J1VdZcgM7CQ) <greggirwin (Gregg Irwin)>:
Same behavior with the release. I guess I need more instructions. :^\

## 27-Jan-2021

[18:44:19](#-ZIPXt1IcNHE5nIzjuM38DPOsexNZfnS5HplVW3jTLA) <giesse (Gabriele Santilli)>:
wait, this file https://github.com/giesse/parse-markup/releases/download/0.0.1/parse-markup.red does *not* require any other file, do you still get an error?

[19:30:26](#e2OM7P4O5-70rKwXTYunQemw9PznqvoM6AO-Ugq85Vs) <greggirwin (Gregg Irwin)>:
%parse-markup.red in the release zip has `compiled-rules: #include %compiled-rules.red`, rather than the prebuilt version, in the zip I DL'd. :^\

[21:10:17](#3GZZv6hUCSeJGfpCly6UaDOcv0oT7ehwoBDXO5JvViQ) <greggirwin (Gregg Irwin)>:
[This](https://lemire.me/blog/2020/10/20/ridiculously-fast-unicode-utf-8-validation/) is really interesting to me. Came from looking for JSON benchmarks. 

## 28-Jan-2021

[19:59:52](#Ty7Vj-pHTBdOJhrv4uuivesr1OGxvy_iqEy2VqNN87o) <giesse (Gabriele Santilli)>:
did you try the link I posted?

[20:06:21](#91euuezSp_C3rhaAaDGLRHv4Zmg_C4WEdhgJqezFMlw) <greggirwin (Gregg Irwin)>:
I have not yet. Was getting the DG release out. May be tomorrow before I get to it.

[20:06:52](#ZKrlwISGunYEQYUG3sczJQzEA-tqg0FHOPuamufVnjk) <giesse (Gabriele Santilli)>:
I forget how to post an image here, but if you look at the release page, there is the parse-markup.red file I linked above, then a zip file with the *source* (it says... Source code). That's exactly the same as what you get from cloning the repo.
If you are looking at the source... then it's the same as what you already had. If you download the actual release, then there should be no dependencies.

## 6-Mar-2021

[9:04:49](#U6MnM0P-LtUBkiptbdxqPo4Z_YwNGxlSGsb2ERNAI_Y) <GiuseppeChillemi (GiuseppeChillemi)>:
I am looking at the differences between json.red and `load/as.. json` one converts json object to Red objects, the other to  maps. Is there any option to convert to injects using `load\as`? And why map has been chosen in place of objects? 

[9:26:46](#ucN5zttJEDm9Vjet4yI_NJPABFcdKzK4QrBPFLuUK4U) <hiiamboris (NOT THIS ONE)>:
you can extend maps

[10:51:57](#qTUISQMZmzlKJtow12-aZbFRLEN3an-UNvR_AQhKUOs) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
@GiuseppeChillemi also map have case sensitive keys:
```
>> #(a: 1 A: 2)
== #(
    a: 1
    A: 2
)
>> object [a: 1 A: 2]
== make object! [
    a: 2
]
```

[10:52:50](#1OD4kQ4tn-oi9G4T_MpPEwmNywCzrMNBELz7jVzrpn8) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
And I don't understand first part of the question.

[11:15:12](#T79kkd3BuTphINH8CN85xhJqyToqItDOYeKYKh_i8qc) <GiuseppeChillemi (GiuseppeChillemi)>:
@Oldes very useful to know about case sensitive keys

[11:15:34](#T3GxAiRJfEjiJxZKJRRxJ4r72iOEke586v3w4IPiUJ4) <GiuseppeChillemi (GiuseppeChillemi)>:
@hiiamboris extend in which sense?

[11:17:04](#DtXDW0bVd-INc7oqt_UpP1igQChgi8TcB-qBN4f02Q0) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
```
>> m: #(a: 1) m/b: 2 m
== #(
    a: 1
    b: 2
)
```

[11:24:57](#f3UrAsjnEZPrE59Ef_xqTbQ4NeCQsjCijTq7teG6wZM) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
@GiuseppeChillemi simply with objects, you can't add (append) new attributes to them. That was available with R3 IIRC, but not sure either. Red does not have it I think.

[13:24:14](#zhegfVeZBiRDjxRkDpGBOfbhL9mxxmKkeqvjM8hi_to) <GiuseppeChillemi (GiuseppeChillemi)>:
@Oldes 

>> And I don't understand first part of the question.

If you refer to my phrase 

> Is there any option to convert to injects using load\as?

I was referring to convert the JSON to `object!` instead of `MAP!`


[13:25:05](#s-TFefc4kKb9oE0sprrAu_87azloYotgKs9lOsZkxQ0) <GiuseppeChillemi (GiuseppeChillemi)>:
@hiiamboris 
> you can extend maps

Now I have understood: you can add elements to maps

[13:26:55](#s_fptuUvKr4x8pOcnjVzHMQFWHOCq9SLHYNBdvr1W_U) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
@GiuseppeChillemi You can convert map to object, but as shown above, you risk loosing information (as object has not case sensitive keys)
```
>> make object! to block! #(map: 1)
== make object! [
    map: 1
]
```

[13:27:33](#oEtJXg_TIHwW3F9qzbwhXN7PWnOI1oQhtocs2ndGKeA) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* @GiuseppeChillemi You can convert map to object
```
>> make object! to block! #(map: 1)
== make object! [
    map: 1
]
```
, but as shown above, you risk loosing information (as object has not case sensitive keys)
```
>> make object! to block! #(a: 1 A: 2)
== make object! [
    a: 2
]
```

[13:28:40](#spPO0NenuO_rPK1ni96M_EG4d-pBC0ASerH1Qd_o5VM) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
JSON is like JS case-sensitive.

[13:28:50](#tHK8fjVcTiyrL_0zHEPQJ6Fzs3Iq1xmlJp8nOvRQLRA) <GiuseppeChillemi (GiuseppeChillemi)>:
I am investigating passing RED objects through the net using JSON instead of MOLDED form. This is the reason of my questions.

[13:29:37](#qMXHLMFP4ebP5ab4tWhlN43wxKRQUQ2vADS4R7vCJpQ) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
If you are passing between two Red apps, you should use Redbin.

[13:30:24](#bM-OpONqJoF95x-Z_UbXwNeUsmAgLVJZKn0IIBXTTxA) <GiuseppeChillemi (GiuseppeChillemi)>:
No need for the context.I need the object/block rappresentation.

[13:30:33](#a55tlVZ2wkmxi75dhh4I5y680z4PyvJ-TB4YyFYRzqQ) <GiuseppeChillemi (GiuseppeChillemi)>:
* No need for the context.I need the object/block representation (The prototype)

[13:31:28](#v_AywX27nYuZJv4BL_5K18mzogTgEJ4gVIou9m57yXg) <GiuseppeChillemi (GiuseppeChillemi)>:
Also I am looking at passing RED code BLOCKS via JSON.

[13:34:28](#ax_2Q-Ub4ipX7L0dyAxBkQNqY8W7aldXkq2IyHCyWW0) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
If you are passing info between Redbol apps, I wonder if JSON should be used at all... it's useful if you need to communicate with systems, which cannot load Redbol data.

[13:35:10](#TWS6sY5u2B3n9ONvZfEewvjkTHiapwewkQeStYxonaY) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Actually it's a nonsense to use it for Red-to-Red communication.

[13:38:02](#Fe0GzFONeR4YmJGJ9-tz8l5ce10SNwsS3Vrks_HNwTQ) <GiuseppeChillemi (GiuseppeChillemi)>:
Yes, it is for RED to non-RED and vice-versa

[17:28:45](#zcH0f3SHWRWesWnhqsOxvJe_xcBvEg2OHFo8dlooiXc) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
@GiuseppeChillemi why not maps?

[17:31:43](#qN81XKufmKTGpgnBKBSuR6rQ-6S3vbMcqXs2-IaTDy8) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
The only disadvantage of maps is, that there must be built hash table, so it requires a little bit more memory and creation may be a little bit slower.. instead of that I see only advantages over objects... like ability return none on non existent values:
```
>> m: #(a: 1) m/b
== none
>> o: object [a: 1] o/b
*** Script Error: cannot access b in path o/b
```  

[17:32:20](#XVxq9MICy8si3SPz2mMH3QC17eTcz1hDDFqJaJn1khc) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* The only disadvantage of maps is, that there must be built hash table, so it requires a little bit more memory and creation may be a little bit slower.. instead of that I see only advantages over objects... like ability to return none on non existent values:
```
>> m: #(a: 1) m/b
== none
>> o: object [a: 1] o/b
*** Script Error: cannot access b in path o/b
```  

[17:35:45](#0nGmpVZqRclGYsooUsMz7M7J7n8sCL5sX6xSTU0m7rU) <hiiamboris (NOT THIS ONE)>:
Object lookups are based on hashtable too.

[17:37:24](#9DNR0wDrA3Mf4MFak4aLx4pl_E5kiq-EQ8hEJFRtwqs) <hiiamboris (NOT THIS ONE)>:
https://github.com/red/red/commit/bc7dbcf05a3a056545902006a34d7e74a2a541df

[18:52:53](#lWvYAAF4TPGAoXywjvqmkP0mh_IjGV6ugMU8lg1IMLk) <GiuseppeChillemi (GiuseppeChillemi)>:
I still have to investigate if all Red OBJECTS and BLOCKS could be mapped to JSON and MAPS and return to their original form.

[18:53:05](#0PKoN1v8k7CvGao-qsR3uxselducNlyytcoPJYyfGjI) <GiuseppeChillemi (GiuseppeChillemi)>:
* I still have to investigate if all Red OBJECTS and BLOCKS can be mapped to JSON and MAPS and return to their original form.

[18:53:18](#f4qKzOn26nlA_0BPkOnFbkPBHpuOHsRBVn-VU-zMJpc) <GiuseppeChillemi (GiuseppeChillemi)>:
* I still have to investigate if all Red OBJECTS and BLOCKS can be mapped to JSON and/or MAPS and return to their original form.

[19:07:17](#bC_vakSpGasqYVSQmb724NJYY64j3h4dhB9h3Y3ccxs) <hiiamboris (NOT THIS ONE)>:
obviously depends on the data

[20:02:41](#ew1WRRXR4vQizkOkYrjbLfMAt_cNen3H-zjPqRVx0VY) <GiuseppeChillemi (GiuseppeChillemi)>:
As I have said, I have not investigated this side of the story. Under the light of having functions that are "API oriented", I need make a choice about function arguments.  Every function will receive its argument in a container:
1) A block in set-word form `[arg1: value arg2: value]`
2) As `Object`
The JSON "container" should carry either one or another content.


[20:03:02](#XmKga3Og6EJEuMBWqR9lXTXEQ6ExSk7oXcuonUUnjrI) <GiuseppeChillemi (GiuseppeChillemi)>:
* As I have said, I have not investigated this side of the story. Under the light of having functions that are "API oriented", I need make a choice about function arguments.  Every function will receive its argument in a container:
1) A block in set-word form `[arg1: value arg2: value]`
2) As `Object`
The JSON "container" will carry either one or another content.


[20:03:16](#OrXdOj_8Ik96BtRnirrU5LrZRy-aqEwlbtWwCWJhEF4) <GiuseppeChillemi (GiuseppeChillemi)>:
* As I have said, I have not investigated this side of the story. Under the light of having functions that are "API oriented", I need make a choice about function arguments.  Every function will receive its argument in a container:
1) A block in set-word form `[arg1: value arg2: value]`
OR
2) As `Object`
The JSON "container" will carry either one or another content.


[20:03:43](#4pvPZOhyGXmm_jFGnXZRJaua5k97EGPfLRYb3KHf-dE) <GiuseppeChillemi (GiuseppeChillemi)>:
* As I have said, I have not investigated this side of the story. Under the light of having functions that are "API oriented", I need make a choice about function arguments.  Every function will receive its argument in a container:
1) A block in set-word form `[arg1: value arg2: value]`
OR
2) As `Object`
The JSON "container" will carry either one or another content coming from foreign non RED/REBOL applications.


[20:18:09](#g8cHGheuaO0WmGvto5QJek2hY2wU__TaalhtyBpn6qQ) <hiiamboris (NOT THIS ONE)>:
Well obviously blocks are lighter

[21:01:42](#eHMLSewzqAgfsGxwI-j5npYC8Lo-Q20d_1qPXDu7z1k) <GiuseppeChillemi (GiuseppeChillemi)>:
But set words are harder to access as paths.

[21:05:27](#lMgXeCOueWD_fk70DZahvFEJJoqO0mlMpK3oxSR4vNo) <greggirwin (Gregg Irwin)>:
Only if you need Rebol compatibility @GiuseppeChillemi 
```
>> blk: [a: 1 b: 2]
== [a: 1 b: 2]
>> blk/b
== 2
```

I have some old experiments, related to Hoare Logic/Design by Contract, but which can be generalized. The idea being that you can vet an input (block, map, object) against a spec, much like you would for a dialect.

[21:08:12](#_V-dMRbWp6afeG27n9tYqm01xcMllzAwAME1Jx5DvVI) <greggirwin (Gregg Irwin)>:
It's not a replacement for standard function interfaces or dialects, but another approach which may work better in some cases. 

[21:10:16](#Q9_YhyueX9wk77tp7uf2-50JAXpaeBaNO98XKub2z4U) <greggirwin (Gregg Irwin)>:
It also overlaps with dependent types.

[21:12:25](#dJkMo7ROp0Dr0wcx9cs3hTmjphkHQQ_0NgewxKevC4U) <GiuseppeChillemi (GiuseppeChillemi)>:
So in Red you have symbol equivalence in path?

[21:12:32](#ft0oQPi5HHu1N2B_epFKMwSiNlaz6vhkeXGMwj1a7sg) <greggirwin (Gregg Irwin)>:
The big difference from a grammar is that order doesn't matter. You're checking for the existence or absence of values and their attributes.

[21:13:03](#sn7m78reAQn6FdPS5uiHT9kBeudf2kRtNHTEZja9iQ8) <GiuseppeChillemi (GiuseppeChillemi)>:
* So in Red you have symbols equivalence in paths?

[21:13:54](#dwFvRwP-BUiAXfUL_5HlLnFo-embDP7OS7KWluQrQVo) <greggirwin (Gregg Irwin)>:
For set-words. Get-words still look up the value they refer to.

[21:15:17](#izJNyZtr0y5JYE9vuff_4IgAppNJVxsqwAGz7quTaao) <greggirwin (Gregg Irwin)>:
e.g. you can use it with `find/select`
```
>> blk: [a: 1 b: 2]
== [a: 1 b: 2]
>> find blk 'b
== [b: 2]
>> find blk quote b:
== [b: 2]
```

[21:15:42](#of2y54dcHlD9WSA4a-4y9g0JgYFbBu8ILesAFa1H2wI) <GiuseppeChillemi (GiuseppeChillemi)>:
I am experimenting in this area too but in simpler ways. I'll test parse-based input grammars in the future, and also arguments value validation.  

[21:17:12](#IuwwpMu-OH_Z0eEa8Mom4szFwIt2Nw9Iks3pTkyo-Zk) <GiuseppeChillemi (GiuseppeChillemi)>:
I have even thought about embedding args validation in input strings, so they are available to a validation parser!

[21:20:00](#px7khxCP6n7bG34ZNd87e0MHORUSUAeE3Fdcda1JhE4) <GiuseppeChillemi (GiuseppeChillemi)>:
So, how do you `find/select` just words or set-words in Red?

[21:20:23](#iH-czsx8oPJgTKbKd5VJb9KLy2u9fFq7rLc-m5OqsH0) <GiuseppeChillemi (GiuseppeChillemi)>:
* I have even thought about embedding args validation in DESCRIPTION strings, so they are available to a validation parser!

[21:20:46](#Agk5Js_6XreObVLTwx_d5hAGYnnzRTalRvVXRhT12eg) <GiuseppeChillemi (GiuseppeChillemi)>:
* I have even thought about embedding args validation in DESCRIPTION strings, so they are available to a validation parser!
(NOTE: I HAVE CHANGED THIS PHRASE!!)

[21:21:03](#uV5MMq8YMWK1hkLHflLf07Ey_xg5gksRzELUTe3JAfk) <GiuseppeChillemi (GiuseppeChillemi)>:
* I have even thought about embedding args validation in DESCRIPTION strings, so they are available to a validation parser!
(EDIT: NOTE, I HAVE CHANGED THIS PHRASE!!)

[21:21:05](#AmH_WaL0e6XjpEccd9GLWI7FCwgTeVHgiXLqk3aqF64) <hiiamboris (NOT THIS ONE)>:
'? find'

[21:24:41](#O4bO9kWqE6Jj1_N4Rkky4PM6mDKMviosz1p3BoVUwJQ) <greggirwin (Gregg Irwin)>:
@GiuseppeChillemi my post above was to show that words and set-words work equivalently.

[21:25:16](#TLI8nKoRp29P-3NEq7PGqk-giJh1fd5cNqibtam-Siw) <greggirwin (Gregg Irwin)>:
If you need to check *strictly* use `find/case`.

[21:35:42](#-ewnM8EyKcppDxIhNzM9IKA1InVq940Nh2aeQM_8MlU) <GiuseppeChillemi (GiuseppeChillemi)>:
Wow! There was a secret here: 
`/case        => Perform a case-sensitive search.`


[21:56:03](#2b5F6EJdznLPqzHyU3DPi80LWBtap6JZkIRaUt__FC0) <GiuseppeChillemi (GiuseppeChillemi)>:
So this road ends to nowhere:

```
>> blk: [a: 22 C: b b: 3]
== [a: 22 C: b b: 3]
>> w: 'b
== b
>> blk/(w)
== b:
>> 
```

I admit I don't like it. Set word notation can't be used in paths but I can create workarounds:





[21:58:18](#vBxp8Is5edi0R0yi9Z8O8buYh8LvSyBySujIkdEW9oU) <greggirwin (Gregg Irwin)>:
Path notation does have limitations, because you can't spec `/skip 2` or `/case`. Tradeoffs.

[21:58:33](#LJQ55Xx3lVnol4D__nmxzmQ7wpCfVr70CRRpoZkqDvE) <GiuseppeChillemi (GiuseppeChillemi)>:
I was creating something like this for arguments constraining and checking:


```

arguments-block: [a: 50 b: 22]

;--- This is the check block ---
checks: make object! [
   a: func [arg [number!]] [if arg > 10 [raise-error]]
   b: func [arg [number!]] [if arg < 2 [raise-error]]
]

f: func [args /local checks] [
	foreach wrd words-of checks [
		checks/(wrd) args/(wrd)
	] 
]

f arguments-block

;Alternate solution
f: func [args /local ff] [
	foreach wrd words-of checks [
		checks/(wrd) find/tail/case args wrd
	] 
]
```


[21:59:04](#VqRRhYLpPglha4n681ZNyHhJ3A7r1dxBHy2O4LvpqLI) <GiuseppeChillemi (GiuseppeChillemi)>:
Note: check should be inside the function but I have left it on the outside to maintain readability

[21:59:20](#_RaslExEr3K6WXrgFjatrvdyukKQhaiIW5qeDe3aKDI) <GiuseppeChillemi (GiuseppeChillemi)>:
* I was creating something like this for arguments constraining and checking:


```

arguments-block: [a: 50 b: 22]

;--- This is the check block ---
check: make object! [
   a: func [arg [number!]] [if arg > 10 [raise-error]]
   b: func [arg [number!]] [if arg < 2 [raise-error]]
]

f: func [args /local check] [
	foreach wrd words-of checks [
		checks/(wrd) args/(wrd)
	] 
]

f arguments-block

;Alternate solution
f: func [args /local ff check] [
	foreach wrd words-of checks [
		checks/(wrd) find/tail/case args wrd
	] 
]
```


[21:59:43](#yM9COmYQqzCVy3vb7jWgT4qQAVSpvw_1k2rZ3tjBBr4) <GiuseppeChillemi (GiuseppeChillemi)>:
* I was creating something like this for arguments constraining and checking:


```

arguments-block: [a: 50 b: 22]

;--- This is the checks block ---
checks: make object! [
   a: func [arg [number!]] [if arg > 10 [raise-error]]
   b: func [arg [number!]] [if arg < 2 [raise-error]]
]

f: func [args /local checks] [
	foreach wrd words-of checks [
		checks/(wrd) args/(wrd)
	] 
]

f arguments-block

;Alternate solution
f: func [args /local ff checks] [
	foreach wrd words-of checks [
		checks/(wrd) find/tail/case args wrd
	] 
]
```


[22:03:05](#ascCaFGI1HdlUzXRSyiKmX73kmJA-he6ju4ohaMNdwo) <GiuseppeChillemi (GiuseppeChillemi)>:
> Path notation does have limitations, because you can't spec `/skip 2` or `/case`. Tradeoffs.

Yes, SKIP 2 can be avoided not having set-words arguments (!) but `/case` can't be used and you have to drop words the use of words as set-word arguments !!!!!

[22:04:35](#aIfRPQv44-r83kATiShT-6GABkxGDzlx6ER878MJeuk) <greggirwin (Gregg Irwin)>:
You can bend Red farther than other langs, but it will still eventually break. ;^)

[22:07:06](#PMnYfjS3aJyJc0BnV8JLB5eQVy1WJULGbqlZppVYsFo) <GiuseppeChillemi (GiuseppeChillemi)>:
Sometime I have thought about having path evaluation options like

`word/[options]/path/path` I will experiment with it making a custom operator to evaluate the path.







[22:07:15](#2KouqS1qiJBN9nTZNVg4ZbMQXq8OQBzwTT4HgztSK5w) <GiuseppeChillemi (GiuseppeChillemi)>:
* Sometime I have thought about having path evaluation options like:

`word/[options]/path/path` I will experiment with it making a custom operator to evaluate the path.







[22:07:59](#GgVdEdAv3Sw8oiyVQKi7NwpKIRbaQ0-zggyHL1fNX74) <GiuseppeChillemi (GiuseppeChillemi)>:
> You can bend Red farther than other langs, but it will still eventually break. ;^)

I love this phrase! 

[22:09:11](#99-yJd1z0jPTA4Xa5VcSDLWF1kNncpQUZwoOTv9wv0I) <GiuseppeChillemi (GiuseppeChillemi)>:
But Red has 1.000 ways to do the same thing, so it won't break if you find the right way of bending it.

[22:12:08](#AU8E1vuHG_0Pblnw1DgBBP_3q9EqrNF_0IPJMZbBE9g) <greggirwin (Gregg Irwin)>:
Correct.

[22:12:42](#iPxmVqmmdqD-sFdhFmCjBV_fb77ZMCLlT0O2ioX-7EI) <greggirwin (Gregg Irwin)>:
If you find that you're bending things so far that you feel the strain and resistance, bend in another direction. 

[22:28:05](#ukoeXqTNVtFHL2CFhIzcC9OAZXOOhVAis4a09W_J2XM) <GiuseppeChillemi (GiuseppeChillemi)>:
Parse is now my friend here. I can bend it further using it. Like a BOOST! on the elasticity property of the objects.  

[22:36:36](#y0UQVc5toTUUC6-9NZUbdv1Jm0wwds927QIRzsJs9Xw) <GiuseppeChillemi (GiuseppeChillemi)>:
* Parse is now my friend here. I can bend it further using it. Like a BOOST! on the elasticity property of the matter.  

[22:37:00](#ucoQkjMrorbEFW0XQkFEDpiTuInTkPvge5Za5Tt1BcI) <GiuseppeChillemi (GiuseppeChillemi)>:
* Parse is now my friend here. I can bend it further using it. Like a BOOST! on the elasticity property of the materials.

[22:42:06](#Z3C3fY4ukgB3BDk0Bp-f6E-fU8lbCt5MPe1cPVoMK9s) <GiuseppeChillemi (GiuseppeChillemi)>:
@greggirwin note: you should document the equality of `set-words` and `words` in find and paths (here)[https://github.com/red/red/wiki/%5BDOC%5D-Differences-between-Red-and-Rebol]

[22:42:24](#X9g9gdkoCQu6YsszoEy8Gclo9s2Ee1ocnsxbwupxYkg) <GiuseppeChillemi (GiuseppeChillemi)>:
* @greggirwin note: you should document the equality of `set-words` and `words` in find and paths [here](https://github.com/red/red/wiki/%5BDOC%5D-Differences-between-Red-and-Rebol)

[22:50:18](#4g15YjK_lC0w_0zDXF8EtWALAXxQZpHO0NLTRlErRhs) <greggirwin (Gregg Irwin)>:
It's a wiki, so go for it. 

[23:15:02](#e0Cz4sGd3i-BgS2RNzEAhaoaFNRsqy8q_e8DSBZuGjU) <GiuseppeChillemi (GiuseppeChillemi)>:
You know why I don't write but maybe I am now a little better talking about Red and **someone** will accept my editings ������

[23:56:09](#tE0mfW0lezPm6cowkG5Tnb5UlUJ0hHX31grUyjIwVx0) <greggirwin (Gregg Irwin)>:
Good writing is rewriting. If we get something in there it can always be improved.

## 8-Mar-2021

[16:06:07](#evd9H33RuZNYZjVV5HPDMp-_i2G_oDTF53RpddG4ePY) <GiuseppeChillemi (GiuseppeChillemi)>:
So,  JSON objects are mapped to `maps` while arrays are mapped to block. Is it right?

[16:06:20](#-NatJOnxQN_dVcQYUnN1O0Qmicv1rMBzYwW-s69MdmU) <GiuseppeChillemi (GiuseppeChillemi)>:
* So,  JSON objects are mapped to `maps` while arrays are mapped to blocks. Is it right?

[16:09:59](#U7PWv0fTiv1R-vous-lnMGexjPVpyP9vb0-ZhYRVtnU) <GiuseppeChillemi (GiuseppeChillemi)>:
* So,  JSON objects are converted to `maps` while arrays are converted to blocks. Is it right?

[17:51:02](#rOQIPoOYqQqYdE64-nUX5dDlqbwNdwCoYnsAPNp5lck) <greggirwin (Gregg Irwin)>:
Correct.

[22:35:05](#07N4ie_1mAYr2j3976DbI8IJAtgdnTDa4QZaR2h9xOI) <GiuseppeChillemi (GiuseppeChillemi)>:
And do we have a way to transparently convert to JSON and then to Red, without losing resolution? 

```
>> xx: ["a" %myfile.r 'a /hello true false none 1 3x2 make object! [c: 22 d: 33]]
== ["a" %myfile.r 'a /hello true false none 1 3x2 make object! [c: 22 d: 33]]
>> load/as save/as "" reduce xx 'json 'json
== ["a" "myfile.r" "a" "/hello" true false none 1 "3x2" #(
    c: 22
    d: 33
)]
```

Words, files and pairs are converted to strings. It would be nice if they retained to datatype in some way (serialized form?).

[22:36:23](#q1xLZ3GO9AWJPaYXVLib0A5dLs_xbY14tTOf5FmhIhE) <GiuseppeChillemi (GiuseppeChillemi)>:
* And do we have a way to transparently convert to JSON and then to Red, without losing resolution? 

```
>> xx: ["a" %myfile.r 'a /hello true false none 1 3x2 make object! [c: 22 d: 33]]
== ["a" %myfile.r 'a /hello true false none 1 3x2 make object! [c: 22 d: 33]]
>> load/as save/as "" reduce xx 'json 'json
== ["a" "myfile.r" "a" "/hello" true false none 1 "3x2" #(
    c: 22
    d: 33
)]
```

Words, files, refinement and pairs are converted to strings. It would be nice if they retained to datatype in some way (serialized form?).

[22:36:38](#amTV0W3X7uhTxutJtSEfTEQecKqAJfV14Igt1m8n1do) <greggirwin (Gregg Irwin)>:
You would have to encode the extra information yourself. JSON conversions are lossy because it only understands a few basic types.

[22:38:28](#ijKwMgFRm-xuoMzhdoCMd5jQatNeyTjIqG0ByBtz48U) <GiuseppeChillemi (GiuseppeChillemi)>:
I know I have read it in the meantime. I will work on this topic. @reichart has made me curious about APIs and I am trying to understand how much of Red could be mapped to JSON.

[22:39:14](#oomT4Xh09l_5qeBPZwdm3AAI4n1548IuM-B8B2skIyI) <GiuseppeChillemi (GiuseppeChillemi)>:
* I know I have documented myselft in the meantime. I will work on this topic. @reichart has made me curious about APIs and I am trying to understand how much of Red could be mapped to JSON.

[22:40:20](#siusXqXqmeGJgv9lfPfcNirqE2Y4NEQN-CkyvHy7zXk) <greggirwin (Gregg Irwin)>:
The way I did this for XML (for Reichart in fact) was to create a schema that mapped known fields to Red value types. The principle is the same, but is predicated on knowing what's in the data.

[22:42:11](#z5ZrzAAslVyGI4mLF7k-8N-VPZwt-A5OVySk3bviroY) <GiuseppeChillemi (GiuseppeChillemi)>:
How do you suggest representing a Red datatype which has no counterpart in JSON?

[22:42:52](#_ZT8nb1J7oyb5VyJJDaX9uYYlXY8DIS2bQS5qbu8bC8) <GiuseppeChillemi (GiuseppeChillemi)>:
(I am asking for an example of your mapping)

[22:43:06](#cNQUxkY4YrPnI19cP3AqF7zmgVmxxl6H4d0Yvx0Y8fs) <GiuseppeChillemi (GiuseppeChillemi)>:
* (I am kindly asking for an example of your mapping)

[22:44:03](#p6krDAERFktABZwzi9zvOXptN6XuItq7MNCV2UF1Hf0) <GiuseppeChillemi (GiuseppeChillemi)>:
* (I am kindly asking for a suggestion for mapping datatypes)

[22:46:30](#9L-jUDvazm4kIEyxmy7AbLdMeNqkOAlay7gt0_ga_ec) <greggirwin (Gregg Irwin)>:
Almost everything has to become a string on the JSON side. If you have compound types they may map to objects or arrays. Then you have conversion funcs to do specialized processing that lets the other side understand it. e.g.
```
from-XML-date: func [val [string!]] [to-date replace val "T" "/"]
to-XML-date:   func [val [date!]] [to-ISO8601-date/T/no-zone val]

MSProject-type-map: [
	; XML type	REBOL type 	conversion funcs
	"integer"	integer!	[to-REBOL to-integer to-XML form]
	"string"	string!		[to-REBOL to-string  to-XML form]
	"boolean"	logic!		[to-REBOL from-XML-boolean  to-XML to-XML-boolean]
	"float"		decimal!	[to-REBOL to-decimal to-XML form]
	"decimal"	decimal!	[to-REBOL to-decimal to-XML form]
	"time"		time!		[to-REBOL to-time    to-XML form] 
	"duration"	time! 		[to-REBOL from-XML-duration  to-XML to-XML-duration]
	"dateTime"	date!		[to-REBOL from-XML-date  to-XML to-XML-date]
	; other name means it's an object type	
]
```

[22:49:09](#HtCzEVlIyfmozmmyXzSamq5C00qyfNNje0dZFjuTMCM) <greggirwin (Gregg Irwin)>:
Then you have schemas for each type you need to translate.
```
    "TimephasedDataType" [
        "Type" "integer" 
        "UID" "integer" 
        "Start" "dateTime" 
        "Finish" "dateTime" 
        "Unit" "integer" 
        "Value" "string"	; may contain a duration value that requires parsing
    ] 
```
Which can have nested blocks that eventually boil down to fields with a type.

[22:55:01](#D9T5uLecJW_-sdFA9rEbNkl5elsP8W54FA1XVLbfZt8) <GiuseppeChillemi (GiuseppeChillemi)>:
So, you use a `foreach` to iterate `MSProject-type-map` and then a `path` to select the appropriate conversion function? 

[22:55:23](#IjLHkkkgNSzRr2G5NWQU4kBfNe1np4i5VOPj1nqPKWE) <GiuseppeChillemi (GiuseppeChillemi)>:
* So, you use a `foreach` to iterate `MSProject-type-map` and then a `path` on the third element to select the appropriate conversion function? 

[22:59:58](#52B90eEkdm3vewZ_ZC1LOVQdQvmIFVIziWa-lzaSuVc) <greggirwin (Gregg Irwin)>:
It first loads the XML into a raw block, then walks that and maps each value using the schema. If there's no schema entry for a field, it tries to `load` it.

## 17-Mar-2021

[6:46:03](#vV-dvq3drRvF_oUAVdoKdce-hklylTTTa8XydgnYQ3w) <rebolek (Boleslav Březovský)>:
@giesse Is there any specific reason why JSON codec returns an error instead of throwing one? Or is it just an oversight?

[19:18:29](#lTfagXvjViidW20eNVK0ORwdlSAbqIhFjGtPCUp10vw) <giesse (Gabriele Santilli)>:
I didn't change `load-json`. Looking at https://github.com/greggirwin/red-json/commit/d034df6268f81ad7b1dbc84e595ac51d055f141d#diff-7a2689d7c2ae95425eac90483c2810220659bf626bd012d97fe409a6d62dd2d7 I'm going to blame Gregg ������

[19:19:30](#m0rg85cWyd4fjyycJMUAuCGPLLLIfC6tvNIibsj0WiQ) <giesse (Gabriele Santilli)>:
I guess it needs a `do` in there? or using `cause-error`.

[19:19:52](#FGi9u9LT-sToj1Hcf_3YJUk-tj4F7q6oS1Z8-tfNgAo) <rebolek (Boleslav Březovský)>:
Ha! :)

[19:20:29](#ctSCfesKP5XjRD2YwXTB9wA9GY_00v6iUe3Bec4VRpk) <rebolek (Boleslav Březovský)>:
Right, it needs `do` to trigger the error otherwise, you get `no catch for throw` error

[19:31:25](#BqWoQHoK2Lpm4G_RldO4De_Y7TbcyEfhxbYq1u3SkXE) <greggirwin (Gregg Irwin)>:
Indeed. Now we know *when* it happened, but given my current thinking, maybe I was just being future consistent with that. :^)

[19:38:45](#RjLYuIqCarkZG_ecNiSKP0k_6VSwlVqbtZuKAJxcJ9o) <rebolek (Boleslav Březovský)>:
:)

## 25-Sep-2021

[11:06:21](#9cO2X-Y_Lg2pRxRc01OdaN4sDz6LJhfLpy6RTh3U6VE) <zwortex (zwortex)>:
I have created a new repository [zwortex/red-xml](https://github.com/zwortex/red-xml) for xml related stuff. It is an attempt to transpose into RED the SXML package used in Scheme, see [original by Oleg Kiselyov](http://okmij.org/ftp/Scheme/xml.html) or its [Racket version](https://docs.racket-lang.org/sxml/index.html). This is experimental stuff, all the more that I still don't feel yet entirely at ease with Red. In the package currently, there is 
- **sax.red** : an implementation of SAX (the standard api for XML event driven parsers). This is nearly complete, except DTD that is not supported yet. The parser also is not yet a validating parser (no DTD, nor XML schema support). You find a similar parser as this one within Rebol3 XML codec, but this one is another implementation, closer to the current [SAX2 API](http://www.saxproject.org/). As this parser does solely XML parsing, it can be easily targeted for whatever target format. For instance, I guess it could be used for loading SVG files directly into DRAW dialect. 
- **sxml.red** : an implementation of SXML format. Originally SXML is an internal representation of XML that is used for Scheme and that is based on s-lists, therefore its name : see [wikipedia](https://en.wikipedia.org/wiki/SXML) and above links for more details. The same structure is implemented here with blocks rather than s-list obviously. One difference also is the marker for the attribute set of nodes. In SXML, it is @. In Read, _ is used instead as @ is not allowed within a word. The script allows loading an XML file into an SXML tree and perform basic operations with that tree. Note however that the objective of SXML is the ability to manipulate an XML structures directly with the language, rather than through an API. As long as the final tree is compliant with the SXML structure, it can be used.
- **sxpath.red** : an implementation of SXPATH. This allows to interrogate an SXML tree with similar requests as XPATH. The script, currently, implements the sxpath primitives and the abbreviated format of requests. It does not implement yet the string format, which is the closest to XPATH.

What is lacking, on top of what was already mentioned :
- serialization : for the moment, this is a one-way ticket from XML to SXML but not the other way round (sorry).
- SXML transformation : similar to XSLT

Note that the SXML or SXPATH formats are not entirely settled. In particular, it may not leverage enough red capabilities to handle multiple data-types. In Lisp, symbols are used for XML tags as well as internal tags like \*COMMENT\*, _, \*TOP\*, \*any\* etc. Currently, word or issue! are used but this not entirely thought through. Similarly XML tags may be translated into word, tag, or url or combination of those. This, also, needs additional thinking.

There is limited, to no documentation, so that the best entry point are the test sets. There is one for each file.

[17:17:00](#d-2uNk1QwdyRgp4_EMuPB6gvMLDwGJEzHU-6l_Pts0A) <greggirwin (Gregg Irwin)>:
Thanks @zwortex! I will make time to check it out. The reason we don't have a markup codec yet is because of unanswered design questions, like those you hit. Also how it aligns with HOFs for processing, versus having an `xpath` API. 

[17:18:11](#matW8cSoyTepp2MznXtCEThtjBxSC8rGHiym8Dq_wa4) <greggirwin (Gregg Irwin)>:
One issue you may run into with using words for all symbols is blowing the current symbol table space. Anytime you're loading external data, which may contain thousands of symbols, you run this risk. 

[21:10:27](#ICoJHECMSP4KK0W2r662Rspj6KVP6S_hBqWVQV5aNKo) <greggirwin (Gregg Irwin)>:
@zwortex wow! That is no small amount of work. :+1: It's nice to see parse-trace used, and you've done some nice work with reflective aspects. I have only skimmed a couple files so far, but appreciated the detailed comments. 

## 26-Sep-2021

[9:16:04](#JAObi5cWK8kIKYP7JKnkC0JkgsMZRv4xNxSWqpRh2VU) <zwortex (zwortex)>:
@greggirwin, thanks for your comments. For the use of words, I think it should be possible to configure the parser to produce either words, issues, tags, urls or a combination of them to handle symbols.
I don't understand your remark on HOFs for processing, versus having an xpath API. First of all, what does it mean HOF ? High order function ?
Anyhow the SXPATH solution see [original paper](http://okmij.org/ftp/papers/SXs.pdf) by Oleg Kiselyov is three folds :
- primitives functions, filters, selectors and combinators, that operate on a node set and return a node set. For instance the function node-closure scans through all descendants of a node and returns all the nodes that satisfy a given test, or the function node-type checks whether a node is of a specific type or tag)
- abbreviated request : that is a higher order shorthand format for writing a request. For instance to get all nodes that are html paragraphs, you provide the following block request [#... p], which is translated using the primitives above. Here the node-closure and node-type with p tag.
- string request (not implemented yet) : are xpath requests, that are similarly translated into a combination of primitives functions.
Still, as SXML is regular blocks combined together into a tree : you might use whatever functions you like to build it, modify it or scan through it, as long as you respect the expected format. I should add also that XPATH allows providing your own functions to a request, so you may embark in the request whatever complex test you need to perform. All this is not entirely implemented, not entirely tested but that is the intention.

[9:16:58](#-sS-Ckp5YlXWz_8_m-HqOOXyX0G0GBJV2L261Mw7D3M) <zwortex (zwortex)>:
* @greggirwin, thanks for your comments. For the use of words, I think it should be possible to configure the parser to produce either words, issues, tags, urls or a combination of them to handle symbols.

I don't understand your remark on HOFs for processing, versus having an xpath API. First of all, what does it mean HOF ? High order function ?
Anyhow the SXPATH solution see [original paper](http://okmij.org/ftp/papers/SXs.pdf) by Oleg Kiselyov is three folds :
- primitives functions, filters, selectors and combinators, that operate on a node set and return a node set. For instance the function node-closure scans through all descendants of a node and returns all the nodes that satisfy a given test, or the function node-type checks whether a node is of a specific type or tag)
- abbreviated request : that is a higher order shorthand format for writing a request. For instance to get all nodes that are html paragraphs, you provide the following block request [#... p], which is translated using the primitives above. Here the node-closure and node-type with p tag.
- string request (not implemented yet) : are xpath requests, that are similarly translated into a combination of primitives functions.

Still, as SXML is regular blocks combined together into a tree : you might use whatever functions you like to build it, modify it or scan through it, as long as you respect the expected format. I should add also that XPATH allows providing your own functions to a request, so you may embark in the request whatever complex test you need to perform. All this is not entirely implemented, not entirely tested but that is the intention.

[18:20:16](#Ohy7bZMcVZ_m3sTeQi0_lrcRLj5sBKfpEorQityXBXk) <greggirwin (Gregg Irwin)>:
We're on the same page. WRT HOFs, the design issues we're thinking about are how best to generalize things. For example, in Red, rather than a specific DOM processing model, you may have flat series, DOM-like structures (with or without node attributes), triples (see @hiiamboris [`node!`](https://github.com/red/REP/issues/57) thoughts), and integration with iterators for imperative use. It would also be nice if we can make things sensible WRT other features in Red. e.g. the new `split` may be able to partition by function(s), so it overlaps with HOFs and DOM filters/selectors in some ways.

## 27-Sep-2021

[10:52:54](#D68UrZgimmJpU6AP6ouMMLhAsnC6wglqHYUkjdeuUwA) <zwortex (zwortex)>:
I am not sure to understand fully (haven't red the REP), but I guess your story is : let's extend our own vocabulary (find, select, append etc.) to support also tree-like structures, and why not be foolish any kind of graph-like structure. And we would need to extend iterating capability, as filtering is not possible etc.

[10:56:07](#1Czk8hcuNVxC81qhtmz0ZbU_OvDv1ytclOjMET5rB_M) <zwortex (zwortex)>:
* I am not sure to understand fully (haven't red the REP), but I guess your story is : let's extend our own vocabulary (find, select, append etc.) to support also tree-like structures, and why not be foolish any kind of graph-like structure. And we would need to extend iterating capability, as filtering is not possible etc. And we don't like recursivity that is bad, for the mind and for the stack.

[16:48:03](#13yz9vT-3oPbWxa4usmIJAjeM_I1WKbPZQsJs9A42Ok) <greggirwin (Gregg Irwin)>:
`find, select, append` won't change in this regard. At least not anytime soon. I started an HOF project, and @hiiamboris took some ideas to the next level, but this will be new mezzanines for the most part. 

## 1-Nov-2021

[12:23:04](#vnahKxF3i5PxN7qEOt3EVbx5Xt5PNZaoPu6RkoXpa0w) <rebolek (Boleslav Březovský)>:
I’m not sure if this is the best room for it (I haven’t found other related directly to networking/protocols), but anyway. Here’s a Wiki describing my work on different protocols implementation so far. https://github.com/rebolek/red-tools/wiki/Red-networking-(layer-6-&-7)

[18:29:46](#Vr9g69mbQ4g-rkxpdFAEXZCd0SmqE3eI8rodXpSU5uM) <greggirwin (Gregg Irwin)>:
:+1:  We should definitely have a group for this, but for now we could use red/red so people are aware. red/protocols is probably a good name, as it's more specific to the higher level aspect, versus things related to TCP stacks, IPv6, etc.

[19:31:05](#baWC95FGJrDbjET3ZRSpGRAOnG5YMICcNrLi1Nz0vnw) <rebolek (Boleslav Březovský)>:
red/protocols for layers 6&7 and red/networking for layers 4&5

[22:02:32](#c8GKTNbW4GRSfpK52BFTEPQ28v7dDH9qMeb8YxtaDec) <greggirwin (Gregg Irwin)>:
@rebolek, you note that the server work currently focuses on security, which is absolutely the most important aspect. Functionality doesn't matter if we fail on security.

[22:04:40](#oboosF_Vju7LcEa_BEbRCxnTVk1YzjuTp4BiWn61oec) <greggirwin (Gregg Irwin)>:
Typo in link: "Red’s MQQT"

[22:14:02](#0kA5Nc0HLzAW-ABzFBMyPrK63Rm_3GRsIXTeU7NGIyc) <greggirwin (Gregg Irwin)>:
Rebol had `dns://` built in as well. I actually used it quite a bit as a debugging tool, making sure names went where I thought they did. Handy for creating server dashboards as well.

For less used protocols, they can be good examples. We don't want to include everything as standard, and some will be more complicated or pose extra surface areas for attacks. e.g. FTP is a pain, and insecure as you note. However, there are still surely legacy systems out there and SFTP isn't dead yet AFAIK. So while they are a low priority, if somebody needs them, we can help them if needed.

## 2-Nov-2021

[8:29:18](#CPIW18OW8jpxnjaZwON5ltfWaJdJmrd6eGijv6nTMfc) <rebolek (Boleslav Březovský)>:
* typo fixed, thanks. I also added more links
* DNS - of course I want `dns://` too, what I meant is that it should be implemented at R/S level using OS calls instead of writing a complete DNS resolver
* my HTTP server focuses on security, but I believe we still need build-in very simple HTTP server that just serves static pages (for a local machine mostly) and nothing more. That doesn’t mean there can’t be another more advanced server. Should it be built-in? I don’t know, I guess it depends on the size of the codebase.
* SFTP certainly isn’t dead, but it shares only name with FTP, it’s SSH based (there’s also FTPS which is FTP over SSL/TLS). Would be nice to have SSH in Red? Oh boy, that would be wonderful!

[10:33:02](#zOqtMft4JOKtT8r5ZWl_17Z2Lh9xpp6b2VfIXZNBm20) <xqlab (xqlab)>:
+1 for SSH

[10:33:21](#0DnVtMGMxsnJUVpd7e0JWmHzpQi7haVtXyUarPXPZJ0) <xqlab (xqlab)>:
* ++ for SSH

[10:33:43](#Mu0457nemYm1i_DrknESQBmaJ8OZoQZzUCgO7LopHkw) <xqlab (xqlab)>:
* SSH ++

[10:43:21](#0ED3VUyPGJnLbSSjNasqErQvmokWMQSm-NGlIlE1zf0) <rebolek (Boleslav Březovský)>:
I’ve made a repo for the various protocols so they’re not shattered around. I also moved the eiki there: https://gitlab.com/rebolek/protocols/-/wikis/Red-networking-(layer-6-&-7)

[10:43:28](#vxYU6Tzcf9EbcHFk71HYBhxbnavqucOiQcQtZJ9GgoI) <rebolek (Boleslav Březovský)>:
* I’ve made a repo for the various protocols so they’re not shattered around. I also moved the wiki there: https://gitlab.com/rebolek/protocols/-/wikis/Red-networking-(layer-6-&-7)

[15:16:16](#oZRIimFsz3-4wZ1lgqTvMU5Y7ICrXFw61cAADcUteuM) <hiiamboris (NOT THIS ONE)>:
secret wiki page ������

[15:41:00](#bcSBEp5HqOEdqp5mbO2YfqvvLVqxTAleUODk4wCBzJc) <rebolek (Boleslav Březovský)>:
secret? :)

[19:34:40](#T5coyldqhb_rl8V8BqWsLrMlnPaZHFTVy7Ag4sNmmLU) <greggirwin (Gregg Irwin)>:
Agreed on DNS @rebolek.

We should be able to do SSH, but this is also an area where we have to weigh value to Red, and is it better to build a modern alternative that is more idiomatically Red. like Reb Services was. That is, can we make SSH better, more accessible, or more secure to help others that use it? Can we make tools that sit over it (think SCP) for particular uses? Zooming out, in today's world, how do we make it easy to create and manage secure, distributed systems?

On built-in HTTP servers, it probably needs to be kept very simple, though once we have modules, the ability to include it optionally will make that less important. I also think a Red native protocol would be great, and we can learn from Reb Services and other protocols there. The underlying protocol(s) will have, I expect, higher level protocols over them, so you can change your tuplespace protocol to a different transport without changing the high level code itself.

[21:10:04](#K_12dbX2MDKwEWYsVPFrPBsbMyAvT7feEaDDZkm_J_k) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
One of the reasons for the Red project, IIRc, was to get Cheynne NG. As a web/app server. Cheynee was based upon an Uniserve multiplexing engine. I think, that apart from schemes/protocols, the ability to configure / instantiate servers / communication for various protocols, was the initial idea.

[21:11:43](#vrXyyTds4Se_E_nVYE1vWzaWHgURZYX-zy49OmciEng) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Rolling some 10-15 years to nowadays, I have to ask myself, if I can see a value in supporting protocols like IRC, ICQ and various protocols, which might not even exist nowadays, is the way to go.

[21:18:57](#Q7NKhDdE6v7zw1rxdi84_EjrYJGU5SUo9WhLQRFx6Bc) <greggirwin (Gregg Irwin)>:
@pekr we absolutely have to look forward, not back. We're learning this lesson now with 64-bit. For those who need legacy support, and there are many out there I'm sure, they should be able to build what they need...or contract us to build it for them. :^)

## 3-Nov-2021

[5:55:29](#d9O_0Fm3xokCXoNKrdjZSxYyOo28dkqSlawqI1fPKeQ) <rebolek (Boleslav Březovský)>:
@pekr I don’t thik anybody mentioned ICQ :-) I might do IRC as I use it daily, IMO it’s much better than closed source alternatives like Slack or Discord. 

[5:57:15](#ZhSUxE5wSOFvuk5VtmJO8btQim293Jw3cblh1f9L758) <rebolek (Boleslav Březovský)>:
But most of the protocols in my list are things that are popular now - HTTP, websockets, some DB engines like MySQL and Redis, etc. I also mention few protocols that are implemented in Rebol, but are legacy IMO and I don’ think we should focus on them.

If you think something is missing in the list, just let me know, we can discuss it and I can add it to the list.

[18:31:05](#DSPQGAqUdfoKhFSnIzmQ8jMQs8dUDDQJdm4lyTsOa4A) <greggirwin (Gregg Irwin)>:
HTTP is by far the most important. Having a couple others as examples helps us refine the patterns used so we can write up docs and best practices to let others build protocols effectively. 

## 18-Nov-2021

[21:12:16](#qA1Iu7qk3lkBNhgMihir8z2Qujx3_vpaME2u5AV6OSg) <greggirwin (Gregg Irwin)>:
We're going to push forward on a markup codec. There are comments going back to early this year on it, and I have a bunch of notes as well. We're in the midst of a *lot* of design discussions right now, and they often touch each other in some ways. It's a good time to hit this hard, and @rebolek will be our lead.

One of the most important things is the data structure, and how that makes various features at the API level easy or hard, and how and what we expose from an implementation standpoint, or how it's architected internally. We're dealing with this now in both `split` and `format`. Fortunately, there's a clear separation with codecs. The parser will be done with `parse`, and produce a data structure. The interface to that, and the implementation to support it is the second part. They meet at the data structure, but are otherwise no connected. The data structure is also important, because it doesn't have to come from a parsed markup document. 

This makes the data structure the critical part, and unless someone sees something I don't, it comes down to a small set of options in how we choose to address attributes for nodes. That is, it's really just a simple tree with nodes... except for the added attributes each node can have. Since, in all these years, nobody has proposed a clear winner, it's just a choice. And that choice may be driven by what makes the API implementation clear and easy. 

## 19-Nov-2021

[8:49:23](#Y_yNHNR7sXc8Y9BAzGyWBjD03G5tkw83EMBTfXEnwpE) <rebolek (Boleslav Březovský)>:
Here are @greggirwin 's notes reformated as a Wiki https://gitlab.com/rebolek/markup/-/wikis/home feel free to edit it.

[15:53:16](#PK9aeUq64_3_Zr7gw3MDarozAp8k7DX9g5o1XU2EfN0) <hiiamboris (NOT THIS ONE)>:
My preference is:
```
input: {
	<tag-1 attr-1="t-1">
		<tag-2>
			<a attr-a="aa-1">aaaa</a>
			<b>bbbb</b>
			cccccc
		</tag-2>
	</tag-1>
}

xml: [
	tag-1 [
		#attr-1 [! "t-1"]
		tag-2 [
			! "cccccc"
			a [
				! "aaaa"
				#attr-a [! "aa-1"]
			]
			b [! "bbbb"]
		]
	]
]

xml/tag-1/#attr-1/!				������ "t-1"
xml/tag-1/tag-2/!				������ "cccccc"
xml/tag-1/tag-2/a/#attr-a/! 	������ "aa-1
```
- `/!` implies we want content, not a branch, and short enough not to be annoying
- lexer will have to be adjusted to not append slash to the issue
- issues ensure we know attributes from elements and can reconstruct the tree back
- since attributes are not trees themselves, there will me at most one issue in the path
- output does not contain mandatory empty strings `! ""` for each value (for readability)
- absence of maps make tree lightweight

[15:54:57](#_SZj18sB1F0L1wOgW24kzDsg78Qv440kZjVaYGuDd2g) <hiiamboris (NOT THIS ONE)>:
* My preference is:
```
input: {
	<tag-1 attr-1="t-1">
		<tag-2>
			<a attr-a="aa-1">aaaa</a>
			<b>bbbb</b>
			cccccc
		</tag-2>
	</tag-1>
}

xml: [
	tag-1 [
		#attr-1 [! "t-1"]
		tag-2 [
			! "cccccc"
			a [
				! "aaaa"
				#attr-a [! "aa-1"]
			]
			b [! "bbbb"]
		]
	]
]

xml/tag-1/#attr-1/!				;) "t-1"
xml/tag-1/tag-2/!				;) "cccccc"
xml/tag-1/tag-2/a/#attr-a/! 	;) "aa-1
```
- `/!` implies we want content, not a branch, and short enough not to be annoying
- lexer will have to be adjusted to not append slash to the issue
- issues ensure we know attributes from elements and can reconstruct the tree back
- since attributes are not trees themselves, there will me at most one issue in the path
- output does not contain mandatory empty strings `! ""` for each value (for readability)
- absence of maps make tree lightweight
- no magic numeric indexes in the tree, nor there any need to interleave branch names with some selector name

[16:06:06](#GB2NekDsmWniMdWPu9WX-XZOgBJmLW634kSvpMsRgSI) <hiiamboris (NOT THIS ONE)>:
Or alternatively:
```
xml: [
	tag-1 [
		#attr-1 "t-1"
		tag-2 [
			! "cccccc"
			a [
				! "aaaa"
				#attr-a "aa-1"
			]
			b [! "bbbb"]
		]
	]
]
```
`/!` here is for branches only, attrs do not require it

[16:06:57](#1FIxP8qSecxYdiqY0JDeXpqzt1cbzmF_qbrnXD7DoJo) <hiiamboris (NOT THIS ONE)>:
* Or alternatively:
```
xml: [
	tag-1 [
		#attr-1 "t-1"
		tag-2 [
			! "cccccc"
			a [
				! "aaaa"
				#attr-a "aa-1"
			]
			b [! "bbbb"]
		]
	]
]
```
`/!` here is for branches only, attrs do not require it
```
xml/tag-1/#attr-1				;) "t-1"
xml/tag-1/tag-2/!				;) "cccccc"
xml/tag-1/tag-2/a/#attr-a 		;) "aa-1
```

[16:42:22](#Otz1p8kAap6vSiKcVPNDmFoxy99lr4-N-dqb51NJZK0) <rebolek (Boleslav Březovský)>:
@hiiamboris it’s an interesting approach. I will test it.

[19:10:04](#6nKaU9wvT30kvrE32cRBhGH1rTuFMg0nV76c8mDhObk) <zentrog>:
Yeah, that `!` is interesting. Do you think multiple text fields should be combined into one, or appear multiple times in the output? And if each one appears separately, would they use the same or a different marker?

[19:13:11](#rDIITJfxEGmFV18NgumMyS8htJzv1A4clx6JHm5gj78) <zentrog>:
I am very in favor of your attribute approach over including a data structure for attributes. Would `ref!` also be feasible for that, or is `issue!` superior for this? I guess `issue1` seems like it might be closer to the constraints of xml attributes...

[19:31:24](#Go6bvP2JmWUg1BBL9ayEcPe-1SOmpOdzbf1JUsZxy-A) <hiiamboris (NOT THIS ONE)>:
> Do you think multiple text fields should be combined into one, or appear multiple times in the output? 

My gut says if there's another item of the same name, turn it into a block of blocks. `item [[first...] [second...]]`



[19:32:19](#MeMZcMTd-cndn-8uFsvboWaAYZtp51h7EmNNDK6dzM4) <hiiamboris (NOT THIS ONE)>:
`ref!` isn't that good, because it's a string, while `issue!` is a word

[19:44:44](#y7UbGghNycpcW79CQ2ee55NX3G4XhkOuuyksLGpqmek) <giesse (Gabriele Santilli)>:
@hiiamboris what you describe would be useless for HTML
I'm not convinced is useful for most XML either, but since I avoid XML like the plague I have no experience with it so I could be wrong.

[19:44:54](#4hjotc-6pQk2HC__sQALPY91SWo-Fh364oQEdzhlcfA) <giesse (Gabriele Santilli)>:
* @hiiamboris what you describe would be useless for HTML
I'm not convinced it is useful for most XML either, but since I avoid XML like the plague I have no experience with it so I could be wrong.

[19:47:44](#R3GfMmD808xpfju6NwMCJXoztVtzY6MA5na9Jm3XK44) <hiiamboris (NOT THIS ONE)>:
Why would it be useless for HTML?

[19:51:02](#38xbGgplVS21Z_NOvdsBQtwiBBpGcwycHD81FxakIlA) <hiiamboris (NOT THIS ONE)>:
I'd love to hear what's *possibly* wrong with it on XML side too ������

[19:52:27](#gjef_u-hRKA9Y4XtXfsH3MMqon7C8myRd10-7rNrp2E) <hiiamboris (NOT THIS ONE)>:
I guess you mean that HTML is ordered. OK.

[19:53:37](#zZ2iagB9ORO_IdbE3chkYdHoX1-c2jwU01j3gcE5wsE) <hiiamboris (NOT THIS ONE)>:
In that case we'll need to think about graceful adaptation. Like insert `! content` between other child elements any number of times.

## 22-Nov-2021

[17:13:53](#Djo2oG_6Apw3NlNbgrFsTyWuiRf3_H_X9tg7npqeKvg) <rebolek (Boleslav Březovský)>:
How to store attributes is one problem, but XML is great at bringing much more problems.

[17:14:47](#ejr_xv9pzuHgCX_YU9wY3ZK6xqdRNFp5x7yWyEuYpWs) <hiiamboris (NOT THIS ONE)>:
Indeed. It's the worst data format probably ������

[17:14:56](#fyrYMm87b__ASKhXAiIIw0zzuEI3Vu-vZK39LQH_HpA) <rebolek (Boleslav Březovský)>:
For example, how to store processing information (tags enclosed in `<? ... ?>`) and stuff like `CDATA` (`<! ...!>`)-

[17:15:00](#qVd1MQ1RWNVCg49Pw4Fz04xvLrvqyLVCTwi4_cR7ERM) <rebolek (Boleslav Březovský)>:
* For example, how to store processing information (tags enclosed in `<? ... ?>`) and stuff like `CDATA` (`<! ...!>`).

[17:15:18](#g4wOlGRCm5Gp0eIj-Lpdfl-AhMWSLyDeTonlky2r_Sc) <rebolek (Boleslav Březovský)>:
No doubt about that.

[17:15:34](#0Ak9QKYwuEOGynPS2teceEjbnSM2LC6kP-r3MAit6kM) <hiiamboris (NOT THIS ONE)>:
What is `<? ?>` `<! !>` used for?

[17:15:40](#6anY9uu0J876d-w2qScuK6tBZdrN7nEAlhB4a13w39c) <rebolek (Boleslav Březovský)>:
What is `<? ?>` `<! !>` used for?

[17:16:17](#beHbKrgab2YijJSB0GJ5MDTY5wjc3NPRKvOYWGu9-Rw) <rebolek (Boleslav Březovský)>:
`<? ?>` are so called processing information, they are used for ... hm ... processing.

[17:16:33](#G5UaNl9kFE66IH6-y8lS28qRyHYzSpDGQjLcpQn6FPU) <rebolek (Boleslav Březovský)>:
`<! !>` are basically some metadata.

[17:17:08](#nfnAQqs0BlsYI-xNLhMVjWKDG9W0NNr-_lZ3X0EGDEw) <hiiamboris (NOT THIS ONE)>:
> `<? ?>` are so called processing information, they are used for ... hm ... processing.

Just a bit vague ������

[17:19:23](#eCjlxmesZWg3wyPmpuAIZHZCUwsLO0UaZ5Tdm-VlVe8) <rebolek (Boleslav Březovský)>:
If you think it’s vague, here’s the definition:

> Definition: Processing instructions (PIs) allow documents to contain instructions for applications.

[17:19:49](#yDn6jax_7Sn0rRKGWwKznSynqxjrZzlPGRL-YZ9MYX0) <hiiamboris (NOT THIS ONE)>:
lo

[17:19:51](#sm0Lo_2JqQt8HyMLYdF4zWsP_2ZNdkO9ehZ7y2eS3A8) <hiiamboris (NOT THIS ONE)>:
* lol

[17:19:58](#Ximro7sJbtOnKb_vCf5OdYbcxo8sxdlbPHZySKcxGrI) <rebolek (Boleslav Březovský)>:
so it’s not information but instruction, sorry

[17:20:07](#GQRWexPwa4kLQeby048tfHuo6-FV9ygmCVSeq0aS4AE) <hiiamboris (NOT THIS ONE)>:
okay, let's see what SO says

[17:20:28](#hMPRJSCIZ887gkjrzEch8gydPAGigFFmrG8ybK10awQ) <hiiamboris (NOT THIS ONE)>:
https://stackoverflow.com/questions/39115398/what-does-mean-in-xml
https://stackoverflow.com/questions/60801060/what-does-mean-in-xml

[17:20:51](#YK0gQ34ERvjRrw_di5iZjWwOcVelZAtsjXYlLoWrs_k) <rebolek (Boleslav Březovský)>:
Also,

> PIs are not part of the document's character data, but MUST be passed through to the application.

So there we need to preserve it.

[17:22:33](#uyTaYwG0N26RJ8pW-Z5MX6G1-DDuYv7-oYMKYIG9RH8) <rebolek (Boleslav Březovský)>:
* Also,

> PIs are not part of the document's character data, but MUST be passed through to the application.

So  we need to preserve it.

[17:23:07](#-pMDCCi4ib8O7mn81pxCzUFjXFuNiq5YjEwzLQs1mEI) <hiiamboris (NOT THIS ONE)>:
from what I read on SO we can safely ignore that all

[17:23:19](#1z6r0oBG0oaucLJXdkP7dsnphYIceUgeS1PNWb3O5mY) <hiiamboris (NOT THIS ONE)>:
`<!` is basically DTD embedded

[17:23:29](#Pkqlcbd3RKe5NgYRk-FW8-gNfHdvZ1KSQ3PJdrx3S2s) <hiiamboris (NOT THIS ONE)>:
`<?` is instructions for specific programs

[17:34:08](#JXPSMDFKh-JpjwvlIfluBitoDK15144m-R9M2y_cwGM) <rebolek (Boleslav Březovský)>:
I don’t agree we can ignore it, if we want to support XSLT transformations, we require that info.

[17:59:13](#5Pa0xGHWyM3Qrw0rUeO8m5sXR4XrGAW3_uZlR8KNyZk) <zentrog>:
Xml namespaces complicate things quite a bit too. It probably doesn't need to track which namespaces elements/attributes belong to, but the syntax is awkward. It implies `:` appearing in element/attribute names.

[18:06:30](#XDjbc7jaAwvmjsVnU0ruRLGKhPBenk2V7Y2OuPeObz4) <zentrog>:
I suppose it could be translated into something else which is legal in red words, but not allowed in xml names

[18:08:44](#Loo7C1aYQ1RebWoi8eNWOVOEWSjiMDNrEkwQpoH9EHY) <zentrog>:
 * [Xml namespaces](https://en.wikipedia.org/wiki/QName) complicate things quite a bit too. It probably doesn't need to track which namespaces elements/attributes belong to, but the syntax is awkward. It implies `:` appearing in element/attribute names.

[18:21:07](#tAcQN3uDh5FlCbqxLRNEmEyIq3Xlb-k8IDv3xn2Dyiw) <rebolek (Boleslav Březovský)>:
@zentrog:matrix.org we can probably translate that to paths, or just leave it alone as strings if it's going to be a problem

[19:33:38](#rzlEYoqk9Q0JcDqkY8ccOcOmZQQ4iJ__m9Kdabcc7_Y) <greggirwin (Gregg Irwin)>:
1) We do want to plan for any features that *might* need to be supported, so we don't paint ourselves into a corner. That said, if we do a basic system now, without all the extra bits, and then someone needs them, there's no reason we *can't* have two separate codecs.

2) In that same vein, if we need to break out HTML and XML codecs separately, I have no issue with that. They really are different beasts, and we aren't going to have a generic SGML model. At least I don't see the value in doing that. 

3) Ask how things would be used in Red, once the markup is loaded. Are we going to build systems that *evaluate* Processing Instructions? I doubt it. If we include them at all, they are chunks of data. Same for DTD, doc info, whitespace, and namespaces. All this means that the loaded data can be much messier than a plain tree, which is a shame.

Here's my take: 80%+ of the value on our side, from XML, will be from plain structured data. This does unfortunately include attributes, which we have to handle for HTML as well. They are even more important there I think. If we can load that, people can extract the most valuable part of their data for processing. If they can, optionally, also get the rest of the content that's a plus. With that they can analyze their XML to see where DTDs, PIs, etc. are used and *they* can decide how to use it. It lets people build general XML analysis and other tools as well.

If we want to think about stylesheet transformations, that's a much bigger and broader topic, but that would be built on top of a basic codec and can come later, when someone actually needs it. It ties to general processing and HOFs to support that as well.

Right now, even if we know what PIs look like, do we know what they can contain and how they're "processed"? Without that, we have no hope of making use of them. If they get passed on to the app, to us they're just data. When someone comes to us and says they need that feature, they can pay us to build it and then we also know it will solve at least one person's problem correctly. :^)

For me, the best thing we can do for humanity is to get data *out of* XML format, and simplify things. Make their lives easier overall. JSON won in that regard. But we also know that being just a basic data structure has caused others to extend it in non-standard ways. XML is at least a standard.

XML and JSON come at the problem as polar opposites. Red comes at the problem sideways. It makes sense to map the tree model directly, as we're thinking about so far. It saves us a *lot* of design brainstorming and potential dead ends and wasted effort. But that doesn't mean we can't do something entirely different in the future. HTML is for documents, XML is quite often used for structured data. Two very different purposes. I don't expect us to save the world of markup with v1 of our codec. Right now it's about the simplest useful aspects that we can extend later.



## 23-Nov-2021

[9:50:05](#n-p3LEaBMcYqGfpoQnxDC9n2h6H2pF6Fvze4ty3GAk4) <rebolek (Boleslav Březovský)>:
Ok, so I decided to include this stuff on demand. There is a new `/meta` refinement that will include processing instructions and other metadata into the result. These metada have same structure as normal XML data (I use `tag-name content attributes` format, but that's easy to change if we decide to go with another one), there's one difference, meta names use `issue!` instead of `word!` as normal tags.

I need to parse that stuff anyway and including it into output is almost free, so there's no reason to postpone it.



[9:58:50](#tS_9zTVRUdec98XCkZ0ue8LYJwAN5s-ZPjtOebCaAUs) <rebolek (Boleslav Březovský)>:
@greggirwin 

>  if we need to break out HTML and XML

I believe we need to. I wrote XML parser that I used to parse HTML but then I needed to add support for HTML specific features. And then support for common mistakes (HTML parsers in webbrowser are very forgiving <---> lot of HTML pages are totally broken if you would use unforgiving parser). So as I see it, XML parser can be very strict and standard compliant, HTML parser must support a lot of common errors (and there's also a lot of differences between the two formats, HTML is not a subset of XML).

>  Ask how things would be used in Red, once the markup is loaded. Are we going to build systems that evaluate Processing Instructions? I doubt it. 

I don't. XSLT is used for transformations and it's not that hard to support it (it's XML anyway).

>  All this means that the loaded data can be much messier than a plain tree, which is a shame.

I'm still trying to keep a simple tree and thanks to rich datatype system that Red has, it's possible. 

> If we want to think about stylesheet transformations, that's a much bigger and broader topic, but that would be built on top of a basic codec and can come later, when someone actually needs it. 

While I agree it's not a part of a basic codec, I think it can come soon as it's not going to be such a big problem.

[16:00:06](#Ved5wOUwKYOS46NyCbrkEK-YtJDZXZzrWjD48ib_0tg) <hiiamboris (NOT THIS ONE)>:
I'm working with `xml.red` right now (the older version) and it's completely impossible to work with (just saying)

[16:00:37](#Aa-NyjjC4ktjJxuavTto1dIAkvQvprNVUos3ZsdbcsI) <hiiamboris (NOT THIS ONE)>:
Such a headache to convert into anything useful...

[16:02:41](#s_qbAwdDTjPOmnDEcKtwDq5H7oqWBiIrPjI18Y2RGJE) <hiiamboris (NOT THIS ONE)>:
And having `"^/^-^-"` represented as *content* is very harmful too ������

[16:03:28](#CCznFfjeydSqLL6CNOfzOnIAcKNtfTcjW-P5sGKYfjY) <hiiamboris (NOT THIS ONE)>:
* And having `"^/^-^-^-^-"` represented as *content* is very harmful too ;)

[16:52:16](#5Ycz0byxqXwDkS9jJ59avsxTYYJqmeTgPLzNWum18h8) <rebolek (Boleslav Březovský)>:
@hiiamboris I was writing a sequel to my post but haven’t finished it due to other reasons. So here’s the crux of it: The original `xml.red` was made to parse both `xml` and `html`. It wasn’t a good idea, so I made separate `html-codec.red` that is now in `castr` and started working on `xml2.red` that I’m improving currently.

> having "^/^-^-^-^-" represented as content is very harmful too 
Unless you care about HTML as explained above. The new XML codec ignores such stuff.

[16:52:26](#wRY9budlzuW2M5Zf13oGZovttdZH3DEbJz_PqS8D3pg) <rebolek (Boleslav Březovský)>:
* @hiiamboris I was writing a sequel to my post but haven’t finished it due to other reasons. So here’s the crux of it: The original `xml.red` was made to parse both `xml` and `html`. It wasn’t a good idea, so I made separate `html-codec.red` that is now in `castr` and started working on `xml2.red` that I’m improving currently.

> having "^/^-^-^-^-" represented as content is very harmful too 

Unless you care about HTML as explained above. The new XML codec ignores such stuff.

[17:11:09](#n2Ie-wGtSGbk3sZ1b4aSbF7yA4SoBQWmXFpmo2TVjNA) <hiiamboris (NOT THIS ONE)>:
makes sense

[17:11:22](#K2tZYppQLoyP9aUFktqGVLie9wrGFMFpj6wJmO5zPsA) <hiiamboris (NOT THIS ONE)>:
keep me updated on your progress on xml2.red ������

[17:11:32](#_9oKTUbtSmPtZkvKrgHPCi8T57CwJA4JHo660zkTTmQ) <hiiamboris (NOT THIS ONE)>:
I will need it for locale data extraction

[17:11:56](#QstUDpmGAiBxWhWVkO2LUCoM9x4OZsP52ZIlVi17wr0) <hiiamboris (NOT THIS ONE)>:
good testing data too

[17:12:15](#_SeizQtFsBsDERAQ8CQV7MLAnjPwVAYuf1XoegAThpk) <hiiamboris (NOT THIS ONE)>:
right now it just returns `true` :)

[17:12:23](#P4lGDu05-zTDnlG2eMnqnbIk9Pzz9KiZUFfSB2li9xU) <hiiamboris (NOT THIS ONE)>:
* right now xml2 just returns `true` :)

[19:50:55](#aacja7xRmw751KoBXNUfOgCZcK_m05_OjfchFcsTP_s) <greggirwin (Gregg Irwin)>:
Thanks for the feedback @rebolek. :+1:

[20:12:48](#AHOeySo7ykcZUqhhqhaADkpZm7mr__j9ANz1FIASF2E) <greggirwin (Gregg Irwin)>:
>  XSLT is used for transformations and it's not that hard to support it (it's XML anyway).

This is where examples and research will help me. I don't know the main ways XSLT is used, or how widely. We do want, as I've said, transformation and selection interfaces to our own data structures, but is it worth our time to transform XSLT itself into ours? This is also where we have to look at Red's applications and other limitations. e.g., some big corp in-house dev may love the XML/XSLT support, but is the rest of Red up to their Enterprise needs?

Leveraging datatypes is something I'm 100% behind, like @hiiamboris showed in his idea recently. :+1: 

[20:14:56](#Kirhm1l3ObLNdhyQS4KXU9dmyKHCS4tp7VRUskKLRnI) <rebolek (Boleslav Březovský)>:
> right now xml2 just returns `true` :)

[20:15:00](#im-1n5y7NAOpfe4h0O5R11x9rE14XInzofJFCqBE3vk) <rebolek (Boleslav Březovský)>:
`true`

[21:20:42](#YgeHQCFTFlNB4uCb0Ac4Ihu5FmfnH88lehKSrNqxCvY) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
I have thought that XML, since the invention of simplified things like JSON, is used mostly by diehard nerds and lunatics :-)

[21:43:45](#apVaXcsikpfUxWVJNTSCGGSPSnux3o2c0At1kSQl_Ws) <hiiamboris (NOT THIS ONE)>:
lunatics aren't hard to come by though ������

## 24-Nov-2021

[6:09:55](#HbXQn2_alwFj1iaLHF1skIorcPEeWp-bvUTVbYyE13k) <zentrog>:
I've done a fair amount of work with XML and XSLT, and I mostly hate XML, but actually kind of like XSLT. I'm not sure which category that puts me into ������

[6:26:24](#gAR1AL3nvh_vkXEWMWvNTpbhYgXar0qUjMDzP0xC1TQ) <zentrog>:
To me the most important things are to be able to convert markup into a Red format, and also reliably generate markup from Red data. I don't think some implementation of XSLT makes a lot of sense to me because I could just call into one of the many existing xslt tools if I already have a style sheet for it, or feed the Red formatted data into parse

[6:34:52](#M6OVEv0LwZme5NCvzRHc6ErtIlhuIqHtDCrCHncUqmc) <zentrog>:
I do think that having some xpath-like mechanism to filter/select into a tree of data would be really useful in general, but I don't think it's specific to markup formats

[7:04:10](#sLkmw90FMDOIFT1cwSvpnVCB5pBBb83ySTK0zEsJDVY) <greggirwin (Gregg Irwin)>:
Good feedback. Thanks @zentrog:matrix.org. 

[7:24:03](#kFRHmZREhNVAWl-RgraTLgm7OYESARVxOvbnQxn0HPM) <hiiamboris (NOT THIS ONE)>:
@zentrog:matrix.org as someone with xpath experience, can you say if [sift](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/sift-locate.md) will be of help given a tree iterator? or if something we could add to it for these use cases?

[7:24:13](#HGbgfhD7hhcy6OX2dtY5obRUBy4pGEvFFTD4p_KG_Sw) <hiiamboris (NOT THIS ONE)>:
* @zentrog:matrix.org as someone with xpath experience, can you say if [`sift`](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/sift-locate.md) will be of help given a tree iterator? or if something we could add to it for these use cases?

[7:38:22](#FN9QgbtdIkA4YH9xTDvzL80mqLP2D5Ejq5XN5uKswKM) <rebolek (Boleslav Březovský)>:
@hiiamboris `xml2.red` now returns tree instead of `logic!`

[8:11:38](#9UXfVhXeEzFAPQAiD0QRutLvLLKVgYgxbx-OKXmE-MU) <hiiamboris (NOT THIS ONE)>:
:+1: will test!

[8:13:22](#BmykWAXerfqs0ABVGpTu1pEORe46wsSrBEJn8EOloBw) <rebolek (Boleslav Březovský)>:
It's a WIP and I'm working on it right now, so problems are expected.

[9:15:28](#eJNaohXhjEuLNdRlq2HjcwvUewqziW7kjxmpMBs9xhI) <zentrog>:
hiiamboris (hiiamboris): it looks interesting! I'll try to explore it some more and get back to you

[9:16:31](#YSj4J6i2EYpGodgw2Nd0iOY0eOosDZUrYediacADVV0) <hiiamboris (NOT THIS ONE)>:
thanks!

[9:25:21](#gYz9gNK6ztujfd1Q0lpd5Z_lidP-GdMI6-kyemqlfTU) <hiiamboris (NOT THIS ONE)>:
@rebolek yeah found a bug :)
```
probe load-xml {<?xml version="1.0" encoding="UTF-8" ?>
	<symbols numberSystem="arab">
		<decimal>٫</decimal>
		<group>٬</group>
		<list>؛</list>
		<percentSign>٪؜</percentSign>
		<plusSign>؜+</plusSign>
		<minusSign>؜-</minusSign>
		<approximatelySign>~</approximatelySign>
		<exponential>اس</exponential>
		<superscriptingExponent>×</superscriptingExponent>
		<perMille>؉</perMille>
		<infinity>∞</infinity>
		<nan>NaN</nan>
		<timeSeparator>:</timeSeparator>
	</symbols>
}
[symbols [decimal [] #() group [] #() list [] #() percentSign [] #() plusSign [] #() minusSign [] #() approximatelySign [] #() exponential [] #() superscriptingExponent [] #() perMille [] #()
infinity [] #() nan [] #() timeSeparator [] #()] #(
    numberSystem: "arab"
)]
```

[10:34:20](#Eg_UObXxFItgwViycN_GSN9z2SWYTRHebFL1aim-VsM) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
☝ [November 23, 2021 10:20 PM](https://gitter.im/red/codecs?at=619d5b28c2cc0e5343c6f9eb) sadly, Android sources are full of XML and it's not going to be replaced. Not to mention, that every web page is also XML based and that is also not going to be changed.

[11:03:24](#xxuwgVHHAHjeuhCUYnbKFn-CwnXziW8jQSDAZQn3064) <rebolek (Boleslav Březovský)>:
> every web page is also XML based 

that's not true, XHTML which was XML based lost and we have HTML5 which is not XML based. Both XML and HTML are based SGML so they're certsainly similar.

[11:03:31](#GgQXfBJU_NM1cg0wgUHMkCAzymJZoXHjWfQwIEpACTU) <rebolek (Boleslav Březovský)>:
* > every web page is also XML based 

that's not true, XHTML which was XML based lost and we have HTML5 which is not XML based. Both XML and HTML are based SGML so they're certainly similar.

[11:04:02](#hAoNNBbtQCiS2DLNZkdONXn0Okp2vp4_zTVG0mt-MT8) <rebolek (Boleslav Březovský)>:
That's not a bug but a missing feature :) It's a very early version.

[11:24:50](#Y027c-xHXGY1aZFHcwdFUp66cVPXeGNYPSz7Me1sH-Q) <hiiamboris (NOT THIS ONE)>:
okay ������

[15:10:45](#dDaE7qKkCfXgag3mfZHG-vhjG6marEt7WHa4Lhirja8) <rebolek (Boleslav Březovský)>:
@hiiamboris your test now should work as expected

[15:21:11](#DYBOKOrj7U-lpt7FeqkxxLu86c3zg4IVxSVNW12k324) <hiiamboris (NOT THIS ONE)>:
:+1:

[16:02:33](#BDawpMvedF7S7yNRhZYn1HEI8rXhZFykm8FyFZ-3ny0) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
@rebolek right, HTML5 may be valid but also invalid XML... but  it is just a detail... like that it does not require closing tags and can have attributes without quotes. Anyway... XML use is still very heavy and it's not going to be changed.

[17:38:35](#8vJhhEMQaq4-1kl85q5xQWN6Bo2F4_pA7vxLUSgoHeU) <rebolek (Boleslav Březovský)>:
No doubt about that. We may not like it but we need to support it. But I don't agree that the differences between HTML and XML are just a detail. I think that the differences are big enough that it makes sense to have two separate parsers. HTML one needs to deal with a lot of stuff that XML can safely ignore.

[18:53:51](#r8OH37jXJXPEjLYoS2EBIDRhodxHk7HeUsgozFiu-ow) <zentrog>:
The question is once you support all the HTML stuff, is it no longer able to handle XML? Or is XML actually a subset of HTML?

[18:56:51](#HMQlYEzwrOoC2J76W2xn__NSLhl38GPtXsHWqmVleR4) <rebolek (Boleslav Březovský)>:
It's not strictly a subset (XML requires a header/XMLDecl) but roughly yes. If you treat XML as a subset of HTML, invalid XML may pass. It's able to handle XML but it can't determine if it'đ a valid XML, unless you have a specific logic for it and then you're just complicating the code.

[19:22:08](#YADejqxtofim9liCMmYTW8q7vYQydT7hlL25oVLJTJ0) <zentrog>:
How important is XML validation? I’d be mostly concerned with extracting data, and would prefer the ability to read broken XML. Of course any emitted XML must be correct. 

[19:24:54](#_L1NjkRH5VdNCrbLOgodcGsMjkA8rqHWpgdmkceU7vs) <zentrog>:
The other question is whether HTML can be always emitted as valid XML (minus the header I guess) or if there are special cases where it needs something else

## 25-Nov-2021

[6:48:04](#hzZCRliciMVnsZ8UMwepSc6atFd0BOCKKOsa0EuETbQ) <rebolek (Boleslav Březovský)>:
I really don’t want to mix HTML and XML codecs, I did it already and found out it’s not a good idea. The HTML-specific logic has no use for XML and vice-versa.

Reading broken XML makes sense and it would be useful to identify usual XML errors. They may be different than HTML ones or the same, I don’t know.

Regarding the emitter, I believe they can be shared much easier than a parser.

[7:03:21](#O1yazr2O26VWFNvI2KwzC9vCrLGDd2HlCSvg327XZ6w) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
I do agree here. If you know you are dealing with xml, use xml codec then.

[7:21:26](#R9veolZVdUx9BWWmPYQN-0PmpwmanEXra7inJyDdHLw) <rebolek (Boleslav Březovský)>:
I do agree here. If you know you are dealing with xml, use xml codec then.

[8:33:28](#AU83d2Sa7Tpv2ug65XHNpMI_8O_xldmJXYIrDtdNNEY) <rebolek (Boleslav Březovský)>:
Another important difference between HTML and XML is that in XML there can be only whitespace between tags and you can ignore that, but in HTML there can be content which you can’t ignore.

[9:06:10](#GsLkGSStUw0j_MJ15tlS95euJcbjJhl6iAytAXVgL_c) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
@rebolek .... just go ahead! :-)

[9:09:55](#1aJavqlu7mHr-6jx0hZ1TVcUU3E3JiDQn_0exywuD1U) <zentrog>:
rebolek (Boleslav Březovský): That is actually not true. XML elements can contain any number of text and inner elements. In practice, I've only ever seen a single meaningful text section in an XML element, but they can theoretically occur before, after, or interspersed between other elements

[9:16:31](#4wf3lC1vBjyly1nYdjJxMJKb3E0ns3xYHmcOoji-KVc) <rebolek (Boleslav Březovský)>:
@zentrog:matrix.org sorry, you’re right, I was confused a bit here.

[9:19:44](#skeuCd7AqFi3Ua1sxcw6hLPKGsatwAHWMJBUBUhPWik) <zentrog>:
No worries! And I believe you if you say that it makes more sense to keep them separate. I'm just trying to be helpful if I can ������

[20:02:51](#ZiGNTirjnxmo49HrkF7imhK0XNQTnZB5etK1fChUVdE) <greggirwin (Gregg Irwin)>:
Your input is absolutely appreciated @zentrog:matrix.org. Especially the theory vs practice part. While it might be nice to say we match the theoretical spec, if nobody uses features, we have to ask how much effort to put into supporting them. I'm good with pragmatic implementations as standard, and others can build what they need for special cases.

## 26-Nov-2021

[9:04:53](#wP1ouQPnSrMIQWRA4bBV2MZjmQHDWlK3Lzu65mlinys) <hiiamboris (NOT THIS ONE)>:
@rebolek I get some junk output from this:
```
<?xml version="1.0" encoding="UTF-8" ?>
			<cyclicNameSet type="dayParts">
				<cyclicNameContext type="format">
					<cyclicNameWidth type="abbreviated">
						<cyclicName type="1">zi</cyclicName>
						<cyclicName type="2">chou</cyclicName>
						<cyclicName type="3">yin</cyclicName>
						<cyclicName type="4">mao</cyclicName>
						<cyclicName type="5">chen</cyclicName>
						<cyclicName type="6">si</cyclicName>
						<cyclicName type="7">wu</cyclicName>
						<cyclicName type="8">wei</cyclicName>
						<cyclicName type="9">shen</cyclicName>
						<cyclicName type="10">you</cyclicName>
						<cyclicName type="11">xu</cyclicName>
						<cyclicName type="12">hai</cyclicName>
					</cyclicNameWidth>
					<cyclicNameWidth type="narrow">
						<alias source="locale" path="../cyclicNameWidth[@type='abbreviated']"/>
					</cyclicNameWidth>
					<cyclicNameWidth type="wide">
						<alias source="locale" path="../cyclicNameWidth[@type='abbreviated']"/>
					</cyclicNameWidth>
				</cyclicNameContext>
			</cyclicNameSet>
```

[9:14:02](#SIHLv0DWzKmGrmHR-vw0jqYJtW7bY2zHs6ZxOT4luNw) <hiiamboris (NOT THIS ONE)>:
this should be it:
```
	EmptyElemTag: [
		#"<" copy value Name any [S Attribute] S? "/>"
		(value?: cont-val: copy "")
		push-stack pop-stack
	]
```

[10:30:28](#ggTLTCLZAYFCEzxg065ON9aq15PI-P-mC2I9AhA_EK8) <hiiamboris (NOT THIS ONE)>:
works fine now! I fed [CLDR archive](https://github.com/unicode-org/cldr/tree/main/common/main) to it, no issues found so far

[10:31:34](#TYdOqoqF4deJYWdu3FNWGAInVbAYCt31iBb0mzQGGQ8) <hiiamboris (NOT THIS ONE)>:
I'm using Morph to convert it into the usable form:
```
>unxml.exe 1.xml
ldml [
    cyclicNameSet [
        #type "dayParts"
        cyclicNameContext [
            #type "format"
            cyclicNameWidth [
                #type "abbreviated"
                cyclicName [#type "1" ! "zi"]
                cyclicName [#type "2" ! "chou"]
                cyclicName [#type "3" ! "yin"]
                cyclicName [#type "4" ! "mao"]
                cyclicName [#type "5" ! "chen"]
                cyclicName [#type "6" ! "si"]
                cyclicName [#type "7" ! "wu"]
                cyclicName [#type "8" ! "wei"]
                cyclicName [#type "9" ! "shen"]
                cyclicName [#type "10" ! "you"]
                cyclicName [#type "11" ! "xu"]
                cyclicName [#type "12" ! "hai"]
            ]
            cyclicNameWidth [
                #type "narrow"
                alias [#source "locale" #path "../cyclicNameWidth[@type='abbreviated']"]
            ]
            cyclicNameWidth [
                #type "wide"
                alias [#source "locale" #path "../cyclicNameWidth[@type='abbreviated']"]
            ]
        ]
    ]
]
```

[10:38:03](#w4tU65CFSvdAa9HnQZPqBfzriLVB9J2sVhG3OEe6Cjg) <hiiamboris (NOT THIS ONE)>:
found issues on other data though ������

[10:47:09](#NeIlkDJh57huPlCtqlp5bcchMwpQS5fdqI3XadNepVs) <hiiamboris (NOT THIS ONE)>:
@rebolek your assumption on spaces count is wrong in most cases, e.g.
```
	STag: [#"<" copy value Name any [S Attribute] S? #">" push-stack]
```
fails on:
```
            <attributeValues
                elements='dateFormatLength timeFormatLength dateTimeFormatLength decimalFormatLength scientificFormatLength percentFormatLength currencyFormatLength'
                attributes='type' order='given'>full long medium short</attributeValues>
```

[10:49:52](#_vRGWnUa0VL6dPdyxO8vzxBI9M4PonOhElu4EKRyp7U) <hiiamboris (NOT THIS ONE)>:
this should fix it:
```
	S1: charset reduce [space tab cr lf]
	S: [some S1]
	S?: S*: [any S1]
```

[11:23:01](#rEWb8wrCVyrj5Iy6vUlk7nALMzUVuXPH5pveKoJXLPI) <hiiamboris (NOT THIS ONE)>:
consider also input like this:
```
        <numberingSystem id="adlm" type="numeric" digits="&#x1E950;&#x1E951;&#x1E952;&#x1E953;&#x1E954;&#x1E955;&#x1E956;&#x1E957;&#x1E958;&#x1E959;"/>
        <numberingSystem id="ahom" type="numeric" digits="&#x11730;&#x11731;&#x11732;&#x11733;&#x11734;&#x11735;&#x11736;&#x11737;&#x11738;&#x11739;"/>
        <numberingSystem id="arab" type="numeric" digits="٠١٢٣٤٥٦٧٨٩"/>
        <numberingSystem id="arabext" type="numeric" digits="۰۱۲۳۴۵۶۷۸۹"/>
```
I have no idea why they emit some symbols using UTF8, and others using hex-encoding, or if such hex-encoding is standard in XML, but I had to manually turn it into strings. Probably what you were doing with your `to integer! to issue!` stuff.

[19:23:25](#O6wFn1qDH43Sa1plW6joBUmni-L7xy_Txzaw-TFn9lg) <greggirwin (Gregg Irwin)>:
Good work @hiiamboris. I like `unxml`, but maybe RexML (pronounced Wrecks-ML) would offer a small, subliminal commentary. ;^)

[19:43:51](#qG2T_uvTzCWBoAbshJH23jsVgyOirj74YEGfmP-0H-k) <hiiamboris (NOT THIS ONE)>:
:)

## 27-Nov-2021

[11:35:34](#kD6Wm5OBFLw5VI28m7FlSpS23RlSihkt25caVuLxln8) <rebolek (Boleslav Březovský)>:
@hiiamboris thanks, I'll look at it. The current rules are mostly the original EBNF rules translated to Red and are expected to fail. It's `xml2.red` for a reason, until it will be on pair with `xml.red`.

## 29-Nov-2021

[6:46:53](#kc3oWczjiMkiRMFVD2bq6m6pGDCSxfh05WH_JFyihWk) <rebolek (Boleslav Březovský)>:
@hiiamboris the space problem is caused by direct translation from EBNF. Thanks for your fixes, I’ll have a new version soon.

[7:03:12](#yAgLk2igWGByenVr4LkwyO_nR0ssT9KmpxcUkMKTPDE) <rebolek (Boleslav Březovský)>:
@hiiamboris `S?` is `opt` and `S*` is `any` so they shouldn’t be aliases. But maybe using `S*` everywhere where the specs have `S?` would be a good idea.

[7:05:20](#ZWis-ujhTFg67Z6ka0ODECyvRLtPYAqxzLwSFlxKTgA) <rebolek (Boleslav Březovský)>:
You must encode `<`, `>` and `&`. There are no specific rules for other characters so it probably depends on the application.

[7:18:47](#FIIbzEdoQ_p5039L1y_Yv7DzAFh4HpvgE_IpwwMto70) <rebolek (Boleslav Březovský)>:
If we could get Rebol-like parsing mode which would skip whitespace between rules automatically, it would simplify the rules very much.

[7:33:59](#C51xajUeyg_d5vL11bWFz5ZRaF90PG6uXM4Jlkq3o-c) <hiiamboris (NOT THIS ONE)>:
> @hiiamboris `S?` is `opt` and `S*` is `any` so they shouldn’t be aliases. But maybe using `S*` everywhere where the specs have `S?` would be a good idea.

what's the point of `opt any rule`? `any` is already optional


[7:35:09](#iCjTdnHhIKADkjhpdf9jPrpfTF_mCbzMZvIBs1kAEUA) <hiiamboris (NOT THIS ONE)>:
(I get that EBNF is just a mental toy that everyone on the web writes to look cool but no one uses, so it's never correct)

[7:48:01](#LtJz6jgeaiA83dWV0SPEwhD_y-CVjPKNP_Yxsq1v2ec) <rebolek (Boleslav Březovský)>:
Where do you see `opt any rule`? If you look at the current version, it says : `S?: [opt S] S*: [any S]`.
However, it probably makes sense to just ignore the EBNF rules and replace them with something that is working. Like `S*` everywhere and forget about it.

[7:49:14](#1Ru6ChP4DAQCztD0Y4pLIlbkGJF7qrUrXGeI7Q0kki0) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Forget formal specs, if those are not being followed by the outer world. Just make a note to particular rule, where it diverges from EBNF and call it a day ....

[7:51:22](#ALd27I8mNZxOu5w31lvmttFtmOo_zA8gnjLh9Guow9M) <rebolek (Boleslav Březovský)>:
The problem here are whitespaces and as I wrote, having the Rebol-like parsing mode would make the problem go away automagically. The other option is to put `S*` (or whatever name you choose for the whitespace rule) basically everywhere.

[7:54:09](#z9dntCZZ0GFh2Y4Ph5RgEcT7tpQAj2d5Yglr1Ok8ey0) <hiiamboris (NOT THIS ONE)>:
> Where do you see `opt any rule`? If you look at the current version, it says : `S?: [opt S] S*: [any S]`.

`opt S` is deeply wrong because it makes spaces significant. One space - syntax works, 2 spaces - it's broken :)



[7:54:20](#DVwVqzS9MztA6y3FbmUYnf1emFJOCan_HfH81iNc2u8) <hiiamboris (NOT THIS ONE)>:
that's why I replaced it with `any S`

[8:00:37](#KQwI0CQ6No1zXCLa6THCHF9u-1Pu4REPfLjR4II0MPs) <rebolek (Boleslav Březovský)>:
I agree, I'm just saying that what's in the specs. I'll replace everything with `S*` and we'll see.

[8:13:02](#RlYp5I9A3SmPU9nlbZk1Tl5qwzFFUk62-M74C9qsChc) <rebolek (Boleslav Březovský)>:
Done, all `S` and `S?` have been replaced with `S*`. @hiiamboris can you please test it with the problematic data?

[8:30:54](#4MRJulwqlu_uK9xfpi0LcyO-grKz272Ss_bWk73fQP8) <hiiamboris (NOT THIS ONE)>:
You can't just replace `S` with `S*`. It's a required space, so it should be come `some S`

[8:32:54](#hZ_4L07g3GZcNVLhA-n0lzsZSRS6X8LKK09tKGqaRxk) <hiiamboris (NOT THIS ONE)>:
* You can't just replace `S` with `any S`. It's a required space, so it should be come `some S`

[8:35:24](#zMsQjXHch0J1UEOnktM3ljEhRA7p2DEYNMdJuaJCVC0) <rebolek (Boleslav Březovský)>:
Ah, that's what happens when I forget my morning tea.

[8:50:04](#E0vCKCqQDiWFfbLBRrnE59UbhdTggy3r7rAH1--VOpI) <hiiamboris (NOT THIS ONE)>:
(:

[9:00:19](#uFspj24ayzb7GY2ckjT48TMfqsYUdfsnVDi_MIqFxug) <rebolek (Boleslav Březovský)>:
Ok, changed, I hope it's fine this time and now I'm going to make the tea.

[9:06:17](#FRV4YZ2_irkl3X2nr8jNw9vluUozb0hd4IoStjoB1vo) <hiiamboris (NOT THIS ONE)>:
:+1:

[14:46:43](#pnteLDaN9wceaSJXUed89w2ah5UXoCAl_rqSDvcgJSI) <rebolek (Boleslav Březovský)>:
XML encoder added.

[16:55:41](#ly-k3SpyuWDba1_Rw0ZU4b9T9ubP4SrxpPjSufcYfec) <rebolek (Boleslav Březovský)>:
encoder now supports `/pretty` for more readable output.

[17:05:34](#9-xrCa_-hluyvnlSxp5SRV0xAyLCD1uHGcilPib8rTs) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Couldnt it be pretty by default and somehow more packed for other purposes?

[17:07:49](#0vcpCyaiFSCruxrnqnU4VsnKoDuPoYV6t7zmn2CY89c) <rebolek (Boleslav Březovský)>:
It could but the question is if most of XMLs are read by people or machines. If by machines, having pretty as default would be just a waste of space(s).

[17:09:32](#1u-HY0WPrqK8ZZEIBwRu5oQ_kxGV2CmCrSID-9SxngU) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
For over 20 years I can hear about xml being for machines to talk yet all I can see is programners stearing at its output ������

[17:15:45](#QORog7EXSDk4eiwBM_Er32avlDdRCTKfi_Y1T9WstBo) <rebolek (Boleslav Březovský)>:
Well if I open the XML in for example Firefox, it will pretty-print it for me, I guess IDEs can do it too, so I 'm really not sure if it should be the default, but I can take a look how others do it.

[17:25:41](#xpy2pUwfo6SU3I6uIP0ANLrS8KEWgCbgsPPJ2IT3SE0) <zentrog>:
I like the dense output being the default. During development, 'pretty' is useful to have, but for the day-to-day, it isn't needed.

[17:26:12](#h6ALBO0D1KQLGOMXJfhRKnKRcOFsxASHhJDeYhkjJZE) <rebolek (Boleslav Březovský)>:
@zentrog:matrix.org yes, that's my feeling too.

[17:27:06](#t4af7Gm2uCZBIdXws_THKqsnt8hPElyv72wvYWxGE9w) <zentrog>:
 * I like the dense output being the default. During development, 'pretty' is useful to have, but for normal usage, it isn't generally needed.
I guess it depends on the particular use case. Some XML is edited by humans, others are mainly processed by machines.

[17:53:16](#S3HUpJijpIw0CCIvHTya6VwszZCeNnChLS8HdMkfIqk) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
When prototyping, I use console. I want to prettify it by default. Why bother with Red object output, then? Let's flatten it then.

[18:12:15](#eVC0mCvQVqWLspcs75pcYpYE9UIQvGgi32kkRQQu_1A) <rebolek (Boleslav Březovský)>:
Thanks for your input. It's still a work in progress and many details can be changed. Actually even the format of XML representation in Red is not set in stone but a subject to debate.

[18:15:07](#HuTh6p3lW7wmByRaSS8FFV_xuoVUMNfWOIspl-HG-30) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Well, maybe some hofs could allow formatting (e.g. probe, form, etc.), but not sure. It is a no big deal, but I am versed on adding tonnes of refinements. E.g. yours `pretty`is not used anywhere in Red yet, so let's give it a few thoughts, and as I know @greggirwin, he tends to be very carefull in introducing new naming schemas :-)

[19:16:57](#Rs6NCR34WpdGDCfsVaqOfxONQaigwQ7NZMtlvYKTSI0) <rebolek (Boleslav Březovský)>:
I'm thinking about how to handle XML namespaces. The obvious solution would be to translate them to `path!`. This has one downside, in some cases you won't be able to access values using path notation. However, the path notation isn't that useful anyway, let's for example look at this:
```
<menu>
    <item id="1">one</item>
    <item id="2">two</item>
</menu>
```
Using `menu/item` would return only the first item anyway, so some XPath-like dialect is certainly a much better solution to access values.

So IMO translating namespaces to paths is the way to go.

[19:25:16](#rwBGljROM4WKNFRZa2nUUH-VijNTXxgL3t93fPXJWXU) <rebolek (Boleslav Březovský)>:
However, there's still one problem with paths - namespaces can be used in attributes too and attributes are currently converted to `map!` where you obviously cannot use `path!` as a key.

[19:28:47](#HTRymK0B8EitACuFqIQXO5sErnsQvWzy4YBYlsWLhms) <hiiamboris (NOT THIS ONE)>:
`sift data/menu [/item]` is all it takes to extract those items

[19:30:51](#SPMIOXvSQuJUbg5whO-9aH9jX6yFph2vZGDCro3GzUg) <hiiamboris (NOT THIS ONE)>:
okay, with your complex layout:
```
>> rejoin sift data/menu [('item) x - ..]
== "onetwo"
```

[19:35:30](#4iBniBq99yRH0CEyHKatEy2JV1zSxCG_2u_UlGu5D34) <hiiamboris (NOT THIS ONE)>:
I think path inside path is a landmine, and we should just recreate the namespace structure if we want to keep it

[19:35:44](#se_rwfsPrNSOhJNGgxwDnkt_DhErMLqsi_O1JofgmOQ) <hiiamboris (NOT THIS ONE)>:
do you have examples of namespaces ?

[21:14:39](#wK8Bw4Ia1e9LyB01Io9yWpIZzBGfruAAvKQw7YrPrQs) <zentrog>:
hiiamboris (hiiamboris): https://gitlab.com/rebolek/markup/-/blob/main/data/menu.xslt

[21:17:57](#XRVbk_LeTq3wghqAQraUPEkyj36OUOhAHHZXJhTZNms) <hiiamboris (NOT THIS ONE)>:
I don't know xml enough to interpret that ������

[21:20:48](#WD7jL1G3Cw7ISkn69EyxoSmSWmj3WsKlJC5lKDQBVNE) <zentrog>:
I've spent a bit of time looking/thinking about the locate/sift functions. I like the idea of having a common pattern dialect. I don't think I have the full picture of what you can do with those, but the thing that stood out to me was that `sift` seems to be used to filter a flat data structure, while xpath is sort of like filesystem globbing + predicate filtering, so it's tuned for a tree structure.

[21:21:50](#Gy-fYcqvCmncpoPceBkjUeDztNMpv1-2Tkkt4i2-c8o) <hiiamboris (NOT THIS ONE)>:
Yes. But a tree + an iterator (that defines visiting order) = linear sequence.

[21:22:49](#XuECpdqXGdW85ol8HnW-htPYXfpHODQnCM9Otx97Pog) <hiiamboris (NOT THIS ONE)>:
Again, I've zero idea about XPath and it's uses :)

[21:23:23](#uwAGdFgbzNPY7NZlVK2bRUPnzjkqruE5a8eebopBo88) <hiiamboris (NOT THIS ONE)>:
So... can't know what's best approach in Red for that

[21:23:37](#UIwYIYndsw4ia0WiPxlJEB6LTc15WzlodgCaH68iWzU) <zentrog>:
I'm not sure if `sift` is good at walking trees like that, or if it would make sense to have a sibling method that would handle like a path with patterns at different layers. I still want to spend some more time looking at them, but haven't been able to yet

[21:24:17](#PEnqj7lVl288bXu7OqmPiBOgI6Yaso0AjtcfSUHaL9E) <zentrog>:
I'll try to find some good non-trivial examples of things you can do with it

[21:25:39](#IiljWDTcxpxwk0-FZ_tfcn4ldHWuRMfd-hIL8PYyYxQ) <hiiamboris (NOT THIS ONE)>:
:+1:

[21:26:11](#MWi0OIU_go3SUm652HiftXekoMM1trMOTuPttXzlrbA) <zentrog>:
namespaces are imo the worst feature of XML. There is never a situation where you couldn't work around not having them, and they introduce a lot of complexity to work with (though they are not all that complex really)

[21:27:02](#IOOD_4Zk5A24bWnvBonXnSmqIth_q5xx31DjsFRPDB4) <zentrog>:
from the xslt example, `xmlns:xsl="http://www.w3.org/1999/XSL/Transform"` this defines a 'prefix' `xsl` which corresponds to the http... namespace

[21:27:57](#DRExhZeHPxsiYb2SUjNyTxOxqGZsH772QVRALycR2kU) <zentrog>:
So for all the children within that element, if you use that prefix `xsl:output` it is saying that the `output` element is in the xsl transform namespace specified above

[21:29:07](#TjCSteo6j-48D5EpK56HGshFWLqS96nm86pb4oOIiY0) <zentrog>:
It's just used to differentiate different elements that have the same name, but are from different systems, like if you were going to randomly mix xml from separate systems I guess. A real use case where you would actually need this eludes me

[21:30:18](#DI6Q-PtXo9g8hLBQHbjIV153pUiN5kgtTfbcxCG8ENA) <zentrog>:
The annoying thing if you care about what which namespace goes to which element, the prefix can be whatever the XML document author decides, so some editors will just call them `p1`, `p1`, etc

[21:32:20](#Y3kx7INbn0QlHovl6DEWgCPOVvkBezkcTYaiBa_NT0k) <zentrog>:
Most of the time, if you know what you are working with, you can assume all the documents use the same prefix, but there could be scenarios where that is not the case. I guess just having it loadable somehow would be fine for a great deal of cases

[21:49:34](#GQm6fkd0tbBJa5y3rNVv0bzfJSwXO-ngEepLB1fYhOs) <zentrog>:
It's kind of interesting that `foo:bar` is a valid `url!` type, but maybe not the best thing to work with in paths

[21:53:30](#Z_dcWiyHFVuQLUgNQMf18JgoXYKXcABd2bje5VBD5n4) <greggirwin (Gregg Irwin)>:
The dual nature for HOFs targeting series and trees is a point of leverage, but may not be something we can unify completely. Just as blocks/maps/objects don't quite line up in all use cases. We'll do the best we can.

[21:54:18](#16ph53pj3iDgvbuCF1BkUEIyfd1j2La6nudXw-gNKBE) <greggirwin (Gregg Irwin)>:
> There is never a situation where you couldn't work around not having them

This is *key*. If people *can* work around not having them, or adding pieces to support them at another level, we should be OK.

[22:34:58](#qVXqupZ1pmVvUfwBVs1zBemQjYJIYnNrkUsNGt4d_Eo) <zentrog>:
Maybe the ns prefix could be treated as a special attribute, so it could be checked if needed. It’s a little more awkward that attributes can have namespace prefixes as well

## 30-Nov-2021

[7:05:32](#k13STxU-WzK4p4dwRZ1BJMWsg6qE87sE83iklXsR9a0) <rebolek (Boleslav Březovský)>:
Do you mean just leave key names as `string!`?

Here are examples,
normal key: `key`
namespaced key: `ns:key`

[7:44:24](#bXiK7eJ8ECenWbCM6DJ4ix-AQXm-4yCkyEiDIQQ0q7Q) <zentrog>:
It could be stored inside the element as some sort of attribute, as a take off of hiiamboris (hiiamboris) 's example
```
>> test: [element1: [@ "ns-prefix" ! "text" element2: ["text2"]]]
>> test/element1/@
== "ns-prefix"
```
then you'd have the base element name by default, but could check the prefix name if needed

[7:50:56](#l35ImP37uAtlb72MhY0WI58HnJQ4NJhBeqdkVS9p1TY) <zentrog>:
I think that most of the time the prefix can just be ignored, and gets in the way more than anything, but if you do need it, you really need it. The thing I was saying about "never a situation where you couldn't work around not having them", what I really meant was from a schema designer's perspective. For instance, restructuring things to avoid collisions. But if you are producing XML for someone else's schema, the xml you generate will need to have the proper namespaces defined

[7:58:13](#0reWyWcR5hYt9AVaI6hyYP_fSGGclo5QbWkVWA3D8ys) <rebolek (Boleslav Březovský)>:
It’s not a bad idea, however, with all these `@` and `!` it starts to look like an alphabet soup, Perl or Regex. If we’re going to use this format I wonder if using more verbose words, like `namespace` and `content`. They would take the same amount of memory but would directly imply what they represent.

@hiiamboris wrote:

> /! implies we want content, not a branch, and short enough not to be annoying

But looking at this after a few days, I find it annoying, because I have no idea what `!` is. And with the introduction of another sigil, I’m getting lost completely.

[8:05:59](#ICFwKiMNEJugeEWBXvvR4k-nmTJLoT8ti8AKi9wMH4w) <zentrog>:
Yeah, I just meant it as an example. The tricky part of more descriptive names is that they can't be potentially valid element names

[8:07:37](#-gB2YY4yIj3Cl-BNZmfO7G-2AKaxs8s6zS5ai56fVys) <rebolek (Boleslav Březovský)>:
Of course, the structure then would need to be different.

[8:08:07](#hnxY9kX21pR2IdkkGxztx4AYy3P0LvrztC_5bfUDNoQ) <zentrog>:
I guess a related question is how much path lookup should be optimized for. In the simplest cases, it would be so nice to make it really easy to look up specific values

[8:09:13](#pKskW99dJDH8hnaLbLG5zkoNdr6-3S0aym1LFKitEbw) <rebolek (Boleslav Březovský)>:
The path access makes sense only when each key in the tree (axis) is unique. If you have two keys with same name (as `item` in my `menu` example above), path access is useless.

[8:16:12](#mJNhid5AtpzdizgUxcJG3ilOXbJ2LR-JPZIKJyTUomg) <hiiamboris (NOT THIS ONE)>:
@rebolek `content` will collide with XML elements, while `!` is an invalid XML element.

[8:17:04](#x5ug-wrmKEhzTiIbCXLPvbCI7WVHmlm9bo1nEin5rs4) <hiiamboris (NOT THIS ONE)>:
nvm, already mentioned :)

[8:18:13](#SmiH-RMN9k8Sxh1rjuRRW9u8Wofry1j9ojs3U14K-j8) <hiiamboris (NOT THIS ONE)>:
if I have 2+ items with the same name, I just *filter by given path* then join.

[8:31:26](#CwtXp5uVkjkVhI40x2V2s9KC03dHBIXaf827nN3j1LA) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
I am with @rebolek here. Don't like crypting things to which you need a manual to work with. But as whatever word chosen might collide with the element name, not sure what would be optimal to do. But if we proceed with !~"^#@'?$ stuff, then let's scrap parse altogether and use just regexp. It will scare away many users to come :-)

[8:34:08](#riZQIqqgODDmfHWDscDJctdalysXqPHfv7EQJiUtQZc) <rebolek (Boleslav Březovský)>:
> I just filter by given path

If I’ll have some filter function for XML, I can use path! as an argument there, even if the inner structure can’t be accessed using paths.

[8:44:14](#4p4CChCZ4DXEsSgitBT2KMrlCzSSu_mTDUTGAQKhI_c) <hiiamboris (NOT THIS ONE)>:
Well, you can do that even for the plain XML. Goal here is to present it to reducers in the simplest form possible.

[8:44:29](#McRAkABDrr5RvU3RODvLkogImG0mPruvDDtAafpVFLU) <hiiamboris (NOT THIS ONE)>:
* Well, you can do that even for the plain XML. Goal here is to present it to reducers in the simplest form possible. Form that'll be pleasant to work with.

[8:50:25](#TvPfAzzuKXML83DTauhxr3klIU8bPCWoX4Fi23VrVqs) <hiiamboris (NOT THIS ONE)>:
For namespaces, would it be possible to use `/#xmlns` accessor? I think xml elements can't start with `xml`

[8:50:47](#2vdA75y_DK38rw0rm5Zri7mwyL_4_7Nn5pHsqWAyqjQ) <hiiamboris (NOT THIS ONE)>:
* For namespaces, would it be possible to use `/#xmlns` accessor? I think valid xml elements can't start with `xml`

[8:56:32](#aSKVnnOLXHPNpZYa0s1f75K8Y30dcOFC-h_3KPUkf84) <zentrog>:
I don't think there are any keyword-like limitations like that.

[8:58:11](#GQbWxhPO38ZSmHC6QTxK4oIgSdN3s1bdEIx2DDRwczw) <rebolek (Boleslav Březovský)>:
No, they can’t start with numbers and some other chars, but they can start with `xml`

[8:59:20](#2DTyfTvn-41vb36RFD9JFXmOr7oa8oQS04xi3NvHHIg) <rebolek (Boleslav Březovský)>:
> Goal here is to present it to reducers in the simplest form possible. Form that'll be pleasant to work with.

Those are two goals and they can be opposite ������

[9:02:34](#EcvqoklJGhAwzZQYp-pNBR6_Dgsz-bmp0Yj3-yXCBW8) <rebolek (Boleslav Březovský)>:
Yes, I’ve (ab)used this in an older version of Redis scheme which also uses #":" delimiter (by convention, you can actually use whatever you want).

But `url!` is still `any-string!` so it doesn’t help very much.

[9:03:00](#eQ_GnJJkP8B8eOFpzmqBzDkcl6DuycFJbQ7LCt-_YtU) <hiiamboris (NOT THIS ONE)>:
![](https://i.gyazo.com/157ddff0066c9f8e6110de2977f78a7e.png)

[9:04:19](#chUe2CHpj49tPI2BUuyycfnZDgMmUu1OSx-FLYiBhh4) <hiiamboris (NOT THIS ONE)>:
We can also exploit that elements can't start with `.`. E.g. `.content`.

[9:04:50](#3vogCsu6o9ohi-IDWfCd-wjcsW7SrXevH8GmA7g3VEw) <hiiamboris (NOT THIS ONE)>:
But then how is it better than `!content`, and how that is better than `!` is beyond me.

[9:07:21](#WBvfW7TrKFsVaWAT-zZJ6y-Xwu_7kTqHM_ECiIOUU8o) <hiiamboris (NOT THIS ONE)>:
I favor shorter because it will be used *a lot*. I hate verbosity of XML paths. E.g. what is this `tree/ldml/numbers/currencyformats/currencyformatlength/currencyformat/pattern`? It occupies the whole editor line, leaving no space for functions or anything.

[9:07:45](#Kl6L77SwK-7ZjbvaQ3F25uB1G2tsET0zMlvMBrcKfqg) <zentrog>:
To be fair, we already have all the syntax of `[#()]`. I don't think we need to be afraid of the other datatypes, if it ends up looking clear enough

[9:07:53](#SXZdPq0rUi57-YkO5_vLS36jghFoaZHv7owxzjTkPEg) <hiiamboris (NOT THIS ONE)>:
* I favor shorter because it will be used *a lot*. I hate verbosity of XML paths. E.g. what is this `tree/ldml/numbers/currencyformats/currencyformatlength/currencyformat/pattern/count`? It occupies the whole editor line, leaving no space for functions or anything.

[9:08:37](#Ul-ZkelIcMaJf3kCNq-Pw39J6rzUGW5lijrtQ9NAmJU) <rebolek (Boleslav Březovský)>:
That verbose path can be accessed using XPath as `/tree//count`. We need a similar mechanism.

[9:08:56](#fjgXr9j_c9IWiXexhutrmKLIREVxDFEX_fPmGqFyENk) <rebolek (Boleslav Březovský)>:
That’s why I don’t care about mapping XML paths to Red paths that much.

[9:21:51](#735HtPb8EmN4255tOf5Zv1ElnT92dK5voLJDgcdbgbE) <hiiamboris (NOT THIS ONE)>:
will it have to scan the whole XML tree to find that item?

[9:22:28](#EGyXI9lzNhwCHHuebCvYYy9LkmOTpBSw_CMnwMQ9jkM) <hiiamboris (NOT THIS ONE)>:
do we need to create an *index* for that tree for faster operation?

[9:26:10](#smdYqIXYj5U9scSjRDptyL7CYzZ4_uIXaaT-9XXk0qg) <rebolek (Boleslav Březovský)>:
What the above example does is to return all elements named `count` that are childer or (grand)*childern of `tree`. So yes, it needs to scan whole tree.

[9:26:38](#KHkQ3A1GL9-QTWrFKdGjaEQJV8zJeoZNvEfseMuYovY) <rebolek (Boleslav Březovský)>:
We can probably create index on the file and cache it, if we feel the need.

[9:26:46](#cIghbenPjIRu_se5vWyPQAQ13mwQPZYDQtjahltOF7g) <rebolek (Boleslav Březovský)>:
* We can probably create index on the fly and cache it, if we feel the need.

[9:28:03](#J0MUwwb8s6a_7MX8zm5sMPLFj3kzGwAJmq8JbTDQeyI) <hiiamboris (NOT THIS ONE)>:
complexity identified! :)
options:
1. destroooy!!
2. slip away
3. embrace it.. let it crawl in..

[9:28:27](#2waRgRULc4sWAtbxCd5tZ5zGR7kWFVB8kPN3bprYBH0) <rebolek (Boleslav Březovský)>:
It’ß XML. It’s complex by definition :-)

[9:28:32](#jO15y-ankjgk1Jis_fHvYUEmGNYUZencpFR78nOoqKw) <hiiamboris (NOT THIS ONE)>:
������

[9:28:32](#1boGDX5JWHM7_xd69Mkx53JhQ4TYUecgFmg3biy3PQo) <rebolek (Boleslav Březovský)>:
* It’s XML. It’s complex by definition :-)

[19:44:36](#TeorL6ce7d7f3x6Ut4YHpNnb9p6LbvQ02YJ6d7T_BPo) <greggirwin (Gregg Irwin)>:
I will chime in just on `!` as a content accessor. It's not Reddish in that we *try* to use words when we can. `!` also already has a strong meaning as a datatype suffix, so has to be learned as not type related in this context. If it does appear in the data structure as a key, that softens the blow. @hiiamboris mentioned that the lexer would need to be updated for one of his ideas. We should not do anything that requires such changes, unless they are lexer issues to begin with.

[19:47:37](#Y2NjlndprSmIVVCFv2PgFnK4BE2n8nc6BXmtTjto9fg) <greggirwin (Gregg Irwin)>:
@zentrog:matrix.org, do you know which XML libs are highly regarded, and anything we might learn from them?

[20:02:46](#4nE4Co5XyVM4T6NCD66gdjhszq1begMiI_RzRsLI9io) <zentrog>:
greggirwin (Gregg Irwin): Not really. I've mostly used what's built-in to .net. MS has two APIs for doing it, and they seemingly support every feature of XML. There is also object serialization. The newer API is based on LINQ, and is a lot nicer to use, but I think Red will already be way past that in terms of ease of use. I don't think their designs share a lot of the same goals probably...

[20:04:27](#6L2eqslIX3q1Oah125NQ1AL_JpJNjegS2kS_IcHwZmE) <zentrog>:
Maybe not goals, but priorities?

## 2-Dec-2021

[9:44:36](#v2gxySfxchQr_Kb8Y5oQHSYYf92UhrapnsucDxAbc1k) <rebolek (Boleslav Březovský)>:
My current feeling for handling namespaced keys and attribute names:

- convert them to `path!`, `select/only` can be used for easy access
- for attributes, use `block!` instead of `map!`, that way attribute names with namespace can be converted to `path!` also

This has a minor disadvantage in that it would be visually harder to distinguish content from attributes as both would be `block!`. I believe it’s a small price to pay.

I will implement it and test it to see how it works. I’m open to any ideas and suggestions. Also, I try to implement it in a way, so the parser would be output format-agnostic and we could replace the emitter easily. So if we decide to use some different format, it should be easy.

[10:22:59](#ModTLX-2T1XXpqVvko8sWTiZu43uxiBgaZTiIyzvxLc) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Isn't easier and much more lightweight to use string-based parse to get data from XML files? At least that is what I did last 20 or more years.

[10:29:17](#ilJUo5JXIeo_Of0qNRiiM0PcL73ah8v2CM8qJQNPhVs) <rebolek (Boleslav Březovský)>:
@Oldes I’m not sure what you mean. The parser is of course string based, what I’m talking about is the result format in Red. If you’re looking for one value is a specific XML file, you can probably write some throwaway oneliner, but if you want to handle various XMLs in Red, then you need some XML codec.

[10:31:44](#T9ujZlhOo-9g3O3EoMTPRK6_yEA9bwQfai6aDzb1aZE) <hiiamboris (NOT THIS ONE)>:
Block is an improvement over maps, because each map is 4kB of extra RAM.

[10:36:26](#ywpgdmkkAYxSO_IYD2Wx9Yy36CepH-htCiWtQS8ut_o) <rebolek (Boleslav Březovský)>:
Another good thing :-)

[10:42:37](#h8nYpHjMg_8cpq1B7TqXwcaxrJEgIIBeXZXcPnTcE7Y) <hiiamboris (NOT THIS ONE)>:
But as you already know I don't like the whole structure:
```
[
    "menu" [none "234567^/    " none
        "item" "one" #(
            "id" "1"
        ) none "123456^/    " none
        "item" "two" #(
            "id" "2"
        )
    ] #()
]
```
And prefer this instead:
```
[
    menu [
    	! "234567^/"
        item [#id "1" ! "one"]
        ! "123456^/"
        item [#id "2" ! "two"]
        ! "012345^/"
    ]
]
```
That is:
- trimming of trailing spaces (but not of trailing newlines)
- attributes together with the data
- `!` sigil to get data from elements (we can of course use `none` like you're doing today, but I don't think `none` is any better in readability and usability)

You have a regression btw - words became strings. 
Also last value disappears from the input (in `xml2.red` all values were disappearing):
```
<?xml version="1.0" encoding="UTF-8" ?>
<menu>
	234567
    <item id="1">one</item>
	123456
    <item id="2">two</item>
	012345
</menu>
```


[10:43:02](#833SR_Q0vQM6DrL_wcZvxawacTYv2cAjGwxwv27dZK8) <hiiamboris (NOT THIS ONE)>:
* But as you already know I don't like the whole structure:
```
[
    "menu" [none "234567^/    " none
        "item" "one" #(
            "id" "1"
        ) none "123456^/    " none
        "item" "two" #(
            "id" "2"
        )
    ] #()
]
```
And prefer this instead:
```
[
    menu [
    	! "234567^/"
        item [#id "1" ! "one"]
        ! "123456^/"
        item [#id "2" ! "two"]
        ! "012345^/"
    ]
]
```
That is:
- trimming of trailing spaces (but not of trailing newlines)
- attributes together with the data, leveraging Red's type richness
- `!` sigil to get data from elements (we can of course use `none` like you're doing today, but I don't think `none` is any better in readability and usability)

You have a regression btw - words became strings. 
Also last value disappears from the input (in `xml2.red` all values were disappearing):
```
<?xml version="1.0" encoding="UTF-8" ?>
<menu>
	234567
    <item id="1">one</item>
	123456
    <item id="2">two</item>
	012345
</menu>
```


[10:44:09](#mBZgynl2vyGBclAOLeVZKEUzmCJLSn8BwpveuGHpr70) <rebolek (Boleslav Březovský)>:
`!` is really confusing.

[10:44:23](#zkHJb_kwsKTOUbeFip6o31UlAyjGt4y00R16YU9RHIQ) <hiiamboris (NOT THIS ONE)>:
`none` isn't?

[10:44:42](#yLfRTX9_qC2yGAnCi6HXHa1vTAdzt_tVzXQwxpGZH38) <rebolek (Boleslav Březovský)>:
However, I'll try to implement an emitter for your format too.

[10:45:07](#oC5D8ThvACuosoyCEff6Mo-TWCr4ot3PGd-qJjiBf1U) <hiiamboris (NOT THIS ONE)>:
That's the spirit! ☻

[10:46:57](#gMtafqyHWCn9spTEWlagHRG_U47BbscpmVttjx_WIsg) <rebolek (Boleslav Březovský)>:
maybe something like `content:` instead of `!` and `namespace:` so tag names won’t have to be `path!`s if you don’t like them?

also there’s a problem with your format, if you use `issue!` for attribute names, they can’ have a namespace.

[10:48:09](#iqKwacW-pGwnyDD3eAZ5K4Gqi2dy8t4_ZmxIHNiKykg) <hiiamboris (NOT THIS ONE)>:
Also, what do you have against grouping namespaces in an extra block? 
That is:
```
namespace [
   #x "1"
   #y "1"
]
```
instead of
```
#namespace/x "1"
#namespace/y "1"
```
?

[10:50:45](#2uAkmDmh52oQ-7ErP6eHtGwj9bUDZa3R5kXlGIhTbz4) <rebolek (Boleslav Březovský)>:
ok, that is a possibility

[10:51:55](#52wiCG4RKmuXUCc1JDI0tggIJNWB0xaZxUpp-RBzkHs) <hiiamboris (NOT THIS ONE)>:
I find `b/x/y` more Reddish than `b/('x/y)`:
```
>> b: [x/y 1]
== [x/y 1]
>> b/('x/y)
== 1
```
Besides, if we later build an index for faster access, paths lookups cannot be hashed. It's linear search.

[10:52:24](#L_JBS_mMVF2EltAaw1G7-LDR6_X8Og8ngXengyfwyAE) <hiiamboris (NOT THIS ONE)>:
* I find `b/x/y` more Reddish than `b/('x/y)`:
```
>> b: [x/y 1]
== [x/y 1]
>> b/('x/y)
== 1
```
Besides, if we later build an index for faster access, lookups by path key cannot be hashed. It's linear search.

[10:55:47](#mFhgEU6EcVuX70SlHux1KghnRW0RvQ9IUXMv8Frh3w8) <rebolek (Boleslav Březovský)>:
that grouping would work for attributes, but not for tags. For tags, you still need some mechanism how to cope with namespaces.

[10:57:41](#6jX5gLMOIijIlpAgrJ4kZkF6TsjUjKhZL4pHjRZ2j58) <hiiamboris (NOT THIS ONE)>:
why doesn't it work for tags?

[11:02:11](#CugsECohYyNhdcg_GhHcTzSfKevSvxN15k670CJpwM4) <rebolek (Boleslav Březovský)>:
because it would mess order in some cases

[11:02:35](#dWoG1Usjxg-HHk5gTw512lq0Juemr2vU2tNXPst2Nx4) <hiiamboris (NOT THIS ONE)>:
have an example?

[11:04:24](#OHoeoQaa_icolHeXBGQfvPKORty9vyWJECB538wZeV0) <rebolek (Boleslav Březovský)>:
```
<ns1:a>1</ns1:a><ns2:a>2</ns2:a><ns1:a>3</ns1:a><ns2:a>4</ns2:a>
```
would become
```
ns1 [
  a 1
  a 3
]
ns2 [
  a 2
  a 4
]
```
if I understand your proposal correctly.

[11:06:52](#vJV5z2TEiro1RaTFf7eImj2L9r-0eGMrgMiRuT7yyB4) <hiiamboris (NOT THIS ONE)>:
I see, thanks

[11:07:17](#M4j3dwI0zalacsY0vtsrg85R-sY9PvOq8XlwKlqdkAs) <hiiamboris (NOT THIS ONE)>:
idk if it is desired or undesired effect though

[11:07:56](#zg3_9bIxlepAvbvLGK8yEQi9sOU2gAMgzKXamEGO69E) <hiiamboris (NOT THIS ONE)>:
what about holding namespace as a kind of special attribute in the tag, like @dander proposed?

[11:08:32](#cLd8sjoVTQQTIdd9wGMpeBWB6PBMRwYaWiElpxffxhM) <rebolek (Boleslav Březovský)>:
Yes, that’s a possibility.

[11:09:06](#wqPz6leX_FN2rcK8qYxQIwfSn60FeHBr2eJxAg-K46s) <rebolek (Boleslav Březovský)>:
In tags I believe it’s undesired effect as it would mess the document structure that is ordered. In attributes I guess it doesn’t matter.

[11:09:07](#OYil_bazAmJRsAYeS-8q8itKj_jcbRYjyNoK5xU9A9c) <hiiamboris (NOT THIS ONE)>:
```
a [#xmlns "ns1" ! 1]
a [#xmlns "ns2" ! 2]
a [#xmlns "ns1" ! 3]
a [#xmlns "ns2" ! 4]
```

[11:09:43](#G1ssRXdTWDv4aZOQEhXc6Fcoko1aLOPLLdBDr2wf9hs) <hiiamboris (NOT THIS ONE)>:
got it

[12:58:56](#OXXfMW7CsA6W-RLXJ2dNr4RJwFGrwiw6WVEhF-F5LlQ) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
While I did not like syntax of Morph much, I surprisingly like most of the suggestions here made by @hiiamboris. I tend to be in favor of consistency, but I must not affect readability. Using none and maps seems to be messy. Prefer blocks and ! 

[13:02:10](#KwdUA-HO6gEFLOh8FOE0YgYcRlxEin47WH0wCBduoUc) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
I have to admit thought, that I strongly hate how maps look visually. Can't stand parens there and wonder, idlf that's just me ������ Imo #[map here] or some other block form using @ or ! followed by block, would be more reddish.

[13:10:37](#CVlHaBS2vxbo2-F0OzwObiPeXNWn7L3C4xND5tvWOng) <hiiamboris (NOT THIS ONE)>:
That's what Gregg pushes for too.

[14:12:58](#xo2PV6aS79x_U0_dkBWb-9HuKK9GY-U5ra28NSSsaWI) <rebolek (Boleslav Březovský)>:
I have first version of modular emitter, it now supports both my versions. I will implement Boris' format as a next step, however, I'm going to replace `!` with something verbose and sane.

[14:16:04](#UItaX-rsA_SJQFSvqkyjrNxOs22mSvh3fH6QtUhaQ7E) <hiiamboris (NOT THIS ONE)>:
but it will conflict with element names then, no?

[14:32:05](#b1TUm7Pnspj1uH_ofTkslU35hBFhnUKnY_8jMW-ChLo) <rebolek (Boleslav Březovský)>:
It won't, it would use a different type


[14:41:05](#z2lpPJ4TptrWklYxtEjd8HUkuKhIBNjsr0oI96fKg3E) <hiiamboris (NOT THIS ONE)>:
set-word?

[14:59:27](#Q7AFl3b7SKXvXg1SlVRMiW1H4J9bnDH_xKNiJbptuy0) <rebolek (Boleslav Březovský)>:
I guess so.

[15:00:07](#KoIrkl4ADKzE5ReRnw7t_zCHqA_2rog_j2Bp7vbxUxE) <rebolek (Boleslav Březovský)>:
I’ll have a prototype by tomorrow, so we can discuss it then. Now I need to leave.

[15:03:09](#KkkDaXaD9KPPtKRqXPll4HShfm-kZdAsHCSeUkU4v2E) <hiiamboris (NOT THIS ONE)>:
set-words and words aren't distinguished by paths, so it will conflict

[17:49:00](#oY8JF_A3m57CfN9oUETXe6PhjoBb9LOMkaT0xn7LeBU) <zentrog>:
What about something like `@text`, `@ns`? Could also use that for things like `@cdata`, `@comment` if those are wanted

[17:56:38](#0hvFuCW7dpJu4YHS7BDtVKypcO0VEpJtEfvFVjV1yO0) <hiiamboris (NOT THIS ONE)>:
:+1:

[17:59:42](#prhy0IOwg_wCkgx1BLKnCkX841QL6ECCxCw1tB7cGZg) <zentrog>:
I don't like using the namespace prefix in the path lookup, because it's possible to have documents from different sources that pick different prefixes for the same namespaces.
```
<xml xmlns:ns1="foo"><ns1:bar/></xml>

<xml xmlns:ns2="foo"><ns2:bar/></xml>
```
Both of the 'bar' elements are in the "foo" namespace, but you would be forced to look up the prefix for that namespace, and calculate the correct path. Either of
`xml/ns1/bar` or `xml/ns2/bar`. It's possible that you would need to differentiate via namespace anyway, but in my experience, it's almost always fine to just ignore it

[19:42:25](#m2iI_VJS1T3bvSIDF8NW4I7Wr__hKQclmfBmvcxVtSo) <greggirwin (Gregg Irwin)>:
One thought I have on `ref!` is a string type. Since attributes are used throughout a document, the same names may appear a *lot*. In that case, word types should offer a significant benefit; as long as we accept word syntax limitations, which I think was an earlier conversation.

I love working from concrete examples, as we are doing in chat here. Does it make sense to take a small XML file as a common source and mock the Red structure for it, along with examples of how you access things? Then it's apples to apples. That's kind of what I did long ago, which is now part of https://gitlab.com/rebolek/markup/-/wikis/home. I keep scrolling back here to see what if new examples use old XML as their source.

Having a modular emitter is cool, and may let us play with output options quickly. When the time comes, we need to define which one Red considers standard, for other tools that access the structure.

## 3-Dec-2021

[8:30:07](#cN5fqnH0lCemMdCCZVaTJQo85Phb2_MzMgFh0pku9Oo) <rebolek (Boleslav Březovský)>:
I agree with @greggirwin that we should use `any-word!` type instead of `any-string!`. I should have a prototype of the alternative output today, so we can play with it then

[8:40:57](#jVoZd7ao7Sf-6uldVaJ7E6NRwocrQ5HIzitukoeGgyE) <hiiamboris (NOT THIS ONE)>:
But any-word won't work in paths, and any-string will.

[8:41:57](#bwlRad6F7mrUPTlKq4Dev_ckUwpH4bvSf6gKLz8lIP4) <hiiamboris (NOT THIS ONE)>:
Though yes, any-string will occupy 2-3 times the memory.

[8:42:22](#AtdRsQqCtUKUYl7rDIEKGBiEYhIVsKYMKt2Xu6TNBjE) <hiiamboris (NOT THIS ONE)>:
* Though yes, any-string will occupy 2-3 times the memory (still nothing even nearly compared to maps).

[8:45:26](#o7GPoF2oiaZS8ajyhy8y9QfmNq7FN19L2kn6hSjqDI4) <hiiamboris (NOT THIS ONE)>:
Oh by the way, if you use the *same* any-string as key, it won't be bigger than the word.

[8:46:45](#3dm1E18ZTWg7Mpk4XaLqEp2S7uttmkYc6HMxBZEi_0Q) <rebolek (Boleslav Březovský)>:
True. But that would be harder to implement. I’ll see.

[8:47:21](#oJSxCNtwWkrQkZL01Z45rBZUEcMD3a6xYpc7tf_zTZc) <hiiamboris (NOT THIS ONE)>:
Just declare it context-wide as you usually do, and do not copy?

[8:48:36](#sTf7MNHfCkfFZCJe9nS1cO0iao2B2zqMaLdLGQtAMe8) <hiiamboris (NOT THIS ONE)>:
The only issue is after save + load it's going to become bigger. Unless Redbin is used.

[8:51:34](#IraF3XqwUB6flKADYpjj41M_iQdHypZ3qqwdHXZbfKE) <hiiamboris (NOT THIS ONE)>:
Still, I'm not convinced that `@text` is a win over `!text` or just `!`. I'm just *okay* with all these variants.

[8:51:51](#IHuWnb3hFAlHQKtylICpUUbTTcPV2NNf3SI_mqVvEpk) <rebolek (Boleslav Březovský)>:
������ that’s what contexts are for

[8:52:16](#b_S7khpTMWZ2D3OKZPTekBuEhI_GIVLMNql6QknLFm8) <rebolek (Boleslav Březovský)>:
`@text` is a win over `!` because you immediately know what it means.

[8:53:10](#8mbY6rH4Se1kW6VvN48dwdUlXDAlZ1VObIxW1AmIHQU) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
what type is @text? Isnt it a planned ref?

[8:53:19](#rNFiRx2T5xsZUM413Q9JO06c0jmv8Hlf2jKnJSMzRN4) <hiiamboris (NOT THIS ONE)>:
@rebolek Yes, but you have to type it *every* time you access a key. It becomes a buzzword.

[8:53:39](#Bov6rd8OwCoyykhGNvltqLY-9Fb6fcC6c-E5IPNqesQ) <hiiamboris (NOT THIS ONE)>:
@pekr It's a `@ref` yes

[8:54:11](#Oobdf_lBqq-sip3WAVhwbh3miTeJ1zgYmyRZPUy2sb4) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
I know, but, does it serves the right purpose here?

[8:54:58](#udrCIz4eIMYaUia927WAXDL8jLkPHCIwDBmS29Iyv7k) <hiiamboris (NOT THIS ONE)>:
To us, right purpose is to distinguish it from XML elements. Any other purpose in mind?

[8:55:08](#70L7WehLX0YfHEHcoKqRhRwtFI6GuqlyUrmhbw0LCKs) <hiiamboris (NOT THIS ONE)>:
* To us, right purpose is to distinguish it from XML elements. Any other purpose you have in mind?

[9:07:11](#AT5n9puI8vPCDIBrIh13ffeVhEbg2f5_LrwwZPFBAQE) <rebolek (Boleslav Březovský)>:
That’s why I prefer custom functions for XML structure access.

[10:06:51](#VxcAYqmyJt8szWzQylHKShbeqWMKgmRfUuyQDlrK1Vo) <hiiamboris (NOT THIS ONE)>:
but then those function names will have to be repeated ������

[18:10:26](#yOJvAYPV1ODK9Nx2I_FJYoM24bWkAFj9StZaPwlCd8o) <greggirwin (Gregg Irwin)>:
Using strings and not copying them will either be a recipe for disaster or a brilliant feature. I can't say which. The fact that the behavior will change entirely when saved/loaded leans toward disaster. The idea that you could do simple field renaming by changing one instance leans toward clever feature. Taking steps to avoid disaster is always good though.

[18:11:25](#0Rj7D3cKzkMZH6yu4QKDN6MBQrlAizcgMIFmj2URIlM) <greggirwin (Gregg Irwin)>:
> But any-word won't work in paths, and any-string will.

Wont' a plain `word!` work?

[18:16:14](#bVeTWFeWRTtJkiKzF5gfuSY4N-ARWS_rmhMA9dwr5V0) <greggirwin (Gregg Irwin)>:
`!` is used in XML for comments and CDATA, which may make it confusing if we repurpose it. There will be a lot of people coming from that side, rather than the Red side, and they may think it's used as XML would.

[18:16:52](#FdAm-Bnt1M70UkkxZTD6XWet_crJdBfUCC3Jtlyh9uU) <greggirwin (Gregg Irwin)>:
> what type is @text? Isnt it a planned ref?

@pekr `ref!` has been around for some time now. 

[18:23:51](#t-CqnNVM5Np1pJQa4Op3lhcFDHKqh4QQ9jwBFZfjmnQ) <greggirwin (Gregg Irwin)>:
I'm OK with the solution that gives us the best *usability*. As I noted to @rebolek in other chat:

> As long as we're not 20x less efficient than a .NET or Java model, I'm OK with that.

:^) 

If we think about how it may be used, there will likely be people who try it, see that it loads, and then just use the codec structure directly for all their work, because they aren't moving away from XML (yet), or need to emit it again. Over time, I hope people will use the decoder, transform it into better structures in Red, then keep it in Red.

So if the codec's output structure is a little clunky to use, we can absolutely blame XML and show how much better life is once you can move away from it. But that move will never be 100%. Some people and systems will stick with XML, and if we can make their lives a little better, being part of the solution, that's still a win.

## 6-Dec-2021

[11:42:56](#t5YnIiXi1qf5Z_51UCrc2AcBtd5Uu-bqY2D2qY9S2lQ) <rebolek (Boleslav Březovský)>:
@hiiamboris I am working on the emitter based on your format and I’m currently implementing the damned namespaces. Here’s an idea. What about refinement? So `"html:a"` would end up as `a /html`. I know it looks strange backwards, but it uses a special type for the namespace that is also word-based, so more efficient than a string. And it doesn’t need some special markup such as `@` or `namespace:`.
What do you think about it?

[11:46:36](#TskNAgg8n1w0xfhVcof1zritLqDlHiQznwv-7W6oyUw) <hiiamboris (NOT THIS ONE)>:
I'm still noob when it comes to namespaces :)
Why not `/html a`? Will this `a` be used in paths?

[11:47:14](#mI7LGoJiskASGiSXVEamaN7mSMbBOxJZc5ONXA50kuE) <hiiamboris (NOT THIS ONE)>:
Is it going to ruin the otherwise straight key-value ordering?

[11:47:40](#wa8YZQ8egitDOnH9LM_MdS0LUaIM-kJDxsEgVAjUskw) <rebolek (Boleslav Březovský)>:
Yes, this way you can use `a` in path and yes, it would ruin the ordering in case we want to have key name first.

[11:49:30](#prTQR8wIGxhB5zTaMz4HxpHymd8ktLrbJMMm33W6Q2g) <hiiamboris (NOT THIS ONE)>:
Can you show how it looks on a simple example data?

[11:49:54](#CiVM98Ddrqb80jdo6FB6_LLFWRFhU7SzBisx5GlEV3k) <rebolek (Boleslav Březovský)>:
Because refinement may look silly for a namespace, which is above tag name in the hierarchy, we can switch types of namespaces and attributes names, so parsed tag would look like:
```
tag-name #namespace /attribute "att value" "content
```

[11:50:01](#v16YNLB55GvwhXYX0gfx9234eu65gs1n7chJBMHNkaw) <rebolek (Boleslav Březovský)>:
* Because refinement may look silly for a namespace, which is above tag name in the hierarchy, we can switch types of namespaces and attributes names, so parsed tag would look like:
```
tag-name #namespace /attribute "att value" "content"
```

[11:51:26](#k5eQ9-As1Vw2Eq2GDO4_8ZdqugZWusfJ7vp-ukBWwI4) <rebolek (Boleslav Březovský)>:
```
>> print read %data/namespace1.xml
<?xml version="1.1"?>

<html:html xmlns:html='http://www.w3.org/1999/xhtml'>
  <html:head><html:title>Frobnostication</html:title></html:head>
  <html:body><html:p>Moved to
    <html:a href='http://frob.example.com'>here.</html:a>
  </html:p>
  <html:p>Done by
    <html:a href='http://examle.com'>example.com</html:a>
  </html:body>
</html:html>

>> print mold load-xml %data/namespace1.xml
[
    head /html [
        title /html "Frobnostication"
    ]
    body /html [
        p /html ["Moved to ^/    "
            a /html #href "http://frob.example.com" "here."
        ]
        p /html ["Done by ^/    "
            a /html #href "http://examle.com" "example.com"
        ]
    ]
]
```

[11:58:27](#OmwbOzRsf-pahx5kuauLdVLQg0cRsQXwwKBhrQ1fa-0) <hiiamboris (NOT THIS ONE)>:
this won't let me access it using paths

[11:58:40](#i7iccet-kVeNNmL7DNy8FTSbgAJX7cmT2Ny-VRlOKEU) <hiiamboris (NOT THIS ONE)>:
`/html head` would work though

[12:00:00](#cWDJQj0KKFmQgOP55Bi26FXbbnmdg9vs1BCKfOOOiAs) <hiiamboris (NOT THIS ONE)>:
and of course I need to access the content using paths

[12:00:44](#zt_zHYh4idjw5LTPZnJbavH5euiBaxAQRVcoLFnsx68) <rebolek (Boleslav Březovský)>:
If you have an attribute there, it won’t let you use paths either. Even if you switch the order `body/p/a` won’t return `a`’s value. And of course it’s usable for first `a` only, in case there would be multiple tags.

[12:01:35](#ePCineS8zs28akHfbNvtQGTqdb7nydzpU4_HIyXaS-I) <hiiamboris (NOT THIS ONE)>:
first `a` is fine for the majority of use cases

[12:01:43](#w3q-A4TTetCDvroCWBE1HDQHmhn7s8preAi45Fog4i0) <rebolek (Boleslav Březovský)>:
If you so insist on path access, then the order should be `<opt namespace> <tag> <content> <opt attributes>`

[12:02:29](#hIDkqGTjgnp1VJhsd5p3FlQ40S-GQ755JOSFgFzWFRU) <hiiamboris (NOT THIS ONE)>:
let attributes be inside `a [..]` like I proposed originally

[12:03:08](#5Eh6mjY1CmemNpicr4NTw3UzJpkvc0uBzGdCkxbmNq0) <hiiamboris (NOT THIS ONE)>:
and `/html` won't hurt if it's before `a`, and I can just happily ignore it

[12:03:13](#Hf9eKJdClq28F6cji95pJftwD4mXsoF9na1I4uvFK5U) <rebolek (Boleslav Březovský)>:
but then you need to prepend some markup to differentiate between content and attributes

[12:03:58](#iX1-jg5YmvzcSQCb73B2eP0Hdp-oEnS2d2mwStWRCgY) <hiiamboris (NOT THIS ONE)>:
and we get back to the question of `!` vs `!text` vs `@text` vs `@` :)

[12:04:54](#fytzesFqRvbdA-_7MTmPGpacNUIrs_PIRyzktOYNURk) <hiiamboris (NOT THIS ONE)>:
see, Red has facilities to work with it's data structures
if we don't structure our data properly we have to invent kludges to access it
but why?

[12:05:36](#j6lRoodw7qEJk9G0sKhcjvj-VnVM1-bBWwmRsDVXY1Y) <hiiamboris (NOT THIS ONE)>:
the data structure I proposed, so far perfectly works for my CLDR extraction tasks

[12:12:35](#EREvNLXa142CDg1QxLB2bc8hJ7dspJoiGTv0Lc6ngMA) <rebolek (Boleslav Březovský)>:
Why not `text:`?

[12:13:11](#xlaKP_t3dztp1iMHsFij_MA2Xfx90jiW61jkb_OiJHU) <rebolek (Boleslav Březovský)>:
> let attributes be inside `a [..]` like I proposed originally

That’s not solving the access problem if attribus would be before content.

[12:13:20](#XADJBpEt6WHFFwCZe7CQCDQmOP5QcmWC25jOPRh9teo) <rebolek (Boleslav Březovský)>:
* > let attributes be inside `a [..]` like I proposed originally

That’s not solving the access problem if attributes would be before content.

[12:14:46](#Hse2dlSi_Q8nZuvf4r0et2qQ-hdiq_bMcXsDKGyMu08) <rebolek (Boleslav Březovský)>:
Path access is not designed to access structures with multiple paths with same name.

[12:15:34](#5lK0yavIlZvaVGWA5AZD445gRY369ALr5KruAFcgVDQ) <hiiamboris (NOT THIS ONE)>:
> Why not `text:`?

Because there may be a subtag "text".

[12:16:36](#kErB8JEI5_yftYI6mja60wdK6Tp8P2cfVLhqMmXpcEk) <rebolek (Boleslav Březovský)>:
Ok, so we’re back to problems with path access that’s obviously not a good fit for XML data :)

[12:17:18](#9fSVd6XqKcqr4SVSFudM7SWaz9D3iDVs9ZTAVGIuiy8) <hiiamboris (NOT THIS ONE)>:
Again. It works most of the time :)
When it doesn't, I can iterate.

[12:17:40](#Z3oTwvLskouU6WATtvSS7OZtighe7qp8XXvckBoJd_U) <hiiamboris (NOT THIS ONE)>:
But I clearly don't want to iterate over each path element.

[12:19:02](#3ndOPXPtQkC_2kZv6q-hI_bpnYKgf5e4kIK7QMmdOxc) <hiiamboris (NOT THIS ONE)>:
E.g. I don't want to write 10+ loops to get the data from `tree/ldml/dates/calendars/calendar/gregorian/months/monthcontext/stand-alone/monthwidth/abbreviated/month`

[12:20:53](#VKMABwvEirkWy4mb9zVIKnlTlB5GNLzQuSJexFvcT6A) <rebolek (Boleslav Březovský)>:
I’m not sure if should optimize for one use-case. But OK, I’ll change the emitter and show you the new structure.

[12:21:24](#zOcpwhT-jfw1jDSOIvhQv1A2dw508S124Qq7uXSIONQ) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Maybe we need to introduce another forms like ![ ], @[. ], 16#[. ], Hash![. ].    Simply put, default is block, coul be literal forms, binary, hash, whatever. Kill the parens fornother thing than computation, evakuation precedence ������

[12:21:57](#OG22-NGGGxm2em0F7lcRlVO_u0OLRbDdt3eJq7x2Hfk) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
evakuation = evaluation. 

[12:22:42](#AHdZftt15Lq6qaBgeGD49LrNJvN8AGpwImPmNkN-69s) <hiiamboris (NOT THIS ONE)>:
what will it solve though?

[12:22:53](#AeIXCbp_BojDii6MkZQzK7gPSkDo3oqOWMiWo86W7Xw) <rebolek (Boleslav Březovský)>:
I also can use `paren!` for attributes, that way I don’t need some markup to make it obvious it’s not content.

[12:27:49](#xSlHF0eZAxEdFpajeTos8Z0q8v6I1HU2vb3odBBEbL4) <rebolek (Boleslav Březovský)>:
Here’s the new structure. It uses `issue!` for namespaces and `refinement!` for attribute names as it looks more logically this way. It also puts attributes after the content so path access works (for first item only):
```
[
    #html head [
        #html title "Frobnostication"
    ]
    #html body [
        #html p ["Moved to ^/    "
            #html a "here." /href "http://frob.example.com"
        ]
        #html p ["Done by ^/    "
            #html a "example.com" /href "http://examle.com"
        ]
    ]
]
```

[12:29:10](#qLVFm-h0cJqojKAwIEcuXZJOLV43mLtFz3mUvgzX87A) <hiiamboris (NOT THIS ONE)>:
No, make /html for namespaces and #href for attributes, otherwise we'll have to type `body/p/(/href)` to get the attribute contents.

[12:30:10](#WOMRVL9z7paqO_ldBp_l6rAl29tkiSJn__I4VkyvYnc) <rebolek (Boleslav Březovský)>:
:rolls eyes:

[12:30:32](#Pi_HS5H_Q3mJLcLS1NEoIxKAJw11exaYtL4If5eSbHc) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Why cant multiple elements be always in block? Would that create too many sub blocks?

[12:31:21](#MN3BJViJXNcRxnuKEWDgMecn-0g5edHDTuQws901CHg) <rebolek (Boleslav Březovský)>:
I’m not sure I understand, they are in block.

[12:32:13](#k4gUuD3-1G1zZZkPrIJxglxVh6Ug45GJMKDSSoioAi4) <rebolek (Boleslav Březovský)>:
In the example above, `body` has children, so the content is `block!`. `a` doesn’t have children, so the content is `string!` 

[12:34:37](#r9anBxhr8AU4vNI2UgzWdhxBJaG6xQU3wXtJGuHN3zE) <rebolek (Boleslav Březovský)>:
@hiiamboris changed, I still need to implement support for namespaces in attribute names, but that should be straightforward as it would use same mechanism as tag names:
```
/tag-namespace tag-name "content" /att-namespace #att-name "att-value"
```

[12:41:40](#80IQIX2coCGEmgrivcdC0Fc0LeUQmTrsxkPlzBEFRcQ) <hiiamboris (NOT THIS ONE)>:
:+1:

[12:58:18](#Owjj5kOgsCWBr_AGE0jrKIaedQ6TwmTRpKLP-_fhfmI) <rebolek (Boleslav Březovský)>:
@hiiamboris Pushed. You can change the output type with `xml/output-type`. Supported values are `wbm` (word, block, map - I’ll probably remove it as it’s too limited). `wbb` (word, block, block) and `boris` (I wonder why it’s called that).

[13:05:35](#oj9UR8-YrtsoxkAkpQr13TFWB3zLKzEx23PTFOmbDQ4) <hiiamboris (NOT THIS ONE)>:
:)

[13:05:37](#T9_CouVAMvVJjwEj0AqfF8_IkZTnOYsaly-_Xe9ABgg) <hiiamboris (NOT THIS ONE)>:
thanks!

[13:08:54](#giwOnfLzMQt3qbQyxEyctmXg5MI06LOUsT1sAM8NCwQ) <hiiamboris (NOT THIS ONE)>:
still, the biggest issue with CLDR is aliases linking to other aliases linking to other aliases.. ������
I guess it's not a standard XML thing, is it?

[13:09:22](#u6PMck7hEMsdtTZ3U-hxLQdVM3siUs3qkml7FLAmJPc) <rebolek (Boleslav Březovský)>:
Can you show me an example?

[13:11:06](#gf5EaRSaQ1IjmrToVH4i6iEm8wxTuhQ8fqavSwBaBgY) <hiiamboris (NOT THIS ONE)>:
Sure

[13:11:47](#kasmWfj_HH88KKx6LquhOCAtC6_OWo4q2BpuAHwYDpA) <hiiamboris (NOT THIS ONE)>:
```
                        months [
                            monthContext [
                                format [
                                    monthWidth [
                                        abbreviated [
                                            alias [source "locale" path "../monthWidth[@type='wide']"]
                                        ] 
                                        narrow [
                                            alias [source "locale" path {../../monthContext[@type='stand-alone']/monthWidth[@type='narrow']}]
                                        ] 
                                        wide [
                                            month [
                                                1 "M01" 
                                                2 "M02" 
                                                3 "M03" 
                                                4 "M04" 
                                                5 "M05" 
                                                6 "M06" 
                                                7 "M07" 
                                                8 "M08" 
                                                9 "M09" 
                                                10 "M10" 
                                                11 "M11" 
                                                12 "M12"
                                            ]
                                        ]
                                    ]
                                ] 
                                stand-alone [
                                    monthWidth [
                                        abbreviated [
                                            alias [source "locale" path {../../monthContext[@type='format']/monthWidth[@type='abbreviated']}]
                                        ] 
                                        narrow [
                                            month [
                                                1 "1" 
                                                2 "2" 
                                                3 "3" 
                                                4 "4" 
                                                5 "5" 
                                                6 "6" 
                                                7 "7" 
                                                8 "8" 
                                                9 "9" 
                                                10 "10" 
                                                11 "11" 
                                                12 "12"
                                            ]
                                        ] 
                                        wide [
                                            alias [source "locale" path {../../monthContext[@type='format']/monthWidth[@type='wide']}]
                                        ]
                                    ]
                                ]
                            ]
                        ] 

```

[13:12:54](#koxvCu6z8XKD6RwARxSJAKZNKCykNuL41Qb7ClFjQAY) <hiiamboris (NOT THIS ONE)>:
These bastards. `stand-alone/abbreviated` links to `format/abbreviated` which links to `/format/wide`

[13:13:08](#kNFSs4WJFL9751hyyDRc-xAQn45wclbITuaKrDocgtE) <hiiamboris (NOT THIS ONE)>:
I'm so happy to jump all over the tree for them :)

[13:19:46](#qv4hxgcQTGiIrGEbFsRCs9jMocWVxMsShsQxWsLrUUM) <rebolek (Boleslav Březovský)>:
There’s nothing about `alias` in the specs so it must be their own invention which I believe they are very proud of.

[13:21:16](#S5VhqUCf5_4he9XrjPCsmjuApahZM93djJjX2ZZhpvg) <hiiamboris (NOT THIS ONE)>:
yeah no kidding

[13:49:56](#Z5wKCAsAUrJk6Fr7xx0wcGw2i9xsuKMk149DZB9XRkQ) <rebolek (Boleslav Březovský)>:
Actually, when you use path access for attributes, it would return the child’s attributes. To return element’s attributes, they would need to be in the content block:
```
/ns-name tag ["content" #tags-attribute "value"]
```
so content would be always a `block!` (it could be string` only in case that the element has no children and no attributes and I’m not sure it’s worth handling that special case).

[14:53:32](#1PHyJOCYPGe__L5VBdilleq4fNLto8IN_LYIUmF2HO8) <hiiamboris (NOT THIS ONE)>:
@rebolek no newlines anymore? :)

[14:55:32](#yGiv5C0inDMpX8iT9ycv673pvl6ytew8CGdi91V-dyk) <rebolek (Boleslav Březovský)>:
@hiiamboris Ah, I need to fix it. The newline logic is now more complicated and currently works only for namespaced tags. I’ll push a new version soon.

[15:02:27](#qXL2PGzcjdsyhG9bdL7TDTy3J76oNpZqDi72J7FHJXQ) <hiiamboris (NOT THIS ONE)>:
Smth doesn't add up here. Input:
```
<?xml version="1.0" encoding="UTF-8" ?>
    <identity>
        <version number="$Revision$"/>
        <language type="root"/>
    </identity>
```
Output (prettified):
```
[
    identity [
        version ""
        #number "$Revision$"
        "" language
        "" #type
        "root"
    ]
]
```

[15:03:23](#pdsKSH9AKUgMvwQCEzvDygJrzb-F_IiAjjMLrwYK5cs) <rebolek (Boleslav Březovský)>:
It’s actually the supposed output based on current rules.

[15:03:40](#N2pwkH778XhcOMMPmy76yBGIMEtFodsfKP-u1uor8fY) <rebolek (Boleslav Březovský)>:
As the tags don’t have content, there's "".

[15:03:50](#SOJbMfL563VCyxcjXtuIgjz6tvN5TxMmcObp3fPY2xw) <rebolek (Boleslav Březovský)>:
Maybe `none` would be better in such case?

[15:04:26](#EUFlRkHehQlSP6VVO2biBoGVOTOLsSbzIFIkX10GMN0) <hiiamboris (NOT THIS ONE)>:
I expected:
```
    identity [
        version [#number "$Revision$"]
        language [#type "root"]
    ]
```

[15:06:03](#rxFAyPpoWeyjNahWQDGW-g-qdaj2kzR41uw05J6PLu8) <rebolek (Boleslav Březovský)>:
Ok and what do you expect from this input:
```
<?xml version="1.0" encoding="UTF-8" ?>
    <identity>
        <version number="$Revision$">1.0</version>
        <language type="root"/>
    </identity>
```

I added some content for the `version` tag.

[15:07:11](#vVR7hfSiAncXaNglZmdmgb0DJIZZ7R9OEl2UbQov-CU) <hiiamboris (NOT THIS ONE)>:
we discussed it like 100 times already ������
```
    identity [
        version [#number "$Revision$" ! "1.0"]
        language [#type "root"]
    ]
```
or whatever sigil you insist on

[15:08:17](#JgkrC4usPT3J6kPDlqEnahctnjKJr4hHeXw6idVu1uQ) <rebolek (Boleslav Březovský)>:
My current solution is that content comes first and attributes follow.

[15:09:10](#wma9r_CbRNAb7SCeR8IabMsaOzM0fFa4AkoJ0v4_Qb0) <rebolek (Boleslav Březovský)>:
So my idea is 
```
    identity [
        version ["1.0" #number "$Revision$"]
        language ["" #type "root"]
    ]
```

[15:09:22](#OUw1LRvAJOBo9AHSCCQYaJoHjpezCB5V3UVfwAd3gOs) <rebolek (Boleslav Březovský)>:
Or `none` instead of the empty string!.

[15:09:59](#5wVol-iHN4IMYu9Zq0GpKb_DQ801dPtS3arxbMGAiBk) <hiiamboris (NOT THIS ONE)>:
No, `!` is vastly preferable to numeric index or none.

[15:10:15](#LTTO8uSRxPRxg2DTvW-kdRBx5zIE3FHpDOmOWKIG2BI) <rebolek (Boleslav Březovský)>:
By you.

[15:10:23](#sxMvl6fJ0PBhoCHIyg5p7Yxw4smiByKxCzU3GvAulVk) <hiiamboris (NOT THIS ONE)>:
Yes.

[15:12:22](#Vh83keXNOa9AQ7nosTINfcSbrl_Me8oVONjgdDCkDhc) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
We should write some visual tool to enable users to define their preferrable XML outputter :-)

[15:12:34](#BtS8M7Mvbf5XKr5t2cCZqTtf-0X6HK9tG0pAITIPg7M) <hiiamboris (NOT THIS ONE)>:
Also, I thought about your idea of `<a>here</a>` -> `a "here"`. It's not gonna work. 
E.g. I may have 
`<list><a>here</a><a type="b">there</a>` 
and it will produce:
`list [a "here" a [#type "b" ! "there"]]`
This will be impossible to work with as there will be separate logic depending on whether an attribute is present or not.


[15:12:36](#ytd_Wa2R3phNBmjtqx82q5-_30S0NiDOWNpM2wpyYgs) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Keep the good work guys, it is interesting to watch!

[15:13:21](#oQjqnYaH1WIIcum11EnRUeA2qoJyx6ZiPIxPF8Umvz4) <hiiamboris (NOT THIS ONE)>:
:)

[15:14:19](#-J46Up33puK7KcuDTqs87iqjPqeeF_g5v1vvTX-6V-o) <hiiamboris (NOT THIS ONE)>:
* Also, I thought about your idea of `<a>here</a>` -> `a "here"`. It's not gonna work. 
E.g. I may have 
`<list><a>here</a><a type="b">there</a>` 
and it will produce:
`list [a "here" a [#type "b" ! "there"]]`
This will be impossible to work with as there will be separate logic depending on whether an attribute is present or not.
The input was uniform so the output should be uniform as well:
`list [a [! "here"] a [#type "b" ! "there"]]`

[15:14:29](#fSgeGvGhINlkChs830x5qA9z0ibP6yxDLXaNDl_CLi8) <rebolek (Boleslav Březovský)>:
@hiiamboris I don’t understand. What separate logic? Also, it doesn’t look like anything I want to produce, there’s `!` in it ������

[15:14:46](#ABcP-I2-UpDCVI815Sa-61i-aH-_gR6-Vnb2DSD1TWA) <hiiamboris (NOT THIS ONE)>:
ok I'll change `!`

[15:15:00](#JngwZ5pSdYH4jGGEDQy3kIgS3acio4scNnEqqXcIsis) <hiiamboris (NOT THIS ONE)>:
* Also, I thought about your idea of `<a>here</a>` -> `a "here"`. It's not gonna work. 
E.g. I may have 
`<list><a>here</a><a type="b">there</a>` 
and it will produce:
`list [a "here" a [#type "b" @bolek "there"]]`
This will be impossible to work with as there will be separate logic depending on whether an attribute is present or not.
The input was uniform so the output should be uniform as well:
`list [a [! "here"] a [#type "b" @bolek "there"]]`

[15:15:05](#LM5_84y_RhuvJd8IlS8kHpTRT4RIA5Z8lRwkgvIiSCs) <hiiamboris (NOT THIS ONE)>:
better? :)

[15:15:11](#3iqYNzzGpnHJSMt4HSm_D8jAqHLRUW7tBdOdl7giPSs) <rebolek (Boleslav Březovský)>:
������

[15:15:20](#5Z4xqcrVWasfGjWtRYT6PV9-zm3s-xpVtoQ7Ov-9_o4) <hiiamboris (NOT THIS ONE)>:
* Also, I thought about your idea of `<a>here</a>` -> `a "here"`. It's not gonna work. 
E.g. I may have 
`<list><a>here</a><a type="b">there</a>` 
and it will produce:
`list [a "here" a [#type "b" @bolek "there"]]`
This will be impossible to work with as there will be separate logic depending on whether an attribute is present or not.
The input was uniform so the output should be uniform as well:
`list [a [@bolek "here"] a [#type "b" @bolek "there"]]`

[15:16:07](#rPi-YcXJxR3iJU-1SxRlfZ1Rtbwx_-eMp5QtBiyqyTo) <hiiamboris (NOT THIS ONE)>:
separate logic because I can't `for-each [('a) b [block!]] list [..]` anymore

[15:16:09](#AITrXyqxgjo98zgSyhyFHq2RQuIxBQMmlmJPmRUNo8E) <rebolek (Boleslav Březovský)>:
With my position-based content, it would be
```
list [a ["here"] a ["there" #type "b"]]
```
I’m not against having a block always present

[15:16:53](#RZiWa1imdeRW2nS7cVmI6udIKN9yOCLkZwgzXuqZpe4) <hiiamboris (NOT THIS ONE)>:
I don't like magic numbers.

[15:17:12](#8TTU9zmXH-Kh7BFxDlG6-3rnZtAc9eB234wsQU3cE3s) <hiiamboris (NOT THIS ONE)>:
Besides, if attributes go after the content, it becomes impossible to read.

[15:17:30](#Sh2B62lFlHhP5HMFCqPL173-q5qjURqmMpP46NXAUK0) <hiiamboris (NOT THIS ONE)>:
* Besides, if attributes go after the content, the output becomes impossible to read because content may be hundreds of kBs.

[15:17:54](#I-u6xw7lhB4Y5BNOaMB2_9CKqDQTzrzmn0poq7LBMPE) <rebolek (Boleslav Březovský)>:
That’s not an argument, there may be hundreds of attributes too.

[15:18:20](#ByJG55gdJBkMEpwvTCrU_Zyisx-k_c-qs-a7wSEsy2Q) <hiiamboris (NOT THIS ONE)>:
I'd love to see that. What I'm talking is real XML files.

[15:23:35](#WPjA86AmK_vC_muSTb_3SQMuhX-RMvLrv3O-6fPf2Ww) <rebolek (Boleslav Březovský)>:
You don’ like magic numbers, I don’t like magic sigils.

And it’s actually not a magic number. What we’re producing here is a dialect that has few simple rules and one of them is that content always comes first before attributes. I’m not saying it’s the best rule and I hope we can come up with something better but I don’t believe `!` is it.

[15:24:12](#E0oXrf12j9Uh6CVG-vkhuMfP-uHr-znf82BFFyXWfYA) <hiiamboris (NOT THIS ONE)>:
I do :)

[15:24:34](#5KQ02bbpD1qpOIbmM1Bxz2LkBKhPtGhwQOab6UW6CyI) <hiiamboris (NOT THIS ONE)>:
Why? Because I can compare XML to Red output visually and tell if it's okay or not.

[15:25:14](#zfJ8T9W1aJtMNU-CVmWy3LWpAuxUrem5ZOIJjXDcHd0) <hiiamboris (NOT THIS ONE)>:
Why else? Because I can look at the Red file contents and figure how to access this or that thing, without jumping to the end of the scope somehow.

[15:32:56](#b-g9hDCAnPxGP0BTkErqvj5FFSQKKn44IgP6mmFeiMY) <rebolek (Boleslav Březovský)>:
Newlines have been fixed. Next steps:

- content will be always a block and attributes would be part of it
- add an alternative emitter (or a switch to the Boris emitter) that would hide content behind an accessor instead of putting it proudly in the first place

[15:33:20](#ePcmWyuVTVfxxSSuWXsX2lkMv5QwkMiqhwmwpEyrkk8) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Guys .... couldn't we just ... agree to disagree? I thought, that's why we are prototyping various outputs? Sometimes just simple look into a list of examples show, how much you (dis)like to read it. You will e.g. realise, that you are overloading the look with some repetitive patterns you might be able to remove by a slightly different aproach .... 

[15:34:22](#jH4itVthh6nfFePmAB-HjAWRYX6f3_Ii1ysSuBExRwg) <rebolek (Boleslav Březovský)>:
@pekr that’s why the current XML implementation has an option to switch between various emitters, so we can try them and see what’s the best fit.

[15:48:10](#wsinyyvFV8XV6afDu8OwsKqvtagBfvN-V_cBB3B5VaE) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
I know, but I somehow got a feeling that you kind of fight against the @hiiamboris proposal in terms of "his" emitter? :-) OK, will let you work and watch the outcome ....

[15:50:05](#aXBY9GyX7RL_hozWo5OivSHawQAv9nq4nXb50Wx9xs0) <rebolek (Boleslav Březovský)>:
No, I like some of his ideas and I don’t like some too. I will implement them anyway so either I can say "hah, I told you so", or be convinced they weren’t bad.

[15:51:59](#qxPtJ590-SrfurGxexirQ5e8Pp6rPR4q893HZ_ZyB0I) <rebolek (Boleslav Březovský)>:
I call it his emitter just because it’s based on his ideas and I don’t have a better/more descriptive name yet. My emitter is called `wbb` because its structure is word-block-block. The other emitter has more free form structure, so I can’t choose some similar simple name. As always, I’m open to suggestions.

[15:53:07](#naWLaVH1wtP75Rdoeb6B7VnTepdHnSFitv75Rvv4FQA) <hiiamboris (NOT THIS ONE)>:
I knew there will be `Boris` emitter a few days before you coded it ������

[15:53:47](#Cz_d8X_cjh_6j4xoa1yvXj4zle7AuM0juVfAKi6OuJk) <hiiamboris (NOT THIS ONE)>:
On a different thing. I would also like some smart prettification algo for the future. For example here's what I'm working with:
```
types [
    type [#key "calendar" #type "buddhist" ! "буддийский календарь"]
    type [#key "calendar" #type "chinese" ! "китайский календарь"]
    type [#key "calendar" #type "coptic" ! "Коптский календарь"]
    type [#key "calendar" #type "dangi" ! "календарь данги"]
    type [#key "calendar" #type "ethiopic" ! "эфиопский календарь"]
    type [#key "calendar" #type "ethiopic-amete-alem" ! "Эфиопский календарь &quot;Амете Алем&quot;"]
    type [#key "calendar" #type "gregorian" ! "григорианский календарь"]
    type [#key "calendar" #type "hebrew" ! "еврейский календарь"]
    type [#key "calendar" #type "indian" ! "Национальный календарь Индии"]
    type [#key "calendar" #type "islamic" ! "исламский календарь"]
    type [#key "calendar" #type "islamic-civil" ! "Исламский гражданский календарь"]
    type [#key "calendar" #type "islamic-rgsa" #draft "contributed" ! "исламский календарь (Саудовская Аравия)"]
    type [#key "calendar" #type "islamic-tbla" #draft "contributed" ! {исламский календарь (табличный, астрономическая эпоха)}]
    type [#key "calendar" #type "islamic-umalqura" #draft "contributed" ! "исламский календарь (Умм аль-Кура)"]
    type [#key "calendar" #type "iso8601" ! "календарь ISO-8601"]
    type [#key "calendar" #type "japanese" ! "японский календарь"]
    type [#key "calendar" #type "persian" ! "персидский календарь"]
    type [#key "calendar" #type "roc" ! "календарь Миньго"]
    type [#key "cf" #type "account" ! "финансовый формат"]
    type [#key "cf" #type "standard" ! "стандартный формат"]
    type [#key "colAlternate" #type "non-ignorable" #draft "contributed" ! "Сортировка символов"]
    type [#key "colAlternate" #type "shifted" #draft "contributed" ! "Сортировка без учета символов"]
(...)
```
It's mostly nicely aligned and I can visually analyze the data. But it's tricky and experimental. Right now I settled upon this rule: if block has no more than 8 items (4 pairs) and no other blocks, then I can remove newlines from it. Other idea I had is to mold part of the block, e.g. 100 chars, and if it's shorter than 100 chars, then strip newlines.

[15:55:32](#LwadNAr88F2cbNrEMQJZFYzNc0r1KJn7tiB7pPRiRMI) <rebolek (Boleslav Březovský)>:
Such smart prettification probably should be separate project as it’s generally useful.

[15:56:13](#p6IiCSDRPEtASksbP_FaXzJ9ztEUENQRysiRYtrg868) <hiiamboris (NOT THIS ONE)>:
Could be..

[15:56:54](#3-SaD9ygwOwsNvcuu3dnOadopSvmRAvn2dUrbpidJVM) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
I have noticed some prettifier in terms of HOFs?

[15:58:53](#-16C6wE453lO_sv_dXZJZMRyBrkZDxapSuMFd1stoJg) <hiiamboris (NOT THIS ONE)>:
There's only an old `prettify` experiment of mine. It was written for *code*. But now that I think of it, maybe it can work with data separately too.

[15:59:35](#NNoWvc-vN1h4tWPsUC0txp1zfJ3GG59oAPLa2PPByDw) <hiiamboris (NOT THIS ONE)>:
The big question is, what rules to code into it :) Where they will work and where not.

[16:18:04](#jq3Na8ztfojdpJdVWkGzhtIL2rkRUO7KJeL095YGteU) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Unless you try, we might never know :-)

[17:01:56](#lNQ5PCLM9pFDAiDNG9mQ8M3uYCHNFAp1hzbHZAC2ulM) <hiiamboris (NOT THIS ONE)>:
I'm trying but it crashes :)

[17:04:05](#_VWMX3hPKrIwVz3hoBt_MKhjviwFuVWk3KAS_ILsEiU) <hiiamboris (NOT THIS ONE)>:
I'm glad we have `trace` now

[17:09:38](#0olKiJHMYf896pdY4XRw0XVJiDLg93XcQLaUCySo-74) <hiiamboris (NOT THIS ONE)>:
I broke Red again https://github.com/red/red/issues/5003

[17:40:38](#c8zc4kXsOs1AGvSAQGJVOvTevBvRH2D9fOO4i7F5jXk) <hiiamboris (NOT THIS ONE)>:
OK [pushed a new version](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/prettify.red)

[17:41:25](#ZR2aQGmLQ92VytHRCElLGAHuzo88AljTEQ7HpAiVJI0) <hiiamboris (NOT THIS ONE)>:
For our case it's `prettify/data`

[23:40:31](#zosTa-huGgUNJR7wnm2-TqXU1bwpnmpqsdMOsSHhc-o) <GiuseppeChillemi (GiuseppeChillemi)>:
I have a design curiosity: why to get a value in a map you do: 
`select map 'column` and it has not been used `pick map 'column`?

[23:40:54](#AkkKXq16k2CaUqqFh7XhB1GYOzkSAsYXygDrVzIMUJw) <GiuseppeChillemi (GiuseppeChillemi)>:
* I have a design curiosity: why to get a value in a map you have chosen 
`select map 'column` and it has not been used `pick map 'column`?

[23:41:13](#ONMIy3lQT_4aL5JmLuEwGpZ0LWA1RHicOfy1DKeVTeQ) <GiuseppeChillemi (GiuseppeChillemi)>:
* I have a design curiosity. Why to get a value in a map you have chosen: 
`select map 'column` and it has not been used `pick map 'column`?

## 7-Dec-2021

[6:18:39](#E7j_g6y1JlYorZN94x8Zu_VtWbSY4_dzKoj1sMid6K4) <rebolek (Boleslav Březovský)>:
`PICK - Returns the series value at a given index.`

There’s no index in map, as they are unordered.

[9:56:30](#PZPIKp-QHqYMlKlNz9PwDzaAa2D_X70clTzzVunSzNI) <rebolek (Boleslav Březovský)>:
@hiiamboris I guess this is what you want?
```
[
    cyclicNameSet [#type "dayParts" 
        cyclicNameContext [#type "format" 
            cyclicNameWidth [#type "abbreviated" 
                cyclicName [#type "1" ! "zi"] 
                cyclicName [#type "2" ! "chou"] 
                cyclicName [#type "3" ! "yin"] 
                cyclicName [#type "4" ! "mao"] 
                cyclicName [#type "5" ! "chen"] 
                cyclicName [#type "6" ! "si"] 
                cyclicName [#type "7" ! "wu"] 
                cyclicName [#type "8" ! "wei"] 
                cyclicName [#type "9" ! "shen"] 
                cyclicName [#type "10" ! "you"] 
                cyclicName [#type "11" ! "xu"] 
                cyclicName [#type "12" ! "hai"]
            ] 
            cyclicNameWidth [#type "narrow" 
                alias [#path "../cyclicNameWidth[@type='abbreviated']" ! ""]
            ] 
            cyclicNameWidth [#type "wide" 
                alias [#path "../cyclicNameWidth[@type='abbreviated']" ! ""]
            ]
        ]
    ]
]
```

[9:58:30](#_fGvIPShPW4NWWc4FiOv3pXjMRlQ703TcNvP-uTvsuQ) <hiiamboris (NOT THIS ONE)>:
Almost. No reason to leave `! ""` though I guess.

[9:58:46](#2nehZ6sLh2Yxd6ozxy4F3dOgzfew_Y4n5IHfKGrxm1A) <hiiamboris (NOT THIS ONE)>:
At least I removed these and had no problem.

[9:59:03](#0ZEJr701YKXJtuYlnlpM9sJn7Lq4SbC72himxHVAQCY) <rebolek (Boleslav Březovský)>:
Ok, it's a WIP. I'll remove them.

[10:00:11](#eZYW5lFqHjk8r14xfflO7rUQp4svIQoKhsDFaWgPlhM) <rebolek (Boleslav Březovský)>:
ok, removed

[10:00:30](#8MDsUW349zSbjKFhHTpg42ZAFSelDZ1wqT_b3Zlzd_A) <rebolek (Boleslav Březovský)>:
I'll run some tests, cleanup the code and push it.

[10:01:31](#zmuEnv4Hw2GPOMR5SKS5U4ZUDNWAQKu8q0hk1rKIxK4) <hiiamboris (NOT THIS ONE)>:
:+1:

[10:02:47](#1tvl7NCr_fb1LaFij56OnZ0ytYefdKuEYHStIiSJepA) <rebolek (Boleslav Březovský)>:
@hiiamboris and what do you expect from this:
```
<a>
  some text
  <b att="val">hello</b>
</a>
```

[10:07:17](#Gkq5KVzW1zB0dwq78UQlNAskmmaMbDt818l8ySjGGos) <hiiamboris (NOT THIS ONE)>:
```
$ unxml.exe 2.xml
a [
    b [#att "val" ! "hello"]
]
```

[10:07:53](#83MmOU4eWuMjsniO-7leFbbs3JLmlwUTbI5-g2hXU6M) <hiiamboris (NOT THIS ONE)>:
oops, xml2.red ignored "some text"

[10:08:30](#SWmNyVvA7QO5wSijN71KoSxAiTATNnxn_zyTilTqNF4) <hiiamboris (NOT THIS ONE)>:
should be:
```
a [
    ! "some text"
    b [#att "val" ! "hello"]
]
```

[10:10:02](#V130i0j340ukb3_U7Iy4eaydXErChtj6XzkTTtQDSB8) <hiiamboris (NOT THIS ONE)>:
that is, text and tags may preserve original order

[10:10:21](#nwryDIXeBET_lIZqLveD-UO3tMffwZJFMGOMMLZEox4) <hiiamboris (NOT THIS ONE)>:
there will be no such thing in CLDR data, but maybe somewhere it will be useful

[10:36:13](#6nZKfrC_68cbARnmJWEZfK8DzrWIimCdwPXsQhSA8jU) <rebolek (Boleslav Březovský)>:
I would say that not MAY but SHOULD. Or MUST.

[10:55:18](#ODpxeMk5dB2uaohq4AD9-23BJEWVAb4B-7Ld391-78U) <GiuseppeChillemi (GiuseppeChillemi)>:
@rebolek Thank you, I was thinking on which command use to get the Nth column without using `index? find words-of table column`

[15:25:45](#-E8110EI__MFRa26EJcJo4XrFAKZCi6vmeNe60fKpg8) <rebolek (Boleslav Březovský)>:
@hiiamboris are you fine with using `@` for metadata?

e.g.:
```
<!-- Comment -->
```
becomes

[15:26:16](#EBHBEUcXagI_1No6Ag2sehbbdRBG_34dxENsE78TcKM) <rebolek (Boleslav Březovský)>:
```
@comment "Comment"
```



[15:30:13](#CZqzsk8BvmVYW5tsp9ZDecvyrTRi1E8xTYZ_XRQe-zw) <rebolek (Boleslav Březovský)>:
Also, if you have a better name for "your" emitter, just let me know :-)

[15:45:26](#yNepdk5ZZOahvuWSZw0pbKV6xTI5JnQjFDG9rFHnc6o) <hiiamboris (NOT THIS ONE)>:
didn't think about it :)

[15:46:11](#pNg-k2fzS1kW6qO462XEKq0A2sZqZWt5l5DGAj2TjPo) <rebolek (Boleslav Březovský)>:
It’s strange to write commit messages like "Boris now supports some metadata" ������

[15:46:17](#VY_n33YFLyTAdyvpOItNwE4swl6aMhMKO36R7r5iaU8) <hiiamboris (NOT THIS ONE)>:
������

[15:47:52](#1KeZ95B_UglWO64PfnQzp8MWQZDkaYZbs0iHYxmxR4I) <hiiamboris (NOT THIS ONE)>:
idk yet, maybe Gregg will have any ideas

[15:47:58](#DV2R2DsTmO9znL8McZzNllwZNELiL4GpI_hpayeDKWA) <hiiamboris (NOT THIS ONE)>:
as for comments, I'm fine without them too

[15:48:32](#9dg5xg4t0e8r86aZLQPHVAAcxkJaNeDlWKp6EX3-SLU) <hiiamboris (NOT THIS ONE)>:
`!comment` or `@comment` are okay

[15:49:26](#weB_0w9j76vUmHt1JDKrwLJ7qA8hW0ET54CfawjljD0) <rebolek (Boleslav Březovský)>:
I understand that, but there are other metadata too, like processing information that may be useful for someone. You need to use `/meta` to get them anyway.

[15:50:16](#s_29kHoFe8h5JpIptaC0MOOv37B2Yz6gZsyr_azv9yI) <rebolek (Boleslav Březovský)>:
Ok, I’ll use `@various-metadata` so they can distinguished by type.

[15:50:43](#jlmqxqaqANlyRXmtWYjpgRS0q35P9H5sC-vRk-1Tlt0) <hiiamboris (NOT THIS ONE)>:
sure

[23:48:23](#sVdlkiRGU2r0x90cQhHOuEnyrXle6MnBFCd8gGXq4HI) <greggirwin (Gregg Irwin)>:
>  also can use paren! for attributes, that way I don’t need some markup to make it obvious it’s not content.

This is an interesting idea, as parens in natural language are used for "optional" information.

On `!`, what about `text`. It's always going to be text, because we're parsing it from XML text, and then if we have a semi-mapped loader there could be `data` like GUI elements have for the duality of text and data content. `!` is just not worth it, long term.

Without analyzing *lots* of XML, which I don't think we have time for right now (as a single corpus, or just a few, will bias our results) we're doing a lot of guessing. @dander may have info up his sleeve, and it's worth a search to see if someone has done this, but what are the max/avg/percentile for content and number of tags. 

@hiiamboris makes a good point about being able to see a) if/how an XML doc maps to Red. Looking at just the result b) can you analyze it in raw form. Then we have c) clean path access for common cases and d) how hard it is to iterate for all possible access. It's all tradeoffs.

You know I love being able to see raw data clearly, but this is where it only works for small or prettified data. And you can still miss things. So I think the raw data value is lower. Build good, lightweight tools. Having a standard viewer available is kind of like the `editor` in R2. Maybe seems a bit heavy, but if it works across data structures it packs a lot of punch.

Aspect `a` (viewable mapping) is also nice, but may also be best served by a diff-like viewer. Maybe the XML module includes all these things, because if you need one, you probably don't care about another 50K in your app. ;^)

This brings us to `c` and `d`, which is all about how we use and access the data structure. 

## 8-Dec-2021

[0:06:46](#7nt_pG9q7JnOtbkIQsraeB3RHDly4m-nQ9z_DEV2y0w) <greggirwin (Gregg Irwin)>:
This is all really good work, and will make a great writeup, but if we distill it, and update the middle of https://gitlab.com/rebolek/markup/-/wikis/home, where various structure options are listed, what have we learned, and what new options do we need to list there?

Watching the chat here, I'm leaning toward a basic, fixed structure that easy easy to reason about, which makes it easier to write processors against, and where HOFs can be applied. The fly in the ointment is multiple values. For those cases, internal `parse`-based access may be the way to go.

I'm OK with saying "Here's how it works, and these are the limitations. If your data is a simple tree of objects, path access works great. Here's how you access attributes. If your data is a document, with repeated sections, use `parse-doc` which is a dialected func where you can define actions for elements by tag name, ..."

Another way to tackle this is to lay out a half dozen use cases for how loaded data will be used, and optimize for those. There are links in the markup notes on other systems that may help. And if we just choose the best or most popular system to emulate, so be it. We cannot solve the problem, fundamentally, because the data model is set in stone.

[3:31:15](#-yfLHmlacfOwL-xSEbMfP_q31_A2yys_bqWdbRQpEKQ) <greggirwin (Gregg Irwin)>:
I'll have to get my head back into XML from the core spec to be any help on thoughts for metadata.

[7:23:22](#4tjAFUJBGeo0uIZe1s2B26HvKmnMyRiV62ty-6iagQI) <rebolek (Boleslav Březovský)>:
> what about `text`

The problem with `text`is that it can be used as a tag name and then you wouldn’t be able to distinguish if it’s a tag name or a keyword.


[8:36:32](#XKWWPM56b8Nvzexw_CucRq_Jm_5_mvtrsK-MJs-1ZFM) <zentrog>:
The nice thing with json is that it just has maps and lists, and those are well suited for distinct kinds of tasks. The problem with xml is it has more data structures, which are more general so they apply to more kinds of tasks, but are less well suited to all of them. So if you are trying to decide how to generate some schema, you might decide to store keys and values in attributes, or maybe elements and text. Maybe you would base it on humans editing the document and esthetics, or maybe it is machine generated and you just need to accept whatever nightmare it spits out at you.

I guess what I'm trying to say is I don't think there are going to be any hard and fast rules for number or size of xml data, and almost certainly someone can come up with some gigantic xml that tips over the system, but they probably should be using a stream-based xml processor anyway. I agree with "basic, fixed structure that easy easy to reason about, which makes it easier to write processors against, and where HOFs can be applied". That should handle the vast majority of cases. If simple path lookup works for cases where there is no ambiguity, that's great! Make simple things easy, and complex things possible, right?

[8:43:56](#90fr5_upEjwHjafd_Xqe59W9CbyKrjbgtVAwYzDcwfA) <zentrog>:
The nice thing with json is that it just has maps and lists, and those are well suited for distinct kinds of tasks. The problem with xml is it has more data structures, which are more general so they apply to more kinds of tasks, but are less well suited to all of them. So if you are trying to decide how to generate some schema, you might decide to store keys and values in attributes, or maybe elements and text. Maybe you would base it on humans editing the document and esthetics, or maybe it is machine generated and you just need to accept whatever nightmare it spits out at you.

I guess what I'm trying to say is I don't think there are going to be any hard and fast rules for number or size of xml data, and almost certainly someone can come up with some gigantic xml that tips over the system, but they probably should be using a stream-based xml processor anyway. I agree with "basic, fixed structure that easy easy to reason about, which makes it easier to write processors against, and where HOFs can be applied". That should handle the vast majority of cases. If simple path lookup works for cases where there is no ambiguity, that's great! Make simple things easy, and complex things possible, right?

[8:47:50](#p4QcaTycXFLyOZ9woqD_ckOqDjMvG2KzBuNwrHlxat4) <zentrog>:
Here's a (pretty small) example that an application I work on generates. It can produce documents which have this entire xml embedded within an *attribute* of another xml document. I don't take any responsibility for this ������

[9:10:25](#yYhZQD7178N-ZL5jwvq_ywIs_50x-bY_VMCSbQF3Xok) <hiiamboris (NOT THIS ONE)>:
Scary :)

[10:54:19](#uE1xafLGWwAqp-m62QDMJ3oyCN6h84gnA3-b9JTkIWI) <rebolek (Boleslav Březovský)>:
@zentrog:matrix.org exactly, why does it allow both attributes and elements if there’s no clear distinction between them?

[11:03:15](#7u4fhgaw4QJc6USI6jO5H6Vn9Bp4awafHnd-OTJNoRU) <hiiamboris (NOT THIS ONE)>:
but such attribute will have to be loaded manually, right?
while element gets transformed into a tree automatically

[11:03:59](#xsHfvVkG77ter2eNMGYlzZ27iGlI3sTFCzgefeHLmAY) <hiiamboris (NOT THIS ONE)>:
that is, I don't think they meant attributes to hold XML tags :)

[11:04:10](#O_TFXU390G9_ja8K9_MjqSFwJCYIprL9kxLRvF5l62c) <hiiamboris (NOT THIS ONE)>:
* that is, I don't think they meant attributes to hold XML elements :)

[11:08:17](#pJUQpT2OZ-zwXEJNiJQLuARKC57zmw-aexegVlX5auM) <rebolek (Boleslav Březovský)>:
The problem is that the ambiguity. Should I write:

```
<book author="J.R.R.Tolkien" name="Return of the King"/>
```
or
```
<book author="J.R.R.Tolkien">
  <name>Return of the King</name>
</book>
```
or
```
<book>
  <author>J.R.R.Tolkien
    <name>Return of the King</name>
  </author>
</book>
```
?

This is of course a made-up example but the difference between attributes and elements is very blurry.

[11:08:35](#wJIoqQgFhWWUijr03aN37xLarDec2x1wkj6LrAPiiPg) <rebolek (Boleslav Březovský)>:
* The problem is that the ambiguity. Should I write:

```
<book author="J.R.R.Tolkien" name="Return of the King"/>
```
or
```
<book author="J.R.R.Tolkien">
  <name>Return of the King</name>
</book>
```
or
```
<book>
  <author>J.R.R.Tolkien
    <name>Return of the King</name>
  </author>
</book>
```
or
?

This is of course a made-up example but the difference between attributes and elements is very blurry.

[11:08:56](#Ad3Jm6czINAN7aHSic7UIEFIj4MSui1MjnKL2Ycnt9M) <rebolek (Boleslav Březovský)>:
* The problem is that the ambiguity. Should I write:

```
<book author="J.R.R.Tolkien" name="Return of the King"/>
```
or
```
<book author="J.R.R.Tolkien">
  <name>Return of the King</name>
</book>
```
or
```
<book>
  <author>J.R.R.Tolkien
    <name>Return of the King</name>
  </author>
</book>
```
or
```
<book>
  <author>J.R.R.Tolkien</author>
  <name>Return of the King</name>
</book>
```
?

This is of course a made-up example but the difference between attributes and elements is very blurry.

[11:14:27](#cCtlYbDGHopI516Uib2o6MNZqYffUBRROFRq0FTP17c) <hiiamboris (NOT THIS ONE)>:
Indeed.

[11:18:40](#BhCekCyuLuF7AG4Sq8cBzj6ySeBN-hnBDwTM7IS6uzw) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Who's the president of United Nations? I will ask him to vote on prohibiting XML usage around the world :-)

[11:22:32](#B2i7F_naELzWtvwGy8rvDvUj0ruVzOWx882chYQI_Zs) <rebolek (Boleslav Březovský)>:
:)

[11:23:34](#0s09LOt613gwdpclSknzLL_N7_zAOhWA-z3I-z_RBcA) <rebolek (Boleslav Březovský)>:
XML is a shitty format but at least it’s open and standardized. There are other formats that are shitty too but closed and proprietary. If you want to ban something start there ������

[11:29:40](#pKLi7-bjnONYKAz7fbVF3M_0Xx3MEFyspomjsF5466s) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
"standardized" is a way too strong claim, but yeah, whatever :-) As for other formats - as far as they are kept being used in closed environments, I don't mind. XML is a typical example of overenginnered commitee kind of work and one of the reasons for JSON existence :-)

[11:30:04](#7T8OoZ4g8wzM_B-AGT2_DjfVLpC3KroXb61BPoWDh_M) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
But anyway - it is clear we still need it, because we are going to face it quite often, so definitely keep the work :-)

[11:31:45](#ET0nQfVnB4tshBktPkHJWpw_4Ppy3_sYGWvGkXf5fDA) <dsunanda (dsunanda)>:
@rebolek > but the difference between attributes and elements is very blurry.
It is!
Technically, attributes can appear 0 or 1 times in an element while elements can appear 0 or more times in their parent element.

There is no way to decide whether something should be an attribue or an element if it can appear only 0 or 1 times.

In your example, it could be argued that books may have multiple authors and multiple titles - so both should be elements for future-proofing. That argument applies to almost anything you might want to put in XML format. So attributes are not very useful in reality.

[11:32:14](#6OlcFt9Rw60WsZ_w1lBNhwxZwJBBEyvOavqnoFIYUo0) <dsunanda (dsunanda)>:
* @rebolek > but the difference between attributes and elements is very blurry.
It is!
Technically, attributes can appear 0 or 1 times in an element while elements can appear 0 or more times in their parent element.

There is no way to decide whether something should be an attribute or an element if it can appear only 0 or 1 times.

In your example, it could be argued that books may have multiple authors and multiple titles - so both should be elements for future-proofing. That argument applies to almost anything you might want to put in XML format. So attributes are not very useful in reality.

[11:50:50](#S7QDCeAyQoXVQMxSt0s98Ve6AjKTjo0ArVkR1KrSHxo) <rebolek (Boleslav Březovský)>:
> "standardized" is a way too strong claim

No, it’s not. There are two published standards, XML 1.0 and XML 1.1 and XMLs are much more standard conforming that HTMLs. It’s overengineered? I don’t doubt that. But most MXLs can be read with a standard parser, unlike HTMLs, which are full of errors and the parsers must conform to at least the most common errors.

[11:52:23](#FodEbm0S16Zfj4T-z1eOqkrNBL_b6F83fauBa0vxH8U) <rebolek (Boleslav Březovský)>:
@dsunanda 
> attributes are not very useful in reality

I wholeheartedly agree with it. It just complicates everything. It’s an alternative solution to a problem that was already solved.

[17:35:25](#Zd7jqC8KCcsWcACd6XKIwTtIdPHvoDVK1HWB7XYI0lw) <zentrog>:
hiiamboris (hiiamboris): Yes, that's exactly right. There is a lot of serialization/deserialization going on. It is wasteful to do this, since all those angle brackets, quotes and other things need to be encoded. In this case, it's really less about the format, and more about preserving application state. We could as well have picked a binary format, though that would be even more opaque. In this case, the biggest influencing factor for getting to this point was probably just the existing tools that were built into the framework for state management. I would say this example is not very typical of an interoperability format, but could still be something I would want to process.

[17:44:36](#5QHndoczoSW7EYfK8quaCiFgIuGRsUFp5_Savh6_R8M) <greggirwin (Gregg Irwin)>:
@rebolek's example makes @zentrog:matrix.org 's point concretely. You can do things how *you* want, *inside* the standardized format, so there's no way to standardize an interface that will work for everyone. 

[17:45:07](#6fWmtrcZB7_6pX1et3OYLmR0Dj962A83fviYvGQm_DU) <zentrog>:
Yeah, that was a great example!

[17:49:01](#6cDiN_pd3Gv-gnLfdNWvMVaGB7D2V1bjrX4BlLj0SUs) <greggirwin (Gregg Irwin)>:
I can also imagine, though don't know if it's true, that having the attrs before values was done for streaming processing order.  That is, if you don't have all the attrs to apply to an element, you have to parse/load the entire element before finding them. 

[18:00:12](#bWqWKl8A1MdeRw4XLlpgdVoAIgjq9wHkVoNwOGSP-N4) <greggirwin (Gregg Irwin)>:
Thanks for that sample file @zentrog:matrix.org. Makes me think that our structure, whatever it ends up being, can't make things too much worse. ;^) On a more serious note, how do you guys edit or manage data like this? Is it *all*  machine processed, or do you have tools you like when having to work with raw XML?

[18:09:18](#IQDxc55RzH_SRO5ZmNSPz09qo4dQokMaXD8tlV6pwjg) <zentrog>:
![](https://matrix-client.matrix.org/_matrix/media/v3/download/matrix.org/tjQRXvEhiijHdNEYPmaEKFjZ)

[18:09:19](#MX_B8pPfn63lCNK_r3LrejKFUwRh3b4jCZvGTaJ689I) <zentrog>:
greggirwin (Gregg Irwin): For serialized stuff like this, it is almost always just machine processed, but I still will look at it sometimes to make sure that changes I think should be in there are actually present. In those cases, pretty printing + code folding goes a long way to make it browsable, so long as it isn't too huge. Here's what that same document looks like in VS Code with the XML Tools extension after formatting and a bit of folding


[18:09:59](#YbEZiNM5_GC64iZ17gscYMsrVYCbnpVAXUNj4_dXchU) <zentrog>:
Helps a lot, right?

[18:12:09](#G5xhBYMaLgXEYtHZW5vIxQg-53rCR8-BgaSwBodVMSU) <greggirwin (Gregg Irwin)>:
:^) I stand by my idea that we can build more helpful tools. 

Thanks for the input @zentrog:matrix.org. :+1:

[18:12:19](#-u-eH0JIBiKooQ_sk5pVmzmnEpn_MO00kLTmws-KR0o) <zentrog>:
For really big nasty stuff that can't be parsed in a reasonable amount of time, or when I was doing more xslt work, I have an old (version 6) of https://www.oxygenxml.com/ which suits me well enough

[18:12:53](#nvhjYK9YAZFXVjODhPPI0XUZRCdgplxqM-ieeG8n-Ec) <zentrog>:
They went up a lot in price since then, and I never had a compelling reason to upgrade

[18:13:58](#EDUwkZytaX60TAoyUAiEtTM9ABeWfXZIAuNakZzROik) <greggirwin (Gregg Irwin)>:
Good to know. We can point people to that if our minimalist tools aren't enough.

[18:17:09](#s5-dqosMyrI-qSEUWNf48Jv-yK5fHdO71c52ZSuzwMk) <zentrog>:
I haven't done any serious survey of similar tools, so take it with a grain of salt. I'm a little shocked to see that it was so long ago. Must have actually been version 8...

## 9-Dec-2021

[11:31:29](#V0CWL5YC61ory3SnnoM2DFLjoIApFrHVthWvin8RN3I) <hiiamboris (NOT THIS ONE)>:
@rebolek there's still the empty string:
```
[
    identity [
        version [#number "$Revision$"] ! ""
        language [#type "root"]
    ]
]
```
input:
```
<?xml version="1.0" encoding="UTF-8" ?>
	<identity>
		<version number="$Revision$"/>
		<language type="root"/>
	</identity>
```

[12:03:58](#QGlwvzOHW78U64l4Nc4Y3xCbpCBUocOWgPv_twHsPIk) <rebolek (Boleslav Březovský)>:
Yes, I’m trying to solve one bug, this must wait.

[14:09:46](#9qjp7qn3S5sDnh2Uhb3XMiI7JFoMu7heQnLAR3J-7nc) <rebolek (Boleslav Březovský)>:
F*#! The bug was not in the code but in the test file. Anyway, I can move on to the empty string elimination :)

[14:52:07](#ZZJJf7ecOr7aMIAtS60Bv7FXohr9Wa2P5WnrmXXYEQo) <hiiamboris (NOT THIS ONE)>:
������

[14:58:55](#cS_KA-JtaC6hSzRYHOFuzTBN_gyx7CgcF2GExdm89z8) <rebolek (Boleslav Březovský)>:
Fixed.

[15:16:51](#ap6Hd3xz8OB21Kbs8I4lAeKWyOBefy_NxgypJuGqo8s) <hiiamboris (NOT THIS ONE)>:
:+1:

[23:58:51](#DYSqRokQ7jKwz1IyQafOnAbOSH8gInKiXpUkI9TBWtU) <GiuseppeChillemi (GiuseppeChillemi)>:
As `select` on maps returns just the value, is there a command to have the values together with the key?
```
>> select m 'a
== 22
```

a command like: 

```
>> select-col m 'a
== #( a: 22)
```



[23:59:11](#IpKBsxcr0mUUIbPaOE596O7KjkK7Eb8Hh9EuBBwhX2w) <GiuseppeChillemi (GiuseppeChillemi)>:
* As `select` on maps returns just the value, is there a command to have the values together with the key?
```
>> select m 'a
== 22
```

a command like: 

```
>> select-col m 'a
== #(a: 22)
```

Or:

## 10-Dec-2021

[0:00:27](#8xrlA5bvvetRzn-gIhE9mtg8iFXX4dK7F3VjuoQdV0c) <GiuseppeChillemi (GiuseppeChillemi)>:
* As `select` on maps returns just the value, is there a command to have the values together with the key?

```
>> m: make map! [a: 22 b: 33 d: 44]
== #(
    a: 22
    b: 33
    d: 44
)
```


```
>> select m 'a
== 22
```

a command like: 

```
>> select-col m 'a
== #(a: 22)
```
Or:

```
>> select-col m [a b]
== #(a: 22 b: 33)
```


[0:00:49](#TeIO0A6KyqR9iLZLUnCN3ikRIy-RaAHXwV5v0nZ1mnM) <GiuseppeChillemi (GiuseppeChillemi)>:
* As `select` on maps returns just the value, is there a command to have the values together with the key?

```
>> m: make map! [a: 22 b: 33 d: 44]
== #(
    a: 22
    b: 33
    c: 44
)
```


```
>> select m 'a
== 22
```

a command like: 

```
>> select-col m 'a
== #(a: 22)
```
Or:

```
>> select-col m [a b]
== #(a: 22 b: 33)
```


[7:14:07](#qEMM-d3tgoIEcJu0ei5WFc1_ZtCyOUq1qfs9dyRkgg8) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Why?

[7:53:30](#y0eOLJjtYb93slH89wM3geIWIxttuPDfle2FDS24NMU) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
`select-col: func[m [map!] key][ make map! reduce [key select m key] ]` but to be honest, it is really bad idea use something like this.

[7:53:40](#69Or55Pu1LHdSbyM67ZN2Iz-ltrgdNGyBPI0IY0x08c) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* `select-col: func[m [map!] key][ make map! reduce [key select m key] ]`
but to be honest, it is really bad idea use something like this.

[9:00:06](#67pQEX53W8bpd_y2CxosgWUd0FZItjlRjV8L3BZlWWE) <GiuseppeChillemi (GiuseppeChillemi)>:
@Oldes It's needed when you wish to make a subset of a table like in SQL: `select a, b from table` where table has columns `a, b, c, d`

[9:03:59](#-oZ6GbEf457vKa2CvBXZUKn-PPBP8GrUHO7ph6H34Xs) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
```red
select-col: func[m [map!] key][
	unless block? key [key: to block! key]
	collect [
		forall key [
			keep key/1
			keep select m key/1
		]
	]
]
```

[9:05:17](#Rm0ok26UyUuR8rdWCrJmNDwSGecMy3gVqsoZzHNBiTY) <GiuseppeChillemi (GiuseppeChillemi)>:
Thank you, I was just asking if it was already there but your code is appreciated.

[9:05:42](#8BKefxSrIE4bdurl6ENtbkGc7_FPP8AIbWeO-Y3aWpg) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
I don't think something like this will be directly there.

[9:05:56](#r15vQ2enuG0tOMXN9xML-X5xWKTCchIEqsJ9qjA7C04) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* I don't think something like this will be ever directly there.

[9:06:12](#cBDnHjTMZqoWfU4taJn9EyVeHYSNw6BKHtzWHbnfAIw) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* I don't think something like this will be ever directly there. It is not much efficient.

[9:08:02](#Ky0Z392lwqLBYqRUWQIxIDmMiwThhcvdcODyZqDyck8) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Btw... although it quite short in Red (`#(a: 1)`), internally is construction of maps quite complex and you should avoid using too many small maps. 

[9:09:18](#qQx7jv7y0HDbEpdcRhMXksu68C2m2lGpJhujwNBy3cI) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* Btw... although it quite short in Red (`#(a: 1)`), internally is construction of maps quite complex and you should avoid using too many small maps. At least until maps are not threated as simple blocks internally for small number of keys (not building hash tables). 

[12:21:21](#Yc1F0EcWAbHA4df8wKAnF7GLmaLVb7wZdGG5eUnCPW0) <hiiamboris (NOT THIS ONE)>:
@rebolek codec eats attributes (missing #source below):
```
[
    calendar [#type "buddhist"
        months [
            alias [#path "../../calendar[@type='gregorian']/months"]
        ]
        days [
            alias [#path "../../calendar[@type='gregorian']/days"]
        ]
    ]
]
```
input:
```
<?xml version="1.0" encoding="UTF-8" ?>
            <calendar type="buddhist">
                <months>
                    <alias source="locale" path="../../calendar[@type='gregorian']/months"/>
                </months>
                <days>
                    <alias source="locale" path="../../calendar[@type='gregorian']/days"/>
                </days>
            </calendar>
```

[16:44:51](#ZlpPj3k-aneC1DH2NMA9w4ME4kk690W3J3z7OUdqVzs) <rebolek (Boleslav Březovský)>:
@hiiamboris thanks, I added it to the test suite and will look at the problem.

[17:54:49](#EyVfx69PLfVYlarmuB27hob09Hs90tAkE0bIXnb7uc8) <greggirwin (Gregg Irwin)>:
@GiuseppeChillemi @Oldes I don't know if it's a common need, but in R2 I had a number of funcs for making objects based on what words you wanted or not. e.g. `remove-words/keep-words`.  Along with spec block support funcs. Useful for sanitizing and minimizing objects, making from templates, etc.

[20:56:29](#rC7Sd81tHyVUMovuAHVPlHypSPnRxLrFfuK3_dxDLbE) <GiuseppeChillemi (GiuseppeChillemi)>:
@greggirwin Do you have a list of all those commands? 

[20:56:39](#nPwBzunyb2MQHtcmu8YM4fXPVkZftUtQJdNSpQbwTnE) <GiuseppeChillemi (GiuseppeChillemi)>:
* @greggirwin Do you have a list of all these commands? 

[21:07:46](#QFVrTaJZRqlpFRzR0kjhmHNcjnJaR3PudoZt8YIfO-g) <greggirwin (Gregg Irwin)>:
No but I just cut a few out into a file.

[21:07:52](#G8QuxpgesN0PVMK_ds2mUZNWMb2w-5ns6eaftQvl79c) <greggirwin (Gregg Irwin)>:
[R2-obj-word-funcs.r](https://files.gitter.im/600719b0d73408ce4ff93018/U3f9/R2-obj-word-funcs.r)

## 11-Dec-2021

[16:43:30](#GbAFaLGq7c9rCCXtVXLMyou6Cbd5zqf6wt0a58OhuGo) <GiuseppeChillemi (GiuseppeChillemi)>:
@greggirwin Thank you, nice read!

## 13-Dec-2021

[22:43:12](#Mh0lznAJEb6JRm7cJmeYWo7xd3IH3xgkMUZ69SKURRw) <greggirwin (Gregg Irwin)>:
@rebolek what is your confidence rating (0-100%) that both XML and HTML decoders will be ready before end of year? Encoding is a lower priority, though we do want it before too long. And are you settled on a data model for the non-boris output?

## 14-Dec-2021

[6:25:03](#GCy9SDjR8NCmonV1wAidCZ_NI11W0uD1TVgGGvKmjTY) <rebolek (Boleslav Březovský)>:
@greggirwin XML - 99%. Both XML encoder and decoder are ready, we just need to decide on the data format. I’m now looking for the edge cases and possible problems.

[18:36:01](#Pn3y2HD_9cUaUYSA04qBNhrRIlyr3RMqmsooAlDMcqE) <greggirwin (Gregg Irwin)>:
On the format, are others OK with what I suggested [here](https://gitter.im/red/codecs?at=61aff716026dc63ca6382936)? 

[19:39:46](#tuX1aqZiaZL-GuQi2GY-6tQ4hmRNleniFRBqW_PskKc) <hiiamboris (NOT THIS ONE)>:
looks reasonable but too vague to say yes or no :)

[19:48:40](#J9AQuTPAFOm4Rjg-nNjsRuPhdDTrYLW53DfFzJYtJOU) <greggirwin (Gregg Irwin)>:
It is vague, but the readme has examples. If it's fixed, it's either `[tag attr value]` or `[tag value attr]`. I lean toward the latter for path use. But if if 90% of access is via our API to it and HOFs, it really doesn't matter. 

[19:53:18](#h6R3hXHd9OKv1TzZwJMV_QUChXPgPPGUJmrm8IOzC80) <hiiamboris (NOT THIS ONE)>:
well then you know I don't like either of these formats :)

[20:06:42](#urSrJP1PcOYNBi6h20haQ2kzqTXgTTi2k-4lpsnGTYs) <greggirwin (Gregg Irwin)>:
I don't want to scan back through chat here, but will if nobody else does, to add other proposals to the markup notes and list pros and cons. I still don't like `!` though. I remember that much. :^)

[20:08:51](#cdxuN9ShbP8Z4K_204x9veZydVeVUYABHJqlbUJ2xII) <greggirwin (Gregg Irwin)>:
Or maybe it would be easier, if each of you have a preferred format in your heads, to just list them there, so I don't misinterpret things from ongoing chat evolution.

[21:48:44](#XDW4lAusAZprI7lu0TYGwssIGLUAVv8I1wzD_paicpc) <zentrog>:
I like the general idea of having a key to match on text values. The benefit of `!` is that it's short, and it's a word which can't be the name of an xml element or attribute. We could as well use a different data type, or other word which contains a character that xml won't allow. `text!` would be another option, or `@text` was also suggested (for example, if we wanted to have a common data type for various xml structural parts). I would be fine with any of these, really. The first time you deserialize an xml, it should be pretty clear what they are for. Being a little more verbose might help with other people reading the source if they aren't familiar with it, or non-reducers

[21:55:06](#9qXJQYPXeOksnzXJfGus1n0iYaVdVscbif62ww8ORDw) <hiiamboris (NOT THIS ONE)>:
Plain comparison:
Input:
```
<?xml version="1.0" encoding="UTF-8" ?>
<currencyFormats numberSystem="latn">
    <currencySpacing>
        <beforeCurrency>
            <currencyMatch>[[:^S:]&amp;[:^Z:]]</currencyMatch>
            <surroundingMatch>[:digit:]</surroundingMatch>
            <insertBetween> </insertBetween>
        </beforeCurrency>
        <afterCurrency>
            <currencyMatch>[[:^S:]&amp;[:^Z:]]</currencyMatch>
            <surroundingMatch>[:digit:]</surroundingMatch>
            <insertBetween> </insertBetween>
        </afterCurrency>
    </currencySpacing>
    <currencyFormatLength>
        <currencyFormat type="standard">
            <pattern>¤ #,##0.00</pattern>
        </currencyFormat>
        <currencyFormat type="accounting">
            <alias source="locale" path="../currencyFormat[@type='standard']"/>
        </currencyFormat>
    </currencyFormatLength>
    <currencyFormatLength type="short">
        <currencyFormat type="standard">
            <pattern type="1000" count="other">¤ 0K</pattern>
            <pattern type="10000" count="other">¤ 00K</pattern>
            <pattern type="100000" count="other">¤ 000K</pattern>
            <pattern type="1000000" count="other">¤ 0M</pattern>
            <pattern type="10000000" count="other">¤ 00M</pattern>
            <pattern type="100000000" count="other">¤ 000M</pattern>
        </currencyFormat>
    </currencyFormatLength>
    <unitPattern count="other">{0} {1}</unitPattern>
</currencyFormats>
```


[21:55:20](#pQKqF4ralw5tmJK03F74qkCYeRB3cHdZY_m60ZKE5ic) <hiiamboris (NOT THIS ONE)>:
Output of `boris` format:
```
[
    currencyFormats [#numberSystem "latn"
        currencySpacing [
            beforeCurrency [
                currencyMatch [! "[[:^^S:]&amp;[:^^Z:]]"]
                surroundingMatch [! "[:digit:]"]
                insertBetween [! " "]
            ]
            afterCurrency [
                currencyMatch [! "[[:^^S:]&amp;[:^^Z:]]"]
                surroundingMatch [! "[:digit:]"]
                insertBetween [! " "]
            ]
        ]
        currencyFormatLength [
            currencyFormat [#type "standard"
                pattern [! "¤ #,##0.00"]
            ]
            currencyFormat [#type "accounting"
                alias [#path "../currencyFormat[@type='standard']"]
            ]
        ]
        currencyFormatLength [#type "short"
            currencyFormat [#type "standard"
                pattern [#type "1000" #count "other" ! "¤ 0K"]
                pattern [#type "10000" #count "other" ! "¤ 00K"]
                pattern [#type "100000" #count "other" ! "¤ 000K"]
                pattern [#type "1000000" #count "other" ! "¤ 0M"]
                pattern [#type "10000000" #count "other" ! "¤ 00M"]
                pattern [#type "100000000" #count "other" ! "¤ 000M"]
            ]
        ]
        unitPattern [#count "other" ! "{0} {1}"]
    ]
]
```
Output of `word-block-block` format:
```
[
    currencyFormats [
        currencySpacing [
            beforeCurrency [
                currencyMatch "[[:^^S:]&amp;[:^^Z:]]" []
                surroundingMatch "[:digit:]" []
                insertBetween " " []
            ] []
            afterCurrency [
                currencyMatch "[[:^^S:]&amp;[:^^Z:]]" []
                surroundingMatch "[:digit:]" []
                insertBetween " " []
            ] []
        ] []
        currencyFormatLength [
            currencyFormat [
                pattern "¤ #,##0.00" []
            ] [type "standard"]
            currencyFormat [
                alias "" [path "../currencyFormat[@type='standard']"]
            ] [type "accounting"]
        ] []
        currencyFormatLength [
            currencyFormat [
                pattern "¤ 0K" [type "1000" count "other"]
                pattern "¤ 00K" [type "10000" count "other"]
                pattern "¤ 000K" [type "100000" count "other"]
                pattern "¤ 0M" [type "1000000" count "other"]
                pattern "¤ 00M" [type "10000000" count "other"]
                pattern "¤ 000M" [type "100000000" count "other"]
            ] [type "standard"]
        ] [type "short"]
        unitPattern "{0} {1}" [count "other"]
    ] [numberSystem "latn"]
]
```

[21:56:16](#tlKElpRIaq5gO1rXLUf-O3lFBqkB2cPg3cZMYl9LA-Q) <hiiamboris (NOT THIS ONE)>:
I agree with everything @zentrog:matrix.org sums up

[23:24:24](#rLg6R9NOxNEFw7kZpzFCUBdKZtO4H2yPQUhnq20BMIU) <greggirwin (Gregg Irwin)>:
Thanks for the comparison @hiiamboris. :+1:  I was going to add it to the wiki, but I don't seem to have rights for that. Can we open that up @rebolek? 

`source locale` missing is a known issue, correct?

I prefer `word block block` between these two. If we do end up with a special key, I bang my design gavel in favor of a decorated word, like `text!` or `.text` rather than `!`. If we *don't* have a special key, we can still define a named value to use in paths, e.g. `a/b/c/:XTEXT`, but that's just another tradeoff.

Values could be `none` rather than an empty string, but not sure it's worth it, or how common they are. My guess is not, so the efficiency win isn't there. Attrs can be `none`, rather than an empty block. It does mean users have to create the block if they want to add them, but that's OK.

If `boris` format doesn't work for HTML (due to [ordering](https://gitter.im/red/codecs?at=6197ff60197fa95a1c7e37e4)), do we want two different formats? I say No. Technically, XML is ordered as well, isn't it? Though many cases will work fine without preserving it. I haven't gotten back to the spec, sorry.

Off to think a bit.

[23:54:40](#-xIj8DczBzLZXrRsPGkAu9jQD8pFXlS0MmUBeycJ0sI) <zentrog>:
Order *is* important, but I don't understand how the `boris` format breaks it. For the `boris` format, how are attributes with namespace prefixes handled (e.g. `<el xmlns:foo="bar"/>`)? For the `word-block-block` format, how are multiple text elements handled?

[23:57:32](#op_rETj_RVwGOGGVdwYmRm6ERJ7qKc8nrECjTmlS9Wo) <zentrog>:
 * Order _is_ important, but I don't understand how the `boris` format breaks it. Is there an example?

## 15-Dec-2021

[0:03:53](#v3_O1lO10gvp7bIKpXeqIcU_eUGToDB0_tcpjh6LPu4) <greggirwin (Gregg Irwin)>:
Scanning test files, I don't see one. We may need to synthesize one. 

@zentrog:matrix.org how common are multiple, separate pieces of content?

[0:10:53](#1pfxgAF0_gQFmtkRhFjViIgqnjMW40wYeOENo2skVgo) <zentrog>:
When you say "content", I assume you mean text specifically? Just to distinguish that from other content like things, such as attribute values. I think for XML, it seems relatively less common to have multiple meaningful text sections with other elements interspersed, but I think it should still be supported some how. For HTML, it is certainly very common

[0:11:53](#yxp2yZUE7pbVFjx9jKiWgGLpmMOnjI1qsv2-EdDkppA) <greggirwin (Gregg Irwin)>:
Yes, text.

[0:28:56](#U3wJ1NMKHs24qT0eZ3BmCTecWSISWIF4jTHuVu6JiL8) <zentrog>:
Something like this?
```
<body>some <b>bold</b> and <i>italic</i> text</body>
```

[0:29:58](#0hoE0AuZLk9Cmoc4LqSvhxzFViAJXufrC8xMr0fP2HQ) <greggirwin (Gregg Irwin)>:
Yes.

[0:31:31](#brs-vWFIIeL4rHbR5yFdnf5EsLjon7QsyrqKUAKd6jo) <zentrog>:
I tried decoding it with [xml.red](https://gitlab.com/rebolek/markup/-/blob/main/xml.red), but just get an empty block back. Not sure if I'm doing something wrong

[0:33:40](#H46gUsQfhqtvqK7tRawzQ4ymZDrieJV13JNC8RQ7lSc) <greggirwin (Gregg Irwin)>:
It may want a prologue. I can't say just now.

[0:37:23](#I-5f7e5F7shw6H-gqVVBdpk96pJw9gtDKwXE346z8CY) <greggirwin (Gregg Irwin)>:
Given that the structure is rich and flexible, maybe trying to prioritize HOF use is a fool's errand. They can still be used effectively for some things I imagine (not knowing how DSSSL and XSLT work internally, but guessing they might do things that way), but will they work well (I hoped in the past they would) on trees as well as lists when the model is like XML? @hiiamboris, thoughts? I'm totally OK with a format that we can use `parse` against internally and provide a nice set of APIs, but (I hope) also imperatively or with HOFs when the data is simple and predictable.

[0:43:34](#QuDEmGooqt7AzJTnBk7SOfWqsvmE2sORZCXUihNA_Qw) <greggirwin (Gregg Irwin)>:
@hiiamboris does your suggested format still require a change to the lexer, as you noted early on?

[0:44:13](#nMDNt4eBxi1tJqoAqNat8hE5eU3fdw6DL2hxI69DnXw) <greggirwin (Gregg Irwin)>:
Unless it's a lexer bug already, just needing to be fixed, that's probably a showstopper for me. 

[0:46:43](#59apgQIPPQDb2UyNZSGi-t3wQaVXeY51-UEkjowKkzY) <zentrog>:
Oh, yep, that was it. Both forms need a bit of cleanup, but they both seem equally machine navigable. The `wbb` one is a bit harder for me to follow.
```
>> xml/output-type: 'wbb
>> xml/decode read %data/simple.html
== [
    body [none "some " none
        b "bold" [] none "and " none
        i "italic" []
    ] []
]

>> xml/output-type: 'boris
>> xml/decode %data/simple.html
== [
    body [! "some"
        b [! "bold"] ! "and"
        i [! "italic"]
    ]
]
```

[0:50:55](#iNIHAQT9XDGGjadomNPrQ44qT12qTk8o7r6TpGMZHS4) <greggirwin (Gregg Irwin)>:
Has anyone propose key-val all the way down? 

[0:50:59](#JEw4EMM-rwA1UEeGbAI6M7Fhc6bjVo6QGmajotM7t-s) <greggirwin (Gregg Irwin)>:
```
[
    currencyFormats [
        ; .text ""                  ;?? Omit empty .text values?
        .attr [numberSystem "latn"] ;?? Can .attrs always safely group to the top?
        currencySpacing [
            beforeCurrency [
                ; Always include .attr ?
                currencyMatch [.text "[[:^^S:]&amp;[:^^Z:]]" .attr []]
                surroundingMatch [.text "[:digit:]" .attr []]
                insertBetween [.text " " .attr []]
            ]
            afterCurrency [
                ; Omit empty .attrs ?
                currencyMatch [.text "[[:^^S:]&amp;[:^^Z:]]"]
                surroundingMatch [.text "[:digit:]"]
                insertBetween [.text " "]
            ]
        ]
        currencyFormatLength [
            currencyFormat [
                pattern [.text "¤ #,##0.00" .attr [type "standard"]]
            currencyFormat [
                .text ""
                .attr [type "accounting"]
                alias [
                    .text none ;?? to distinguish auto-closed tags? Probably not.
                    .attr [path "../currencyFormat[@type='standard']"]
                ]
            ] 
        ]
        currencyFormatLength [
            .attr [type "short"]
            currencyFormat [
                ; Can .attrs always safely group to the top with .text?
                ; Should they always come first?
                .attr [type "standard"]
                .text ""
                pattern [.text "¤ 0K"   .attr [type "1000" count "other"]]
                pattern [.text "¤ 00K"  .attr [type "10000" count "other"]]
                pattern [.text "¤ 000K" .attr [type "100000" count "other"]]
                pattern [.text "¤ 0M"   .attr [type "1000000" count "other"]]
                pattern [.text "¤ 00M"  .attr [type "10000000" count "other"]]
                pattern [.text "¤ 000M" .attr [type "100000000" count "other"]]
            ]
        ]
        unitPattern [.text "{0} {1}" .attr [count "other"]]
    ]
]
```

[0:52:41](#HeeyhMZDodZx-pZmgrIRpeYSSXmn49vIgGYjVmY6nrg) <greggirwin (Gregg Irwin)>:
* Has anyone proposed key-val all the way down? 

[0:53:37](#QmaLfzWMoyk_SW6l44xC57JHIogZZ8G_t9kO0Q3qttI) <greggirwin (Gregg Irwin)>:
Similar to `boris`, but attrs are in a keyed block. 

[0:55:58](#kipLl5JEPrXZ7CChFHpVKruDeSs4nPxmHEFsvJ5GALU) <zentrog>:
I was thinking about something like that. I couldn't figure out attribute namespace prefixes though. But that is still a consideration for the other forms too. I think rebolek (Boleslav Březovský)  had a solution using paths...

[0:57:16](#JujCNF2X1UqswdB8SSz_Q2Hid_PAs1tAqQPAyhcZ-sM) <zentrog>:
Anyway, thinking more on that, it is a nice consistency, and other things could be done that way as well, like `cdata` (if differentiating from text),  `comment`, and other weird things like processing instructions

[1:01:31](#_S-av6pNtEkC3lB-xa65_CEIx4XrgBw58GMHD0vRCXM) <zentrog>:
It does make paths longer. It could be useful to be able to grab all the attributes in a single block

[2:17:55](#Ar9jLWFjiwB2ASwybRNms6fSUQ7AjlrUeeuUITB_rWQ) <greggirwin (Gregg Irwin)>:
Everything is a tradeoff in this space. Your gut instincts, having digested more XML than the rest of us, are valuable.

[5:22:23](#wEHDJY51WgeQfMtNMGQTOIAKub9gYmzbCUNgbYYz9bk) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Though dot convention is not particular redbolish, I kind of like that, especially as it is used in JS and ppl might be right at home.

[5:26:42](#HumX7gJW0DHw39G4HkQSTtnRu35fUfLqZJt0inLYjQA) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Not sure I undrestand empty block vs none, but I was always versed,  when something had several possible different types as a return. `none` for no value, `value`for just one and `[value1 value2]`for multiple ones. But I can understand you don't want to have code full of `[]`or `""` ....

[7:56:32](#xdzmrLFRSSzLDqPakGmduORNGkcfQ2ncWF-EcSiKGUM) <hiiamboris (NOT THIS ONE)>:
`/.attr` is preferable to `/3` magic number, though doesn't leverage type richness and the biggest downside after extra verbosity is that `.attr []` will always have to be present, you can't omit it, or your paths `a/.attr/x` will error out on missing `.attr` in the scenario like this:
```
a [.attr [x "1"] .text "1"]
b [.text "2"]
c [.attr [x "3"] .text "3"]
```

[7:56:41](#Su-9ArJ6ZUE-UgTwKgbBwOAdj67Ggx1WeJQil0VkjQ8) <hiiamboris (NOT THIS ONE)>:
* `/.attr` is preferable to `/3` magic number, though doesn't leverage type richness and the biggest downside after extra verbosity is that `.attr []` will always have to be present, you can't omit it, or your paths `b/.attr/x` will error out on missing `.attr` in the scenario like this:
```
a [.attr [x "1"] .text "1"]
b [.text "2"]
c [.attr [x "3"] .text "3"]
```

[8:05:07](#f6W_D_e_FRf-T0n5B7DdiwGKvlc2H5oR0ZoulWgHOmg) <hiiamboris (NOT THIS ONE)>:
For the tooling, @dander should advise from experience. But my limited experience tells me that use cases like this are going to be common:
```
	;; select a subtree
	srcdays: cull/fetch 'tree/ldml/dates/calendars/calendar/(#type = "gregorian")/days
	;; extract the days data
	for-each [('daycontext) b] srcdays [
		type: select [format format stand-alone standalone] to word! b/#type
		cal/:type/days: days: copy #()
		for-each [('daywidth) b2 [block!]] b [
			width: to word! b2/#type
			key: select [narrow char abbreviated abbr wide full short short] width
			days/:key: m: copy #()
			for-each [('day) b3] b2 [put m to word! b3/#type b3/!]
		]
	]
	;; some days may be inherited from the other type, so I reflect both sides to one another for completeness
	foreach w [char abbr full short] [
		unless format/days/:w     [format/days/:w: standalone/days/:w]
		unless standalone/days/:w [standalone/days/:w: format/days/:w]
	]
```
`cull` is a helper I made to filter out things from the tree, `cull/fetch` returns only the `/days` leaf rather than the whole tree. I don't like it and it has big design issues, and is only occasionally helpful, but it helps me avoid the fourth `for-each` loop here. Better ideas how to handle this are welcome.

[8:09:48](#FGw4heMvb5yKaOzV7NaYht8SKtKFwLtPDNKMqojf38k) <hiiamboris (NOT THIS ONE)>:
`morph` could have been just the tool for it, but it's too early a prototype to be convenient

[8:17:52](#4ZgTkOLixTXs8o4aWHAWepcH0Yem18v6YJCyqFvCsos) <rebolek (Boleslav Březovský)>:
> the biggest downside after extra verbosity is that .attr [] will always have to be present

Isn’t it a good thing OTOH? With the `tag content attributes` model you can traverse the tree easily as there are always three values. With your approach, you can’t rely upon that, as the element’s length is always different. 

[8:18:45](#jmfX3oghxcx6huHcv3AaNE-iGGC99HFEWyKyH7mIPKQ) <rebolek (Boleslav Březovský)>:
Instead of `.attr` I would use for example `issue!`, `#attr`.

[8:35:13](#V5_Cv-fU8R6ucMQPUAekrku6sicQC9tK92AVwDKeuMk) <rebolek (Boleslav Březovský)>:
As @greggfirwin wrote, it currently needs a prologue. I’ll probably change it.

[8:42:28](#ch-SFGXbXzyxznMKIkNDW--Dp5Ozug72TXWyPCPfVWU) <hiiamboris (NOT THIS ONE)>:
it isn't good from readability's perspective, and we're always going to look at our data, during debugging

[8:43:28](#NeJnWpggdPAumJJPGjnoWnG6rjB_LK9Ex_ePGklreZY) <hiiamboris (NOT THIS ONE)>:
and `#attr/x` is currently a problem in the lexer that Gregg said isn't going to be addressed

[9:05:37](#oaVorz8xUg4QbtaD3PKk1Yuy1L9H57z8sjK-FFGVjeI) <rebolek (Boleslav Březovský)>:
If it complicates automated access, is readability really such a strong argument?

[9:09:27](#fw3vt2_qCRtLS9aYE33wbeVrZP3uUvTRzsalJheoOJE) <hiiamboris (NOT THIS ONE)>:
Does it complicate anything?

[9:10:09](#2xI54mEpaJlX5x6XUagYaEbN1DW8_wvh-uM2mZHcsH0) <hiiamboris (NOT THIS ONE)>:
Ah, you mean if `.attr` is absent, it complicates traversal? Yes.

[9:10:11](#GhFdijOVPPVpYxQaof8NIqZ9eKDbdlmaaY9zYVp8RhI) <rebolek (Boleslav Březovský)>:
with the `[tag content attributes]` structure you can traverse the tree with a simple recursive foreach loop.

[9:11:06](#xq4L8zf6wd_LhOWB-WZlrHZKCA9LPxzJzA31RCc-ZH8) <rebolek (Boleslav Březovský)>:
I understand that omitting empty attributes/content looks better, OTOH it breaks the flow.

[9:11:43](#RA5-0fCYygVSUGK4I6c6ML-S9wY8xVnh4TbCmvih_f8) <hiiamboris (NOT THIS ONE)>:
That's why, for this model, I say `.attr` will always have to be present. For automated access and for less error handling. And readability will be sacrificed.

[9:12:06](#im4cE1sJuYgMTAorD5StbG5a6ldYRNKS0qlxTSlJKIA) <hiiamboris (NOT THIS ONE)>:
I'm not proposing it the other way around :)

[9:13:57](#5BP18uHC9kU-ixrYWkRXvaqyT9B5iiHhET8jshTzFg4) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
I just wonder. We are constantly trying to i troduce new forms. And all that time we ignore one Red native datatype, a tag. Consider .attr vs <attribute>. Would work in paths too, no?

[9:16:30](#-PBV1HdX8e45v5wCSW_3Nbi8tI5pZCRqckNe-g1Pl3E) <rebolek (Boleslav Březovský)>:
Yes, it would.

[9:17:16](#uGl2QFgF2r7d3d_vZ2boEyQ3VQvTsgk6wFnyOspSgVU) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
It might feel weird to decompose tags by using tags, but we are trying tosolve a structure problem.

[9:17:21](#YleKVvKcZ3usybbnVE6J8m2x4Xt6vZtAplcpy71cAFw) <hiiamboris (NOT THIS ONE)>:
what does it improve over `.attr`?

[9:17:28](#yOAWrM4kMa6R8jceb8MT40sjcaojffCHGZs55wVNeak) <hiiamboris (NOT THIS ONE)>:
* what does `<attr>` improve over `.attr`?

[9:18:14](#HpLKeKHpH5l8lu40z1Q2GhT6K7vr29MVk17w1RjK0CM) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Expected that, you should know better.

[9:19:23](#fzVHMcIUJLjkt0nymVjUlqlD6xQy-hvSvfOul7S9xhA) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
! Nor .attr are redbolish. We don't abbreviate like that.

[9:20:39](#pAvQYFJjbl6JnFSLSoz9mSDGL7inZatwcjZrx89dGfU) <hiiamboris (NOT THIS ONE)>:
Who defines what is more Redbolish?

[9:20:49](#d0jnwetmoLgCF4H1xfXvG21iSc13LGUBL6Gs6IomYys) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
I myself hate tags and like dots more, but so far, tags in redbol, is most useless datatype, if nit used.

[9:21:26](#PrO7TirMZeXYFVUFimU8ZtFRkOxEEI5NLjUsQiuG2d0) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Do you reallymean it?

[9:22:09](#Q08cGAHxEhTThqpRitPfzJRqJlxgviKHFDJcXKkXi1c) <hiiamboris (NOT THIS ONE)>:
Yeah, why not? What's the guideline?

[9:25:06](#mfIq_B81QOyU8D1qrAn1H5jeiNp-sR7zwK2A_wHEmp0) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Rebol naming conventions are defined. I do 't mind dot, though that convention is hostile and confusing to those, who expect objects.

[9:26:41](#N45jQ7ZPChjwTiKB5Sqacwt_RrtXqYNCy6wxH0zi5yk) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
But attr should be full word. In long worde we use hyphens, not hungariannotation, nir the camel case.

[9:29:47](#IZstQ6JxK87OG79TIKGPGIvlMx_Do_c3-Kb2Ga2Vthw) <rebolek (Boleslav Březovský)>:
@pekr so you prefer `attribute` instead of `attr` ?

[9:31:33](#HyxM8OtAD3Y18PSge0h6jMGnakJX7v1LhLCSQe7t_io) <hiiamboris (NOT THIS ONE)>:
Why don't we call it `attribute-block` then?
```
if a/attribute-block/x <> b/attribute-block/x [a/attribute-block/x: b/attribute-block/x]
```
Now that ensures our code will not be readable :)

[9:33:32](#70piFFyMbIlhgSYTiFuq9aWTzvNIn0E4dfV4mB7K-Zo) <rebolek (Boleslav Březovský)>:
Pushed new version, `wbm` emitter was removed and `Gregg` emitter was added.

[9:44:30](#4EPUAEcfrQdi6DUEdlzG5ldkLVJHttjuJJCmyOMw3Ts) <hiiamboris (NOT THIS ONE)>:
One of the reasons I proposed `#attr "value"` syntax is because having `/attr/` everywhere in the paths distracts the eye from attribute and element *names* to the completely unimportant detail of how we name the attribute group. And also the reason I chose `!` over `text!`: it's a *syntactic noise*, and I prefer to keep it to a minimum. I exaggerated the example above only to show that strictly abiding by "never abbreviate" law, and having`attribute`, is a step towards maximizing syntactic noise. I would prefer common sense to prevail in all decisions we make, and laws being taken as only guidelines, and every decision should be weighed in it's context (and that is true not only for the world of code).

[9:44:38](#jLGGsGCgIzo-n7FBep2MCRWBOgYsyB6VkZYqSncOvVk) <hiiamboris (NOT THIS ONE)>:
* One of the reasons I proposed `#attr "value"` syntax is because having `/attr/` everywhere in the paths distracts the eye from attribute and element *names* to the completely unimportant detail of how we name the attribute group. And also the reason I chose `!` over `text!`: it's a *syntactic noise*, and I prefer to keep it to a minimum. I exaggerated the example above only to show that strictly abiding by "never abbreviate" law, and having `attribute`, is a step towards maximizing syntactic noise. I would prefer common sense to prevail in all decisions we make, and laws being taken as only guidelines, and every decision should be weighed in it's context (and that is true not only for the world of code).

[9:50:39](#cKmFB52L_Q_DJnGI8KAcb9l8MLkN4Ok0By1LCDrlwl0) <hiiamboris (NOT THIS ONE)>:
We can rename them to this purpose though, to `flags`. So what if it's not an official term?

[9:56:58](#SyD8wVff2paqiP2q9e1Z5DJqCh22-h2SOCpRjbatK1Y) <rebolek (Boleslav Březovský)>:
XML prolog is now optional. It may be enforced with `/strict` refinement.

[11:51:36](#EHWFjGp6yS5pjGOME7E7f9SW61NjgaBvTS1WgRJCmu0) <rebolek (Boleslav Březovský)>:
> I was going to add it to the wiki, but I don't seem to have rights for that. Can we open that up @rebolek? 

@greggirwin It seems to be open.
@hiiamboris can you please try to edit the wiki to see if it’s accessible for others than me?

[11:59:09](#fBruBlZJp6SYlHO-enLW0gYCVNo9sRasGsXEOQzRlVs) <hiiamboris (NOT THIS ONE)>:
Maybe I'm just dumb but I don't see any "edit" buttons there: https://i.gyazo.com/bcd002dcc50f45d2ee8ca95e065e4cc9.png

[12:00:53](#OiqItRln6Lr8dTsuNRRrmfqtl3-oldpkKVsezHfWTvE) <hiiamboris (NOT THIS ONE)>:
Do you have a direct edit link so I can try it?

[12:02:30](#ieUcy_5QibVocu54djHdwx5fiRva3LeneXUg_nKzzfs) <rebolek (Boleslav Březovský)>:
Hm, strange.

[12:02:44](#sPm5Cwe7i369HpbEB9UVGP56FescTKtyqQfab68yioE) <rebolek (Boleslav Březovský)>:
https://gitlab.com/rebolek/markup/-/wikis/home/edit

[12:04:51](#0P-QKpSIvin3nTFN_2ZmTahMzJzR7ZjltBSyfCcR6G4) <rebolek (Boleslav Březovský)>:
The project is public, in settings it says that Wiki can be edited by anyone with access.

[12:06:36](#kwPs9rioLTjiETrlCAywQP3VfcqU1HWRAbXps_nKCVE) <rebolek (Boleslav Březovský)>:
@hiiamboris @greggirwin I invited you as members of the project, maybe it would help.

[12:08:21](#IuDWF1rc0ABcfZD0DgA6q9Eyo6syA-p_VoRGtKpdZlQ) <hiiamboris (NOT THIS ONE)>:
Now I see it, yes.

[12:08:45](#GyJF7eimGRB6CSWbhqa0E6o4C0xdQcJsjT9K6fWlpP8) <hiiamboris (NOT THIS ONE)>:
Anyone *with access* must be it

[12:09:06](#1xQ181V0jBb4-iS6x4fXDdnamtT28zhMqdYSHl4braQ) <rebolek (Boleslav Březovský)>:
The other option is "members only"

[12:12:58](#NLEOCg1U2hQUA3jlWPSE7e5mnQ-j_Y2Z9AT7_lRMwME) <hiiamboris (NOT THIS ONE)>:
Right, now that I look at settings, it certainly looks silly.

[12:13:55](#UjpEKtquC9nmdVPJCjjPxcxrYQeG3CfnSdHjTgSNwAc) <hiiamboris (NOT THIS ONE)>:
I guess that's what you get when you continue killing the UI every day - bugs creep in :)

[22:42:13](#NMJvhKY_nM9biLsodNMi-x50tyZV5eYZaT_0qMRt3l4) <zentrog>:
Regarding the `#attr/x` lexer issue, it isn't a problem with `@attr/x` (which also conveniently matches up more closely to xpath syntax). However, would someone give a bit more explanation about the tradeoffs of using a word-based type vs string-based? I don't think I understand Red internals well enough for it. Is it mainly to do with memory usage or other performance characteristics? Like are the words just an index into a context somewhere, vs a string would be duplicated each time it appears?
Maybe it would be useful to specify an initial constraint for minimal capacity, like "ability to handle a document up to 50MB" (just a random figure). Or a tool to detect the maximum capacity. Then we can see how much those decisions affect what the limit ends up being.

## 16-Dec-2021

[5:40:14](#Opz-Df6BWZypn29CIJyivQPdjiDkIrK_7ok3AaSxzeU) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
I don't want to push for tags instead of issues or refs, as there seem not to be any fan of that aproach here, but just curious - what is happening here? 

```
>> type? <attr>/x
== /x
>> blk: [<attr> "test"]
== [<attr> "test"]
>> blk/<attr>
== "test"
```
In path, tags seem to work, but in first case, what is lexer doing, returning `/x` instead of a type?


[5:46:06](#kDcOs7oFYGnDRpQ799myOS0dPHlLcRngz6yhPeiLNYM) <toomasv>:
@pekr On first line there are two expressions `type? <attr>` and `/x`. Last is returned.

[5:55:05](#1LWIEfB6w-Ie3iDK5fNx8XT9Ko-lZYpFS-uxT5xx2a0) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
There is no space between those two elemens. And even more, in the second case of path access, it corrrectly returns the string type. Shouldn't just type function always return a type?

[6:03:09](#Mc_bd_v494R2TWmAsC3Q_8vgX4EcrMzxN_1Oedq3ib0) <toomasv>:
Space is not always required between expressions. `type?` returns type, but it gets lost as you are not using it. Put `probe` before it to see.

[6:07:14](#srRHJivh4YU5higoB_vJyK_gJPYsEdJR2HeHLgL3C7w) <rebolek (Boleslav Březovský)>:
@zentrog:matrix.org yes, the main problem with `word!` vs. `string!` is the memory usage. However, we can cheat a little bit here and reuse the same string, I guess it shouldn’t be a problem, as we aren’t going to modify the string during the lifetime of the data structure. But I need to test it to see if there aren’t some problems I’m not aware of.

[6:09:12](#7qvOjyPaOihOO9grnpS2D6kBctUCmQtxzDysayCHrmo) <rebolek (Boleslav Březovský)>:
@pekr the problem is that `tag!` can’t be the first value in `path!`.

[6:12:47](#MGc4L61irI6ukbgvlVErRSl411K5M9VFqrwrOukqihk) <toomasv>:
@pekr You an see how lexer treats it:
```
[type? <attr>/x]
== [type? <attr> /x]
```

[6:36:03](#_xz5SRFxc3-0NXD-JfD4_l3MykNxbMrxZbJ8w4Htfe8) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Thanks.

[21:56:52](#RIpsw4t8U3PxIgv_DO18l6uyhPfOY7VTFx21553rgHk) <greggirwin (Gregg Irwin)>:
1) We all seem to agree that a fixed structure has a lot of pros, with the main con being readability of raw data. Secondarily it's less efficient. I'm OK with that tradeoff. Other options just mean different compromises. Agreed?

2) We need key names for `text` and `attr` that can't conflict with what may appear in the data. That means they have to be illegal in XML. We can't safely use `refinement!` or `issue!` types, due to paths. Using `lit/get/set` words as a hack doesn't solve the problem. This leaves us with a sigilled word or a string type. As I said [before](https://gitter.im/red/codecs?at=61aa5d92197fa95a1ca4b8ae), *not* copying strings is a recipe for disaster. So we either accept the overhead of copied strings for something like `@text/@attr` (`tag!` is a bad choice, as we are coming *out of* markup and don't want confusion there) or use a sigil on a word. I vote for word, and *prefer* `.` as the sigil not because I *like* it but because the other options are worse. :^) Vote for your sigil.

3) To @hiiamboris' point on explicit `.attr` and `.text` being noise, I disagree. They aren't *implicit*, but I think that's a good thing in this case. This is *my* priority sense for the design right now. The reason being that this format, fingers crossed, will never change. If it does, it will be at the edges and not at the core for text and attrs. If it's a long-lived format, it should be as plain and obvious as possible. If there is a *more* plan and obvious format, please post it with the rationale for it.

> the biggest downside after extra verbosity is that .attr [] will always have to be present, you can't omit it, or your paths b/.attr/x will error out

It's true that you can't write paths against unknown data and ignore error handling. This is always true, coming from XML data or not. It applies to any nested key, not just attrs. 

> With the `tag content attributes` model you can traverse the tree easily as there are always three values. 

I haven't tried the new `gregg` emitter yet. What I posted is not 3-value based, but recursive `some [key value]` all the way down. 

Does this description match [the example](https://gitter.im/red/codecs?at=61b93bee440178658b961df0) I posted?
```
`.text` is always a string, and there may be more than one, appearing throughout a tag's (node's) block. `.attr` is always a block and may only appear once. Any other key is a tag name, and is a node.
```
We *can* choose to always include `.text/.attr`, which means we can never take them away. If we spec that they may be omitted, people have to write code to handle that. If we get lots of complaints, or find that code is massively uglified by it, we can later force them to always be included without it being a breaking change. And, No, I don't care about the argument that someone will load a doc now that later fails because empty values are forcibly included. 

[21:57:44](#ZhMDv9vvtkF4Fjva9DoRgPDVOsfayyOEm7COufk626I) <greggirwin (Gregg Irwin)>:
* 1) We all seem to agree that a fixed structure has a lot of pros, with the main con being readability of raw data. Secondarily it's less efficient. I'm OK with that tradeoff. Other options just mean different compromises. Agreed?

2) We need key names for `text` and `attr` that can't conflict with what may appear in the data. That means they have to be illegal in XML. We can't safely use `refinement!` or `issue!` types, due to paths. Using `lit/get/set` words as a hack doesn't solve the problem. This leaves us with a sigilled word or a string type. As I said [before](https://gitter.im/red/codecs?at=61aa5d92197fa95a1ca4b8ae), *not* copying strings is a recipe for disaster. So we either accept the overhead of copied strings for something like `@text/@attr` (`tag!` is a bad choice, as we are coming *out of* markup and don't want confusion there) or use a sigil on a word. I vote for word, and *prefer* `.` as the sigil not because I *like* it but because the other options are worse. :^) Vote for your sigil.

3) To @hiiamboris' point on explicit `.attr` and `.text` being noise, I disagree. They aren't *implicit*, but I think that's a good thing in this case. This is *my* priority sense for the design right now. The reason being that this format, fingers crossed, will never change. If it does, it will be at the edges and not at the core for text and attrs. If it's a long-lived format, it should be as plain and obvious as possible. If there is a *more* plan and obvious format, please post it with the rationale for it.

> the biggest downside after extra verbosity is that .attr [] will always have to be present, you can't omit it, or your paths b/.attr/x will error out

It's true that you can't write paths against unknown data and ignore error handling. This is always true, coming from XML data or not. It applies to any nested key, not just attrs. 

> With the `tag content attributes` model you can traverse the tree easily as there are always three values. 

I haven't tried the new `gregg` emitter yet. What I posted is not 3-value based, but recursive `some [key value]` all the way down. 

Does this description match [the example](https://gitter.im/red/codecs?at=61b93bee440178658b961df0) I posted?
```
`.text` is always a string. More than one may appear throughout a tag's (node's) block.

`.attr` is always a block and may only appear once.

Any other key is a tag name, and is a node.
```
We *can* choose to always include `.text/.attr`, which means we can never take them away. If we spec that they may be omitted, people have to write code to handle that. If we get lots of complaints, or find that code is massively uglified by it, we can later force them to always be included without it being a breaking change. And, No, I don't care about the argument that someone will load a doc now that later fails because empty values are forcibly included. 

[21:58:02](#mXTfWRrQBUnEfK-vWWUerIcPKL9Q1MeJrAkxamuuxus) <greggirwin (Gregg Irwin)>:
* 1) We all seem to agree that a fixed structure has a lot of pros, with the main con being readability of raw data. Secondarily it's less efficient. I'm OK with that tradeoff. Other options just mean different compromises. Agreed?

2) We need key names for `text` and `attr` that can't conflict with what may appear in the data. That means they have to be illegal in XML. We can't safely use `refinement!` or `issue!` types, due to paths. Using `lit/get/set` words as a hack doesn't solve the problem. This leaves us with a sigilled word or a string type. As I said [before](https://gitter.im/red/codecs?at=61aa5d92197fa95a1ca4b8ae), *not* copying strings is a recipe for disaster. So we either accept the overhead of copied strings for something like `@text/@attr` (`tag!` is a bad choice, as we are coming *out of* markup and don't want confusion there) or use a sigil on a word. I vote for word, and *prefer* `.` as the sigil not because I *like* it but because the other options are worse. :^) Vote for your sigil.

3) To @hiiamboris' point on explicit `.attr` and `.text` being noise, I disagree. They aren't *implicit*, but I think that's a good thing in this case. This is *my* priority sense for the design right now. The reason being that this format, fingers crossed, will never change. If it does, it will be at the edges and not at the core for text and attrs. If it's a long-lived format, it should be as plain and obvious as possible. If there is a *more* plan and obvious format, please post it with the rationale for it.

> the biggest downside after extra verbosity is that .attr [] will always have to be present, you can't omit it, or your paths b/.attr/x will error out

It's true that you can't write paths against unknown data and ignore error handling. This is always true, coming from XML data or not. It applies to any nested key, not just attrs. 

> With the `tag content attributes` model you can traverse the tree easily as there are always three values. 

I haven't tried the new `gregg` emitter yet. What I posted is not 3-value based, but recursive `some [key value]` all the way down. 

Does this description match [the example](https://gitter.im/red/codecs?at=61b93bee440178658b961df0) I posted?
```
`.text` is always a string. More than one may appear
throughout a tag's (node's) block.

`.attr` is always a block and may only appear once.

Any other key is a tag name, and is a node.
```
We *can* choose to always include `.text/.attr`, which means we can never take them away. If we spec that they may be omitted, people have to write code to handle that. If we get lots of complaints, or find that code is massively uglified by it, we can later force them to always be included without it being a breaking change. And, No, I don't care about the argument that someone will load a doc now that later fails because empty values are forcibly included. 

[22:27:00](#TvUkaIW28B7gQ820DGcz5Q4E4QSceMLGeae2E23Cs5k) <hiiamboris (NOT THIS ONE)>:
With so many different tastes around, it's a great thing that Bolek's codec can use different emitters :)

[22:40:05](#x8JRB4EKLcjSpiB-zdsp1Nm52UQsDE3u4SjZ5nVjHO4) <zentrog>:
greggirwin (Gregg Irwin): Good summary. Maybe a nice checkpoint to copy over to the wiki page?
hiiamboris (hiiamboris) I agree!

[23:12:42](#02vViXa0ZSoA_e-ICa5zjBZqsAGg07pULmE3HWWKUc0) <greggirwin (Gregg Irwin)>:
@hiiamboris, yes, what we're talking about here is the standard emitter. Other formats will make great blog posts or something.

[23:17:39](#OBCQOBX6dy3BfcTw9zfc3pnrWSMqLmyfnp0Rwrat694) <rebolek (Boleslav Březovský)>:
@greggirwin thank you for your reply! Here are my thoughts. 

[23:18:42](#ei-C-shNuI2fyPsx4OR70ey44XZ1myNogb2v30CaEbE) <rebolek (Boleslav Březovský)>:
On the phone, so excuse me for all errors, there would be more of them than usual.

[23:19:16](#1GjpTl3DPuSLSPCyQTRS3WYjRgv10lb5hBSNUFhH188) <rebolek (Boleslav Březovský)>:
1) I agree.

[23:22:14](#x5PkDuWVFJZqOr3rbW_xyXIHvk75AmyrYAi-0ibbIak) <rebolek (Boleslav Březovský)>:
2) we don't. If we agree with the fixed structure, why not go with `tag content attributes`. It's a fixed structure that makes sense and does not need magic keywords.

[23:24:58](#1ptSCdXdG8BnjHEJjjl_G2ezQXrYKtv_LEiCPoWY3_U) <rebolek (Boleslav Březovský)>:
2a) we can offer alternative structure, which is basically what Boris proposed and let's be clear here, it's a dialect, with all the things that it can omit, like empty attributes and text. That's not wrong, dialects are good. So let's test it as one and see how far we can go.

[23:26:42](#i6TwnBVGtECSr61L3czhbHH1a4Q41yWWvs14rXbIcM4) <rebolek (Boleslav Březovský)>:
I'm obviously not going to comment on 3

[23:28:30](#dhgccvQ5-VPR_JGp6dZ22r4UhLqqP3iaD4i38JEuDQU) <rebolek (Boleslav Březovský)>:
I've chatted about XML with Oldes a bit and he told me about XML library required for one project. That library is cca 2MB.

[23:29:17](#qMod3LrX3_LMIa9aSosx7K_JTsi3ey5NG02VuD5AlSY) <rebolek (Boleslav Březovský)>:
My codec is 17kb with all the variants, so we have a lot of space for experiments ������

## 17-Dec-2021

[0:43:22](#lsqx3H3WejJyzukYyzb2AhgwTk5Wye2_TNPoeMdtKIE) <zentrog>:
I'm not convinced that `tag content attributes` is more of a fixed structure than the alternatives. It is very consistent when text appears just in leaf nodes, but when that is not the case, you still need to repeat the structure multiple times, and it adds a lot of extraneous `none` and empty blocks in those cases. So how much of a difference is it really to loop through elements in groups of 3 vs 1 at a time? Are you primarily considering the data transformation scenario where it would be a nicer structure?

[6:21:36](#o3P1FdizFAcQ1hkY0OJfafjgK_NsiRDQirKCMSVvRzg) <rebolek (Boleslav Březovský)>:
>  it adds a lot of extraneous none and empty blocks in those cases

Each solution has it'đ downsides and that's the downside of this one. Hwever, text outside of leafs is not very usual in XML. It's a common thing in HTML but I guess we should have a different format for HTML.

> So how much of a difference is it really to loop through elements in groups of 3 vs 1 at a time? 

What structure do you mean that can be looped one element at time?

[7:28:15](#DaV_sj1betdh-V5eIzHLneq_-R_EXAXUgpM_6jFjqX8) <toomasv>:
I did some simple experiments, and I have to say for my taste @rebolek's solution won with large margin, as concerns working further with the result (especially when we have new `split` available). But there are some problems with it too:
```
source: {<example>Some <bold>words</bold> in <italic>this</italic> string</example>}

wbb: load-xml source
== [
    example [none "Some" none 
        bold "words" [] none "in" none 
        italic "this" [] ;  <-- Hey, why is "string" missing?
    ] []
]

boris: load-xml source
== [
    example [! "Some" 
        bold [! "words"] ! "in" 
        italic [! "this"]
    ]
]

gregg: load-xml source
== [
    example [.text "Some" 
        bold .text "words" .attr [] .text "in" 
        italic .text "this" .attr []
    ] .attr []
]
```
Now, suppose we want to extract just pure text from this:
```
extract/index wbb/example 3 2
== ["Some" "words" "in" "this"]

parse boris/example rule: [collect any [ahead block! into rule | '! keep skip | skip]]
== ["Some" ["words"] "in" ["this"]]

parse gregg/example [collect any ['.text keep skip | skip]]
== ["Some" "words" "in" "this"]  
```
Want to look at each element?
```
pick split wbb/example 3 2
== [
    bold "words" []
]

pick split boris/example 2 2
== [
    bold [! "words"]
]

;gregg ??
```

[7:30:21](#xEQMAe0lJ8mPKwE-YDHx9BZ8C4S1ZPaJNc80gu4_I4w) <rebolek (Boleslav Březovský)>:
@toomasv Thanks!

> <-- Hey, why is "string" missing?

Good catch! I exactly know why, the text is stored in the buffer but because it's at the end, the buffer never gets emitted. I'm going to fix it right now, thanks!

[8:00:07](#yo5RhcvETDnyU9k4I98KRnDWZ-v-bQHKZD2l94mgubk) <toomasv>:
You are welcome! :)

But I am not sure about trimming unconditionally text-nodes. Whitespace may be signifiant too in many (or at least some) cases, although I agree that it mostly may be ignored. Can it be made optionally to be kept?

[8:00:59](#GXIfPMEd772lEzqoz38ojlXY6UJlTFUYYamu-QKM-5k) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
If I may just jump in for a while, all results above are loosing information. There should be `" in "` and not just `"in"` for example!

[8:01:59](#i0GEFcTL7sbJ8O8oHQU7IRX6lg1nqTIeKEhmb-9dhT0) <zentrog>:
I think a better rule for trimming whitespace is to drop text which contains *only* whitespace

[8:03:13](#BMT7JXsgEHR3kOqfbcvd-aDYZLtHLOprBeV1OR_19ow) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
In a parser I was using, I have to call `/trim` to trim the spaces.

[8:05:56](#NU0Zv8V0MsZRkMxJtorU8SyxxKctEiafLo3j5drc4A8) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Also the order I have is [tag-name attr-block-or-none content-block]

[8:06:02](#F7ym2YpHiGNA0O1xxkn7mVfXp8zkRkeh7-pn6Y9Mm64) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* Also the order I have is `[tag-name attr-block-or-none content-block]`

[8:07:39](#PY2Vxg-8JIq8lefaZGCou4Jq9pDSZKI_3Ajdq37Pvso) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* Also the order I have is `[tag-name attr-block-or-none content-block]`where attributes are just `[key1 value1 ...]`

[8:15:13](#-f6pyLaJUGE6JbyXvUIZ6u8volE9mfNav72aVcB-gbc) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Btw... I'm not sure how much is important, if the decoded xml structure is good enough readable in console. From my experience I never needed it... what is important is, how looks the backwards encoded xml.

[8:21:42](#hsKvhkQAtOhbWy8XlBG-976MeHQh0L6juBgccrUuPCg) <rebolek (Boleslav Březovský)>:
> Can it be made optionally to be kept?

Yes, that's my intention.

[8:22:41](#l8MtAE4DnzclfEq4-kWpsFcodkof5t2n8U-TlLCqEyQ) <rebolek (Boleslav Březovský)>:
@Oldes I prefer to have content right after the tag, so you can access the content using path notation.

[8:23:55](#sniEQzuc9eskCe7c4-bxNUOvNQx9c2SGFr0HguzR754) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
I like Gregg's emitter probably most. With wbb, there's too many nones, Boris' one is nicely streamlined too, but with Gregg's one, I can clearly see, what is what ...

[8:24:48](#i8jkWxxqn2T-9Kg4eTqw7UoIUFjgdD-JHZ_DfX_fSjg) <toomasv>:
The problem is not seeing it but working with it, though.

[8:28:27](#HOoWDC5be4w7emEYdS0zxfTRcv0W4pdgUBCdwcplNfI) <toomasv>:
Accessing elements with namespace specified is a bit cumbersome but doable, e.g.:
```
source: {<example>Some <bold:rt>words</bold>^/in <italic:rt>this</italic> string</example>}
wbb: load-xml source
== [
    example [none "Some" none 
        bold/rt "words" [] none "in" none 
        italic/rt "this" []
    ] []
]
get to-path [wbb example bold/rt]
== "words"
```



[8:28:29](#CV9pZJb3HbtEjPrZCbsYcN9zu0KEufnIK7akGOrYUxc) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
@pekr if `none` is a problem it can be just `_` or something not so much distracting.

[8:35:56](#JVKv6hxbowZMbAuqwiT9NTMTDNvxs1vKf_kGRXUJknw) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Btw... one important note! [XML tags are case-sensitive](https://stackoverflow.com/questions/7414747/is-xml-case-sensitive)! I don't think any current implementation cares about it.

[8:38:00](#XPyXrdZr0teZSI6pdFknC7B4NJi8A9zg-NS6FYrMpi4) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* Btw... one important note! [XML tags are case-sensitive](https://www.ibm.com/docs/en/scbn?topic=syntax-xml-rules)! I don't think any current implementation cares about it.

[8:39:19](#qKIgpJGsJ_AXtS1u9LaNa_GxGuoOJl_AlILk694Uofk) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* Btw... one important note! XML tags are case-sensitive! I don't think any current implementation cares about it.
https://www.ibm.com/docs/en/scbn?topic=syntax-xml-rules

[8:39:42](#RBSnPrFrU4QmPOpKuzYy0F_dBOtwcVZkNfenA8EeMqk) <toomasv>:
As element-names are turned into words, there seems to be no way to enforce case-sensitivity.

[8:48:05](#hbFcwuYQVINEtTQ93AG_VX6IAYLj0PWnU3dcadugLQ8) <rebolek (Boleslav Březovský)>:
True. There is an option to leave the names as strings thought. And for most cases, I think that case sensitivity is not a problem.

[8:53:27](#jCzlj0QccY89TIDSTgd7l8SeuVrcdlc9oLz3RZXi0jo) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
My preferred output for @toomasv example would be probably:
```
	<example> _ [
		"Some "
		[<bold> _ "words"]
		" in "
		[<italic> _ "this"]
		" string"
	]
```

[8:54:55](#optYF5vAkihPUKZ2sMtuCsR_ljySOjhjpPcg24sMLcI) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
With smarter `tag!` it could be just:
```
	<example> [
		"Some "
		[<bold> "words"]
		" in "
		[<italic> "this"]
		" string"
	]
``` 

[8:55:56](#45RRtoTnMzNUpfYWGS2k-CCLEe9nDLPj9cGyso6m4-U) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
(smarter `tag!` is a tag, which is not just another string syntax, but can handle also attributes internally, if there would be any)

[8:56:43](#0wql1sqFnxo2x_hCmAazar5aU7D6YO0g8Wz61SmNbwo) <hiiamboris (NOT THIS ONE)>:
I came up with emitter names. `boris` -> `compact`, `bolek` -> `triplet`, `gregg` -> `dotted`, `oldes` -> `tagged` :)

[8:58:04](#cAQ_BFnB0WtxHatn8xLVfXYFXPhxxl440MN9CuqvpTs) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Maybe it could be just:
```
	<example> [
		"Some "
		<bold> "words"
		" in "
		<italic> "this"
		" string"
	]
```

[8:59:06](#U3YibjU3Sv45BDABKEuMXH6LXx0bSUzQ7QJ5oOcd80s) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
(my version would require parse for traversing)

[9:00:25](#CHBm6OxrTTRBmZYQddSlsMnonYDzVd8QJY3chg5JDuc) <hiiamboris (NOT THIS ONE)>:
I also should remind everyone that HTML tests are no good to judge XML codec.

[9:00:31](#vmfFC5-2OQXQb_ZasDt7AvjOWfbrbHASKXy20drBGrI) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Don't know... I'm quite happy that I don't have to work with XML now. I just wanted to put my little bit into the decision mess ������

[9:02:22](#V0lgC4kxfXYpI6DHCNyjwF75cyNfn5uU3hwvj5VLAzQ) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Here is a little piece of real code where I used XML last time (years ago):
```rebol
	shape-to-symbol: func[
		"Converts existing shape into new symbol"
		shp [block!]  "Shape's DOM"
		id  [any-string! integer!] "New symbol's name id"
		/local name symbol shpNode file
	][
		name: join "__symbol_" id ;checksum mold shp/3 'crc32
		symbol: load-xml [
{<DOMSymbolItem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://ns.adobe.com/xfl/2008/" name="} name {" itemID="} make-id {" sourceLibraryItemHRef="} name {" symbolType="graphic" lastModified="} to-timestamp now {">
  <timeline>
	<DOMTimeline name="} name {">
	  <layers>
		<DOMLayer name="Layer 1" color="#4FFF4F" current="true" isSelected="true" >
		  <frames>
			<DOMFrame index="0" keyMode="9728">
			  <elements>
				<DOMShape/>
			  </elements>
			</DOMFrame>
		  </frames>
		</DOMLayer>
	  </layers>
	</DOMTimeline>
  </timeline>
</DOMSymbolItem>}]
		
		shpNode: get-node symbol %DOMSymbolItem/timeline/DOMTimeline/layers/DOMLayer/frames/DOMFrame/elements/DOMShape
		if shpNode [
			shpNode/3: shp/3
		]
		������robe shpNode
		repend/only dom-symbols compose/deep ["Include" ["href" ( join name %.xml ) "itemIcon" "1" "loadImmediate" "false"] none]
		;ask ""
		write file: xfl-target-dir/LIBRARY/(join encode-filename name %.xml) form-xfl symbol
		
		;append files-to-parse file                    
		name
	]

	make-symbol-dom: func[name][
		first load-xml [
			{<DOMSymbolInstance libraryItemName="} name {" name="" symbolType="graphic">
				 <matrix>
					  <Matrix/>
				 </matrix>
				 <transformationPoint>
					  <Point/>
				 </transformationPoint>
			</DOMSymbolInstance>}
		]
	]
```

[9:23:02](#D6bNeZljNDUSRpcm1vd4KlmWYq8X8hIzcbX6MbGQUrM) <rebolek (Boleslav Březovský)>:
smarter `tag!` would solve *a lot* of problems

[9:30:24](#fw4oCYxA_4Fn0f67t118ll8urOuslGHda_G1CQ9aPmM) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Are we talking changing / extending tag datatype semantics? If tag would be supposed to be ever used in Red, then I am all for that. Do we have any statistics, how much is the tag type used at all?

[9:39:59](#09i5B-iyLFb-UPQ6K8SkOKA3RId9ecY6EK_KDIxCpco) <hiiamboris (NOT THIS ONE)>:
I've seen it used a lot in HTML generators in R2.

[9:46:43](#xINAFN6D7EYHFED5-b29rqcD5Mcn6C7c8ctedKrR_5Q) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Is there any description, what the "smarter tag" would be all about?

[9:47:19](#xdUMoAlDDd59tN8e66Fi3UiiDdza3X1sOuvnpvrSALs) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Just a note - it is clear that any change to the tag type is not a realistic expectation for the XML codec timeframe, right?

[9:57:00](#7Fx5xgRV4XrExn4YXZH4a8t6GUAV_GEnSc01xASmN4U) <hiiamboris (NOT THIS ONE)>:
Just forget about smart tags. Nenad strongly said No, and not once.

[9:57:05](#iBTJCGQa17cTPAWIDoCD7awvtnL8kCqfRB9iVaDckj4) <hiiamboris (NOT THIS ONE)>:
* Just forget about smart tags. Nenad strongly said No, and not just once.

[10:13:09](#fHci69FVsAYxQqszptnsoZ5VnRvXpxNYq0tCwFVpVIA) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Who is Nenad? ������

[10:13:44](#pa6ke26XoOb49yU9tHbQLtdKPQPYOBhUFq2vmMK-syo) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* Who is Nenad? ;-) Btw... in czech.. Ne means No.

[10:18:55](#aQTRKbM5-SifIII9uVWpRl3Rr931qkSGr0gJk7ysWcs) <hiiamboris (NOT THIS ONE)>:
:)

[10:20:18](#_svSUeQ0PXqSiMcrLSiHv6SY-vhbtpj4otBggSDSc7g) <hiiamboris (NOT THIS ONE)>:
In Russian too, the name could be read as "Not required" :)

[10:21:40](#L0YSXV3izrZAKHrm9sO0OWOXIWtTij6mnUk4poRlYAU) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Did not know it was discussed in terms of the Red team. OK then.

[10:31:59](#bHGPHCf0dLp-oX6Omqj-tFSm2laPdPAp-1ji1jeVjdw) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
I understand it... it is a lot of work and hard to make decisions. It's easier to just use block or none after the tag.

[15:40:21](#msX_o1ebZ4hkoVaFr8lQpxlQRjJCvshmUg60qEJaKug) <rebolek (Boleslav Březovský)>:
we can fake them with accessor functions like `attributes-of` etc. But that of course would be slow.

[16:01:49](#jNA9SPhuVEAkWl0rNWYWLDBhPGcxHQmSk_MfnCnCac4) <zentrog>:

> What structure do you mean that can be looped one element at time?

rebolek (Boleslav Březovský) I guess not one at a time, but a pair at a time. Any of these key-value-ish formats. I guess an important aspect of what makes a structure more or less convenient for processing is what interface you are expecting to use, and what you are actually doing with the data. Is it iteration with `parse`? `foreach` loops? Or filtering with something like [sift / locate](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/sift-locate.md)?

[20:45:09](#jLYLg_f-QQYE8Pzbi53p9xFgl_ieYJgdOV0UIGFNERI) <greggirwin (Gregg Irwin)>:
- Consensus is not going to happen. :^)

- We won't get a smarter `tag!`. <gavel>

- `[tag content attr]` order for triples. <gavel> (unless someone makes a *really* strong, concise, and concrete case for `[tag attr content]`).

- `!` in `boris` needs to be a sigiled word, not just `!`, if it's going to be included as a standard emitter. <gavel>

- Improved names @hiiamboris. :+1: How about `[triples compact key-val]`? `Compact` is a little tricky, because it may still be prettified, so it's not flat or minified in any way. I don't love `dialect` or `rich-type` but will let others weigh in.

- We won't change the lexer unless it's a lexer bug, but I *think* issues for attrs in `boris` are problematic only in two use cases (correct me @hiiamboris), which is 1) setting them, because you can't use them literally in a set-path. They can't nest, so will always be the last thing in a path. 2) is accessing an index in them. e.g. `.../#name/1`. You can still use indirection for them. Is that acceptable, or do we need to use another type?

- If the markup codec is going to handle both XML and HTML, they should use the same format(s). Having emitter options lets people choose the most convenient one for them. As long as things aren't lossy (not WRT whitespace), users can convert between any format pretty easily.

- Are we OK with `output-type` as the emitter control name? Since codec implies 2 directions, I'm unsure. `Format` is no better in that case.

- I don't hate `_` as a `none` placeholder in this context. But we could also do NO_ATTRS or something along those lines. If a human is going to read it, our viewer could have an option for what to display for `none` values. In the same vein, replacement of unique keys is easy. e.g. change `.text` to `!` 

- I think we can live without case sensitivity. Thanks for all your thoughts @Oldes. This is a good one.

- I defer to @zentrog:matrix.org on whitespace preservation behavior.



[20:46:35](#FkFp9ygSnIo9SW4D0eadA7vEBomsR-ZiOdxov1ZsrLs) <greggirwin (Gregg Irwin)>:
I copied some of my recent notes to the wiki. Hard to find where suggestions and their pro/con arguments are in chat now.

[20:48:29](#m-EnhPyN-UaetJQvwjA63751_mpzjLOPj4cwGYchb1k) <greggirwin (Gregg Irwin)>:
Using @toomasv HTML example, here's what I get:
```
File:   %data/simple.html
Format: wbb
[
    example [none "Some" none 
        bold/rt "words" [] none "^^/in" none 
        italic/rt "this" []
    ] []
]


File:   %data/simple.html
Format: boris
[
    example [! "Some" 
        /bold rt [! "words"] ! "^^/in" 
        /italic rt [! "this"]
    ]
]


File:   %data/simple.html
Format: gregg
[
    example [.text "Some" 
        bold/rt .text "words" .attr [] .text "^^/in" 
        italic/rt .text "this" .attr []
    ] .attr []
]
```
Note the problem with refinements, e.g. `/bold/rt`, in `boris` @rebolek.

[20:51:03](#IXFZKEbCB1BkYVn5JRlriaCu5jWxyteqG1hGNsLkEaE) <greggirwin (Gregg Irwin)>:
I've looked at a couple XML examples and will comment once I think more on it. Won't be tonight though.

[20:53:36](#uzitNCO8Xwl6Sj_nzvwz7vtjgm3hdM7KZ5MEFLLj94Y) <greggirwin (Gregg Irwin)>:
Also, @rebolek there's a problem with `gregg`. 
```
bold/rt .text "words" .attr [] .text "^^/in" 
```
Should be
```
bold/rt [.text "words" .attr [] .text "^^/in" ]
```
Shouldn't it?

[21:11:35](#9oNebmLgScIsFG6qaeLZ07bqaPkw8wu3EU8btE2inC8) <hiiamboris (NOT THIS ONE)>:
refinements are by design so they don't interfere with path access

[21:13:14](#iRuwhyolTA3iXCnJpIEBas9sJGZXPn6lorixq4Q2W74) <hiiamboris (NOT THIS ONE)>:
I don't think `../#x/1` and `../#x: 2` are lexer bugs. Rather a grey design area where nobody thought about issues in paths. But since `:` and `/` are illegal for issues, I find it much more useful to support sub-paths and set-paths than to raise an error.

[21:28:39](#wocOVeLRc_1TH19S5oH3VGJ6dljowW4gpImWNvxHNYM) <zentrog>:
Looking more closely at the html-ish sample, it's not actually valid xml. It should be more like this: (`rt` being a common namespace for related elements, and `bold`, `italic` being the 'local element names'). I just made up a namespace definition for it. One note is that the `xmlns` prefix is one of the rare places where you will see a namespace prefix on an attribute.
```
source: {<example xlmns:rt="Red/rich-text">Some <rt:bold>words</rt:bold>^/in <rt:italic>this</rt:italic> string</example>}
```

[21:30:06](#zMWgYwHyPuPXtfN4V_pX4VHq0qca2bEf-Ho5wRfsoeI) <hiiamboris (NOT THIS ONE)>:
A few (rare) examples of multiline text from CLDR:
```
    <keyword>
        <key extension="t" name="k0" description="Keyboard transform:
        Used to indicate a keyboard transformation, such as one used by a client-side virtual keyboard.
        The first subfield in a sequence would typically be a 'platform' designation,
        representing the platform that the keyboard is intended for.
        The keyboard might or might not correspond to a keyboard mapping shipped by the vendor for the platform.
        One or more subsequent fields may occur, but are only added where needed to distinguish from others." since="21.0.2">
            <type name="osx" description="Mac OSX keyboard." since="21.0.2" />
            <type name="windows" description="Windows keyboard." since="21.0.2" />
```
---
```
            <attributeValues dtds='supplementalData' elements='subdivisionAlias' attributes='replacement' type='choice'>AS AW BL BQ CW GF GP GU HK MF MO
                MP MQ NC PF PM PR RE SJ SX TF TW UM VI WF YT</attributeValues>
```
---
```
        <firstDay day="sat" territories="AE AF BH DJ DZ EG IQ IR JO KW LY OM QA SD SY"/>
          <firstDay day="sun"  territories="
            AG AS
            BD BR BS BT BW BZ
            CA CN CO
            DM DO
            ET
            ...
            SA SG SV
            TH TT TW
            UM US
            VE VI
            WS
            YE
            ZA ZW"
          />
```
---
```
            <variable id='$oldLanguages' type='choice'>
                aa ace ada ady ain ale alt an anp arn arp ars av awa ay
                ba ban bho bi bin bla bug byn
                ch chk chm cho chy crs cv
                dak dar dgr dv dzg
                efi eka
                fj fon
                gaa gan gez gil gn gor gwi
                hak hil hsn hup hz
                ...
                udm umb
                ve
                wa wal war wuu
                xal
                ybb
                zun zza
            </variable>
            <variable id='$scriptNonUnicode' type='choice'>Afak Aran Blis Cirt Cyrs Egyd Egyh Geok Inds Jurc Kitl Kpel Latf Latg Loma Maya Moon
                Nkgb Phlv Roro Sara Syre Syrj Syrn Teng Visp Wole
            </variable>
```
Note 3 of 4 examples put that into attributes.
I would say that authors relied on the following logic here:
- newlines between non-empty strings are significant and should be preserved
- opening/trailing newlines are purely for reader's convenience
- line indentation is clearly only for the reader of XML file, and is either supposed to be removed or ignored in the output; I guess we need newlines to be able to reproduce the XML, but can strip the indentation when reading and produce new indentation when saving


[21:32:54](#B2mbnpJuyeEJVWfS1SHY4S0ShZwFOo10Xtmiufpj_8Q) <greggirwin (Gregg Irwin)>:
@zentrog:matrix.org your example doesn't seem to load. @rebolek?

[21:33:51](#a6y1125MRLvtvLSReJ4iBBC85j-bopA7gh3s_jJGzg0) <hiiamboris (NOT THIS ONE)>:
I think header should not be mandatory, for testing purposes.

[21:34:32](#enJgWm8DRrFNu962t_yj8ayGvqb13PNLisnuA1ehgQ0) <greggirwin (Gregg Irwin)>:
Good examples @hiiamboris.

Worth raising the `issue!` issue for Nenad. R2 allows it.

[21:35:05](#MiZzUf9tHvYcUTofOj-DUNb1_cFySeXF-icIAxw2J3A) <zentrog>:
It seems to work for me
```
[
    example [none "Some" none 
        rt/bold "words" [] none "in" none 
        rt/italic "this" []
    ] [xlmns/rt "Red/rich-text"]
]
```

```
[
    example [/xlmns #rt "Red/rich-text" ! "Some" 
        /rt bold [! "words"] ! "in" 
        /rt italic [! "this"]
    ]
]
```

[21:39:29](#AfA7wzuO0B-w2EobAKCnBkn5_8jfHINKGP6YiQTPP1k) <greggirwin (Gregg Irwin)>:
@zentrog:matrix.org interesting. Works if I paste `source` into the console and load it, but not if it's in my test file run by my script.

[21:39:55](#6F44aluW1MaKXa6Q8QFxHu75LJSqkg8Ru7yTCR8j6KU) <zentrog>:
Is it the newline?

[21:41:04](#ywoSbA0tk62cPMGG1xwQxeDkVGwSaqe5EvxJSyBKBuo) <greggirwin (Gregg Irwin)>:
No. It was having the original data in there as well, even as a comment it seems.

[21:43:31](#EJ2AtNGNsHJOGJC9erXN3M6Yg58z4nEfoalFa6gTbNk) <greggirwin (Gregg Irwin)>:
Likely because there can only be one root. 

[21:43:54](#upr2xDSSNb7FEQbWmY4OQ_KBbGPLJ5NlN69-hWDjL8o) <greggirwin (Gregg Irwin)>:
That was it.

[22:26:17](#K9vnmnksdeKUKrwl2G7zvErdR9Qjv5cQfMFZcGChkP4) <zentrog>:
It's certainly safer for xml schema designers to keep newlines in the attributes to protect against the data being corrupted by someone using an xml formatter. I have opinions on what would be the best default whitespace handling, but I'm likely to be wrong about it. Ideally you're reading machine generated xml which doesn't have any extra whitespace. If it's been formatted, then it depends on the formatter. A smarter formatter might not break up sections if there are mixed elements with text. But there is no guarantee about that.

Here's what the VSCode plugin I generally use does with that sample:
```
<example xlmns:rt="Red/rich-text">Some 
	<rt:bold>words</rt:bold>
in 
	<rt:italic>this</rt:italic> string
</example>
```
Kinda weird. Probably no matter what you do, it's not going to be quite like the original.

[22:34:18](#y8NhXTRy6RPrL0c8m-5EBnE623erTVG8pU22ReTrEAg) <zentrog>:
So I guess the question is do we put in trimming by default for cleaning up stuff that might be a bit messy, or make people opt-in when they know their inputs are trimmable? If you have clean inputs, trimming *could* be problematic in some cases because it's possible to store a whitespace value as text, but hopefully rare.

Trimming is probably nicer for explorational stuff, like testing with sample data which happens to be formatted, or API examples.

[23:22:39](#cCLGWlzSiGv92Zvr1dtYxtb5qHQK5ExBr642RatxpVA) <greggirwin (Gregg Irwin)>:
- If it's machine generated, it should be clean (pre-trimmed if necessary).

- If we don't trim in the codec, nothing is lost and the user can still do it. A simple wrapper can even trim all strings in place so it's not a terrible efficiency hit.

- If we *do* auto-trim, data is lost and we can never get it back. Then we have to add a `/preserve` refinement or something, which is no easier for users than a `trim-strings` helper.

I vote to preserve whitespace.

## 18-Dec-2021

[7:44:20](#UY8iHAOEQr9i09OBGAr9_Y4EWDNvrR4LfaKWO-WJ7nA) <rebolek (Boleslav Březovský)>:
@greggirwin Thanks for your thoughts!

> ! in boris needs to be a sigiled word, not just !

I agree, that's the plan, I just haven't implemented it yet.

> How about [triples compact key-val]

Good suggestion, I'll use it unless we can come up with something better

> If the markup codec is going to handle both XML and HTML

There's so many sublte differences between those two formats that I prefer to have a separate parsers. A lot of code can be shared though.

> Are we OK with output-type as the emitter control name?

As I recently modularized emitters also, this is going to change.

> I don't hate _ as a none placeholder in this context

This can be optional probably too

I'll comment on the other posts soon.

[8:24:28](#OiB9QGRfhg2Z7d3dUMNsGf0Zh4XFyLqY3JqAJgsroZU) <hiiamboris (NOT THIS ONE)>:
I vote for auto trimming and a preserve option, because trimming indentation is not as simple as just 'trim' call.

[15:16:49](#2HmbCcEtO_HHnNMflZPY9frRczx-wAPCpzMGY4qSI0I) <toomasv>:
> Consensus is not going to happen.

Yes, until there are no commonly accepted criteria. There are so many aspects -- composability, compactness, readability, efficiency, utilisability, accessibility, closeness to specification... from the top of my head. Are there more? What weight to these have compared to each other? What value does each format have in each of these aspects? If we could get to some more-or-less agreed list of relevant aspects, their relative importance, and estimates for proposed formats in these aspects, only then would there be any hope to reach consensus, er.. of moral majority. IMHO.

[15:17:35](#JJmEM_r0WeC7ljbriyxXNmBbCK3WO6qbukdS8TizwYs) <toomasv>:
* > Consensus is not going to happen.

Yes, until there are no commonly accepted criteria. There are so many aspects -- composability, compactness, readability, efficiency, utilisability, accessibility, closeness to specification... from the top of my head. Are there more? Oh, yes, Red-ness. What weight to these have compared to each other? What value does each format have in each of these aspects? If we could get to some more-or-less agreed list of relevant aspects, their relative importance, and estimates for proposed formats in these aspects, only then would there be any hope to reach consensus, er.. of moral majority. IMHO.

[15:27:21](#qf4BGWYcTdqR7MiY_XMHyO4DVugSKwMThSgScuv-aek) <hiiamboris (NOT THIS ONE)>:
Thing is, different people care about different aspects. To me for example learning `!` takes a few seconds - just enough to read the sentence explaining it's meaning and glancing at the output example. But some people will look at the output and think OMG what does this even mean?? Without a textual hint they will feel lost. So our preferences come down to our differences :)

[15:29:51](#xMi1Ef3TOim5SD3rHAgImWabOoTIX2M4s8Nge-W8hXw) <hiiamboris (NOT THIS ONE)>:
* Thing is, different people care about different aspects. To me for example learning `!` takes a few seconds - just enough to read the sentence explaining it's meaning and glancing at the output example. And then I immediately can reap the benefits of it not growing on my eyes. But some people will look at the output and think OMG what does this even mean?? Without a textual hint they will feel lost. So our preferences come down to our differences :)

[15:30:31](#eYxIXdl270wgRgrJ3XgclSxx3GD2bi9BRxIbQsSSfH4) <hiiamboris (NOT THIS ONE)>:
* Thing is, different people care about different aspects. To me for example learning `!` takes a few seconds - just enough to read the sentence explaining it's meaning and glancing at the output example. And then I immediately can reap the benefits of it not growing on my nerves. But some people will look at the output and think OMG what does this even mean?? Without a textual hint they will feel lost. So our preferences come down to our differences :)

[15:31:43](#pj6bBIY7BhEGq8_wbScrXD0SKtCl73olzITW6tlQIOE) <hiiamboris (NOT THIS ONE)>:
Obviously there are also people who are *opposed* to any kind of documentation. For them textual hint is a must. That's why Gregg insists on it I think.

[15:35:02](#T1PFrzG_UNnDe9EOCSmMA6ylhUFrdTscqajfx9hjzqc) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
We are hurrying up for the next release I think, and we might make some mistakes. But - it is "just" codec and as such can be adapted, reworked, or even replaced? There is so much in the naming, that sometimes the old Rebol discussions I remember, were tiresome. E.g. my notice to abbreviating attribute to attr was kind of downplayed, whereas we have funcitons like on-deep-reactor. And I can even understand, that reading such long names might really play on our nerves. I am afraid there is no simple answer to all of this. 

[15:35:52](#B161wjDIjtFhjFL1TASwVvXMN0NXm5vIXvctJCxYbnE) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
And as is mentioned above - the look of the Red generated code is one thing, the other thing is - how do we access, change, export the results? Paths? Accessors? Filters? Iterators?

[15:36:51](#1Gl4fl__fw-7Ap6ISlvHSg3haZOywYCUDOSonpYWk_w) <hiiamboris (NOT THIS ONE)>:
I haven't come up with a good extraction technique yet, but I'm thinking about it.

[15:54:01](#_eXN8mvmg_OYSs6qd3Ddz7VVTDCQ9PgHHSGzYvuMtxw) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Well. How the output looks might be important when prototyping. And you are right, many users will not look into docs first. Will have to look into Carl's Altson proposal, if there is dot convention. If it eventually, due to its look, will help users of xml or html feel familiar, then - why not?

[15:55:06](#QK41-rfoOMQX3_cFnaAlZxf7-HnF1jCV0YVMKVYFOeo) <hiiamboris (NOT THIS ONE)>:
I don't think you can convert XML to JSON (or any of it's alternatives).

[16:00:15](#4Z3kbMJPMoblnyyMsPXi5SDWsAWJw97HKTK-04-7MT4) <hiiamboris (NOT THIS ONE)>:
I mean you could change the structure completely, but will it be a win or not?
E.g. 
```
<type>42</type>
<x>1</x>
<x a="a">2</x>
<x b="b">3</x>
```
Can become this JSON:
```
"type": "42"
"x": [
   {"text!": "1"}
   {"text!": "2" "attr!": {"a": "a"}}
   {"text!": "3" "attr!": {"b": "b"}}
]
```
Which is closer to Red in way: it has arrays. But it's still the same iteration to find what you're looking for.

[16:01:02](#smjFpRoQLiv1sTN9MmPwN02a3MJdzuEwSlQkSzIjfpQ) <hiiamboris (NOT THIS ONE)>:
* I mean you could change the structure completely, but will it be a win or not?
E.g. 
```
<type>42</type>
<x>1</x>
<x a="a">2</x>
<x b="b">3</x>
```
Can become this JSON:
```
"type": "42",
"x": [
   {"text!": "1"},
   {"text!": "2" "attr!": {"a": "a"}},
   {"text!": "3" "attr!": {"b": "b"}}
]
```
Which is closer to Red in way: it has arrays. But it's still the same iteration to find what you're looking for.

[16:01:42](#vrNaPOwogPD1x864OqpH2usOLMBzgT7aHlhyhh0Q3pE) <hiiamboris (NOT THIS ONE)>:
* I mean you could change the structure completely, but will it be a win or not?
E.g. 
```
<type>42</type>
<x>1</x>
<x a="a">2</x>
<x b="b">3</x>
```
Can become this JSON:
```
"type": ["42"],
"x": [
   {"text!": "1"},
   {"text!": "2" "attr!": {"a": "a"}},
   {"text!": "3" "attr!": {"b": "b"}}
]
```
Which is closer to Red in way: it has arrays. But it's still the same iteration to find what you're looking for.

[16:04:07](#GF1e4XXqUC1YLeLUl5OCbk-1HqoIDNEd4Mm0w-PCDro) <hiiamboris (NOT THIS ONE)>:
* I mean you could change the structure completely, but will it be a win or not?
E.g. 
```
<type>42</type>
<x>1</x>
<x a="a">2</x>
<x b="b">3</x>
```
Can become this JSON:
```
"type": ["42"],
"x": [
   {"text!": "1"},
   {"text!": "2", "attr!": {"a": "a"}},
   {"text!": "3", "attr!": {"b": "b"}}
]
```
Which is closer to Red in way: it has arrays. But it's still the same iteration to find what you're looking for.

[16:05:08](#cpX1fgE-NdFw9rVkfdp8-C_LzFPwqDNxbsI7h7DKLDM) <hiiamboris (NOT THIS ONE)>:
* I mean you could change the structure completely, but will it be a win or not?
E.g. 
```
<type>42</type>
<x>1</x>
<x a="a">2</x>
<x b="b">3</x>
```
Can become this JSON:
```
"type": ["42"],
"x": [
   {"text!": "1"},
   {"text!": "2", "attr!": {"a": "a"}},
   {"text!": "3", "attr!": {"b": "b"}}
]
```
Which is closer to Red in a way: it has arrays. But it's still the same iteration to find what you're looking for.

[16:11:22](#DH0Kjd89xLv1C0bPKWXuzRrvoMpILrwB2iXaOf1kVXc) <hiiamboris (NOT THIS ONE)>:
Problem of XML is it does not provide you with the clue, whether each element is supposed to be unique, or can repeat array-like. So you have to create arrays for every element, just in case.

[16:13:31](#Emo57vm30hR91T6zHuc4QoYPnXLPFvDTXYVGSXH_H58) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Dont want to convert xlm to json. Just stating the familiarity of certain devs with the dot convention. Dots, in many langs, mean object method access. I am mostly thinking of CSS accessors. Remember having a teplate html page with tables of prices, and jquery function calling recalculation for particular class.

[16:16:24](#G9cGap0XB3YcWOx2e0EOhiIJmchQTp3WIo3TlLE0YpQ) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
I think the reason for having a codec is two fold 1) import the data, do some tweakings, export back, or 2) import, take the data and use in terms of your app.

[16:46:59](#tLlPKqSxkTZUsLuBNs6DO5GUa1oDKUlVeDyQlNJM8Vk) <rebolek (Boleslav Březovský)>:
@hiiamboris this is very interesting example because Red is closer to JSON than to XML so we should look how the conversion is solved there.

[16:49:24](#AHVNHzgBERg42o1S6iLgt35_WZ5MSN6tSd5SyfWES9I) <hiiamboris (NOT THIS ONE)>:
I can tell how it's solved from two huge projects: CLDR and CLDR-JSON that's aimed to convert the former. There is almost nothing in common in data structure between the two projects. They just took the data out and created new files with data how it looked convenient for them.

[16:53:23](#XYGrYf5h9w-646CZCwMshzpE2W4y3_m2FIz4DqcaBg0) <rebolek (Boleslav Březovský)>:
I meant libraries.

## 20-Dec-2021

[23:24:46](#HxcJogGFp0pHQw9tSQWi1SBRS3z1s5ms6Bsg-otC_ZI) <greggirwin (Gregg Irwin)>:
@rebolek separate parsers is fine, I just think having the same format(s) emitted is important.

[23:28:52](#fV0DfOgiQwFPqluegB9j4tAs_l20mf5G67lZHFQDe4g) <greggirwin (Gregg Irwin)>:
For this codec, I'm good with getting it out there and *not* freezing the emitters instantly. We'll find out if anybody uses it and provides feedback. Given the emitters we have now, there should be something for everyone, and if we want to make custom emitters possible, that can happen later. 

## 21-Dec-2021

[8:54:23](#wISQVh5QhlQhbO-gnEBEL_0z8SWCvwh5L30yuXusPs0) <rebolek (Boleslav Březovský)>:
@greggirwin there are currently three parsers that return different Red formats and three emitters that return the same XML file as was the source (minus formatting of course). They should be fully consistent.

[21:51:03](#x9slpZaYbHDjyrtVK97mLi9inKtC5rKizNcm0f1qwgc) <greggirwin (Gregg Irwin)>:
:+1:

## 22-Dec-2021

[10:08:16](#T43qzgjpfCi9fy915oSqrS8SZrMn_-aFw3MCX7dzHkw) <rebolek (Boleslav Březovský)>:
For the format setting, `output-type` was a temporary solution, I’ll add `/format` to both `to-xml` and `load-xml` with `triples` being the default format and for people who don’t like that as the default format and don’t want to use the refinement every time, there would be an option to override it directly with setting `xml/format`. I guess this is the most sensible solution, but I’m of course open to suggestions.

[11:02:07](#YkJlo5qwYOk1_xbG8Y_m-h0a4cOqhzb-pFs94PGUv2o) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
I just found, that Github is now returning "+1" as a key in its json data. That is not a valid word, so it breaks the codec.
```red
>> load-json {{"a": 1}}
== #(
    a: 1
)
>> load-json {{"+1": 1}}
*** Script Error: contains invalid characters
```
Do we have any strategy, how to deal with something like this?

[11:03:46](#VFfgy7WaBr9wTRvekNKNEL7qC_9rcPXKGUcr3RapgBA) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
I just found, that Github is now returning "+1" as a key in its json data. That is not a valid word, so it breaks the codec.
```red
>> load-json {{"a": 1}}
== #(
    a: 1
)
>> load-json {{"+1": 1}}
*** Script Error: contains invalid characters
```
Do we have any strategy, how to deal with something like this?

[11:05:08](#YOUW4GLXv1mQgyUaqO-tGFmFxrAEFlNL7AWnlVbRjfI) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
I just found, that Github is now returning "+1" as a key in its json data. That is not a valid word, so it breaks the codec.
```red
>> load-json {{"a": 1}}
== #(
    a: 1
)
>> load-json {{"+1": 1}}
*** Script Error: contains invalid characters
```
Do we have any strategy, how to deal with something like this?

[11:15:48](#tTkmqXoHCKb2EQ8_f6zZt6PqnJbjlwf6g9e49_2gimQ) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
I guess that only possible solution is keep it as a string.

[11:50:42](#wwHol3FVbHKyiKCGcwYHsyVym9iMOoKTkOO0DzrFAMs) <rebolek (Boleslav Březovský)>:
Right, keeping it as a string is a solution. I believe that JSON codec should fail back to strings when an unloadable key is hit but I’m not the author, so I don’t know the details of the implementation. I guess filling an issue would be appropriate, so I’ll look into it

[11:59:51](#Sjgoig-yETTgQX5n1Z0lypjySAdi3Mmm17-6gKSYwVQ) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
[This parse rule](https://github.com/red/red/blob/01d964636422c6a8d30b01dbd2beb439ccbe830f/environment/codecs/JSON.red#L177) must be enhanced to fail if the is  `[#"+" | #"-"] some digits end`

[12:00:03](#DKg5qQ2E0plvM_bNyAqHzAatP54uDamXUk_PLJAYaV8) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* [This parse rule](https://github.com/red/red/blob/01d964636422c6a8d30b01dbd2beb439ccbe830f/environment/codecs/JSON.red#L177) must be enhanced to fail if there is  `[#"+" | #"-"] some digits end`

[12:04:37](#NtjJIUsmVzyV2H6PpZnlrNFqE1ST8AUM094ksbJgChQ) <hiiamboris (NOT THIS ONE)>:
I think `attempt [to word! str]` will be much faster than parse there.

[12:08:30](#W9hwPZ0sjVQWErRpEJTFrR4HX1ozp_QmiwtUPUK12rY) <hiiamboris (NOT THIS ONE)>:
Or maybe it just be just `transcode/one` and check of the loaded type to be `word!`

[12:08:57](#bwP28QXFNLaPeuxGV13xgjIkABCgyiNmRDfbyLm7QUY) <hiiamboris (NOT THIS ONE)>:
Because:
```
>> to word! "#x"
== x
```
we don't want this I think

[12:09:20](#m4gyyEEJCwugNbOyFVSjLSt-RNxFdfGCWIN-jhavJyk) <hiiamboris (NOT THIS ONE)>:
* Or maybe it should be just `transcode/one` and check of the loaded type to be `word!`

## 23-Dec-2021

[2:55:35](#rJW6yI3MO-RsEYSgsgJRM3uZ7R5TnWuKkGGyAJMcYBU) <greggirwin (Gregg Irwin)>:
Just one quick question/comment for now. @rebolek would `/as` make sense, rather than `/format`?

[6:33:23](#ac8UMT6RsSjen4h0lTBkxgKH9MnDtbRgbMcz7lY36gY) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
+1 for /as

[7:26:37](#txDbCrr87BcmmDA6dpPtfFCb4aIReUm6-XwDo3htMpE) <rebolek (Boleslav Březovský)>:
@greggirwin good idea, it will be `/as`

## 29-Dec-2021

[11:46:32](#SdmmG0Oi1BkftH_UuwaPMEP8VgOxv7GIQekBaFkezl0) <rebolek (Boleslav Březovský)>:
`/as` was implemented and the bug is fixed now.

[20:52:42](#LHkzuD6jwfrgK18KOBG2ItO-1f_62uOSDVgU30gMbnM) <greggirwin (Gregg Irwin)>:
:+1:

## 4-Jan-2022

[1:36:44](#L4AMXL7W6DgLtEVpBAIawfEkTdqxXNVu7nE6hBdj67E) <greggirwin (Gregg Irwin)>:
@rebolek when would you like to do a PR for the markup codec? I'll try to review the code shortly, so we can sync up on anything there.

[6:05:41](#atyTLPmKSsaJho8_x-8poH7PNWfHnZVKc_twyiEgves) <rebolek (Boleslav Březovský)>:
@greggirwin in a day or two, I’ll just review the code and do some cleanup. Should be really fast.

[19:14:26](#e9GqOFldxHx0WyqbGtHbXFxUdCEKN5kEW-pH97kkUOs) <greggirwin (Gregg Irwin)>:
Sounds good.

## 5-Jan-2022

[8:13:42](#GnkOYQluLOXpqh3ZTPtH7RkUwMiA3uGM2SgU8GGTVkk) <rebolek (Boleslav Březovský)>:
Found a bug.

[9:03:19](#AAhG1koCj7re83DzCIWIeaCFWEAKZv28UVL8BKaP8dM) <rebolek (Boleslav Březovský)>:
@hiiamboris in your format, how should `<tag/>` be stored? Just `tag` or `tag []` ?

[9:54:56](#-86yymOcFYZC9pTQ00ZXzXUeOtTkRvFpGw8n_oYDQiY) <hiiamboris (NOT THIS ONE)>:
`tag []`, so `tag/text!` would eval to none

[11:08:03](#8ulYgr-T4wNJJuBpNDUmG0sJKGW6MtmiDBeVZwCMUDc) <rebolek (Boleslav Březovský)>:
`text!`? it’s not `!` anymore? :-)

[11:08:35](#YaxLwkCufWXnAJg5tFHXOj0gFNSwOxvNNpikhbXQagM) <hiiamboris (NOT THIS ONE)>:
I like `!` but Gregg vetoes it :)

[11:09:09](#aq-E11-1GanfbGHZpgtojipfhfP2BRDgUIzTT2aSVBo) <rebolek (Boleslav Březovský)>:
`!` is still in code ������

[11:09:47](#cMSNkKP7xdwyAeWLlEqmtyKfsIywZ9mVy3cRoyxIB5g) <hiiamboris (NOT THIS ONE)>:
Good! :)

[11:10:16](#binI2-iJHD6DwU0WvRkL70Ei-5Qa_rFWN9ed4-467mk) <rebolek (Boleslav Březovský)>:
Anyway, it’s user-configurable, so even if Gregg gets it changed to `text!`, you can override it.

[11:10:20](#upGsY62LnzVCmSX5Jx7yK3MKbQojfyipljUZ7Ho-eJI) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
... not sure it's ready for release, if those things are not agreed-upon :-)

[11:11:01](#2STTi7LpWlBswpM9J3m4UzP5HYp3hmgOWqMpkI5fk7w) <rebolek (Boleslav Březovský)>:
It would be released as alpha. Thanks to its modular nature, more formats may be added if we find a better way to represent XML data

[11:11:20](#zMqe3haWif8MSWZx0ppm-gOFS8p1AbItViTjtCZt8e8) <hiiamboris (NOT THIS ONE)>:
:+1:

[11:12:04](#2zYekzEz6tnb-OWOvbru9qwbiSKG8JH2IzF6zcf249M) <rebolek (Boleslav Březovský)>:
@pekr it’s a one-line change, so can be done really at the last moment.

[19:52:09](#F3lZ6Gt1cBEIVszlqC9B6LCDF_AGwLvwYhi25BhISkA) <greggirwin (Gregg Irwin)>:
I still veto `!`.  Please change it. As @rebolek notes, people can override it if they want for their own uses. For standard Red work, it should not be overridden.

[19:53:03](#0BZo1-fl8nnw47DD3pfrKju4Z5EmBd-nAnIxHpVfTdE) <greggirwin (Gregg Irwin)>:
Writing up some docs will also help catch things that may have been changed many times in chat here.

[20:15:21](#5zxiZK6sfxAtoz88Jby3E2R2JB7ZpIH4AVf55ct5UUw) <greggirwin (Gregg Irwin)>:
For reference @rebolek: https://gitter.im/red/codecs?at=61bcf6d4c642515af33c5f43

## 6-Jan-2022

[5:55:14](#F5Kj3kD2dJdd9mXF9nICKykwLDJmGtpUppZVZWm2ogY) <rebolek (Boleslav Březovský)>:
Ok, I’ll change it.

I’ve re-read that post and let me address few things there:

> We won't change the lexer unless it's a lexer bug, but I think issues for attrs in boris are problematic only in two use cases (correct me @hiiamboris), which is 1) setting them, because you can't use them literally in a set-path. 

IMO this is a bug. Why is it possible to use them in `path!` and not in `set-path!`? What’s the rationale here?

> They can't nest, so will always be the last thing in a path. 

I don’t see this as a problem, the way we would use them here, they always would be last thing in a path.

> 2) is accessing an index in them. e.g. .../#name/1.

Same as above, index doesn’t make much sense here

> You can still use indirection for them. Is that acceptable, or do we need to use another type?

For me, these are acceptable trade-offs.

[8:02:30](#s6OBtn3PWYtHhwTmAStzW5mGwJ5d6EoQqx2PP-hXG70) <rebolek (Boleslav Březovský)>:
> Writing up some docs will also help catch things that may have been changed many times in chat here.

I wrote an overview of the implemented formats: https://gitlab.com/rebolek/markup/-/blob/main/README.md

[9:17:47](#c5aJ8Z--e02sVymYrzta9wJADDW9bJ8_a2N9XvnHxE4) <rebolek (Boleslav Březovský)>:
Anyway, the default sigil in `compact` format changed to `text!` and keywords in `key-val` format are now `issue!`

[9:17:59](#CDjCGHq4ISJplGJaePW6tzACwp_vkUViQERa0VY_y2g) <rebolek (Boleslav Březovský)>:
Also, all remaining bugs should be fixed I hope.

[9:19:16](#woctaAnaNutZKRuALe5Tb2-qNo2vGGaAOpahopK2kR0) <rebolek (Boleslav Březovský)>:
There are some minor improvements left to do but it it seems to be ready for PR.

[9:20:32](#piN6YLc5k3_U1t50Ne6Rwc-q0rdc5b8WHO5wiIU8IXY) <rebolek (Boleslav Březovský)>:
Also, I was contacted by Danny Murrilland, who wrote http://www.rebol.org/view-script.r?script=rebol-dom.r which I’d like to review once I’m done with the minor improvements.

[11:27:43](#mNvKqhaBeUhWpgOfVNaS8coaktmzIsmepRWU7fGxyXU) <rebolek (Boleslav Březovský)>:
I’ve made a pull request but probably it would need some changes still, here’s the question:

[11:29:22](#SsBqL6lvYJJ3Zq51OGPXP-H8iQnnxA9ciH7pKxxPikI) <rebolek (Boleslav Březovský)>:
the codec is in `XML` context. Other codecs are in anonymous contexts. This context has a name so it’s possible to change some settings. I can probably add a function, something like `xml-settings` that would take care of it and let the context be anonymous. What do you think?

[11:56:19](#H1q4_6dK0w4OSADmlecAIQDdQT7zpQ13Ql-_cI2ZUiI) <hiiamboris (NOT THIS ONE)>:
it's best to put settings into `system/codecs/xml` I think

[11:56:27](#4PXjQXx0TGFkJ0Hjzo1ohRfPad9knWxE4oB2Ry58ivg) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Xml-settimgs would sit in a global context? I don't like exposing thing, which have some abstarction (codec system), this way. Already did not like Rebol's do-service, do-browser. I lik3 polymorphism, but am also aware of evetual slow down by overloading functuons that way ...

[11:57:14](#jaS_CH3o766acWIVrJdJXATIxTHIqb7dTu10CtWzDXU) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Maybe general get-codec name param?

[11:58:29](#ejA2bvWPnKT2JO9LeLbfAly-PaJjboCfH21s-wGuOrk) <hiiamboris (NOT THIS ONE)>:
btw it's rather strange that `system/codecs/json` uses capitalized names in it

[11:59:02](#E1WKRqrq_76C33ENGCi1qM85HqzUUVJKCGbhRpPFMTo) <hiiamboris (NOT THIS ONE)>:
maybe they come from the header..

[12:04:51](#sR6MVIvnxa3bqmmAwLd1xTRMc-I-_E_fwJX7Z7Whs10) <rebolek (Boleslav Březovský)>:
@pekr yes, it would be in global context.

[12:06:22](#myb0abTWfRvp_sebGUiYFSmibxh7Iw49LwL0spAOjmI) <rebolek (Boleslav Březovský)>:
@hiiamboris CSV also, but I copied it from JSON :-)

[12:25:41](#nXPHaf4IaDPICpcI1MKgf0MrGSA0c9WjSt4VvP2vKFI) <rebolek (Boleslav Březovský)>:
Hm, I’ve got compilation error on this.

[12:49:54](#CfXJpvSNT3EcvEq4nosMDh23QnIGcLeHmbyn2Qg4vWc) <rebolek (Boleslav Březovský)>:
Fixed.

[21:38:28](#vBYGROL9sTx1t43aYFFEuinRYHJoiuL4EzuNE2mI44A) <greggirwin (Gregg Irwin)>:
:+1:

- "Be aware that /as checks for invalid format names but if you override the format name directly, there is no check and you’ll end up with an error." To clarify, `/as` catches the error earlier, as it's checked when set, but setting the format name produces the same *kind* of error, just when the data is loaded, correct? That is, you don't get a different error or crash.

- `red-keys?` sounds funny to me. If that's the default, and the norm, would it be better to call it out as `str-keys?`? Then `unless red-keys? ...` (the two places it's used) become `if red-keys? ...` which is also cleaner. Also make sure it is doc'd outside `triples`, since it applies to `key-val` as well.

- :+1: for having commented examples of each format right there. Maybe pull the XML source out of the `triples` section, since it's used for all of them. Or included it in the other sections for direct comparison of input and output.

- "Text content is prefixed with a special sigil (by default !)," That's going to be `text!` instead of `!`, correct? The code does have that now. Also probably important to note why the sigil is used, because `!` can't appear in XML content, so it avoids conflicts.

- Thoughts on a better name than `text-sigil`? Simply because "sigil" denotes a single symbol, rather than a name, key, or marker. This one does apply only to `compact`, so `text-key` is *slightly* confusing as it looks like it applies to `key-val`. 

- Maybe `include-meta?` instead of just `meta?`. 

- I have to go back and look at earlier format chat now, because I think `key-val` is not quite right in the example.
```
        version #text none #attr [number "$Revision$"]
        language #text "Czech" #attr [type "root"]
        markup #text none #attr none
```
Should be
```
        version [#text none #attr [number "$Revision$"]]
        language [#text "Czech" #attr [type "root"]]
        markup [#text none #attr none]
```
Shouldn't it? Otherwise it's not key-val all the way down. And I don't remember if we decided `none` values would exclude their associated key (and the `none`). e.g.
```
        version [#attr [number "$Revision$"]]
        language [#text "Czech" #attr [type "root"]]
        markup []
```
I do remember an issue being `x/#attr/z` may fail if `#attr` isn't there, but it will also fail if it's `none`.

- @rebolek thanks for making the `load/to encode/decode` consistent with the others. :+1: I was looking at the old code and going to comment, but then checked the PR code and it's good there.

[21:45:19](#4HsOZTUsU8z500eiBCxntbnCIJZMtkUiX19nQNw6e6g) <greggirwin (Gregg Irwin)>:
I'm OK with capitalized text, especially acronyms, as humans use them.

[21:57:15](#781MkszVzQA2KcbZEVzpSjQhbmsl4e-oRxYdq6esF7g) <greggirwin (Gregg Irwin)>:
I don't like the idea of `xml-settings`, but we should be consistent. In the other codecs, you need to use `load/to` to spec alternative options. However we decide to do it, we should be consistent. Each codec can have an `options` area, but that means changing CSV and JSON now too. Doing it with refinements on `load/to` means a couple more for the XML loader. A third option is an `/options` refinement for `load/to` funcs, to subsume others. Not as nice for `help` that way.

My gut says to make XML (and HTML when we add that) work like CSV and JSON. But if we *do* want to change it, better now than a year from now. In that case, XML is the guinea pig and we ask for feedback before changing JSON and CSV.

[21:59:37](#p_fNKHJArPcVKfFr9pxuU4RSY8zvlSPP_EefjCi7VX4) <greggirwin (Gregg Irwin)>:
We also have the issue of PitS vs PitL. As soon as you introduce a global state or switch, other code can mess with it when you're not looking in a PitL scenario.

[22:05:25](#gbo12WdBY53ZHedgjrPs2JSE-z00ilw0ZXDie0_OpLY) <greggirwin (Gregg Irwin)>:
In this case, we can also note for early release that the default format choice isn't frozen yet. If we discover in the next two months that `compact` or `key-val` is a big win for Red internally, in how we want to standardize access, we can change that if we do it before too long.

[22:08:17](#AsWMHof0Vy47HzPy4FJU77cuOYgqBkVqu2qiLNZVihI) <greggirwin (Gregg Irwin)>:
@rebolek I noted the `key-val` format issue [here](https://gitter.im/red/codecs?at=61bcf8369a9ec834fbd51c45) before.

[22:14:25](#HEMV3QtizbwmBKfwsiaxporev_4vtL_gIOo6whOajVQ) <greggirwin (Gregg Irwin)>:
Also, can someone remind me why `#text/#attr` (issues as keys) are used, rather than words for `key-val`? It's something we'll be asked, so need to doc it, and I don't remember. We need to note it for `compact` too, but I know why they're used there.

## 7-Jan-2022

[4:26:03](#N6oOLgJxSsTfpWjGYcgD26M0C1_XRi_OzVk6smI7iiE) <greggirwin (Gregg Irwin)>:
Correction to the above `red-keys?` note: Should be `if str-keys? ...`

[7:01:40](#U4V3DJ7cE9mF85GkxSERcYpHv5PHsuzAoRPlimZyaas) <rebolek (Boleslav Březovský)>:
> To clarify, /as catches the error earlier, as it's checked when set, but setting the format name produces the same kind of error, just when the data is loaded, correct?

Setting the format directly would produce a different error, but that was fixed now and the check is the same for both methods. Now it returns "unknown format" error.

> `red-keys?` ...

I’ll check if it’s in the docs, I am open to suggestions regarding naming, what about `words?`

> Maybe pull the XML source out of the triples section

Yes, I’m planning to do that.

> That's going to be text! instead of !, correct?

Yes, it hasn’t been fixed in the docs yet.

> Thoughts on a better name than text-sigil? 

`mark`? I don’t know, if anyone has a beter idea, I would be glad.

> Maybe include-meta? instead of just meta?. 

Maybe, but’s more of an internal state, it’s controled with a refinement `/meta` and for the refinement I prefer the shorter variant.

> I think key-val is not quite right in the example.

Ah, maybe I misunderstood it earlier, I will change it.

[7:06:26](#WHb0HxWjSERtBlmdOHnIflRmLkk9thlN4kbFt1RwfpI) <rebolek (Boleslav Březovský)>:
> Also, can someone remind me why #text/#attr (issues as keys) are used, rather than words for key-val? 

Well, words can be confused with tag names. For that reason, keywords were prefixed with a dot - `.text` but I don’t find it very Reddish. I can change it back but I still prefer a different type for keywords.

[8:37:03](#_bZZH0y2pnl1524SMb_o3KUlLqZpKVRREW-2m7YJjJc) <rebolek (Boleslav Březovský)>:
@greggirwin I made changes to the `key-val! format and this is current output:

[8:39:50](#nFI3UAg3eADIeeJ6PAWRZMkujoY1IrHj-W8kHDKfMTg) <rebolek (Boleslav Březovský)>:
```
[
  identity [
    #attr none
    #text "Version and language^/"
    version [
      #attr [number "$Revision$"]
      #text none
    ]
    language [
      #attr [type "root"]
      #text "Czech"
    ]
    markup [
      #attr none
      #text none
    ]
    #text "Ending^/"
  ]
]
```



[8:40:45](#YljCeWggfBshK4u198jhoj8K1r6hvRn3ZKKcvBBI324) <rebolek (Boleslav Březovský)>:
The question is if we want to store empty text and attributes (in fact, not storing empty text is easier, it needs special logic).

[8:43:20](#ql-NlzysPA2Sffm5nyfWKfLMfvaI8jC6Ny3NzrpHgJM) <rebolek (Boleslav Březovský)>:
And another question is, if we are using keywords for attributes and text, why not use them for child elements too?
Something like:
```
```
[
  identity [
    #attr none
    #text "Version and language^/"
    #children [
      version [
        #attr [number "$Revision$"]
        #text none
      ]
      language [
        #attr [type "root"]
        #text "Czech"
      ]
      markup [
        #attr none
        #text none
      ]
    ]
    #text "Ending^/"
  ]
]
```


[9:44:19](#oTCdGVoqW--0oeo42AlwDZV2KV3ztkXEoPDMJ42YG6I) <hiiamboris (NOT THIS ONE)>:
Shouldn't it be '#children none' for the rest of elements?

[9:51:27](#tFU-QLvx--xL2k2Y_M4HdEjKJN2GdBA_VlKh7_-ePcw) <rebolek (Boleslav Březovský)>:
good point

[9:51:46](#v3RG-JXI4thgfgEjq3ezkU51yQwg2AGwOI-46wsh0CI) <rebolek (Boleslav Březovský)>:
or empty keywords could be roemoved

[19:01:37](#5qcIhGURIZ52_PS9xX7grGv2azf8AO4pOh9D599R488) <greggirwin (Gregg Irwin)>:
- On `red-keys?` or `words?`, what is the *downside* to `str-keys?`?

- I thought about `text-mark` as well. Any thoughts @hiiamboris? `compact-text-key` says it exactly, but is a bit long. It's only used about 4 times though. Maybe `text-mark` is good enough.

- I'm fine with `/meta` for the refinement name, but `meta?` alone reads like "Is there metadata in the content?". Again, only used a few places.

- What about `text!/attr!`? That matches `compact`, where issues are used only for attr names, though also isn't idiomatic because they look like datatype names. OTOH, they *are* keys for specific types of data in the content, so it's justifiable that way. @rebolek if you and @hiiamboris really want issues here, see if Nenad agrees that issues in paths are lexer-bugged. It still gnaws at me that we have to do this:

```
>> blk/identity/version/(#attr)/number
== "$Revision$"
>> blk/identity/version/(#attr)/number: "$Rev$"
== xyz
```

- For `key-val`, there is no technical problem caused by removing empty keywords, correct? If so, let's do that. 

- Just had a thought, in the docs, maybe include the metadata in example output. Could be at the end, to keep the first examples cleaner. 

[19:08:03](#SttELLXgRncKAawV5QiS08Gsf0MqKl6fB7cuk9Vsmx8) <greggirwin (Gregg Irwin)>:
@rebolek what is the win for using `#children`? I get that it makes all keys for an element one of `[text! attr! children!]`, and makes the child nodes explicit, but it's going to make path access quite a bit uglier I think. Imagine just one more level than in the examples. We go from `blk/identity/version/detail` to `blk/identity/children!/version/children!/detail`.

Collecting all children is marginally easier, but we'll provide examples, and likely helpers, out of the box, so people can do that. 

[19:11:37](#tUEAaRXYuoyJXA5_ASzCG4I2WT4NprvJH63zO9o5AmA) <hiiamboris (NOT THIS ONE)>:
`text-mark` is ok with me, as well as `text-symbol`

[19:12:07](#aXSwcHY_CU4LkuwxO3Yf-zY1oJaDS3zBx_fpESKVxtU) <hiiamboris (NOT THIS ONE)>:
`text-marker` too

[19:14:12](#Wp1nKmvgc5D9PBZJAVbLCM11Fb5owW2fd01v6iVI5WY) <greggirwin (Gregg Irwin)>:
`symbol` is kind of like `sigil` in meaning. I'm OK with `text-mark` or `text-marker`.

[19:15:27](#I-KArybQDT6aCPNnIiMlZrj3-GDO_TBpaVHUvXc3gvI) <hiiamboris (NOT THIS ONE)>:
`symbol` comes from association with [`red-symbol`](https://github.com/red/red/blob/43609421b8b3612d8d882719650d5150f657d17f/runtime/datatypes/structures.reds#L162)

[19:16:25](#k3o4uC5E3gZpfbaWC8AhUiP2n4QUVecMWZUZKS7aOAg) <hiiamboris (NOT THIS ONE)>:
though this term is from R/S, not Red

[19:17:11](#j8QendDdSmyIKEvyWH8Jqb-FHzlHpMWmgaxwaTD-m8Y) <greggirwin (Gregg Irwin)>:
Ah, got it. Since we're talking about high level structures here, and we already struggle with when to use `[key word field name etc.]`, let's go with what fits this context best.

[19:17:30](#UJdICgHd-CwZwowyml8WH8sqOhnHhCiIvmcdim_ksjE) <hiiamboris (NOT THIS ONE)>:
:+1:

[19:18:34](#-KOQKGqkqKTO3pHYtfFYClkPxuXpxTTTZS0unx6QuHc) <greggirwin (Gregg Irwin)>:
Thanks for all your work on this @rebolek. :+1: It's exciting to have it so close!

[22:36:29](#GKLZo98PypbHOA_fT7DynigyxCylwvJHw9S2FMGN4Xw) <zentrog>:
greggirwin (Gregg Irwin): attributes are not supposed to repeat inside elements, so the `blk/identity/version/(#attr)/number` syntax shouldn't be much of a concern. I think it might actually make the xml invalid if they do.

[23:03:38](#ayxtXI4MaSXaqrPYLTHcZRMHMh4wff53glUtrqr5xFQ) <greggirwin (Gregg Irwin)>:
What I mean is that we have to use parens in paths where `#text/#attr` are used (outside a tailing read), because of how issues are currently lexed. We'll get used to it, and we could argue that those values are special, and it makes them stand out in the path, so it's not the end of the world. Just leave a funny taste in my mouth at the moment.

## 8-Jan-2022

[6:46:34](#CXiWtJSnywnEGZvFg2Kr17-Orw27GKhyw-gH2oBDEPg) <rebolek (Boleslav Březovský)>:
> what is the downside to str-keys?

One downside I can see is the shortened form. `string-keys?` would be find IMO.

> `text-mark` is ok with me, as well as `text-symbol`

Ok, `text-symbol` is it.

> `meta?` ...

No problem, I’ll change it.

> What about text!/attr!

I need to check if they aren’t valid XML keywords. If yes, we can’ use them. That’s why I want to use a different type so this kind of problems can’t happen.



[6:48:01](#Ik729LEaT9JL3ZfCTy3OSPIwt9pMEDAnjP3gW1U47l8) <rebolek (Boleslav Březovský)>:
I was looking at `ref!` also. It’s buggy in paths too but in a different way than `issue!`:
```
>> a: [@a [a]]
>> a/@a
== [a]
>> a/@a/1
== none
```

[6:52:24](#Gt8JbGwByqCrdbd16ddYccw-ivtV9dlWaWbGbfiCtMc) <rebolek (Boleslav Březovský)>:
Or "buggy", it takes `@a/1`as one value `"a/1"` which may be a good thing I guess.

[6:53:37](#ZSJATfqWfWQM54dkQ42-t1MDQ9Gp6JFpSLwzAO3MRAE) <rebolek (Boleslav Březovský)>:
Ok, I think I have a solution, `tag!`:
```
>> a: [<b> [c]]
>> a/<b>
== [c]
>> a/<b>/1
== c

[6:53:43](#y9qynHU27YcBXPu1JZ3c4BWZKdGGTecFT1ocntIcBrI) <rebolek (Boleslav Březovský)>:
* Ok, I think I have a solution, `tag!`:
```
>> a: [<b> [c]]
>> a/<b>
== [c]
>> a/<b>/1
== c
```

[6:54:03](#SkEmRrLVqXsWBt8yZH6d3P7g1vV0zdd_iqIATyOGhe8) <rebolek (Boleslav Březovský)>:
No need for parens.

[17:37:32](#tb_4A5q_0N8H8ArgPzbECW7Z3yfoN2KixihPNuJ89P8) <greggirwin (Gregg Irwin)>:
I'm fine with `string-keys?`, but `str` is almost always an acceptable abbreviation IMO because it's so common. Same with `obj` or `blk`.

I think the `!` makes `text!/attr!` illegal in XML, per earlier chat, but good to confirm.

Yes, refs being strings raises that issue. Good thing to note in docs. We should also ping @dockimbel  on it.

We already talked about tags. I don't like them because we're coming from markup and I think they'll be confusing as keys.

[17:37:50](#ofLlwOHqiWFF9HCXhMe-ihH7-dpjza1s7zrzerL3hGM) <greggirwin (Gregg Irwin)>:
* I'm fine with `string-keys?`, but `str` is almost always an acceptable abbreviation IMO because it's so common. Same with `obj` or `blk`.

I think the `!` makes `text!/attr!` illegal in XML, per earlier chat, but good to confirm.

Yes, refs being strings raises that issue. Good thing to note in docs. We should also ping @dockimbel  on it.

We already talked about tags (though it's been a while). I don't like them because we're coming from markup and I think they'll be confusing as keys.

[17:40:08](#ka9K-UNrlwg3xdhW3huBoyw03WKSptNQ37RCG33Vzcs) <greggirwin (Gregg Irwin)>:
Consider that we're then taking all the things that *are* tags in the XML and making them *not* tags, but doing exactly the reverse for text and attrs. 

[18:45:35](#Np2ZKvUBremE3oIUpCoyMYK6O3ggQhdVlgh_3ZpV-KM) <rebolek (Boleslav Březovský)>:
I understand that, I’m just trying to find a fitting datatype.

[18:48:00](#S_Xnl_vGr8SkExz_L70WczOl5H5ZH3Hb2eAncC87qX4) <rebolek (Boleslav Březovský)>:
It seems that `!` is illegal in tag names, so let’s go with `text!` and `attr!` for now.

[18:49:21](#sbe6SVHQg7pcaZlS_Mi_fr9IxZLA1_Z_OzPoJKJoG-g) <rebolek (Boleslav Březovský)>:
`str-keys?` - why not, I don’t have any strong opinions here.
What's more important, is how to deal with these additional settings.

[18:52:21](#85u4ClU0X63cC6UgvMJHRJ0sfJrmGOPi5ny6pkFUUXc) <hiiamboris (NOT THIS ONE)>:
generic `system/codecs/(name)/options` map/object?

[18:52:45](#uQwsLqaDrpd_ws3LeI2FlkDKA0IU8s0NP9F--kpO9UY) <greggirwin (Gregg Irwin)>:
:+1:  Yes, the option handling is key. (no pun intended)

Comments on my thoughts [here](https://gitter.im/red/codecs?at=61d765ba46529077f5707a16)

[18:52:54](#NZMW_xzgWCgVKz4-gWZV9a8XWn2O1LAtV3oV4R7HcfE) <hiiamboris (NOT THIS ONE)>:
* generic `system/codecs/(name)/options` map/object?
though global state.. bad

[18:53:24](#gUgW5qsb_5pIYWHknwsT8fV4hqvDFp0v4b_xgcHUxJs) <greggirwin (Gregg Irwin)>:
That's its Achilles' Heel @hiiamboris, I agree.

[18:54:22](#MXvchCjVgW0if5jqdQrxmaOgc_4Jxl1SkLrVvuDazSk) <hiiamboris (NOT THIS ONE)>:
let's go for /options refinement then

[18:54:44](#ZtL5azKFuNUyoc-oASXWqEyRftsKoYsBd6CXOMketSs) <greggirwin (Gregg Irwin)>:
The way other systems work around that is that each working codec can be a separately config'd instance. To do that, we need to be able to `make` them.

[18:57:43](#1crO8qSDDb1sMC0YOAYpxsBog-vDJ-1EzjVKF6QeY9w) <greggirwin (Gregg Irwin)>:
The other thing that happens there is that `load/save` don't work transparently on file/url values, but `/as` is already used there for the source format, not the resulting data structure. :^\

[18:59:23](#EL5FS-ox597k0Tc-n2LrKZy9UMDFtVquU3zQJkLzvkQ) <greggirwin (Gregg Irwin)>:
This is where we have to guess about whether codecs we have now, and others which may be added, will have enough `options` to make that a win over direct refinements. 

[19:04:16](#gAYHvRkYcL9F8voXd4OQMLlP6yAfmdIB1jTQTlol6xc) <hiiamboris (NOT THIS ONE)>:
Are you suggesting to add refinements for every future option?

[19:15:00](#1eEVJKnByhcDiaRW6bnDTve2tEuKl2rUUkfLse_2nj0) <rebolek (Boleslav Březovský)>:
> let's go for /options refinement then

I’m inclined to think it’s the best solution.

[19:54:05](#GmPgZ28EJqOxAYmHaEJxqVdHSUsx5J-vCTIkTSkNScM) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
I am not sure I agree to `text!`, unless this is a real datatype.

[20:08:47](#Y2tyBSohJxDyR87-O0al6hb_ZLyUSYI2jeYfMVBoc6g) <greggirwin (Gregg Irwin)>:
@pekr, suggest something better. This space, unfortunately, has a lot of compromise involved. It needs to be something that can't appear in the XML source.

[20:11:04](#LTzxl2v0pstH7k19P_8_j1KfQr7k259S3NbaG4II8gw) <greggirwin (Gregg Irwin)>:
>Are you suggesting to add refinements for every future option?

I'm saying that may be the best choice, if the number of options is small. No, it's not infinitely extensible, but we can see with XML what happens when you go that way. :^) So let's mock it up for XML, JSON, and CSV. Just the func specs. What do they look like with refinements (i.e. no changes to CSV and JSON), and what do they look like with `/options`, including sample calls.

[20:13:25](#mtk_76JfEzOiQzAbzuDbfP3XY9IM6iJKozDpfvPC-Hs) <hiiamboris (NOT THIS ONE)>:
Point of `/options` is that it's future-proof. OTOH if there are 2-3 similar options, adding a refinement shortcut makes sense.

[20:13:36](#oZRiJlUjO8FpaCuGaIiUB092J4ywqZDt9vb04cBc5NM) <hiiamboris (NOT THIS ONE)>:
* Point of `/options` is that it's future-proof. OTOH if there are 2-3 similar options, adding a refinement shortcut for that option makes sense.

[20:14:21](#lDmZ_ChwzZ1haMFzqTFUti5LWdolt1DaEr07NvZonbY) <hiiamboris (NOT THIS ONE)>:
* Point of `/options` is that it's future-proof and extensible by anyone. OTOH if there are 2-3 similar options, adding a refinement shortcut for that option makes sense.

[20:17:33](#sKhQu9TnY3g9rJ69cceNdoeBU8FSOhKsfKwx3Jjdrxs) <greggirwin (Gregg Irwin)>:
> Point of /options is that it's future-proof and extensible by anyone.

And this is where we, as designers, have to decide if that falls into YAGNI territory.

[20:50:51](#fl86-qNP96N6CZxlxWMtpcCiO8YKzcJZfLj8TgzKZjg) <rebolek (Boleslav Březovský)>:
The problem with the refinements is that they would apply only to a specific format, not to all of them.

[21:15:20](#Kp2OAelop685AXljK3dYSC8bmxGcW7rFjjye1GiXgEA) <greggirwin (Gregg Irwin)>:
Of course, just like other mutually exclusive refinements. And a downside to `/options` is that `help` won't know what to do with it. Hence, I suggest mocking things up.

[21:17:15](#SwmPb86qhpiQ_9Se9WvbKa9ZlpS9TekhOrC4UmI2rqs) <zentrog>:
Is the idea to have a global options object with the defaults and to make a custom one from that with changes?

[21:18:47](#ErP6ZGiN6_J9fWp8Nasav6Y3WvyAd3JnnpRXdarRt24) <greggirwin (Gregg Irwin)>:
That's a bigger shift. Right now it's the choice between specific refinements and a more general `/options` refinement for `load-xml`, etc.

[21:19:41](#PYFIPnovMjkGxNiL0u6UpgNBchDWQWDi0vPrh2q71DI) <greggirwin (Gregg Irwin)>:
Bigger because we don't have a `make codec` concept, or how that would work with `load`, while still providing option locality for safety.

[22:10:38](#Uh7IKQxY4cILwM6joZtaEa7qump-29NvhaN1FOenLk4) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
@zentrog:matrix.org you mean something global like... `system/options` ¿-)

[22:11:22](#itVIfjxK4DN3S9Mg2Sy1sNYbE_kd-QgxsOn2IkiAOG4) <zentrog>:
I thought /options would take an object (or similar). It would be nice to have a template object to base it on. Is that not how it would work though? I don’t think it would need to make the whole codec 

[22:12:45](#fMi3Mzzk2wNlCsjNKOQ4beDnHh4rMN9eQzh9W8YauaE) <zentrog>:
Yes, something global to use as a template. It could also serve as global settings, though that introduces some risk as others have mentioned

[22:13:48](#06DlWBjgIn4bMg7OgQgw-ZhjJkMEVtfdOZoeRm8Fv6E) <zentrog>:
It works still be missing some documentation on what the settings do though…

[22:13:58](#UatPU6X5sn1arlD9UQh5knj4KLX6msuBl7oUgbszwlE) <zentrog>:
* It would still be missing some documentation on what the settings do though…

## 9-Jan-2022

[0:33:17](#jxNG5Dz7QODP3fEllTM9QqeBuyD8j82MKPWtD-O6cAE) <greggirwin (Gregg Irwin)>:
I hope we'll see new tooling options, including making `help` smarter, so rich interfaces like objects and dialects become first class citizens like specs and refinements are today. That will be *very* important in distributed message based systems, APIs, and interrogative interfaces (related to, but much more than autocomplete.

[9:43:55](#nCflj4XbORn3UIzD78BxUUOGP6y3bIcyTSvt7HYrCrY) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
@greggirwin I might agree. Just checked and  `!`is a regular word char. As far as `type text!` does not return `datatype!`, I am OK with that.

[9:44:20](#hxSgLCi8zjBiulGcoy72xBzAXOY77OpyyGnmGvT47oI) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
* @greggirwin I might agree. Just checked and  `!`is a regular word char. As far as `type text!` does not return `datatype!` (which it does not), I am OK with that.

[9:47:42](#fQIe2PkOfT8jiemgLpL6Sq12r3kMCkJXgNMfSO4FxEg) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
I would just like to note, that since the R2, there is a concept of `system/standard`, which holds some templates. It was IIRC mainly used by networking - e-mail header, etc.

[9:49:53](#t55nv8o2NvlYxPBwemHjsPAHuz_T9E5j1PcC7Rwlqn0) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
@greggirwin I was always missing more clever/extensible help, which would allow to use some docs for stuff like dialects and objects. And btw - even Carl has planned for objects to eventually have headers: http://www.rebol.net/r3blogs/0350.html

[18:05:31](#hz3HNd-gQn4ox5RuBx5rDq5FCE5wb79soqoMxMmisqQ) <greggirwin (Gregg Irwin)>:
Yes, we also want to be able to vet that an object matches a spec, in terms of duck typing. 

[18:13:46](#pcvkRY8U2VNf3gDoqRIrNwrBrhXgtykhHgO3CZsxQIg) <rebolek (Boleslav Březovský)>:
@pekr that `datatype!` use exclamation mark at the end is just a convention, `datatype!` has no literal form, it looks like a `word!` and you need to check for a type to distinguish it.

## 11-Jan-2022

[18:09:48](#7LKeY3BTQDmX7NoxRpjKMluW0hDpoSpghZPWqtPLLP4) <greggirwin (Gregg Irwin)>:
@rebolek are you working on mockups for `/options` vs refinements, or are you waiting for me to do that? I will make time today if that's the case. 

[18:16:23](#Y9jbfH_Mis9qZB-N38ArtFyNzT6F1a6ZFMXG4iOH_zM) <rebolek (Boleslav Březovský)>:
@greggirwin I have something cooked up, but not yet published, I’m going to push it to Git tomorrow if that’s fine.

[18:25:33](#Q5UJKIDyLIYap5SYktJabfGxr8b-s0bkk9c_Y99NZps) <greggirwin (Gregg Irwin)>:
OK. Thanks.

## 12-Jan-2022

[12:01:17](#Cl1g0FZZq3WP9lCe7M_7x5DH4s332h__PHER8wdqP4k) <rebolek (Boleslav Březovský)>:
Options handling changed (currenlty in the markup repo only, will be posted to the PR later). I’ve implemented both options, refinements and `/with options` variant.

There are four refinements:

```
/meta
/strict
/str-keys
/mark txt-mark ; this one is for COMPACT format only
```

which is not that much but that number would rise if we add other formats.

Second option is to use `/with` refinement followed by block or map of changed options. Options are first initiated to default values and then overridden using refinements or user options block (map).

## 13-Jan-2022

[6:03:53](#J_m4pjVKpMT-NNgeEDyesFva9bVq-tnZHoLEgttCAWg) <rebolek (Boleslav Březovský)>:
This is a more general question, not specific to XML codec, but related as I encoutered it here too.

Image this data:
```
data: [tag "content" none]
```

This should produce this XML:
```
<tag>content</tag>
```

However, currently it won’t because, as you can see above, `none` is not `none!` but a `word!`.
And the question is: should we be strict and require `none!` here or should we be relaxed and accept `word!` also? In this particular case it’s not a problem, there can’t be `word!` in place of attributes, but I can think of a case where it would be problematic, if you’re really contemptible person and would name your tag `<none>`.

[20:56:36](#YCdMFdVb9BjH9CGAKxwFgKl2WYlJ3YYWd3U8UOhBWLM) <greggirwin (Gregg Irwin)>:
Thanks for fixing `to-xml` so I could test it. :^)

Using `none!` seems like a good idea here. It has more semantic meaning, and is safer. It's also what we get from the loader, so it's more consistent.

[21:20:29](#JtbTL5vevMKbIpALzKQISqEIvlKNclr9LZFdw5PDnO0) <greggirwin (Gregg Irwin)>:
Just to confirm @rebolek, the current XML codec is *not* expected to handle HTML, correct? I have an old test that loaded %simple.html and the output is wonky, so I just wanted to check.

[21:20:40](#C1DRvlcA1zwtljNhc_w5fkpsCr1t1wr876lsyre7rco) <greggirwin (Gregg Irwin)>:
* Just to confirm @rebolek, the current XML codec is *not* expected to handle HTML, correct? I have an old test that loaded %simple.html and the output is wonky, so I wanted to check.

[21:32:02](#SE0yGAyHcHlSwbVVzSdS4wKA4sFwSmQ3Ey4nYNp5wzc) <greggirwin (Gregg Irwin)>:
On 07-Jan I said:

> For key-val, there is no technical problem caused by removing empty keywords, correct? If so, let's do that.

Are there any technical reasons to keep them? In probing some loaded data, I think it will be  a pretty big win to omit them.

[21:59:45](#QsCxhK1kgkOYVk9sqM7eelRCtJAKZs6HQ4lSmr0-4ms) <greggirwin (Gregg Irwin)>:
Remember, if we include them now, they are there forever. If we omit them now, we can always add them and not break anything.

## 14-Jan-2022

[1:20:04](#M1wLEPKOY4kAKAOV36MznJsn5ylDT-8CtUz2-P7Vf9Q) <rebolek (Boleslav Březovský)>:
> the current XML codec is not expected to handle HTML, correct?

Correct. HTML is a similar but different beast. Let's slay them one by one.

> Are there any technical reasons to keep them?

It just needs a bit of extra logic. Nothing special, I just need to do it. And I will.

[3:06:51](#SlYjub3hcSa1VUsXb70Ye4pqhG6RfOTjevIcbHOhQZU) <greggirwin (Gregg Irwin)>:
:+1:

[3:15:09](#MotBeYFq6Ot1XTswnOnOhn6EUsetqMoXCcx4SDEgW88) <greggirwin (Gregg Irwin)>:
I was hoping to get you and Boris more feedback today, but another task took priority. Have to deal with some business paperwork tomorrow, but should at least be able to say more on the codec options interface.

[3:31:58](#rVekibRC-pZQxdig6tWcquqLbYS8YVstMj2Y-LoI9SY) <greggirwin (Gregg Irwin)>:
Small consistency note. `put system/codecs` is at the bottom for XML and JSON, but at the top for CSV. 

[3:39:33](#EsKUFOieveTPqH71gI-y9gDCFmGHBAN3R-kCj_5Wb2A) <greggirwin (Gregg Irwin)>:
@rebolek should `strict?` be in options?

[3:40:43](#WrNw2720WCzv4KDpWk_DoD3NqmRjvUU-IGoFTGshibI) <greggirwin (Gregg Irwin)>:
I know we're mocking right now, so no change needed ATM.

If we use `/with` consistently in codecs, that will chagne CSV, which uses it just for dlm today.

[3:43:04](#yWSsnaBFT6gnur5qcm1mKtkHAAjIf7lw9hXPpP1-opY) <greggirwin (Gregg Irwin)>:
Indentation is an interesting one, because we can't yet schema map/obj/block. So as a refinement, we can say it needs to be a string, but as an option field we have to doc, and the user has to look up, if it's a string, an int, or either.

[3:45:28](#j4BXrSC1VuXBqR8wNqQqBG3M4YKVlDWN5vSChTayLjU) <greggirwin (Gregg Irwin)>:
CSV has `/as-columns /as-records` today, but could be just `/as` with an arg, like XML.

[7:26:38](#F6aByIl-C1ZgG3_wXlqsoWcboegikBD34S4ZNw4A1Bs) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Yes, it should it be ideally unified ....

## 17-Jan-2022

[20:06:29](#SxiZikmwq6mun6YsnVUgAlgE4P2BBO-uwbdbTqzLFT0) <greggirwin (Gregg Irwin)>:
- `default-opts` uses lit-words and logic words in a map. I actually
  can't get `load-xml` to work using `/with` for `format` no matter what
  I try. Logic options have to use `#[true]/#[false]`.

- No `Strict` option yet. Just a TBD note.

- When `/meta` is used with `compact`, meta `issue!` vals change to
  `ref!` vals. With `key-val`, using %menu.xml test data, the first
  `#xml` changes to `.xml` but `#PI` stays `#PI`.

- We have some options for encoding, and most for decoding. With an
  `/options` approach, how do we make it clear which go with `to-xml`
  and which go with `load-xml`? Or that `indentation` is ignored if
  `pretty?` is not `yes`? Similarly, `text-mark` only applies to
  `compact`.

- Is there anything else we need to consider, along the lines of
  `/meta`, that namespace or DTD support might add?

- `to-csv` doesn't need `/as` because the datatype tells us the format.
  XML could only do that for `key-val`, but that means changing that loaded format to `map!`, which we didn't want to do for the overhead.

[20:12:44](#_CMy21v00KI78VEiYcIsgTpUS1JsMfxaFYlNTbV76WU) <greggirwin (Gregg Irwin)>:
We could change CSV `/with` to `/delim` or something, so `/with` is available as a future option. It's more specific in any case.  CSV has a lot of options, and it's unlikely we'll add more. Similarly, XML having 3 emitter options and `meta+strict` covers a lot. I'm also OK with removing `/mark` for now. I think we need `/str-keys`, but @dander can weigh in, or @hiiamboris based on the ICU work, to say if how often it might be needed.

[20:15:41](#QbrrfiG7qa-hFRhVofnDL6DD257I4QOAOo8vqv1udGQ) <greggirwin (Gregg Irwin)>:
Example calls for comparison.

[20:17:24](#wW1bjt-RmAnGPdMOuN4c7gykGbz0cMg-1e5x6_2DFas) <greggirwin (Gregg Irwin)>:
Simplest call
```
print mold load-xml/as file 'triples

print mold load-xml/with file #(format: triples)

print mold load-xml/with file #(
	format: triples
)
```

Next simplest
```
print mold load-xml/as/mark file 'triples 'text!

print mold load-xml/with file #(format: triples  text-mark: text!)

print mold load-xml/with file #(
	format:    triples
	text-mark: text!
)
```

Most complex
```
print mold load-xml/strict/meta/str-keys/as/mark/with file 'triples 'text!

print mold load-xml/with file #(
	strict?:   #[true]
	include-meta?: #[true]
	str-keys?: #[true]
	format:    triples
	text-mark: text!
)
```

[20:18:30](#hucq-pRIaB1HLofABTbGei8WSjrDit9eqSsLvExph6M) <greggirwin (Gregg Irwin)>:
These are predicated on `/with ... format` working, which I can't so far, per my message on Telegram.

[20:19:34](#A64C73Jkbv4-D8qcDVfCqmQuavB_u9tSppPq6fJjhgk) <greggirwin (Gregg Irwin)>:
* Simplest call
```
print mold load-xml/as file 'triples

print mold load-xml/with file #(format: triples)

print mold load-xml/with file #(
	format: triples
)
```

Next simplest
```
print mold load-xml/as/mark file 'triples 'text!

print mold load-xml/with file #(format: triples  text-mark: text!)

print mold load-xml/with file #(
	format:    triples
	text-mark: text!
)
```

Most complex
```
print mold load-xml/strict/meta/str-keys/as/mark file 'triples 'text!

print mold load-xml/with file #(
	strict?:   #[true]
	include-meta?: #[true]
	str-keys?: #[true]
	format:    triples
	text-mark: text!
)
```

[20:24:13](#TNvi6E5Q_hAksRYrAHULpzN6NKIpnvrx-h1l63JcMdc) <greggirwin (Gregg Irwin)>:
After looking at this, playing with things, and I am sorry it took so long to get this posted, my gut says that refinements are the way to go. If we had a dozen options, or a high probability of getting to that number, `/with options` might be the way to go. But I think it makes the calls more verbose while at the same time being less clear and specific. The fact that it's bugged (or so I think) also tells me we have some more map/serialized/config thinking to do, and this turned out to be a timely, real-world, example.

Thoughts?

[20:26:28](#QwNxASLlGXkfdZp4mWBZ_H4OkhJpWeSKZFRjNhqG9EM) <greggirwin (Gregg Irwin)>:
I can certainly see tripping over word vs lit-word values in maps vs objects vs blocks, which is a key part of that discussion. How do we make it easy to use them as safely as possible when they may be mixed or interchanged?

[20:28:35](#WqIjcVtQSFT7HXoRalhukFkWFVF040Pij-8CTn1f4YM) <hiiamboris (NOT THIS ONE)>:
> I think we need /str-keys

Well, Red words cover much more than XML element names. But words have exceptions. E.g. `Bh` is not a word. In ICU data I haven't encountered invalid words, but when I tried loading their .txt format (so, not XML-related, even though it's the same data) `Bh` was a problem for me.

[20:29:53](#008nnWID-ePJRdGIFG0y8KHADQ1FVDtsieS0plg6zOA) <hiiamboris (NOT THIS ONE)>:
I'm for `/with options` because I would hate to pollute general `load` with refinements from all codecs.

[20:30:18](#IbwQL41LdWpmMRiqP4EF-0nyjVdWiMVG-VwJTvGWbTU) <greggirwin (Gregg Irwin)>:
I always forget about literal hex notation. Not sure I can convince @dockimbel to remove it, but I think it isn't a great fit for Red, and causes issues like this.

[20:30:40](#7NlItMtfqndz5vHEVWIQI4eKeT2OVTFGTym68Lh_dTQ) <hiiamboris (NOT THIS ONE)>:
* I'm for `/with options` because I would hate to pollute general `load` with refinements from all codecs. Though `/as` should be there as both option (format) and refinement /as.

[20:30:57](#1znMkK4xy2_8Ocey_L57uT_7ibGNmDtKmUnNuX2N3Ug) <hiiamboris (NOT THIS ONE)>:
* I'm for `/with options` because I would hate to pollute general `load` with refinements from all codecs. Though `/as` should be there as both option (format) and refinement /as because it's just so often going to be used.

[20:31:13](#x8pE1svWWK-8FLxwoJ0j2Mp9wv0xJmO10Q9IDUGTzdc) <greggirwin (Gregg Irwin)>:
We aren't polluting `load` at tall, only `load-*` specific funcs.

[20:31:19](#UTpVunDhXOMIbCbrckZhiBedQA8HsfYuT7JgSzQ8nOg) <greggirwin (Gregg Irwin)>:
* We aren't polluting `load` at all, only `load-*` specific funcs.

[20:31:22](#CxGTaoTeA0d4fh2Hz8wDMd7nrHjBpb0Lwv2kdueF7Z8) <hiiamboris (NOT THIS ONE)>:
* I'm for `/with options` because I would hate to pollute general `load` with refinements from all codecs. Though `/as` should be there as both option (format) and refinement /as because it's just so often going to be used. OTOH it conflicts with `load/as` so maybe another name.

[20:31:27](#Jtgpiu6klgUeliLnBeZHKhnKzo8gd0w8bkv3Vn8UT_A) <greggirwin (Gregg Irwin)>:
* We aren't polluting `load` at all, only `load-*` specific funcs get the necessary refinements.

[20:31:54](#Sm-r4xpDnXcj7pqxBZQqyQtKtKKA_OQNaPus6z3ml10) <hiiamboris (NOT THIS ONE)>:
OK and how does this work with `load/as .. 'xml`?

[20:32:38](#ybjIsBWxZeBa0vuRLx9vCchnzQPXUcC5zCJ_Pk1qg30) <hiiamboris (NOT THIS ONE)>:
(I don't care how `load-xml` itself works, either way is fine)

[20:32:44](#28faZbszO1_NcVirW8sPS0BVsjDW482lAykbBKgf-6s) <greggirwin (Gregg Irwin)>:
Just maps to default `load-xml`.

[20:33:43](#QWJC-Q6gFINviTWymhFbMyuBejGetjBWzrQclO07fGI) <hiiamboris (NOT THIS ONE)>:
Hmm I was thinking /with would propagate from `load` to it's receiving ends.

[20:33:51](#4Ty0NLRuxO-A740wJf-ezpFasnBuFyfYfTLPOssf92w) <greggirwin (Gregg Irwin)>:
All codec specific loaders map their `decode` to something internal for that codec.

[20:34:57](#FXzehIftftMMiSJj4nQVJQw8pH201HGbv3oQgK2LIV8) <greggirwin (Gregg Irwin)>:
> Hmm I was thinking /with would propagate from `load` to it's receiving ends.

But that also bloats `load`. Not in the func spec, but in being completely general, where do you look for options, etc.

[20:35:55](#JV5U-oIH0nCjuhM04mU3e95PkREXe7BxD3BKgUApdwA) <greggirwin (Gregg Irwin)>:
And `load` already has 7 refinements.

[20:44:45](#yb8u9hHPqsfTlzd4w_wFzqX_VcTpy2epCkcj79yUCMQ) <greggirwin (Gregg Irwin)>:
Hex literals live in the uncanny valley of words.

[20:55:23](#JppgclHELd5mH6J5eWiUv43fIMZMU95_InvvUGbSXdg) <hiiamboris (NOT THIS ONE)>:
Yeah. Agree it's a bad syntax.

## 18-Jan-2022

[8:33:37](#CNaQfTeNpQfiDM6_EseDa1mv1I0qDk1AmkIQCKL1bLM) <rebolek (Boleslav Březovský)>:
 @greggirwin to be sure, are you testing the version in the `markup` repo or in the Red PR? Because the Red PR is updated less often. I am using the `markup` repo as the working place and occasionally I push the changes to the PR as I don’t want to pollute that branch with too many commits. If you want to test the latest  version, use the `markup` repo, please.


[8:45:58](#qiF0ZTN1olGAhwz1TVdpobW3SK-0BZAh8c_LrZxLvU8) <rebolek (Boleslav Březovský)>:
> default-opts uses lit-words and logic words in a map.

That’s a copy&paste issue I guess. I look into it.

>  I actually can't get load-xml to work using /with for format

I believe I checked it and it was working but I’m going to check it again.

> no /strict

`/strict` certainly works, you are probably looking at an older version.

> When /meta is used with compact, meta issue! vals change to ref! vals.

Thanks, I’ll check it.

> We have some options for encoding, and most for decoding. With an /options approach, how do we make it clear which go with to-xml and which go with load-xml?

Good question. I don’t know.

> Is there anything else we need to consider, along the lines of /meta, that namespace or DTD support might add?

I believe that’s covered, name spaces work right now, DTD - I guess it’s supported, but needs more testing.

[9:04:38](#RfZPCl2_GxrP2WaFS4_UTg0eJIo_PM1H7EEVFFtql2k) <rebolek (Boleslav Březovský)>:
> When /meta is used with compact, meta issue! vals change to ref! vals.

Ok, I’ve checked it and that’s intended because `issue!` is reserved for attributes in `compact` format. So I used `ref!` for meta tags. Maybe we can change it in other formats to use `ref!` too so it’s consistent. What do you think?

[21:14:37](#IJpzjB_SqN2wRS8tnB4lEOEClHt3gvolQ1q0EKkNVks) <greggirwin (Gregg Irwin)>:
I am testing with the repo. :+1: A common practice of mine is to write a %_console.red script for playing and tests. e.g. for markup it includes %xml.red, dumps test files in different formats, and I can hack from there.

[21:16:28](#vKH9UWYJ_Eek6ohHPcN-uY8rwb9K1MeN0reYB0B7I5o) <greggirwin (Gregg Irwin)>:
> /strict certainly works

Poor wording on my part. I meant there is no `strict?` option for `/with`.

[21:17:34](#-VSIm7tZGGqTzhDl8tnPh2oP616z8MtRwgrkxcVpfNA) <greggirwin (Gregg Irwin)>:
* I am testing with the repo. :+1: A common practice of mine is to write a %_console.red script in the repo dir for playing and tests. e.g. for markup it includes %xml.red, dumps test files in different formats, and I can hack from there.

[22:16:04](#ldeonfnvzXyDbUKryR3Z8iMDY1CasluaBOUinTe2QSY) <zentrog>:
I’m actually away on vacation right now, and prior to that, a winter storm knocked out my power for 13 days. I’m hoping I can help out a bit with testing and such after I get back and settle in a bit. Maybe around the weekend. 

[22:40:53](#HNwMd3JZckNhuW7x-7srGxLnsQTd3GG6SqPWNX8TThM) <greggirwin (Gregg Irwin)>:
:+1: 

## 19-Jan-2022

[1:40:59](#7HL32zogf5Gz46pOWk8jZSlqJ1yMHN74PM4hiu1HrHA) <greggirwin (Gregg Irwin)>:
I'm working on metadata thoughts, but it's going to be a big post and I'm being summoned for human interaction. :^)

[1:42:22](#2eQclvuBsCTHEA1u_GVR-jrfH-4ygldNEa6ihxBcsZo) <greggirwin (Gregg Irwin)>:
In the meantime, here are three small topics we should be able to finalize quickly.

[1:43:01](#ibHkFCTJnKGrXhYHGPOtTguVCbSvn4jYd3gi5mfWN88) <greggirwin (Gregg Irwin)>:
We're getting close on this. I'm excited. Nailing down some final details are all that's left. ;^) We're going to ignore advanced aspects like DTDs and "valid" doc handling for now.

# Interface

I strongly cast my vote for refinements over `/with ... options`, and only @hiiamboris complained a little. 

Can we gavel that decision? 

# Omit none values in key-val?

I vote to omit `text!/attr!` entries if they are none. Any objections or technical problems with that?


# Prolog/Strict

XMLDecl, and full prologs, are optional per the spec. `/Strict` makes the loader require it, and `/meta` is nicely wrapped so only `meta-action` (and one other place at line 602: store-xml-decl) care about it. All `/strict` does is add `opt` to the grammar, making it strict vs loose. 

The spec says docs *should* start with XML-Decl, but they are entirely valid without it. If we keep `/strict` it means you get an error if it's not there. Then we'd add `/valid` or a `validate-xml` feature if/when DTDs are supported. But the pertinent question is whether we'd rather use `if error? load-xml/strict ...` or remove `/strict` and let users check for prolog info if they care. Note that `/strict` *only* applies to the `XMLDecl` part of the prolog, as other prolog parts are still optional.

Any strong arguments for keeping `/strict`?

[1:43:29](#heQEGsn8GnTtOvknSbwuBoPGj3Syy_pufjAevxUWNrc) <greggirwin (Gregg Irwin)>:
* We're getting close on this. I'm excited. Nailing down some final details are all that's left. ;^) We're going to ignore advanced aspects like DTDs and "valid" doc handling for now.

## Interface

I strongly cast my vote for refinements over `/with ... options`, and only @hiiamboris complained a little. 

Can we gavel that decision? 

## Omit none values in key-val?

I vote to omit `text!/attr!` entries if they are none. Any objections or technical problems with that?


## Prolog/Strict

XMLDecl, and full prologs, are optional per the spec. `/Strict` makes the loader require it, and `/meta` is nicely wrapped so only `meta-action` (and one other place at line 602: store-xml-decl) care about it. All `/strict` does is add `opt` to the grammar, making it strict vs loose. 

The spec says docs *should* start with XML-Decl, but they are entirely valid without it. If we keep `/strict` it means you get an error if it's not there. Then we'd add `/valid` or a `validate-xml` feature if/when DTDs are supported. But the pertinent question is whether we'd rather use `if error? load-xml/strict ...` or remove `/strict` and let users check for prolog info if they care. Note that `/strict` *only* applies to the `XMLDecl` part of the prolog, as other prolog parts are still optional.

Any strong arguments for keeping `/strict`?

[19:44:12](#lZ5zaAzfCFluJ5RsKd5bO4C00Te6HO6WinWIg4x5ZFo) <greggirwin (Gregg Irwin)>:
## /mark

I said not long ago that I think we can remove `/mark`. We can always add it later, but can't remove it once it's there. A simple `replace/deep` is all that's needed if someone wants a different marker, and should be fast if it's word-for-word.

Can we gavel that?

[20:13:21](#IWsEZ8ijtrt4TTDLqSfXJXavQpDU_G7ENQxKbf8VDvE) <hiiamboris (NOT THIS ONE)>:
Hands off /mark!!! ������

[20:14:36](#XPNtJjhzCqeoeruYuGZkE1Y4YtZr--xhbOfqFlRyfns) <hiiamboris (NOT THIS ONE)>:
I certainly wouldn't want to parse 1MB+ file extra time.

[20:16:27](#dTm965p_6iCFVEldN205REXM5rOoKhMd72VTjh_Mi6s) <hiiamboris (NOT THIS ONE)>:
Though if it's accessible as a setting inside XML context, it's acceptable, just a bit awkward.

[20:32:55](#VVVwqeg3frP6gUEC-I3jPRTZlwjmEuuyA9UJhDB22n0) <greggirwin (Gregg Irwin)>:
> Though if it's accessible as a setting inside XML context, it's acceptable, just a bit awkward.

True. So you're OK removing it? And, hey, let's profile it to see just how awful it will be. Good info to have.

[20:49:00](#uue33y2yMCiwEVpoVUAwxSB2kBQ7Z4hPQcspEKgsOUM) <hiiamboris (NOT THIS ONE)>:
330ms per file at max juice mode

[20:53:15](#zsQIq8_igHOoN58tINdaYeGt8_HHB1USXYIPZL7mfp0) <hiiamboris (NOT THIS ONE)>:
I also find that `!` is good with path access but `text!` is good for defining field mappings in a DSL. So the use case dictates the sigil.

[20:53:59](#wjqv-YOnpFfkGy6j6aqP-M20dCNFeSAJmUwqnqVS77w) <hiiamboris (NOT THIS ONE)>:
* I also find that `!` is good with path access but `text!` is good for defining field mappings in a DSL. E.g. `value: !` is not good there. So the use case dictates the sigil.

[21:03:16](#biGW-2IpsLsPRl_CRc6vutTmK4FSZuZqnc0rb5wUvi4) <greggirwin (Gregg Irwin)>:
An order of magnitude either way would make it an easier call. :^( 

[21:03:53](#bK4hdbKgSj7X_6Y5JHjakq7APGfqbg_dEHjXSutiRRM) <hiiamboris (NOT THIS ONE)>:
������

[21:03:56](#EArFghBmXRjppdEySGzcvxsJLwQJ_xJxySJWKUcMmlQ) <greggirwin (Gregg Irwin)>:
@rebolek any idea why this doctype decl would cause a problem?

`<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN">`

[21:08:41](#WdpywhUi8PdsmukaKOMFXMnUoqCF5Jfwyd10XzFJ7vU) <greggirwin (Gregg Irwin)>:
For now, let's remove `/mark`, but make sure that Boris, er, "the user" can set `text-mark` manually in the XML context to avoid the hit. And we should also note that "feature", and the `replace/deep` option in the docs. The latter keeps global codec state out of the picture. <gavel>

[21:10:55](#2J9lXwXdLV4s7Bs_L5xYBiA_ScFsqFOoohr6E0qp1aY) <greggirwin (Gregg Irwin)>:
@rebolek it's not that doctype it seems. I replaced it with one from %menu.xml and it still causes the rest of the doc not to load. Something with the other prolog elements I'm hacking in to test.

[21:22:46](#W9tdTvb_0O0xykb46iJQLqidazFoWc8LPGqpltcOoBA) <greggirwin (Gregg Irwin)>:
Got it. Mapping issue from the BNF `prolog   ::=  XMLDecl? Misc* (doctypedecl Misc*)?` to `parse`.
```
	prolog: [
		XMLDecl
		opt [doctypedecl any Misc]
		any Misc
	]
```
All is well if the DTD is the first thing after XMLdecl, but the BNF says it can go anywhere. But if there are PIs or comments before it, it stops at the DTD (but still passes with `/strict`).

[22:39:21](#jKFPxWcc6v0KD9-ZWGZcvoQQ-KrC4wAvj0ZeukhNX0k) <greggirwin (Gregg Irwin)>:
@rebolek looks like `standalone` in XMLDecl isn't captured.

[23:21:07](#B8d9kcmKBN1QKb17-o6qiLUCk8k4Wg5ygEeg2AG1xrk) <greggirwin (Gregg Irwin)>:
[xml-metadata-notes.md](https://files.gitter.im/600719b0d73408ce4ff93018/xKgL/xml-metadata-notes.md)

[23:21:29](#j8m3bAtiHbx5TzXYLmDp_NFyetjmRxtwolEZHXcvEcI) <greggirwin (Gregg Irwin)>:
If you want to add it to the repo @rebolek, that might not be a bad idea.

[23:26:14](#q7onQDUHzjyHsrWErlzT401gEQ8ZPf9DSCTxApw5_3I) <greggirwin (Gregg Irwin)>:
Here's my %prolog.xml test file.
```
<?xml version="1.0" encoding="UTF-8" standalone="yes" ?> 
<!DOCTYPE data SYSTEM "./data/menu.dtd">
<?xml-stylesheet type="text/css" href="/style/design"?> 
<?xml-stylesheet type="text/xsl" href="menu.xsl"?>
<!-- This is a comment --> 
<?welcome to the real world?>
<?welcome x?>
<?welcome ?>
<customer_list> 
	<customer> 
		<name> Sanjay</name> 
		<location> Mumbai</location> 
	</customer> 
	<customer> 
		<name> Micheal</name> 
		<location> Washington</location> 
	</customer> 
</customer_list> 
```

## 20-Jan-2022

[6:18:46](#kHE6lpxmNiB1OICj9PalHGXwgU7F4S6-08j1V3innIU) <rebolek (Boleslav Březovský)>:
@greggirwin Thanks for the test file, I will fix it.

[8:14:51](#Xp5BLYZFB0mHimxN2VH4GlXUCjl8NUeWh8bKwpGnKNw) <rebolek (Boleslav Březovský)>:
> I strongly cast my vote for refinements over /with ... options, and only @hiiamboris complained a little. 

Ok, there’s not that much refinements, so let’s remove `/with`

> I vote to omit text!/attr! entries if they are none. Any objections or technical problems with that?

No objections and it’s implemented already.

> Any strong arguments for keeping /strict?

Probably no, If `XMLDecl` is optional in specs, let’s make it optional.

> I said not long ago that I think we can remove /mark

I must object here. The problem here is the accessibility in the XML object. To access it, the XML object must not be anonymous, unlike other contexts. Do we really want that?


[8:20:12](#XceV-TyukGb8awf0UeFfVNESjDcEL4yii__k_bN-aaM) <rebolek (Boleslav Březovský)>:
@greggirwin your notes were added to the repo: https://gitlab.com/rebolek/markup/-/wikis/Metadata-notes

[10:23:40](#Kq61xdVds2Xck6bMT7vLCmi3bZJ7t2NxIQl7WG18pKY) <rebolek (Boleslav Březovský)>:
Some notes:
> Note that no doctypedecl information is retained. I don't know if that's by design or not.

It’s a missing feature, I am working on it.

> Or if we change them all (meta data) to use ref! like compact does now.

I vote for changing them to `ref!` to be consistent across output formats.

> If we can agree that having the entire prolog in a structure is a good thing

I am not against having a prolog in a structure, but that doesn’t solve some other problems - comments, processing instructions and CDData can be anywhere in the XML doc, not just prolog. If we move them to prolog, we will lose structure.

[15:06:05](#D-k8Esb6itFqGDo-a0JAMB72fC4ZJzWnJe-_cKoPcYk) <greggirwin (Gregg Irwin)>:
> I must object here. The problem here is the accessibility in the XML object. To access it, the XML object must not be anonymous, unlike other contexts. Do we really want that?

I don't really want that, no. But I like `!` even less, and `/mark` as a general feature is really only there from our own little legacy issues and one specific alternative marker (legacy happens fast sometimes :^). So I will still say to remove it, even with an anonymous context, and then @hiiamboris can tell me how much time he loses each day, working on L10N and ICU data, because he wants to use `!` and has to post-process it.

[15:13:58](#pEW5m-Cjj1CQnX2-NSaw7MWODRouhQx1MbeDCiMkKNI) <greggirwin (Gregg Irwin)>:
> comments, processing instructions and CDData can be anywhere in the XML doc, not just prolog. If we move them to prolog, we will lose structure.

Ah, right. :^\ OK, let's mock up a test file that mixes them all in, I will look at the CDATA examples to start, and plan to put the prolog in a structure, whose internal format will depend on the format we decide for those elements.

I *really* thought we were almost done. ;^)

[17:08:14](#s0vxaCx20Ftvmw8fBb9nk5SKhP-2Oj7wxA_3u7LpU8k) <greggirwin (Gregg Irwin)>:
Here's my messy mockup for special values.
```
<?xml version="1.0" encoding="UTF-8" standalone="yes" ?> 
<!DOCTYPE data SYSTEM "./data/menu.dtd">
<?xml-stylesheet type="text/css" href="/style/design"?> 
<?xml-stylesheet type="text/xsl" href="menu.xsl"?>
<!-- Prolog comment 1 --> 
<?welcome to the real world?>
<?welcome x?>
<?welcome ?>
<!-- Prolog comment 2 --> 
<customer_list> 
	<customer> 
		<![CDATA[Customer 1 CDATA]]>
		<name> Sanjay</name> 
		<!-- Customer 1 comment --> 
		<location> Mumbai</location> 
		<?cust-1-PI type="app/red" href="/root/path"?> 
	</customer> 
	<customer> 
		<?cust-2-PI-1 type="app/red" href="/root/path/1"?> 
		<?cust-2-PI-2 type="app/red" href="/root/path/2"?> 
		<name> Micheal</name> 
		<!-- Customer 2 comment 1 --> 
		<![CDATA[customer 2 CDATA 1]]>
		<location> Washington</location> 
		<![CDATA[customer 2 CDATA 2]]>
		<!-- Customer 2 comment 2 --> 
	</customer> 
</customer_list> 
```

[17:09:18](#WNN2ZtT5GdC4y12Zj0HRgikBUdnQ7eKrM04JDSsLHts) <greggirwin (Gregg Irwin)>:
I should add some attrs for elements.

[17:12:34](#jGFLE-U6nGXAgpieTzgZ1FNbAjdQ2pYLflJJDUoBJLs) <greggirwin (Gregg Irwin)>:
```
<?xml version="1.0" encoding="UTF-8" standalone="yes" ?> 
<!DOCTYPE data SYSTEM "./data/menu.dtd">
<?xml-stylesheet type="text/css" href="/style/design"?> 
<?xml-stylesheet type="text/xsl" href="menu.xsl"?>
<!-- Prolog comment 1 --> 
<?welcome to the real world?>
<?welcome x?>
<?welcome ?>
<!-- Prolog comment 2 --> 
<customer_list> 
	<customer name="myVar1"> 
		<![CDATA[Customer 1 CDATA]]>
		<name type="first"> Sanjay</name> 
		<!-- Customer 1 comment --> 
		<location type="geo"> Mumbai</location> 
		<?cust-1-PI type="app/red" href="/root/path"?> 
	</customer> 
	<customer name="myVar2"> 
		<?cust-2-PI-1 type="app/red" href="/root/path/1"?> 
		<?cust-2-PI-2 type="app/red" href="/root/path/2"?> 
		<name type="first"> Micheal</name> 
		<!-- Customer 2 comment 1 --> 
		<![CDATA[customer 2 CDATA 1]]>
		<location type="geo"> Washington</location> 
		<![CDATA[customer 2 CDATA 2]]>
		<!-- Customer 2 comment 2 --> 
	</customer> 
</customer_list> 
```

[17:18:34](#sdLacOTm7FS-5uWjv-EwiGX9FAsXMoDXO24eAgZfXm8) <greggirwin (Gregg Irwin)>:
Thanks for all the fixes and improvements @rebolek. It's nice when my data doesn't load and I'm confident enough in the code to be sure it's my mock data that's messed up. :+1:

[17:21:21](#qF34-h6JeaQpUX6_7XdgNiVsEb3EV3vvlRyPPqmLPDk) <greggirwin (Gregg Irwin)>:
An interesting design aspect here is that `compact`'s choice to use issues leaks out if we have to change the other formats to avoid it.

[17:22:43](#R53EHJrzkzmL1lmD3UrcpRKsPN-a33VaPg2fPta2twU) <greggirwin (Gregg Irwin)>:
In `key-val`, PIs need to be adjusted, as they are 3 values right now (key-val-val). 

`#PI "cust-1-PI" {type="app/red" href="/root/path"}`

Should probably be

`#PI ["cust-1-PI" {type="app/red" href="/root/path"}]`

Comments and CDATA each just have a single string, so they're OK.

[17:23:44](#P0QbKFznXu8IbOhUdcwRrJqWomJvkZedFkKW38PjmaE) <greggirwin (Gregg Irwin)>:
DTD in the prolog is OK for the same reason.

[17:27:37](#T2Ob4St-rltYU_-MfsQyFLdP1EblYz9rwQfekJNckDs) <greggirwin (Gregg Irwin)>:
To make the test even better, we should mock attrs to be named `[cdata comment pi]`. Not that anyone in the real world would ever do that, just to check for conflicts as we look at syntax options.

[17:30:05](#1ay6Q5BptAU_dsm24P2KHjZLS4aB_s0GUrL71j1JKI8) <hiiamboris (NOT THIS ONE)>:
what is `#PI`?

[17:30:14](#2Vrq18mTybGtQKWz-EX-C9KymI6BGqpoGzzHU9UwXTQ) <greggirwin (Gregg Irwin)>:
Processing Instruction.

[17:30:21](#B10534dEQvi28V0N52UUNrgpqV2PKTzFLUV9xhJE_3I) <hiiamboris (NOT THIS ONE)>:
oh

[17:31:05](#psLI3IvNxs1bWAglxaTcX2k7zvRw60hivEaXeODgzQk) <greggirwin (Gregg Irwin)>:
In source XML they aren't "named", just `<? ... ?>` format to identify them.

[17:32:02](#0IwQe8lN0ejuCggNUh1J1u71yeQkjURl29c8IqUm8Fg) <hiiamboris (NOT THIS ONE)>:
got it

[17:32:26](#lYze8tIg4MTfTT8tOVcIkFWBSPTtSCOrCDtstubqScM) <greggirwin (Gregg Irwin)>:
My note from my metadata file: 

> `PI` is not meaningful, but `processing-instruction` is long. `Process`, no. `Proc-instr`, still not great. Given that "PIs are not part of the document's character data, but MUST be passed through to the application." what about `pass-thru`? I'm open to thoughts, and if @dander says `PI` makes the most sense in context, so be it.

[17:33:08](#yjXbaobvS17y-8HSdtgI8olik-XXsRJlK6Y15MBJ_2Q) <hiiamboris (NOT THIS ONE)>:
`proc-info` maybe

[17:34:00](#A_YQTO9PtTQhaLEwoACzgSdlp2jjAAsBwSEaqks-6G4) <greggirwin (Gregg Irwin)>:
That expands to Process Information to me.

[17:34:17](#NDAyI1nz0UsMpC7i5RN5ouRfmpSBdzJkbiMJ0pkyPT8) <greggirwin (Gregg Irwin)>:
But not terrible.

[17:36:41](#kpbLJEYeRP16cHrO_nEvs6w1d2umI2qgeztDjRc4ouw) <greggirwin (Gregg Irwin)>:
`cdata` could be `char-data` to match the length of `pass-thru | proc-info`.

[17:37:10](#u97bK5ovZ-r_Sa7SaGgFTFIrOIW-bQxph44XbnG815c) <greggirwin (Gregg Irwin)>:
But the standard abbreviation is probably very meaningful to XML users.

[18:18:28](#LeLT43wxh1Rqy-_IU4NKLBcF0mzVcZK3p4MPFEHk5rE) <rebolek (Boleslav Březovský)>:
> In key-val, PIs need to be adjusted, as they are 3 values right now (key-val-val). 

Right, the code was just copy-pasted from `triples` format, I’ll fix it.

## 21-Jan-2022

[1:20:58](#44c9hK6sIf_SnhEU1TDL5-Gnj3QB57n84-og2Vb2guo) <greggirwin (Gregg Irwin)>:
Latest test data, with attr names matching XML keyword names we use.
```
<?xml version="1.0" encoding="UTF-8" standalone="yes" ?> 
<!DOCTYPE data SYSTEM "./data/menu.dtd">
<?xml-stylesheet type="text/css" href="/style/design"?> 
<?xml-stylesheet type="text/xsl" href="menu.xsl"?>
<!-- Prolog comment 1 --> 
<?welcome to the real world?>
<?welcome x?>
<?welcome ?>
<!-- Prolog comment 2 --> 
<customer_list comment="comment-attr" cdata="cdata-attr" PI="PI-attr"> 
	<customer name="myVar1"> 
		<![CDATA[Customer 1 CDATA]]>
		<name type="first"> Sanjay</name> 
		<!-- Customer 1 comment --> 
		<location type="geo"> Mumbai</location> 
		<?cust-1-PI type="app/red" href="/root/path"?> 
	</customer> 
	<customer name="myVar2"> 
		<?cust-2-PI-1 type="app/red" href="/root/path/1"?> 
		<?cust-2-PI-2 type="app/red" href="/root/path/2"?> 
		<name type="first"> Micheal</name> 
		<!-- Customer 2 comment 1 --> 
		<![CDATA[customer 2 CDATA 1]]>
		<location type="geo"> Washington</location> 
		<![CDATA[customer 2 CDATA 2]]>
		<!-- Customer 2 comment 2 --> 
	</customer> 
</customer_list> 
```

[1:34:20](#Kw8K387D2XPIokCFBg8MXmV8sTMfD87s_gCgFfvvT38) <greggirwin (Gregg Irwin)>:
Here's my current thinking. Don't use issues or refs. Use the mechanism already in place for `text!` and `attr!`. I mocked it up in this file:

[1:34:37](#wmwYTSWOH9lznqjSzn77utnl4ZZG1kSAQJxPgSqAgpY) <greggirwin (Gregg Irwin)>:
[xml-proposed-keyword-syntax.txt](https://files.gitter.im/600719b0d73408ce4ff93018/kteO/xml-proposed-keyword-syntax.txt)

[1:45:46](#wiNlAT8xSP6bBCKmloaDi3fdZBzLkkk6GPb5vueg7o8) <greggirwin (Gregg Irwin)>:
Existing syntax at the top, then the proposed syntax at the bottom.

+1 for consistency. It's the same in all formats.

+1 for still avoiding keyword conflicts, because `!` can't be in XML names. So `!` acts like we use types today.

+1 for the implication that the keywords have a type meaning associated with them.

-1 for not standing out as much visually, because the sigil is at the end of the keyword, not the beginning. I can live with this. We could uppercase the keyword names, or add a leading underscore. That may be OK as these shouldn't occur nearly as much as regular content. @dander may have thoughts as well.

This makes the data pretty bland to look at. It's all just words now, with the exception being attr names in compact format. That also normalizes processing (except for `compact`). This mocked data is the worst things could ever look WRT the effect the syntax has. Massive data in attrs, or other issues will dwarf it in any raw readability comparison.

[6:28:37](#5Zs-dM1el199cEIMOZQfa38Fqe8bKWD8gYVQJVkIJKg) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Visually I prefer  `!` instead of `#` or `@` too. The latter two variants seem to be quite busy, overloaded. Can't explain, it is just feeling after all ....

[6:29:42](#ghtEOSuH_3EuvhfGrZ5fQ5ReLf6cErJvYnqs7azN-ic) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Interesting, that you gave it a minus / con, while I consider it being a plus / advantage :-)

[7:05:54](#h4V15Sobpk4nwHvW0chcj3_sIhlPhb4huW2o0VupLYo) <rebolek (Boleslav Březovský)>:
Ok. My gut feeling is that using `ref!` would be better because it’s a different beast than `text!` and `attr!`, but I can live with that.

[7:28:07](#NUxnmzfDrkAv4r4hErRObXaa_V0ZFhNFG95d__Q0xOo) <rebolek (Boleslav Březovský)>:
Also, I am going to remove `/mark` as discussed becuase there is a way for accessing the anonymous XML context:
```
xml-ctx: context? first body-of :load-xml
xml-ctx/text-mark: '!
```

[7:28:38](#n5e6UhyDpRu3njCHul062cEVmn3YTDReeYIXgKjjWWk) <rebolek (Boleslav Březovský)>:
Fairly easy :)

[8:13:48](#Pk8opRGfC2GohGDai9axhXCYLAFqaCcn_OrvU9Hr00A) <rebolek (Boleslav Březovský)>:
I would leave `CDATA` as it is, don’t introduce new terminology when it’s not needed.

[8:14:17](#04pksrn7WflnmAFonU2f1BatHpz5xeVLSgD5RCHOok0) <rebolek (Boleslav Březovský)>:
* > cdata could be char-data to match the length of pass-thru | proc-info.

I would leave `CDATA` as it is, don’t introduce new terminology when it’s not needed.

[10:12:04](#ExZyXf4YiLUuF9V-9txRLx4-COMrHM6v-hU7Oh5LJk0) <hiiamboris (NOT THIS ONE)>:
Why don't you use system/codecs/XML as context?

[10:12:20](#OUCLm6mC3Kgin03OOdUijEWIcFo8f2_umDtLNitx_jc) <hiiamboris (NOT THIS ONE)>:
For settings.

[11:29:14](#KuI4FQyrEp0RJE8yl6Yr2ZFJrM6iLvFh9SqDxPL6WbM) <rebolek (Boleslav Březovský)>:
That would mean adding new stuff there. I am not against it and if we agree on some structure that could be used with other codecs too, I am for moving options there.

[19:29:07](#cxVHzmBQnRIdWmI7ePBYPT26WTiv3qe9Gdhn5NfdKBc) <greggirwin (Gregg Irwin)>:
Something to run by Nenad. He recently noted that the new codecs don't use the "API" as he intended, but hasn't responded to how else we should write codecs that have options. All the old ones are just graphics loaders, and offer no control. In that context, I think it's OK. The only thing that limits us there is writing, e.g., JPG support in an image producing app that controls the compression level.

[19:30:53](#Tuu1ObO9fcWN1T-f1GCXUj95rC_Xnc9IQjDag0202rk) <greggirwin (Gregg Irwin)>:
`CDATA` it is, unless @dander screams "NOOoooo!". <gavel>

What about `[PI pass-thru proc-info]`?

Should `doctype` be `doc-type`?

[19:32:26](#LzPwcl8f0ThJ4FdmnTrcQ3OPge_uHR_hUR8JbjMvekk) <greggirwin (Gregg Irwin)>:
@pekr, the great thing about subjective experience is that we all see things differently.  It's also terrible when we have to make decisions. :^) Thanks for weighing in, it's appreciated.

[19:34:45](#-y5YwnIT5rLToP51m8aKKDQhr-ZQuUfbJFhuAh_R_zY) <greggirwin (Gregg Irwin)>:
* Something to run by Nenad. He recently noted that the "new" codecs don't use the "API" as he intended, but hasn't responded to how else we should write codecs that have options. All the old ones are just graphics loaders, and offer no control. In that context, I think it's OK. The only thing that limits us there is writing, e.g., JPG support in an image producing app that controls the compression level.

[19:38:00](#PiKGh0vEBfshfm7dRSbGyq9d0wJxy8EGERw_TsC1z64) <greggirwin (Gregg Irwin)>:
The downside to using the system codec context for options is, once again, globals. We don't have concurrency yet, but when we do a lot of things may need to change that assumed it doesn't exist. I'll also continue to push for separation between tasks, and using message passing. I'm not concerned about how many theoretical tasks we can run in microbenchmarks, but how we get real work done correctly without losing our minds.

[19:46:22](#9e8UuA0Ch2AL8CTdK56ETLy6NDBG8u6M-t_a9l3Nuvw) <hiiamboris (NOT THIS ONE)>:
well, accessing it's context via hacks has the same downside

[20:30:08](#qVcNXKNnAuSfKuODfMri5DXEmEKSdFlqxnb9HJWuSFk) <rebolek (Boleslav Březovský)>:
> He recently noted that the "new" codecs don't use the "API" as he intended

If I can take a look at that API, I’ll be happy to rewrite my codecs.

[21:01:10](#DsOJXMI77R9eEhqFr4z8rv1jU03CdbfbvpjtIV21zOE) <greggirwin (Gregg Irwin)>:
@hiiamboris yup, the difference being that we as designers haven't blessed it, and therefore aren't to blame. ;^)

[21:03:50](#3nc_qH0c5MNvnT-3_D8qUM1-dju-22SWdRDYYZyx-2o) <greggirwin (Gregg Irwin)>:
@rebolek I don't see a solution. The issue is that the other codecs don't have any options. I think his comments were in the PR. The problem is that adding support for options of any kind, in any codec, means `load` has to support a generic mechanism for it (as I understand it). And that has all the issues we talked about for it here.

If we can get him to clarify what *he* wants, we can look at alternatives.

[21:06:19](#LjXASJq6L_4byLQHJpN5C6VA1j_eJxNVR5v5RA6iTEU) <hiiamboris (NOT THIS ONE)>:
:)

[21:06:25](#WjzpbS9B6va7lkjkuRqFpuIOlTdX25uOdqE6aI1rabs) <greggirwin (Gregg Irwin)>:
https://github.com/red/red/pull/5026#pullrequestreview-856800137

[21:13:17](#v8k7GjQfiN_zgQvyocX7si-FDztZXSvXrs3Dc12jjdU) <rebolek (Boleslav Březovský)>:
@greggirwin Ok, I’m cetainly not pushing for that, if @hiiamboris wants to override `text!` and use `!` there is a way even with the anonymous object as I shown, so IMO it’s not a problem currently.

[21:13:59](#4MQzSzmks4h-6WIuleHOD7cSjk7iuYj8-3i2buMjruI) <rebolek (Boleslav Březovský)>:
OTOH having an unified mechanism for setting codec’s options makes sense not only XML and current codecs but also for all future ones.

[21:55:31](#ZfyrbUk3r6wzYK-g6p3Ve1SLZI8zkYSKIjzcKBQXCOE) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
☝ [January 21, 2022 8:38 PM](https://gitter.im/red/codecs?at=61eb0b985ee4df335af7c685) I cannot imagine that someone, who does not want to loose his mind, would like to load simultaneously multiple XML files using a different options for each of them.  

[21:56:53](#lUR8lmY6k2iBq2T36gfVmfjUadOFif04pE1YjJRK1fA) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
I believe, that having context to hold all codecs in one place is the right way to go... instead of having tons of floating `load-*` functions.

[22:31:46](#aUV6NmitZYQyFXGby4vE7lAsCourS9jNpWxfLaFbZRw) <hiiamboris (NOT THIS ONE)>:
Well, what if you import some tools that process XML data and those tools operate on different formats.

[22:32:06](#eb50pbqPPUXcPf99Ao8H9_gajQQepGp6ZIhbgXhQCoI) <hiiamboris (NOT THIS ONE)>:
* Well, what if you import some tools that process (various kinds of) XML data and those tools operate on different formats.

[22:58:13](#0XhmRdIGKOKgLaODENdujli5cOyTtPep-wfe7TQhE-I) <greggirwin (Gregg Irwin)>:
@Oldes agreed, but when someone else touches the code, and wants their data in a different format, but doesn't tell you...you lose your mind for a different reason. It's not a showstopper, just a less appealing pattern.

[23:48:44](#04GSJR0ybqlCI8QGc_BaHlV8vxCi5NoLpXExmDVPkow) <greggirwin (Gregg Irwin)>:
Synced. Thanks for the changes @rebolek. 

Are we still going to put the prolog in a separate block? I'd like to <gavel> that.

[23:53:47](#gkyhk7SLA9Gt77i7iEpKWEX8Aqvt7IgIiXAsbIz9QGI) <greggirwin (Gregg Irwin)>:
@hiiamboris are you OK with PIs using issues for the PItarget part in compact form, even though it's not technically an attribute? e.g.
```
<?xml-stylesheet type="text/xsl" href="menu.xsl"?>
<?welcome to the real world?>
```
Becomes
```
    PI! [#xml-stylesheet {type="text/xsl" href="menu.xsl"}] 
    PI! [#welcome "to the real world"] 
```

## 22-Jan-2022

[10:15:06](#XMpu54HnSBarMoOso0fW2zMWlTnO8FBnCXQZtegvaMY) <hiiamboris (NOT THIS ONE)>:
looks good

## 24-Jan-2022

[1:06:16](#2z0And24qs70VYmXV3FVTbbBMliq4gVRFmX9idOuWd4) <greggirwin (Gregg Irwin)>:
> I believe, that having context to hold all codecs in one place is the right way to go... instead of having tons of floating `load-*` functions.

I think this falls into "pushing the problem around", rather than solving it. Whether you have options in a codec object, or a named func, if you need the functionality, it's got to be somewhere. So we look at tradeoffs. As noted before, we need to build a help system for anything beyond how `help` works for functions today. Otherwise there is nothing more than docs for a user to learn from. Then there's `help` itself. If there are no extended funcs, and we *can* do that, you can't do `help load-` and get a list of them. You just get `load`'s help, that it has `/as` and a list of those formats. If it gets to *tons* of them, you overload that doc string. But also, that doc string won't know about any non-standard codecs, so won't list them. If you're the only one working on your code, you know that you included the `XAML` codec, but on a team, or with shared code of any kind, you might not.

For me, this is all still very open to change, because we don't have enough people using them in different environments to tell us what design aspects are good, bad, or just wasting space.

[2:18:43](#oz7EEcwzTmRMqMkGEPkuEsa2AWJNHw0Y8GektRTKD_A) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
I am sorry, but the concept of myriad of do-* functuons was one of the most hated design decisions about Rebol. It started with do-browser netscape plugin and exploded with do-service R3 services. I always regarded the reasoning about not overloading and slowing down functions as an excuse, or even worse - an afterthought and the lack of proper desing decisions.

[2:21:27](#73RN3L3yR2yaIfPU3MNElzl3ZDkuEU0XMJ_ylC7ftZA) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
The same hoes for the help system. Its topic is as old, as Rebol system. If we need eg objects having headers, let's just do it, after all even Carl planned that. Ditto for dialects. The recent help system design should not be a decision point, which brings mess to the language.

[2:28:16](#b-PONCh8wFk34SaAVsDsi58CwCDLZkwxTMU7cozcQXA) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
I was quite shocked by readimg Doc's PR comments re XML codec, where he wondered, why the codec obeys a codec API, and even worse, why it is not a streamed parser he always wished for. This ideas hoes back to the times of his mysql vs postgress drivers. It just reminded me of Carl letting others do r3- gui or VID 2.3, scrapping delivered solution later and redoing it himself. I can see the lack of coordination there without syncing upon basic system design requirements.

[2:30:22](#bJ5_O-EwlIlYAJWQNERDPrPcTn81XGqOSdFo469kakQ) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Ditto for the CLI module.

[3:36:37](#O4YExA-CCszitQRAQXoimzdXDmpZY6ZZQE-HSgYnwLE) <greggirwin (Gregg Irwin)>:
@pekr, I'll ask here for a concrete design that we can discuss, to see which we like better. Saying "X is bad" only helps so much. We want the least worst option. :^)

I agree we can and should improve `help`. But who's going to do it? How important is it relative to other things?

Yes, coordination in a team can be really hard, and we hope to improve our internal communication in the future. 

[3:41:08](#nsLntFt46RfHHOtTWX5iOS87y6zmoopi7UZgErY3K-A) <greggirwin (Gregg Irwin)>:
I do appreciate the feedback though.

[4:24:04](#paQRYxLpmmWi9dRbc-fjQHawsuDrV2UA35iJx1q0T2M) <greggirwin (Gregg Irwin)>:
@pekr, maybe what triggered my response was:

> functuons was one of the most hated design decisions about Rebol. It started with do-browser netscape plugin and exploded with do-service R3 services.

I don't remember any community discussion about those being hated, and "exploded" is kind of like @Oldes using the "tons" to describe how many codec might be in play.

[5:37:27](#TYHNBNpv9QaS_RrWib0ZQkp7HWtuxKsxhz7ur4SCQlA) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
@greggirwin what do you mean with the "tons"?

[6:55:30](#7BvolWkg84KYKU-eTD5NCXLUCxMy_rLOWWZ2FvY46bg) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Sorry, I typed on a smartphone, and noticed "my most hated". I could not edit it on a smart phone. But I do remember the discussion I started because of that, requested a more polymorphic aproach and was silenced down by counter claims, that do / load are important function and their further slow down is not an option. 

[7:00:14](#LDZWd2aOOSXCUHBMsuboVUjlfB0eNNSUJEXizP0CJIk) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
And R3/Services was poluting the space further with stuff like send-service, open-service. I really don't want to see that. Those function should have an API imo and /as /with etc refinements are a good way to go. In there internal space (inside a module), the author can do whatever, but global space should be kept as much clean as possible.

[7:02:00](#xY8qU1GWVDWvkD1q9UxdCoxmyDNbeX3S3Ei_cwGDZJU) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
I even objected, that the naming could be reversed to something like service-send, service-open, so that help lists them one by each other. But that already leads us to service/open (or in other langs service.open) schema, which was refused too, because of the common naming order in Rebol.

[7:06:09](#Ijxy4rSXxmBITGVAeeb_ZHtxZxwmDp-yl-El_7R6Q9A) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
@greggirwin I'm currently having in Rebol (in the Bulk version) 25 codecs:
```rebol
>> ? system/codecs
SYSTEM/CODECS is an object of value:
  text            object!    [name type title suffixes entry]
  markup          object!    [name type title suffixes entry]
  qoi             object!    [name type title suffixes entry size?]
  pkix            object!    [name type title suffixes decode identify]
  der             object!    [name type title suffixes decode identify DER-tags decode-OID verbose]
  mobileprovision object!    [name type title suffixes decode]
  crt             object!    [name type title suffixes decode fingerprint verbose]
  ppk             object!    [name type title suffixes decode]
  ssh-key         object!    [name type title suffixes decode]
  utc-time        object!    [name type title decode]
  unixtime        object!    [name type title suffixes decode encode]
  ar              object!    [name type title suffixes decode identify]
  gzip            object!    [name type title suffixes decode encode identify verbose level]
  zip             object!    [name type title suffixes decode encode identify decompress-file de-extra-fields ...
  tar             object!    [name type title suffixes decode identify verbose]
  dng             object!    [name type title suffixes comment decode identify]
  jpegxr          object!    [name type title suffixes decode encode identify]
  dds             object!    [name type title suffixes decode encode identify size?]
  tiff            object!    [name type title suffixes decode encode identify]
  gif             object!    [name type title suffixes decode encode identify size?]
  bmp             object!    [name type title suffixes decode encode identify size?]
  jpeg            object!    [name type title suffixes decode encode identify size?]
  png             object!    [name type title suffixes decode encode identify size? chunks]
  wav             object!    [name type title suffixes decode encode identify verbose]
  ico             object!    [name type title suffixes decode encode identify]
```

[7:07:22](#K66n0II8bJ-igATywg1JtNFGEBNwXfq9pLyieyTV6GA) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
```rebol
>> ? codecs
TIME CODECS:
    UNIXTIME
    Unix time stamp converter
    Includes: decode encode

    UTC-TIME
    UTC time as used in ASN.1 data structures (BER/DER)
    Includes: decode


TEXT CODECS:
    MARKUP
    Internal codec for markup media type
    Suffixes: .html .htm .xsl .wml .sgml .asp .php

    TEXT
    Internal codec for text media type
    Suffixes: .txt .cgi


CRYPTOGRAPHY CODECS:
    CRT
    Internet X.509 Public Key Infrastructure Certificate and Certificate Revocation List (CRL) Profile
    Suffixes: .crt
    Includes: decode fingerprint verbose

    DER
    Distinguished Encoding Rules
    Suffixes: .p12 .pfx .cer .der .jks
    Includes: decode identify DER-tags decode-OID verbose

    MOBILEPROVISION
    Apple's mobileprovision file
    Suffixes: .mobileprovision
    Includes: decode

    PKIX
    Public-Key Infrastructure (X.509)
    Suffixes: .pem .ssh .certSigningRequest
    Includes: decode identify

    PPK
    PuTTY Private Key
    Suffixes: .ppk
    Includes: decode

    SSH-KEY
    Secure Shell Key
    Suffixes: .key
    Includes: decode


COMPRESSION CODECS:
    AR
    Unix archive file
    Suffixes: .ar .a .lib .deb
    Includes: decode identify

    GZIP
    Lossless compressed data format compatible with GZIP utility.
    Suffixes: .gz
    Includes: decode encode identify verbose level

    TAR
    TAR File Format
    Suffixes: .tar
    Includes: decode identify verbose

    ZIP
    ZIP File Format
    Suffixes: .zip .aar .jar .apk .zipx .appx .epub
    Includes: decode encode identify decompress-file de-extra-fields validate-crc? verbose level


SOUND CODECS:
    WAV
    Waveform Audio File Format
    Suffixes: .wav .wave
    Includes: decode encode identify verbose


IMAGE CODECS:
    BMP
    Portable Bitmap
    Suffixes: .bmp
    Includes: decode encode identify size?

    DDS
    DirectDraw Surface
    Suffixes: .dds
    Includes: decode encode identify size?

    DNG
    Digital Negative
    Suffixes: .dng
    Includes: comment decode identify

    GIF
    Graphics Interchange Format
    Suffixes: .gif
    Includes: decode encode identify size?

    ICO
    Windows icon or cursor file
    Suffixes: .ico .cur
    Includes: decode encode identify

    JPEG
    Joint Photographic Experts Group
    Suffixes: .jpg .jpeg
    Includes: decode encode identify size?

    JPEGXR
    JPEG extended range
    Suffixes: .jxr .hdp .wdp
    Includes: decode encode identify

    PNG
    Portable Network Graphics
    Suffixes: .png
    Includes: decode encode identify size? chunks

    TIFF
    Tagged Image File Format
    Suffixes: .tif .tiff
    Includes: decode encode identify


OTHER CODECS:
    QOI
    Internal codec for qoi media type
    Suffixes: .qoi
    Includes: size?
```

[7:08:43](#zzpmtP4ZJGMTqExkIYdIVbGkrwPTK9eNEEvo85pJuHQ) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
(there is a bug... QOI should have set `image` type)

[7:10:08](#8cYR88uY7JXxU-0PnkZ61f_ULO67gLpMyQ847dPvlX4) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
(there is a bug... QOI should have set `image` type)

[7:11:40](#pu2UPzhXbbn-_w-5npN-mXUds2TWEm3Fu7zA4rfb-w4) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* @greggirwin I'm currently having in Rebol (in the Bulk version) 25 codecs:
```rebol
>> ? system/codecs
SYSTEM/CODECS is an object of value:
  text            object!    [name type title suffixes entry]
  markup          object!    [name type title suffixes entry]
  qoi             object!    [name type title suffixes entry size?]
  pkix            object!    [name type title suffixes decode identify]
  der             object!    [name type title suffixes decode identify DER-tags decode-OID verbose]
  mobileprovision object!    [name type title suffixes decode]
  crt             object!    [name type title suffixes decode fingerprint verbose]
  ppk             object!    [name type title suffixes decode]
  ssh-key         object!    [name type title suffixes decode]
  utc-time        object!    [name type title decode]
  unixtime        object!    [name type title suffixes decode encode]
  ar              object!    [name type title suffixes decode identify]
  gzip            object!    [name type title suffixes decode encode identify verbose level]
  zip             object!    [name type title suffixes decode encode identify decompress-file de-extra-fields ...
  tar             object!    [name type title suffixes decode identify verbose]
  dng             object!    [name type title suffixes comment decode identify]
  jpegxr          object!    [name type title suffixes decode encode identify]
  dds             object!    [name type title suffixes decode encode identify size?]
  tiff            object!    [name type title suffixes decode encode identify]
  gif             object!    [name type title suffixes decode encode identify size?]
  bmp             object!    [name type title suffixes decode encode identify size?]
  jpeg            object!    [name type title suffixes decode encode identify size?]
  png             object!    [name type title suffixes decode encode identify size? chunks]
  wav             object!    [name type title suffixes decode encode identify verbose]
  ico             object!    [name type title suffixes decode encode identify]
  swf             object!    [name type title suffixes decode decode-tag identify verbose swf-tags]
  pdf             object!    [name type title suffixes decode encode identify]
  bbcode          object!    [name type title suffixes decode]
  html-entities   object!    [name type title decode]
  json            object!    [name type title suffixes encode decode]
  xml             object!    [name type title suffixes decode verbose options xml-parse-handler echo-handler b...
```

[7:12:27](#84uqmVXJA1xdJAHWyb0hhYFWN2iSpfbdCfxOI_fKPmw) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* ```rebol
>> ? codecs
TIME CODECS:
    UNIXTIME
    Unix time stamp converter
    Includes: decode encode

    UTC-TIME
    UTC time as used in ASN.1 data structures (BER/DER)
    Includes: decode


TEXT CODECS:
    BBCODE
    Bulletin Board Code
    Suffixes: .bbcode
    Includes: decode

    HTML-ENTITIES
    Reserved characters in HTML
    Includes: decode

    JSON
    JavaScript Object Notation
    Suffixes: .json
    Includes: encode decode

    MARKUP
    Internal codec for markup media type
    Suffixes: .html .htm .xsl .wml .sgml .asp .php

    TEXT
    Internal codec for text media type
    Suffixes: .txt .cgi

    XML
    Extensible Markup Language
    Suffixes: .xml .pom
    Includes: decode verbose options xml-parse-handler echo-handler block-handler ns-block-handler parser


CRYPTOGRAPHY CODECS:
    CRT
    Internet X.509 Public Key Infrastructure Certificate and Certificate Revocation List (CRL) Profile
    Suffixes: .crt
    Includes: decode fingerprint verbose

    DER
    Distinguished Encoding Rules
    Suffixes: .p12 .pfx .cer .der .jks
    Includes: decode identify DER-tags decode-OID verbose

    MOBILEPROVISION
    Apple's mobileprovision file
    Suffixes: .mobileprovision
    Includes: decode

    PKIX
    Public-Key Infrastructure (X.509)
    Suffixes: .pem .ssh .certSigningRequest
    Includes: decode identify

    PPK
    PuTTY Private Key
    Suffixes: .ppk
    Includes: decode

    SSH-KEY
    Secure Shell Key
    Suffixes: .key
    Includes: decode


COMPRESSION CODECS:
    AR
    Unix archive file
    Suffixes: .ar .a .lib .deb
    Includes: decode identify

    GZIP
    Lossless compressed data format compatible with GZIP utility.
    Suffixes: .gz
    Includes: decode encode identify verbose level

    TAR
    TAR File Format
    Suffixes: .tar
    Includes: decode identify verbose

    ZIP
    ZIP File Format
    Suffixes: .zip .aar .jar .apk .zipx .appx .epub
    Includes: decode encode identify decompress-file de-extra-fields validate-crc? verbose level


SOUND CODECS:
    WAV
    Waveform Audio File Format
    Suffixes: .wav .wave
    Includes: decode encode identify verbose


IMAGE CODECS:
    BMP
    Portable Bitmap
    Suffixes: .bmp
    Includes: decode encode identify size?

    DDS
    DirectDraw Surface
    Suffixes: .dds
    Includes: decode encode identify size?

    DNG
    Digital Negative
    Suffixes: .dng
    Includes: comment decode identify

    GIF
    Graphics Interchange Format
    Suffixes: .gif
    Includes: decode encode identify size?

    ICO
    Windows icon or cursor file
    Suffixes: .ico .cur
    Includes: decode encode identify

    JPEG
    Joint Photographic Experts Group
    Suffixes: .jpg .jpeg
    Includes: decode encode identify size?

    JPEGXR
    JPEG extended range
    Suffixes: .jxr .hdp .wdp
    Includes: decode encode identify

    PNG
    Portable Network Graphics
    Suffixes: .png
    Includes: decode encode identify size? chunks

    TIFF
    Tagged Image File Format
    Suffixes: .tif .tiff
    Includes: decode encode identify


OTHER CODECS:
    PDF
    Portable Document Format
    Suffixes: .pdf
    Includes: decode encode identify

    QOI
    Internal codec for qoi media type
    Suffixes: .qoi
    Includes: size?

    SWF
    ShockWave Flash
    Suffixes: .swf
    Includes: decode decode-tag identify verbose swf-tags


TIP: use for example help system/codecs/zip to see more info.

```

[7:13:02](#nz2kfFxSrghy6prk6Tum8FEOPWOzXEck_lOEzbhWzDc) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* @greggirwin I'm currently having in Rebol (in the Bulk version) 31 codecs:
```rebol
>> ? system/codecs
SYSTEM/CODECS is an object of value:
  text            object!    [name type title suffixes entry]
  markup          object!    [name type title suffixes entry]
  qoi             object!    [name type title suffixes entry size?]
  pkix            object!    [name type title suffixes decode identify]
  der             object!    [name type title suffixes decode identify DER-tags decode-OID verbose]
  mobileprovision object!    [name type title suffixes decode]
  crt             object!    [name type title suffixes decode fingerprint verbose]
  ppk             object!    [name type title suffixes decode]
  ssh-key         object!    [name type title suffixes decode]
  utc-time        object!    [name type title decode]
  unixtime        object!    [name type title suffixes decode encode]
  ar              object!    [name type title suffixes decode identify]
  gzip            object!    [name type title suffixes decode encode identify verbose level]
  zip             object!    [name type title suffixes decode encode identify decompress-file de-extra-fields ...
  tar             object!    [name type title suffixes decode identify verbose]
  dng             object!    [name type title suffixes comment decode identify]
  jpegxr          object!    [name type title suffixes decode encode identify]
  dds             object!    [name type title suffixes decode encode identify size?]
  tiff            object!    [name type title suffixes decode encode identify]
  gif             object!    [name type title suffixes decode encode identify size?]
  bmp             object!    [name type title suffixes decode encode identify size?]
  jpeg            object!    [name type title suffixes decode encode identify size?]
  png             object!    [name type title suffixes decode encode identify size? chunks]
  wav             object!    [name type title suffixes decode encode identify verbose]
  ico             object!    [name type title suffixes decode encode identify]
  swf             object!    [name type title suffixes decode decode-tag identify verbose swf-tags]
  pdf             object!    [name type title suffixes decode encode identify]
  bbcode          object!    [name type title suffixes decode]
  html-entities   object!    [name type title decode]
  json            object!    [name type title suffixes encode decode]
  xml             object!    [name type title suffixes decode verbose options xml-parse-handler echo-handler b...
```

[7:18:59](#HwgzSmSqlKu42ceXwdHUGi9t_OgjFyk1M28XPkhs2Tc) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
But Red cannot have codecs living in object, because it does not have implemented object extending..
```red
>> extend object [] [x: 2]
*** Internal Error: reserved for future use (or not yet implemented)
```

[7:21:49](#Cy1aoPUYXnnRlWVXEeev5ByjC4dr0MrVfVmT-tQyVPk) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
@pekr since there is `transcode`, `load` is not so important function like it was in Rebol2.

[8:03:18](#XGXOM-MRg_aOVZszQ0QnVZ6JABov-qNV0iYqAaelTkk) <zentrog>:
greggirwin (Gregg Irwin): I think 'cdata' makes sense, since it's that everywhere. For processing instruction, I might have mentioned "PI" because it looks like [a common abbreviation](https://en.wikipedia.org/wiki/Processing_Instruction), but I've never done anything that processed them.

[19:22:05](#VjJIa6Sw56LUI3KRC3nEM-UnOjvtmxWlwNz4gaAdZuI) <greggirwin (Gregg Irwin)>:
@Oldes, "tons" referred to your comment:

> I believe, that having context to hold all codecs in one place is the right way to go... instead of having tons of floating `load-*` functions.

[19:25:40](#WMerTk2nFxhcrMXkoE1q89I3527AaHxbK_iS7iWmCYg) <greggirwin (Gregg Irwin)>:
@pekr, we definitely agree on consolidating interfaces as much as possible. I fought hard for that with `round` in Rebol, and am doing so now for `split` (where we are now at the stage of deciding on a dialect vs refinements) and `format`.  It then comes to how things work in practice, and finding the best balance, because it is possible to overload a small set of interfaces too far. That's part of the magic of Rebol's design for me. It's not that it's perfect, but it found a nice balance.

[19:28:06](#FoaXcWZVPUNManQbgbMYzjKU7IopmkxoXcXl0ZRc2G8) <greggirwin (Gregg Irwin)>:
@Oldes thanks so much for the list, and the help example! I will pull that into notes and review when I can give it a block of time.

[19:32:10](#GOZ-Sznajsw2_99RxL2w43HILbUd8nooyvl-vgtPl5o) <greggirwin (Gregg Irwin)>:
@zentrog:matrix.org thanks. :+1: Personally I like `pass-thru` or `proc-info`, as they are more word-like, and have nice meaning. But when dealing with XML, that domain uses `PI`. So I will defer to that, and nobody except me has complained about `PI` that I know of, so `PI` it remains. <gavel>

[19:33:03](#wbHI1WEryxFpfvyUC9tVOA2t8ad6i264gUA0XIWQ2S8) <greggirwin (Gregg Irwin)>:
@rebolek what's still to be done on our checklist for release into the PR?

[20:30:19](#s-yghodkbJznVCCdWm0iTflrT1VtvoThloUmsJ7QvBA) <greggirwin (Gregg Irwin)>:
We are a week away from month end, and my goal is to get XML out, along with Animation. We'll note in the blog post that there may be changes, and that we are reviewing the overall codec interface. 

The original JSON interface is a legacy issue for us now. R2 didn't have codecs, and that code has been around in various forms for a very long time. Romano did the first version, I took over maintenance and kept it up with Douglas Crockford on JSON.org, then @giesse, @rebolek, and @hiiamboris contributed to improving it; but the original interface lives on. :^\

I don't want to pull anyone's focus right now, but also don't want to just hack in a different interface without thinking it through. So it will be a pretty big task. It will likely also inform other extension models or how a system catalog works, even for I/O protocols perhaps.

@Oldes made the point that a single app may only use one XML format, for sanity, which will be common. But it may also be common for a single service or process to act as a general data transformer, dealing with many input and output formats, per request. That leads to bigger architecture questions, concurrency and reentrancy issues, etc. 

For my part, as you can probably all guess, I'm much more concerned about understanding and correctness than about micro-benchmarks. So the overhead of function calls into a codec are not as important to me as the big picture.

## 25-Jan-2022

[4:29:59](#gTsXHPOudbrGRq2LtG8GP_XXPpyGFN7fjGdnqQggzZ0) <toomasv>:
Thanks! Will study these now.

[4:30:22](#dSyDDJQvA7UnuSEJGh-dEf0OhyPstinsh6-rsw2tmbo) <toomasv>:
* Thanks! Wow. A lot. Will study these now.

[4:33:13](#-SHOWlXYQHPE_v4rmBKLXJizmaOD2EBh9w_4zwdMn3I) <greggirwin (Gregg Irwin)>:
That's probably related to other stuff. :^)

[4:33:34](#CZD1nba9p9BuXBLgylhnh_Z3RsQCFPvwqEmaVDJI8-s) <greggirwin (Gregg Irwin)>:
Gitter makes it easy to lose track of which group you're in.

[6:37:43](#c0svUezmHa-aqjJWale6-JfRb4ZpA2q7hh9kQSFxpkk) <rebolek (Boleslav Březovský)>:
@greggirwin 

> what's still to be done on our checklist for release into the PR?

I have almost rerady the `init` function, so the codec won’t eat memory when not used, this `PI! [#xml-stylesheet {type="text/xsl" href="menu.xsl"}] ` (for the compact format) is not done yet. but that’s going to be very fast, and that’s all I believe. I’ll finish these two things and re-read the conversation to see if I haven’t forget about something.

If there’s not going to show up something else it definitely can be merged this month.

[9:50:11](#JQXcI_FtOT2CVt_bfhIW-HbX-XqHUnHlKDYtK11ChpI) <rebolek (Boleslav Březovský)>:
As, so the `PI! [#xml-stylesheet {type="text/xsl" href="menu.xsl"}]` is done already.

[9:50:19](#FCBh2iF91Djje8fLmUpz7YJXiultWRNpac0ZuppVAgw) <rebolek (Boleslav Březovský)>:
And `init` is also finished.

[9:50:49](#dtlAD-S8lqgSoWbihSW1tIRnPRCPxSIKYNynHBPTMjo) <rebolek (Boleslav Březovský)>:
I am going to review the chat again, to see if I haven’ forgot anything. If not, we’re probably ready to go.

[19:10:29](#Y3e7NeGq_Ks3CpxxcaxenMrSnB8MEyWE44o8_gTwopY) <zentrog>:
������

[20:51:00](#xTGoJ_GkqwSdJjE3xyN6teK4hG09H0NxbYGCFLj5gOc) <greggirwin (Gregg Irwin)>:
@rebolek I think we agreed the prolog would be in a separate block. Is that right?

[20:52:24](#b-DrjYYSt7J8KQeLX3x62e5TQIUU2Zh8UAw8-uV2Z8g) <greggirwin (Gregg Irwin)>:
Thanks for reviewing chat. I'll leave that to you. We will write examples for the blog post which may bring things to light that we address after the release.

[20:54:32](#JfVZ1N-_2F-WWe8YMzjqVk0wjyV_knf8i5Yr3kP9jww) <greggirwin (Gregg Irwin)>:
We should probably also add a %codecs/ folder to docs, and move the old wiki docs for JSON and CSV there, along with new XML docs. 

[22:36:47](#FxWrC0YGEDAHAyZBpjY-I5l_YBN7Cqt4iSw7EaHhuR0) <rebolek (Boleslav Březovský)>:
@greggirwin Prolog in in a separate block -  I am not agains it, if it would be prolog only, leaving cdata, PIs, comments, etc out.

[22:38:02](#1rL9LjyDv5NSh7FoEWkfZRGKuzcJLpZsyc-nzOGaUJI) <rebolek (Boleslav Březovský)>:
> We should probably also add a %codecs/ folder to docs, and move the old wiki docs for JSON and CSV there, along with new XML docs. 

Good idea. The code is almost ready, reviewing the docs would take some time but I don't think it's a showstopper.

[22:38:19](#R5XpcfHUgyY9m4lYJdh_zceGIdsLbwWVt2ZMlgodbXw) <rebolek (Boleslav Březovský)>:
* @greggirwin Prolog in in a separate block -  I am not sure about that.

[22:38:49](#t4aTOm6Mg-A33xE6Bis4FEQwgM5ZZZnfe3HPAQGheNM) <greggirwin (Gregg Irwin)>:
The point of putting it *all* in a separate block is so you just get two values back: prolog and body. Otherwise, how do you find the root note, and separate the prolog? You can do it, but should everyone have to, versus (which I think I used as the example) `set [prolog body] load-xml/meta ...`

[22:39:02](#ljsBcK3DZH6Akc10_vYUF_s8uay0uwx487leJqc7u60) <greggirwin (Gregg Irwin)>:
* The point of putting it *all* in a separate block is so you just get two values back: prolog and body. Otherwise, how do you find the root node, and separate the prolog? You can do it, but should everyone have to, versus (which I think I used as the example) `set [prolog body] load-xml/meta ...`

[22:39:13](#qRhxsfD2VU_7B_nnOJQLj4QPEAcvnyvHrqwgEqAyzw4) <rebolek (Boleslav Březovský)>:
* @greggirwin Prolog in a separate block -  I am not sure about that.

[22:40:37](#Z8yOMm_LIHHJcGmNyL5cdxtyWmbAf39tkc9yEO8ND30) <greggirwin (Gregg Irwin)>:
In the spec, the prolog rule includes those misc elements.

[22:40:51](#VadRFl0Z4hoPipC9lpID3F1loeOtyQ8emabMy4sX9lA) <rebolek (Boleslav Březovský)>:
Ok, I need to think about it a bit more and do some tests tomorrow (not in 20 minutes, but after some sleep ������ to see how it's going to work.

## 26-Jan-2022

[1:36:29](#tXg5xCqT4-jJKiZSBpC4hIM8Q-lBnU4KUUvSJPl-cKM) <greggirwin (Gregg Irwin)>:
In probing the XML context, I saw that `cont-val` had a large chunk of data in it. It only gets cleared in `store-char-data`.  I wonder if, as a general rule, we want to clear things like that when the main func is done. On the one hand, they can be handy for debugging. OTOH, leaving data laying around for others to sniff isn't great.

[6:42:51](#VVaYDkDvB1VfKBhkleg_oMYL815ebl_uXN153UlknTA) <rebolek (Boleslav Březovský)>:
It gets cleared in `store-char-data` but there shouldn’t be anything left after the function ends. If there is, I may add `clear`, that would be probably wise, I agree.

[6:53:10](#ViUIS9sdnjNInaKn6v-MKtp5mBImj4kokyDrDO6GSCc) <greggirwin (Gregg Irwin)>:
It may have had data left due to a malformed file I was testing. 

[8:10:40](#8WUZ59dSulNVKSAl-Y69JNkXSnKuxcXXTQO174Y66So) <rebolek (Boleslav Březovský)>:
Ah, that explains it. I’ll add clearing anyway to be sure.

[8:34:13](#I1E79sgeHLpV_G3c_UyIFoB8TpmpT8nLi8DvvtSkvVM) <rebolek (Boleslav Březovský)>:
@greggirwin re: malformed file - this is one thing that’s actually not solved yet. Now it silently accepts malformed files and returns whatever it was able to parse, but I believe an error should be thrown instead. Do you agree? It’s a simple change.

[9:12:49](#H47UsHvA5eRp8DM_9GBDztUlvnOip17WKTBmXDEYPzA) <greggirwin (Gregg Irwin)>:
Yes, I agree. :+1:

[9:24:42](#VO3aaomG04RWNp_J6UXIWxaxGUrUA3tl5K39gZEBOy4) <rebolek (Boleslav Březovský)>:
@greggirwin great! Will be done ASAP.

[10:06:10](#LnR6dDPWhm6DqlneIeL0EL3MxntXGWDOtehHLvvG2l4) <hiiamboris (NOT THIS ONE)>:
Sometimes I'm tryin to-xml on a Red file and get surprised that it returns nothing. An error is better :)

[10:40:11](#m4NteFQd-BMyHZzVi0GSA-ZkNuULi8Foox5wOPrIheY) <rebolek (Boleslav Březovský)>:
Of course.

## 27-Jan-2022

[10:34:50](#ft2cyBUyeQWAgDwgABhzucPbyR94zTSmla8EwQTMjyM) <rebolek (Boleslav Březovský)>:
Arguments against prolog being a separate block:
* if you have a snippet of XML code without a prolog, prolog would be always an empty block in result data.
* prolog is not separated in XML anyway
* there is XML declaration in prolog, optional doctype, and optional metadata. However, metadata can be part of the document also. What’s the point of the separation then?

[10:58:37](#c5pHZbFwl6kcrZ0usmI2XZmOJllWk4S8B4UrIhFLWMc) <rebolek (Boleslav Březovský)>:
Unanswered questions I was able to find after re-reading the conversation:

> Should doctype be doc-type?

I would prefer to stick with the official terminology here.



[11:00:59](#Iin3jw61e39WXgKwWAGWQx3OCD3cDsFTBI87wu51o-o) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
I am too versed on parsed XML data being 2 blocks each time you parse XML document. Not sure it is necessary ....

[11:01:16](#LgGP4pnSA2pRAiUaScUsweXxJPBztPElmLBxTgOyCX4) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
* I am also versed on parsed XML data being 2 blocks each time you parse XML document. Not sure it is necessary ....

[11:11:18](#ajr93wZy9zJxO5IDkSrtfs2MpDYkAPGGpewy3CgQz8k) <hiiamboris (NOT THIS ONE)>:
also in most cases we're parsing known data structure, so we know how root is called and don't need `find xml word!` to figure it out

[19:45:15](#5ilkCZjwmFAVzKH2TjHl7znIN_r2IwSZ5Q8bgy8W8Jc) <greggirwin (Gregg Irwin)>:
`doctype` OK. Easy. :^) <gavel>

> if you have a snippet of XML code without a prolog, prolog would be always an empty block in result data.

That's OK. You asked for `/meta` and there is none. Metadata could also be `none` in that case. If it's not in a block, and you use `/meta`,  how do you determine if any exists?

> prolog is not separated in XML anyway

Our goal is not to mimic the physical XML structure. None of our emitters do anyway. ;^)

> there is XML declaration in prolog, optional doctype, and optional metadata. However, metadata can be part of the document also. What’s the point of the separation then?

Grouping associated data. The *spec* for XML defines it as a number of elements (the `prolog` rule), even if there's not a syntactical delimiter marking the end of it. That is, it's part of the logical structure, not the physical structure.

I just noticed that the spec has `document	   ::=   	prolog element Misc*
` but we have 
```
		document: [
			opt prolog
			element
		]
```
I'm OK without trailing `misc` elements, but would like @dander to weigh in on that. If we *really* want to follow the spec, we should have them. Now we have another question: the epilog. ;^)

> also in most cases we're parsing known data structure, so we know how root is called and don't need `find xml word!` to figure it out

@hiiamboris, that won't work. All the special values (`xml! doctype! PI! comment!`) are also words, so you have to find the first word that's not one of those. I agree that most users will act on specific docs of known, or semi-known structure. It just means a bit more work for anyone writing more general purpose tools. Not a showstopper there though.

Let's do this on metadata, since it's just me who wants it separate. We need more docs written up anyway, so do that @rebolek. Here are the two things to add first:

1) If you use `/meta`,  how do you determine if any exists?

2) How do you find the root element, and treat it and metadata separately? @dander might have real world examples of when that's done.




[19:49:58](#uVNVJaacfd6Va0rk6mu33IN-7xLF7gTgnMhWHutnTxo) <hiiamboris (NOT THIS ONE)>:
`prolog! [...]` inside?

[20:04:09](#MhcIuiGAjSxCxJO7DQh2KshDVHxelrEtAoRnrTt_4cs) <greggirwin (Gregg Irwin)>:
@rebolek did you see https://github.com/red/red/pull/5026#issuecomment-1022633966 ?

[20:06:18](#sa_jMZkDTnGb38kXJr3zcMj6bcNXIg51XOD-lR_YEP4) <greggirwin (Gregg Irwin)>:
> `prolog! [...]` inside?

I thought about that, and it's also viable, but doesn't answer the question of whether it should be demarcated somehow. If we name it, then we also have to ask if the refinement name should match the key. This damn XML thing is neverending. ;^)

[20:09:22](#k0YIMp45iSRHx-dw6FfejX5gHnJ1KDfx9QOhBTDeMAY) <zentrog>:
I wouldn't call myself a prolog expert, but my impression is that it seems like a hack to deal with the issue that the document is required to start with a single root element, but they _also_ wanted to allow a whole bunch of other stuff outside it...
All that stuff can come just about anywhere inside the document though as well (comments in particular), so I would be in favor of not giving it special treatment.

[20:14:49](#3Qjm5c15pNWHMTBVzjaGZQaMzILUcW4xvykk17rNGYw) <greggirwin (Gregg Irwin)>:
I think you saw my comment @rebolek. GH didn't refresh new comments for me.

[20:15:30](#Y4zs3Guqs2jbPin2M0mQwItHM9bSNczc3D9KMeD7osc) <greggirwin (Gregg Irwin)>:
Thanks @zentrog:matrix.org. 

[20:27:41](#-nCLWCwZNH1sz5LRUFAZ4WTkhR7gE2bsHxva7oW7uHA) <zentrog>:
> > also in most cases we're parsing known data structure, so we know how root is called and don't need `find xml word!` to figure it out
> 
> @hiiamboris, that won't work. All the special values (`xml! doctype! PI! comment!`) are also words, so you have to find the first word that's not one of those

That's an interesting use case favoring a different datatype for metadata tags

[20:35:02](#qxIqfvJDgmBjOfIY-NXgkMvTalsI79BNE8FhuTLs-38) <rebolek (Boleslav Březovský)>:
If I can choose between
* removing `/meta` and always include metadata
* adding separate block for prolog
then I am for removing `/meta`. Adding separate prolog wouldn’t serve any purpose IMO.

[20:35:12](#OkJ7hxPlvqjaXSFMSa1Op6PB8U1BQ-R5ZX6TpB17XVc) <rebolek (Boleslav Březovský)>:
* If I can choose between
* removing `/meta` and always include metadata
* adding separate block for prolog

then I am for removing `/meta`. Adding separate prolog wouldn’t serve any purpose IMO.

[20:36:00](#-s5IndwlcxymTqzMOytv8zMo521_NVLwwxTpPWUThys) <rebolek (Boleslav Březovský)>:
>  think you saw my comment @rebolek. GH didn't refresh new comments for me

[20:36:13](#8MpyzuyAJn9VeX_W11NSryQXJXQKB1odBvkgVx4IUKs) <rebolek (Boleslav Březovský)>:
* >  think you saw my comment @rebolek. GH didn't refresh new comments for me

Yes, I saw it and implemented it :)

[20:36:33](#XmX8bxhoMfyCk-_Oxc8RtEbAyHxVmLrgaX-ori0QavE) <rebolek (Boleslav Březovský)>:
* If I have to choose between
* removing `/meta` and always include metadata
* adding separate block for prolog

then I am for removing `/meta`. Adding separate prolog wouldn’t serve any purpose IMO.

[20:46:52](#IaZuLYKWf0fnZQNn9Ws6Yadu1XCoh6ZwTGFCNf9Ulb4) <greggirwin (Gregg Irwin)>:
The refinement and block questions are separate. We can always include it, but still have to decide on the format.

[20:56:41](#DJVn76IkFT1zbX5Gv5AR-YmEMIcDCRA5pe6eRrFDd98) <greggirwin (Gregg Irwin)>:
I'm open to always including the metadata and removing `/meta`. It does mean, however, that everybody then has to follow the instructions @rebolek writes for how to ignore it. ;^) The question of value is how often people use it versus how often they need to ignore it. If people need to ignore it explicitly a good portion of the time, we should keep the refinement to make the default case easier. Just the doc Ma'am.

[21:03:32](#MYw4EwRlN1UH_wm4L2T5IMbEZQXQoa4sh8HIMs6sDTY) <hiiamboris (NOT THIS ONE)>:
Please don't sabotage what we already have

[21:17:22](#wO6tO_GVqBJaGNG0hrotEFBAHtKRMw5GKeWuix96Hxc) <greggirwin (Gregg Irwin)>:
That's a bit vague. 

[21:19:06](#rHbW3tEZr-1KAu2mdUYRhD6_5ETjYRaFfj3tevRcC_A) <greggirwin (Gregg Irwin)>:
My gut says to leave `/meta` in place, and release v1 with the prolog as it stands (as long as the docs are written for how to deal with it).

[21:41:12](#Rm_Rz2dJ0_jIfEa01k_beknH9H90fq6g012_N3tU7Po) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
How often users of XML use Prolog section anyway?

[21:50:13](#9g9JbgufW_afvgewTfcTU-M4c41VBbA2zzq6CuhzazI) <greggirwin (Gregg Irwin)>:
That's what I asked. ;^)

[22:37:40](#mF1dNILXeG4vy0KsVPbH--IdgXA_ZyNb3HJAgyVpzZI) <zentrog>:
probably not much

## 28-Jan-2022

[6:24:24](#tb5wPNMttp5sI0CeywNkOhmiKoeg-YXxJsPQWdciUns) <rebolek (Boleslav Březovský)>:
It’s easy to skip the prolog. It’s just xmldecl, doctype and misc (comments and PIs) and besides xmldecl, everything is optional.

[7:07:37](#m-Ze1RZoxdc2TGK1DO6dzHiTtgIxNMMzPclqOwX6W7w) <zentrog>:
I think in some cases xml decl is treated as optional too, or even if it isn't, it's nice to be able to parse xml fragments in the same way as a whole document

[7:15:13](#5TMtk6pUZLD5-rMRGGkfI-4ds0bSSCmACUMtklwI7ns) <rebolek (Boleslav Březovský)>:
@zentrog:matrix.org yes, parsing snippets is possible. XMLDecl is optional in XML1.0 and required in XML1.1.

[17:12:36](#qu-bWQTzq2qjzvXscBdXkiVltOTAjQ9Kid6YMWoJfKA) <greggirwin (Gregg Irwin)>:
> It’s easy to skip the prolog. It’s just xmldecl, doctype and misc (comments and PIs) and besides xmldecl, everything is optional.

What I want is *the code* to show how it's done. "Easy" is relative, like "fast/slow". Right now, my benchmark for easy is `set [prolog content] load-xml/meta <file>`. What does easy look like the way it is now?

[17:35:09](#pEQPuPEzbFT2sixZbIJjk5b8HefQoDQ9Eocux_Y6WJ0) <greggirwin (Gregg Irwin)>:
And I'm not asking to change it, just show users how it's done.

[17:40:48](#H7VHpO6HhkddOjetyEtBliudfap8aYuyBdaspMYtCOU) <rebolek (Boleslav Březovský)>:
Ok, I’ll add it to the docs. There need to be three variants, one for each format.

[17:41:51](#tbl9clhemb5dTbjzU820yVpHKNeRjs2BWxbVFa8USo8) <rebolek (Boleslav Březovský)>:
Anyway, I’m finishing with the codec, I just need to add processing of metadata to `to-xml/as 'key-val`, if there are no further problems, then I need just to update the docs.

[18:08:10](#FpuvgKKSluvJRKd1EUSWMsQIiowuBGkwYBDs-1uKe14) <greggirwin (Gregg Irwin)>:
Please also see my latest comment on the PR WRT `#delayed`.

[18:08:55](#nASPyR91qimEhq2bgYIeq5NfbUNZazXhJl8778-kT8k) <greggirwin (Gregg Irwin)>:
> There need to be three variants, one for each format.

Yup. ;^)

[18:37:15](#FKX6kwEHmUtpiFTJK1dsBGAr1kMM5P_qtBS88DZpYR0) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
When I saw #delayed and other cool tricks, I got a bit scared that we are going to end with the code golf  :-) 

[18:46:31](#zO68ego7VgH8qijM79b2Yyzif9O9OiA-KbYU-NA_WQc) <hiiamboris (NOT THIS ONE)>:
who you're betting on @pekr? ������

[20:07:19](#c7IfN8Zp76z4cYdc9nCyjyBamEixkWq51v9ek1pmap0) <zentrog>:
> my benchmark for easy is `set [prolog content] load-xml/meta <file>`. What does easy look like the way it is now?

greggirwin (Gregg Irwin) It's certainly useful to get just the content, but I don't know that grouping the prolog into a single value is all that helpful, since the things in it are likely unrelated. I think it's better to just keep the relative ordering of metadata items along with the content if you know you need both. You can sort it out yourself, and maybe the relative positions are relevant.

[20:16:44](#fxitONFAoBmKfcNcAgu_dh48AHTgiZ-Wu-7n9I3uHx8) <rebolek (Boleslav Březovský)>:
@greggirwin it seems that you are the only one who wants to have the prolog separated.

## 29-Jan-2022

[4:51:03](#4rhmwRLPvfPJhgPKnfgAWO9fhadp0R0yFrzVXIs70Xg) <greggirwin (Gregg Irwin)>:
Yes, and as I said:

> And I'm not asking to change it, just show users how it's done.

[8:12:18](#WxN5ifBMUSG3YLqy1VtTtQJfZYGFENJvkbVGqGHmmzM) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
I would like to write down my last comment to the codecs PR. For me, the decision was all but wrong, the code does not even make sense, #delayed is looking weird, is not even needed there. How do I put  code style there? Using backtick, like here on gitter?

[9:23:07](#rAhv5duVfzDqdiPDZweA1BZTA9VlQrX_0Vbpv6uGr58) <hiiamboris (NOT THIS ONE)>:
Yeah.

[9:23:21](#DMuKKb8XqsFmBhs5MakD8ikwqsPNioC3EqHPkTv2BVc) <hiiamboris (NOT THIS ONE)>:
There's preview button btw :)

## 2-Feb-2022

[9:28:02](#fwfuONwuG7pZZUNgmsV9Muorllz2plI9WpwBZPh6uvo) <rebolek (Boleslav Březovský)>:
@greggirwin @hiiamboris I want to make one last-minute change. Currently, in the `triples` format textual data have this format:
```
none "Some text" none

[9:29:20](#TXL-kQeUfLIb9n2q92NUwNqQ6PXmDZOArmWcASp4BQ8) <rebolek (Boleslav Březovský)>:
* @greggirwin @hiiamboris I want to make one last-minute change. Currently, in the `triples` format textual data have this format:

```
none "Some text" none
```

to get it more in line with other formats and also make it a bit mor readable, I propose to change the first `none` to `text!`:

```
text! "Some text" none
```

It’s non-controversial change IMO. Any thoughts?

[9:29:44](#m-kBZjuE0bApZKLD5A8O_0WibfARDCt-KFea0G7cZ_I) <rebolek (Boleslav Březovský)>:
* @greggirwin @hiiamboris I want to make one last-minute change. Currently, in the `triples` format textual data have this format:

```
none "Some text" none
```

to get it more in line with other formats and also make it a bit more readable, I propose to change the first `none` to `text!`:

```
text! "Some text" none
```

It’s non-controversial change IMO. Any thoughts?

[9:38:13](#rbaoKFwwejikhgM3F_6ec8y4WfCDEnXnQ_Pl8GzkkF0) <hiiamboris (NOT THIS ONE)>:
Might work.

[17:49:03](#T9_pxYlsaqPG7eTPwWCipL70lB2AWKZFHy4zCvEpwbM) <greggirwin (Gregg Irwin)>:
That seems like a good change to me. Nice catch @rebolek.

## 3-Feb-2022

[0:07:31](#0PeMR6ScsAUSldse_2iyvDm5xAMzyXp8IUY8JvirD-4) <greggirwin (Gregg Irwin)>:
Where can I get a big, nasty XML file to `profile` against? In the blog announcement, I thought it might be nice to show a comparison between formats.

[0:09:31](#oUN6_YP1cS5DfIzef359nYrlfvOYa5cvSJKw54z8IVg) <greggirwin (Gregg Irwin)>:
NVM, I found a 300K file here that should be enough. If somebody knows of a *really* big one though, pass it on.

[0:15:54](#YGcju1CX-zolO6etutU-tygf5f5SiKMo_kGvQfSwf7Y) <greggirwin (Gregg Irwin)>:
Or maybe that's already too big. :^( `not enough memory`

[0:16:20](#_lvGooBhSRt7H5nBf1P7sGIif-WQ0yAqDrA2HibZakY) <greggirwin (Gregg Irwin)>:
So now we know something else we need to research and doc: current limitations.

[0:20:46](#cMrNUUDQ3aZ9hm9rJuukfujsQuluSkMeOEalr3YixMw) <greggirwin (Gregg Irwin)>:
DOH! I must need sleep. The file is 318M. Oh my. 

See why we need that `bytes` formatter @hiiamboris. :^)

[0:51:43](#aQjpy3sU9-vCUBLSmtllMrrNhdk5dbmqawkqGm9IpoY) <greggirwin (Gregg Irwin)>:
Cut it down to ~200M and it made a valiant effort. 150M crashed Red. ~8M worked fine and fast, just a few seconds to load. Duped the bulk of it back up to ~32M and still works fine. 
```
Time         | Time (Per)   | Memory      | Code
0:00:15.714  | 0:00:15.714  | 232'350'964   | triples
0:00:16.503  | 0:00:16.503  | 54'074'716    | compact
0:00:17.003  | 0:00:17.003  | 71'993'260    | key-val
```
Here it is down to 1.5M
```
Time         | Time (Per)   | Memory      | Code
0:00:00.808  | 0:00:00.808  | 15'945'432    | triples
0:00:00.811  | 0:00:00.811  | 6'357'364     | compact
0:00:00.832  | 0:00:00.832  | 7'155'460     | key-val
```

[0:52:57](#b7sG5mRuHWakv1abdcI-V5_UMO__Lf25U-bQ-eqpgcs) <greggirwin (Gregg Irwin)>:
* Cut it down to ~200M and it made a valiant effort. 150M crashed Red. ~8M worked fine and fast, just a few seconds to load. Duped the bulk of it back up to ~24M and still works fine. 
```
Time         | Time (Per)   | Memory      | Code
0:00:15.714  | 0:00:15.714  | 232'350'964   | triples
0:00:16.503  | 0:00:16.503  | 54'074'716    | compact
0:00:17.003  | 0:00:17.003  | 71'993'260    | key-val
```
Here it is down to 1.5M
```
Time         | Time (Per)   | Memory      | Code
0:00:00.808  | 0:00:00.808  | 15'945'432    | triples
0:00:00.811  | 0:00:00.811  | 6'357'364     | compact
0:00:00.832  | 0:00:00.832  | 7'155'460     | key-val
```

[1:14:39](#Lm03QM7Epspjc30YSTnBCcIJWiQ7mUKLzcsu5dB_Cg4) <greggirwin (Gregg Irwin)>:
And loading %test-3.xml (4K) 375 times:
```
>> profile/show/count [triples key-val compact] 375
Count: 375
Time         | Time (Per)   | Memory      | Code
0:00:00.839  | 0:00:00.002  | 6084772     | triples
0:00:00.839  | 0:00:00.002  | 6250580     | compact
0:00:00.852  | 0:00:00.002  | 5170256     | key-val
```

[1:17:43](#1mOhHyJsK5PsIRoxJBNi71uBRqa49dMjfBRsMrSw5mM) <greggirwin (Gregg Irwin)>:
* And loading %test-3.xml (4K) 375 times:
```
Time         | Time (Per)   | Memory        | Code
0:00:00.839  | 0:00:00.002  | 6'084'772     | triples
0:00:00.839  | 0:00:00.002  | 6'250'580     | compact
0:00:00.852  | 0:00:00.002  | 5'170'256     | key-val
```

[5:26:04](#tKXv6WwbYJwV1CuUVcs2aBkLlVf3QhzfTM_Y1xmt43I) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
What's with this Triples taking 2-4x more memory?

[8:19:57](#tx-K-FyZV870sfLZEbI58ppftgOZgnA2jSjUrnx27kA) <rebolek (Boleslav Březovský)>:
It's not that memory efficient but maybe it can be optimized further.

[8:35:59](#Ag-qKIUxjMs52eIR9FP-cZ1rTxl1lrpuo62jNpQH50Y) <rebolek (Boleslav Březovský)>:
@greggirwin thanks for the tests! 'triples' memory usage is interesting, I need to look at why it's so much higher.

[8:40:05](#r_fs0Fpe5Q-RlCmv0He8MwQTCpCeNY_I9_0u8wBTmA0) <hiiamboris (NOT THIS ONE)>:
I wonder if this is data size in memory or temporary allocations as well.

[8:50:10](#6N1xKThMgMCsSFacjKb1wRdIa7rTHZ8rR43Jt8RUmx4) <rebolek (Boleslav Březovský)>:
I hope it's temporary allocations so I can get rid of them :)

[19:41:52](#A8uM_8RSUQeuAGMLnOHz3zlInOv-yjeJxCtOQZJmhYk) <greggirwin (Gregg Irwin)>:
I will note that in the blog.

## 4-Feb-2022

[7:44:09](#pEUyVsq8ptYeE_AV0vT_rg-nFlaJeuNX-uyvty9svFo) <rebolek (Boleslav Březovský)>:
Here's an alternative solution how to deal with options in codecs ������ 
https://twitter.com/bikerglen/status/1482516332432162820

[12:08:33](#K6FB6xkiYv3KqX3NjMtIwBLu9Xt9iWIkRjbeSE2RENg) <hiiamboris (NOT THIS ONE)>:
there's a mess in the docs - 2 `!` and 2 `text!`:
![](https://i.gyazo.com/d442575411a1b875f1bf04bfdb2d5c04.png)

[13:06:21](#W-epN_JZ2rj0xjZDJ8UHwAuSfeJyOu4zVw-3iBlZmok) <rebolek (Boleslav Březovský)>:
@hiiamboris thanks, I missed that!

[19:25:11](#0F67qx9GV8ZDVw7eYM9AyXH92Q-GqVTDBRt6F5JJ-Fk) <greggirwin (Gregg Irwin)>:
Thanks to @rebolek's continued efforts, the XML codec PR can be merged at any time. Woohoo!

But there's always something else, isn't there? You see, he did what I asked, and now that it's done I can ask a question. I would like everyone to give their brief thoughts, and I will abide by the majority's decision. I apologize that this is a bit involved, and managerial in some respects, but my hope is that exercises like this will help us work more effectively as a team going forward.

It's important to understand that none of this is a criticism of Bolek's work. This is all of us working together, and him giving us artifacts to work against for design discussion. We're also learning *how* to work as a team, when to run with ideas and when not to.

[xml-tools.red](https://gitlab.com/rebolek/markup/-/blob/main/xml-tools.red) has a new `get-meta` function, to get the metadata. 

The question is: what is the benefit of having metadata *not* in a block? I was the only one who wanted it in a block, but I didn't know how to make my concerns about the current design clearer than I already had, so I asked Bolek to doc it. Now we have a concrete thing to see for comparison. Sometimes I have a plan. :^) 

[here](https://gitter.im/red/codecs?at=61f307095dc6213cd402b458) I specifically talk about how to ignore it, if it's included. Since we still have `/meta`, that would be how right now; don't use `/meta`. A few messages later I said this:

> Right now, my benchmark for easy is `set [prolog content] load-xml/meta <file>`

On 27-Jan (bear with me, I know this isn't fun) I asked:

> 1) If you use /meta, how do you determine if any exists?
> 2) How do you find the root element, and treat it and metadata separately? 

The second is as yet unanswered, the first partially. Use `get-meta` and see if it's empty. But then you still can't tell if it's in the doc part, because `get-meta` doesn't remove it, so question 2 still stands.

@rebolek's original points on why *not* to put it in a separate block:

https://gitter.im/red/codecs?at=61f27549742c3d4b21ba3a58

Only the first one has any weight, especially now that `get-meta` returns only the prolog metadata, not all metadata for the document. And if there is no metadata it returns an empty block, just like Bolek's first point says. If people use `/meta`, are we concerned about the overhead of that empty block, or that it's confusing? I'm not. 1) It's XML and not small or efficient, 2) we doc how it works, returning two blocks.

That's the design part.
_________________________

For the implementation, I *think* putting metadata in a separate block would entail hitting the end of the `prolog` rule and moving everything that is in the document block so far into a new block, removing it from the document block. Can't say for sure, and @rebolek may see a better way, e.g. an `in-prolog?` flag that `meta-action` uses to decide where to put meta values.

Then the user just does the `set [prolog content] load-xml/meta <file>` dance and their done.

With the current approach, we add %xml-tools.red to the mix, and have ~70 lines of code with a few tricky bits in it. `Get-meta/as` lets users get the metadata in a different format than the doc. What is the use case for that @rebolek?

`Get-meta` is basically doing the same work the `meta-action` related bits in the main XML parser do, but against the Red structure, not the raw XML. So we're doing the same work twice. Prologs will be small, and I'm not concerned about performance overhead. Just that less code = less bugs and doing the same thing in two different places can lead to different results.
```
;1) Get %xml-tools.red from...
#include %xml-tools.red
doc: load-xml/meta <file>
meta: get-meta doc
;A) Select known root word from doc
;- or -
;B) ??? How do you skip the metadata?
```
_________________________

Thanks for your time. I know this was long.

Please briefly list what you see as the *benefits* of *not* having the prolog in a separate block. I don't claim to be right and, again, I will abide by the majority's decision.


[19:28:12](#NT2NAXi6NMGf54wBZGxiOSM-ZHiRzQyA8WoStwQ6HYw) <greggirwin (Gregg Irwin)>:
I hit Gitter's message size limit, so had to edit a bit. Let me know if something doesn't make sense.

[19:29:36](#QugNZGqGZGyKLL5YcyOS456c0aqsaUhYipG_df4uhyY) <greggirwin (Gregg Irwin)>:
The benefits I see for using a separate block are:
- Less code, and simpler.
- Easier for users.

[19:39:32](#us2ki_24L8BQst5F5WM1QMT3UVlaHD7iuOt6CyfkLbQ) <hiiamboris (NOT THIS ONE)>:
I think Bolek's main point was that if you include metadata and you *don't* know the structure, then you *have* to write the parser, because even if you skip the prologue metadata, you still have to handle metadata that is found inside the *contents* part. From that perspective, neither `get-meta` nor having a block seems very useful.

[19:39:49](#vIThVNiDUNJip7ADweGf9fj6KeAmiGOmzo49dKpubF4) <greggirwin (Gregg Irwin)>:
@rebolek I want a DIP stick! :^)

[19:42:28](#fW548Um7Mc0VdZSDH6fTJFfXcldY6dDVOakBtNDLptw) <greggirwin (Gregg Irwin)>:
@hiiamboris sooo...oy, `/meta` includes it everywhere, and not using it leaves it out for the entire doc? 

[19:42:56](#GpU4rcPHTdbkx4yQ3B_FRQ59hWqVbGmMuw1DMbI4c6E) <hiiamboris (NOT THIS ONE)>:
So I believe.

[19:45:07](#g2LldNvJXu5LJbRfE2Pdk7Bam1pKGZ-ALEvw2nFu5Ug) <greggirwin (Gregg Irwin)>:
Wow. Not sure how I missed this in all the chat. :^\

[19:46:16](#nNAYabeaz27UNEY4oBfCrgdUIO7JEJvRY2-g52J_qqo) <hiiamboris (NOT THIS ONE)>:
For finding the root wouldn't simple `parse data [to [set w word! if (#"!" <> last form w)] data:]` work for all formats?

[19:46:40](#aDXLIlFKAaBhCWwmhKsq6PEOvgHttruN5O9qnFdK4kQ) <greggirwin (Gregg Irwin)>:
And testing. I must have only ever used `/meta` on files that had it for testing, and never *not* used it on those.

[19:48:03](#Is7W5KDy3hM-_asEVkln-tzr-FFRT3q39SBnFpTJ7WI) <greggirwin (Gregg Irwin)>:
Not sure I'd call that "simple", but if we wrap it in a `find-root` helper it's fine.

[19:49:28](#3Vm1PTLVq3T6usk6k2w9QW2FJoY_tUNkFQnA3w6cHGI) <hiiamboris (NOT THIS ONE)>:
Well, with HOFs it could be `locate data [w [word!] .. #"!" <> last form w]`.

[19:49:39](#JkTAlAbiCh60jONiJjbPM04DaEHttWLHhiNiaA5bZH4) <hiiamboris (NOT THIS ONE)>:
Anyway, it's not 70 LOC.

[19:50:35](#9a1Z5XhkOLuJ9xPL-P3voXBHVfX1W4q69X_k_3QCdi4) <greggirwin (Gregg Irwin)>:
That's no shorter than the `parse` approach though. `Locate` has more meaning of course.

[19:50:48](#8jtA2PbDEeJjmOE3-VkGJbgIsxxaTd58-b9PV_NkYY8) <hiiamboris (NOT THIS ONE)>:
Agree.

[19:51:22](#-PX4y5CnANqn5iCnNPVtjBCwnumSWxDy5YcMYttiSTg) <greggirwin (Gregg Irwin)>:
`Get-prolog` is then splitting at `find-root`. 

[19:52:01](#3IvJiJjAr0m-nz7aI2oEteoPMbJHFGzvdYee5wpREug) <hiiamboris (NOT THIS ONE)>:
`split` into runtime! :)

[19:52:31](#E6jHgVbI5WsAi9m-MYfDrPLOyFKyWuP9Us1WqPF5Cqg) <greggirwin (Gregg Irwin)>:
This month, `split` and `format`. :^)

[19:53:31](#uZ5FTb2eZLovIpYqOb9m7R2PKajK-xp8UgdrQ2_ULZg) <hiiamboris (NOT THIS ONE)>:
It depends how lagging behind are you ������

[19:55:32](#7OxQSVGog8lmvVb7Yq-sU4D4OfxeBJwcjhgkXlQWuXw) <greggirwin (Gregg Irwin)>:
Looking at prologs in each format, that approach would seem to work. @rebolek, do you agree?

[20:02:31](#OPr5oUOLCoBp6wYZF1c7srSP3IRFdSH8nzbe9nNotKg) <zentrog>:
It sounds like a good approach to me. Maybe `find-element` instead of `find-root` though, since it's not just specific to the root of the doc.

[20:03:18](#HW6NF4O-FvOLqDqGXeBE1oJamZXP3ToQhUN-4JVQpTQ) <greggirwin (Gregg Irwin)>:
:+1:

[20:54:29](#QQAUNoWMQeVOjHiuH3ZVCY7RrfiVOFtG7lMP1mRpX5k) <hiiamboris (NOT THIS ONE)>:
What's the place for this function though?

[21:25:59](#-DSTUDUJh991GxmNpx2jt5Y-970de4rhQj_p4_qYEvI) <greggirwin (Gregg Irwin)>:
In the docs to start.

[21:26:13](#WGHsTvb87V3D1Jrd2jJ-nGE5GR5WKcX-Bow7kEAcmk8) <greggirwin (Gregg Irwin)>:
Could also be in the XML codec though.

[21:40:38](#2GoZtuRHY2u57Z9BW1u8bXvkdK6uOeo0w5lsDGBKkr0) <hiiamboris (NOT THIS ONE)>:
But it's an anonymous context.

[21:41:58](#1WoKDf9ns0ztyQA7iXup8C42w_7HYT0kS-Wk7kgMO3s) <greggirwin (Gregg Irwin)>:
`Set` will still work to make it global, but then we have a naming issue. :^\ Nothing is easy. 

[21:42:45](#1_qVUBOWu8qnFGtzdv6fAVEsiXy2BWY2A6o8hMwVILo) <hiiamboris (NOT THIS ONE)>:
This is something so specific that it should be kept in a namespace.

[21:43:00](#WJiFZ7qf-rb6fAoFJKVH7Hu1UDrmdN_4vnSj_3rRt_o) <greggirwin (Gregg Irwin)>:
Agreed.

[21:44:11](#vgeSnl_OO_sKg43o7jdDJXRYOES4TWhttFTbyq6MreQ) <greggirwin (Gregg Irwin)>:
So docs it is for now.

[21:45:03](#KJBjGcyhVma64w_718zJdxl7OSMdxT0BXkoEZ2J5REM) <rebolek (Boleslav Březovský)>:
> 2) How do you find the root element, and treat it and metadata separately? 

That's easy, skip prolog metadata, first tag you encounter is the root tag.

>  especially now that get-meta returns only the prolog metadata, not all metadata for the document.

No, it recursively scans whole document. If it misses something, it's a bug but with the test file I used, it works fine.

> Get-meta/as lets users get the metadata in a different format than the doc.

There's no format autodetection. The function doesn't know what's user feeding to it, same as `to-xml`. That's why `/as` is needed. We probably can add autodetection but I'm not sure it's worth it.



[21:46:46](#-brPTYold8ejLm7UNwmSn0wd07Y_a6aWtwyqT7Q7VrE) <rebolek (Boleslav Březovský)>:
> From that perspective, neither get-meta nor having a block seems very useful.

@hiiamboris I agree, I don't see the point of separating metadata from the structure. Maybe my biggest mistake was to introduce `/meta`, maybe I should have included metadata always and nobody would probably ever think about separating them from the rest of the content.


[21:47:35](#MMo3jfmQKd1RmO1WQACRlbhu67Y6WV_jIUmS2UapGQQ) <rebolek (Boleslav Březovský)>:
>  /meta includes it everywhere, and not using it leaves it out for the entire doc? 

@greggirwin yep, that'đ the point. It leaves things like comments out from the whole doc, not just from prolog.

[21:47:44](#yJuExeMRmy9GpyekfY00p4H0Xmybx-GsJWkqc2I6hwk) <rebolek (Boleslav Březovský)>:
* >  /meta includes it everywhere, and not using it leaves it out for the entire doc? 

@greggirwin yep, that's the point. It leaves things like comments out from the whole doc, not just from prolog.

[21:48:55](#aw5CRKPIKxxPE0P0ACFUCRVrTAUWzFlAnNDEAkxiLfY) <greggirwin (Gregg Irwin)>:
> No, it recursively scans whole document. If it misses something, it's a bug but with the test file I used, it works fine.

I think it's a bug then. Can you test against this file?

[21:49:06](#DgiZGDSg948z0Oi-UYwSbdXnk2Ri1YBX529IdBHIs9U) <greggirwin (Gregg Irwin)>:
[prolog+pi+cdata+cmt.xml](https://files.gitter.im/600719b0d73408ce4ff93018/PdEd/prolog-pi-cdata-cmt.xml)

[21:49:49](#ZHxqmHAgstmpW3-1khvEF45w749bIVztR8ooBxY6Q8w) <greggirwin (Gregg Irwin)>:
> There's no format autodetection. The function doesn't know what's user feeding to it, same as to-xml. 

Ahhhh, I see now. Hmmm.

[21:52:22](#z7BN4PEjYJRavdSEm5Y1wzFOJW0CuIpVPM5gNxbiLzA) <greggirwin (Gregg Irwin)>:
I think from past chat that `/meta` *may* be useful, but we can't say for sure. We did talk about always including it. And we can change our minds once we get some feedback (not too hopeful on that though ;^). While it's wasteful to post-process and remove it, that's an option.

[21:52:25](#QqnQbtGQymKe0XpTG16VCk5MPNMzdaVDlZ8iS8nNAIg) <rebolek (Boleslav Březovský)>:
That's actually the file I was using to test it :) And it works:
```
>> print mold get-meta load-xml/meta %data/prolog-pi-cdata-cmt.xml
[
    xml! none [
        version: "1.0" 
        encoding: "UTF-8" 
        standalone: true
    ] 
    doctype! {data SYSTEM "./data/menu.dtd"} none 
    PI! xml-stylesheet {type="text/css" href="/style/design"} 
    PI! xml-stylesheet {type="text/xsl" href="menu.xsl"} 
    comment! "Prolog comment 1" none 
    PI! welcome "to the real world" 
    PI! welcome "x" 
    PI! welcome "" 
    comment! "Prolog comment 2" none 
    cdata! "Customer 1 CDATA" none 
    comment! "Customer 1 comment" none 
    PI! cust-1-PI {type="app/red" href="/root/path"} 
    PI! cust-2-PI-1 {type="app/red" href="/root/path/1"} 
    PI! cust-2-PI-2 {type="app/red" href="/root/path/2"} 
    comment! "Customer 2 comment 1" none 
    cdata! "customer 2 CDATA 1" none 
    cdata! "customer 2 CDATA 2" none 
    comment! "Customer 2 comment 2" none
]
```

[21:53:12](#8UPS-ucVahU1gff-OLa2DDEfFN_1fRcfAuDAM9K5QMM) <greggirwin (Gregg Irwin)>:
OK, I need to make sure I'm synced here. Thanks.

[21:53:38](#K0HpPnXgp1KsMg6A0xBhX9QTLqinzKcCMo8NzFKXsmM) <rebolek (Boleslav Březovský)>:
Of course you loose the structure, it returns just a flat block.

[21:56:49](#y4wYpYlvhz3oh_nbT7ZtTvMjmqjTPTQN_BwRHFY1jhQ) <greggirwin (Gregg Irwin)>:
The problem is that it only works with `triples`, not for other formats. That's what I was seeing.
```
>> print mold get-meta load-xml/meta/as %data/prolog+pi+cdata+cmt.xml 'key-val
[
    xml! [
        version: "1.0" 
        encoding: "UTF-8" 
        standalone: true
    ] doctype! 
    PI! ["xml-stylesheet" {type="text/xsl" href="menu.xsl"}] comment! 
    PI! ["welcome" "x"] PI!
]
>> print mold get-meta/as load-xml/meta/as %data/prolog+pi+cdata+cmt.xml 'key-val 'key-val
*** Script Error: PARSE - unexpected end of rule after: into
*** Where: parse
*** Near : [collect into output [any [keep pick [['xml! ] ] ]]]
*** Stack: get-meta key-val  

>> print mold get-meta/as load-xml/meta/as %data/prolog+pi+cdata+cmt.xml 'compact 'compact
*** Script Error: PARSE - unexpected end of rule after: into
*** Where: parse
*** Near : [collect into output [any [keep pick ['xml! ] ]]]
*** Stack: get-meta compact  
```

[21:58:01](#pG5ajuBkWfo8ElWE1MvSedwPgTEiRs_jJ2xFzUm76O0) <rebolek (Boleslav Březovský)>:
Ah, a bug. Sorry about that, I'll fix it.

[21:58:02](#TTmWbEnVkIeY09TJvmLeB956vNKOq4xEg02jWjOnMpQ) <greggirwin (Gregg Irwin)>:
So the prolog part was still returned, but the rest wasn't. 

Will @hiiamboris' approach work? That should solve it.

[21:58:27](#HIydxv4POTrUCyC-3yW5WVSb-kUXY2I9uqNaWEyMaJ8) <greggirwin (Gregg Irwin)>:
This one: https://gitter.im/red/codecs?at=61fd8288e4c979478d5fb4b6

[21:58:47](#To2_1D0sczsMBxSvd2eB4_ZUX8rRQpKoG9YMdOkEIGo) <rebolek (Boleslav Březovský)>:
This:
```
print mold get-meta load-xml/meta/as %data/prolog+pi+cdata+cmt.xml 'key-val
```

works by accident. It's interpreting `key-val` data as `triples`.

[21:59:13](#2Irv1ZiNGYedhI2TC7PqS7bnoXG1G8_Yo3xZxyh7Ie0) <greggirwin (Gregg Irwin)>:
> works by accident

Like most software. ;^)

[21:59:30](#KHWJYLTKRQzgGMHp-9WdXbo3oMIVn3EAerKq85_7yU8) <rebolek (Boleslav Březovský)>:
`get-meta/as ...` is the proper code but runs into a bug.

[22:02:17](#KvXzc8qTOSg8mXhUR9_5ryOuN8yHYO0tBEOzBfgxwEc) <rebolek (Boleslav Březovský)>:
Ah, it's a result of a last-minute optimization...

[22:03:49](#Wriw-_p6rQrnuqapGbcLRAA1H4T1tVu93bLvYSyFJ_s) <rebolek (Boleslav Březovský)>:
Reverted to the working version.

[22:05:47](#CtVzQVM4e2Be-OSny5u5PdtLnjIxaWLkQpfryZ1fNfU) <greggirwin (Gregg Irwin)>:
Sorry, my note on Boris' idea was for finding the root. Mixing up chat. :^\

[22:06:20](#O4tK8fjbKfQCJK08GE4hQ8_iUR0avuvunXamYiolFnI) <rebolek (Boleslav Březovský)>:
> Will @hiiamboris' approach work? That should solve it.

Yes. I would prefer testing for metatags (there's just five of them) instead of `form`ing a word, but that's just an implementation detail.

[22:07:19](#FHX1ytghPGfWqgoHCj393K9pZxpxIPKjL3vpKqb5PcA) <rebolek (Boleslav Březovský)>:
> Sorry, my note on Boris' idea was for finding the root. Mixing up chat. :^\

No problem, I can parse it ������ I probably should reply in a thread but I still can't get used to them.

[22:07:26](#yzosLDdzmv2mBeGTBKZitfpJ7sgMqWciYFAybGMBjGE) <greggirwin (Gregg Irwin)>:
That's fine. Please add it to docs, wrapped in a func called `find-element` as @dander proposed, unless a better name comes up.

[22:07:39](#OBlmC5_BHJC8uA6quW1F5JbIclnatLegS5GW-OdMbWI) <greggirwin (Gregg Irwin)>:
Threads on Gitter kill me.

[22:08:15](#DSm15x7n4QtbogMpyRf0v4lVeEeo6RFy3rlDr3-HaMY) <greggirwin (Gregg Irwin)>:
Whew! I have some blog revising to do now. :^)

[22:09:45](#FhSzYAwYvLqtPClett8tTNJNALqH5EDpEOCgTgy1JvA) <rebolek (Boleslav Březovský)>:
> Please add it to docs...

OK, will do.

[22:10:05](#EaXk8V3M2Lkxp3c_4FkBBiLRsxqGDYgaGeUL6eECn8s) <greggirwin (Gregg Irwin)>:
Thanks!

[22:10:52](#sy8j96XjEe0yLrRP6KevTrguWJeiobwBm1T1KFFCDHE) <rebolek (Boleslav Březovský)>:
But probably tomorrow, sorry, it's getting late here.

[22:11:16](#chqZXRXByqH5ofLlGRKI4TLI1Xa2Po4biK4toHf-sI0) <greggirwin (Gregg Irwin)>:
NP.

[22:12:36](#IzKU6I9uom1EtaIXWUMxADj7C8LOlZwoPYObHdKbxYs) <greggirwin (Gregg Irwin)>:
We should probably also port https://gitlab.com/rebolek/markup/-/blob/main/README.md to a wiki page, to match JSON and CSV, until we add them all to docs for real.

[22:13:30](#CXDc5mrBT-uUGvh6nPT8w-VfxkiIhiQVOkulLdjgENU) <rebolek (Boleslav Březovský)>:
Of course, that repo is just for the development, I will move it to the Red wiki.

## 5-Feb-2022

[2:15:11](#IDTamwi2SRhOaxOMEugVWm6DU5TMQBpoPpXjdMqQMzc) <greggirwin (Gregg Irwin)>:
I'm excited to get this out, and have a lot of fun tasks for @rebolek to move on to. We should make notes, however, of things that support *all* codecs, like examples and benchmarks. Once we have a wiki page up for XML, I'll think about that and anybody else is free to add notes to the codec wiki pages to help.

We will pale in comparison to optimized loaders for any given format, but that's OK. Our goal is practical use, and I will defend our position. In the future, there may be other codecs for formats, and that's OK. 

[2:15:22](#FRzvrI_C1EuHwJAdQkyw1wtXK87bExgpK_kbErFt4Dw) <greggirwin (Gregg Irwin)>:
* I'm excited to get this out, and have a lot of fun tasks for @rebolek to move on to. ;^) We should make notes, however, of things that support *all* codecs, like examples and benchmarks. Once we have a wiki page up for XML, I'll think about that and anybody else is free to add notes to the codec wiki pages to help.

We will pale in comparison to optimized loaders for any given format, but that's OK. Our goal is practical use, and I will defend our position. In the future, there may be other codecs for formats, and that's OK. 

[2:19:09](#sAGsw1E-NDv8ia0aoSEzEgHGATQO4Am8pU76mugG8TM) <greggirwin (Gregg Irwin)>:
When I say "benchmarks" I don't mean direct comparisons. I mean telling people roughly what performance to expect, so if they look at their data they can decide if Red's standard XML codec is worth trying. If they see we can do 1.5MB/s and need 50x that, or if their files are massive, we can save them time by ruling it out.

And if I put ~1.5MB/s in the blog, is everybody OK with that?

[2:22:41](#EDu37FoyVvDKE13cveyrEh0fOLzockQmUFObGOMhkrM) <greggirwin (Gregg Irwin)>:
Maybe we should move [this section](https://github.com/red/red/wiki/JSON-codec#references-comparisons-benchmarks-etc) from the JSON page to a general codecs page.

[2:36:42](#wrPS3LA5Nor41RxdByEbw0ZFLhzme8sXBZ6-hUr6HGE) <greggirwin (Gregg Irwin)>:
I just skimmed the [CSV cocec](https://github.com/red/red/wiki/CSV-codec) page, and I *really* like the way it's set up, which I had forgotten. Explaining the different formats with examples like that is fantastic.

[6:22:15](#DWYeUY0vP_fq8yMcFRiFqwnI3KBJaSYlHV87fnmkmJs) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Isn't 1.5MB/s nowadys ... too slow?

[6:34:31](#8y6I2OdB3BOhWrlUKJUiSRfeXwjgd-6HV5qxuLJHYOc) <rebolek (Boleslav Březovský)>:
It's interpreted code, I haven't done optimizations and you get a Red data structure. I guess it depends of what kinf of XML data you are using. If they're config files in sub-MB teritorry, then it'đ fine. If they are multi-MB files, then converting them to Red doesn't much sense because of the memory usage.

[6:50:27](#ZzS_PqBbB_-4MHjV1iqb9MleONK5jZQcfEgNTGfrmEI) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
My most common use would be probably interfacing. So basically converting XML template to Red values. Reading and manipulating some data then, in terms of the Red "xml" block, outputting the resulting XML file, sending it to consuming interface.

[6:53:50](#1ZxADmG-IdBCZsIEbKTkt8xdtqXFZXf-OdG8acaWI8k) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
The code is probably too complex for a Red vs R2 (or R3) comparison, but those who found Red's parse being almost an order of magnitude slower, than R2, was accused of using an edge cases. The usage of more real-life scenarios like codecs for e.g., might be a nice test-bed to find out, what is the real-life difference.

[7:09:23](#5oBJ3ViGT-0SXPak682BnOdb-rCT-FVgjFOnK_0H7bg) <rebolek (Boleslav Březovský)>:
@greggirwin re: `find-root`/`find-element`

IMO it makes sense to add both functions. `find-element` for finding *any* element in the doc (actually all occurences of the element, IMO) and `find-root` as the specialized version that would skip prolog.

[7:10:25](#IPpjo3zeNIes45eLYfj7-PGzwb7EkjccpEP7qNP1ZV4) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
I like find-element to find any element ....

[7:11:51](#4nmVwST6hMUuyCU6n6O0gmoQcN0AFsN-Ci1aibs1f_M) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
How my code could look like? For e.g.: `foreach element find-element xml-data element-name [do code]`?

[7:21:22](#8D3aBwtxR7IT00BqQNRTBC4PqdsxpVz5HcyulFdzHo4) <rebolek (Boleslav Březovský)>:
Yes, that's basically it. It should also support finding elements by their attributes, but we can add that later.

[7:36:36](#pCAmGuWzqbtHw7e9uWGygg0QjAvEaDlOihPidH9AqLI) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
All that might be useful. I remember the need to find by ID, CLASS. We need the ability to filter out to certain elements. You might have two tables, identical elements, but they will differ in ID or CLASS .... but then I am talking HTML mostly.

[19:30:55](#uBimkIJoOw7DBBIjLyXQg-hwZupJHMwoWJcaJ0nrbM0) <greggirwin (Gregg Irwin)>:
@rebolek I'm fine with both. @dander @hiiamboris what do you think?

[19:33:22](#F6dUIuU05ppMPLOAhIp90kJHPcIyZeFrAXYVA-FAdXA) <greggirwin (Gregg Irwin)>:
On general finding and filtering. The parallels to XPath/XQuery/XSL all happen at the next level. First we needed to define the structures for them to work against (and we have 3 :^\). 

[19:42:55](#HyiyG3NMvkgNseXD5crSahys-x2AtCYgXZXvOzZJHEs) <hiiamboris (NOT THIS ONE)>:
Since they will only live in the docs, I don't care ☻

[19:49:12](#YTH4k4iZOC2_cvWvw2ZfKZLBjA1kA4RQ2y1bn1Af9uA) <hiiamboris (NOT THIS ONE)>:
For querying, I wrote a dialect: https://gitlab.com/hiiamboris/icu/-/blob/main/extract-locale.red#L326
I just couldn't make anything useful with the CLDR without it, especially because I need to look for data in multiple files at once. And it makes XML iteration & filtering much cleaner than generic `for-each`. But it's still very limited, driven by one use case only.

[19:56:57](#z4r_yUaSWc9Q1HE6XYd60z0dlZ3rRXm5BhwtIZfEDiY) <greggirwin (Gregg Irwin)>:
> Isn't 1.5MB/s nowadys ... too slow?

@pekr, "too slow" isn't a number, and has no context. Is it too slow for people who know they need 1GB/s? Yes. What are those use cases and how frequently do they occur? Is it too slow for solving a huge number of real world problems? No.

Do I want it to be 10x faster? You bet I do.

1) If someone needs to process more than 375 4K files per second, do we say "Sorry, it's too slow.", or do we say "Can you run multiple instances?"

2) Do we sell Red's performance or overall capabilities? "Yes, Ms. XML user, you have to wait an ungodly 15s if your file is 25M (no sarcasm here, that's an unbearable amount of time to wait for a file to open). But what you get in return as a working GUI app in an hour, rather than mixing a fast C++ parser converting to JSON, and a web UI running against a local server." That is, marketing. ;^)

3) How much of the total work time is XML loading? It's like the native vs mezz `loop` overhead question. If the only thing you're doing is loading XML we're really slow. As soon as you start doing real work with that data, what percentage of the time is that, compared to loading?

[20:08:11](#6OFAzAiSt4BrHiHd1lHHCVaQhrgfvTt5vzc4-zOywp4) <greggirwin (Gregg Irwin)>:
> But it's still very limited, driven by one use case only.

That's a good place to start. :^)

[20:08:35](#Wvfp2pX01WwlpR2aAILJI_WA6WAS1nSgdrhn2tDUEcg) <greggirwin (Gregg Irwin)>:
* > But it's still very limited, driven by one use case only.

That's a good place to start. Infinitely better than zero use cases. :^)

[20:10:07](#zXOw5GrFfHaDbFRDzFYTg3lGLzJ8O1n5Vw7H9K3bCxw) <greggirwin (Gregg Irwin)>:
Typos in your code @hiiamboris. `greg-format` should be `gregg-format`, etc. ;^)

[20:11:43](#5HxPsioQvsp3oscRoIjwhVhqkXtyjStdjPeJhem_q1Y) <greggirwin (Gregg Irwin)>:
One of my oldest friends took to calling me Gregorious decades ago, and does it to this day.

[20:15:29](#1ziM7rkbT-Y9VpgPCAYY16ByHCmIpi4eRAbwIkOAYPA) <hiiamboris (NOT THIS ONE)>:
> Typos in your code @hiiamboris. `greg-format` should be `gregg-format`, etc. ;^)

I thought about that ������


## 6-Feb-2022

[19:33:49](#XjFD_6DwZ0AOZPSR48lYHJvUOkdhWg5GcClSck4vhE8) <zentrog>:
If there are going to be some more powerful searching functions which support things like recursion and predicate-based matching, then it may be redundant to have a specialized one built into the xml codec. Once the xml has been converted to red data, we should try to process them with generic processing functions, but there may be some predicates that are specific to the xml formats, like `element?` that would tell whether a particular word represents an element or something else.

[19:47:21](#Rxu892qsF3ZlECdwQpTq4yV-O6ctBEUh2UUt8AvbMi8) <hiiamboris (NOT THIS ONE)>:
With properly structured data there may be no need for complex processing utilities. XML is just very badly structured data.

[19:48:41](#fC_jtw08mXLOpXO8zcABWXyYQX84hSAHL4iGrh99-zk) <hiiamboris (NOT THIS ONE)>:
Of course, I agree that if we write such utility it should be general.

[20:20:57](#n2BGGNV4NR2siPjkGbFBBtgJ3dknAhG9Sxy0lSSoLS8) <greggirwin (Gregg Irwin)>:
We're all on the same page. Generalize as much as possible, so things are consistent across common data models, but then add custom bits that fit each special need.

## 7-Feb-2022

[0:35:43](#xofpoJC2jmZEGo4uljzMS2GYLg2rN_s5B3ym9tpCyBc) <zentrog>:
The point I was going for was that it may be a bit premature to add more advanced searching/processing functions if those are going to be handled in a more general sense. If `find-root` or `find-element` are simple or can be considered temporary, it seems fine to add them. I still don't quite understand the distinction between them though, unless the idea is to make `find-element` much more powerful.

[0:47:52](#GjLLYcsHBrxQTIAxSiWYcZKOIJeaKnOXGe7ofr_JryE) <greggirwin (Gregg Irwin)>:
We're on the same page. Advanced search and filter will be general, and these are helpers for this specific need. `find-root` is a nice name, and more meaningful than something like `find-element` vs `find-element/deep`. It could be `find-element/root` to reverse that logic of course. The root is the starting point, and there can be only one. That makes it easy. If we do `find-element` it raises other questions (First? All? params, etc.), so it will be only an *example* of how to write something like that. A strawman if you will.

Now that we have the foundation, the key questions to ask are:

- What are the most common tasks you perform once you have a document?
- What are the biggest pain points?
- Can we research prior art and guess at the best general solutions, or are we better off building ad hoc solutions, collecting those, and *then* seeing where the sweetest low-hanging fruit is?

[6:09:51](#s6V0WiaIpCBd7rf6vP2zn12dCogDB9vQIJDts3oxnjU) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Gregg, we've got already names - head/tail ... so why to invent root?

[6:11:07](#W4xcgeSLGtOTi3DpAwnp1JWlITrBQko5mxTWCNjEemc) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
* Gregg, we've got already names - head/tail, first/last ... so why to invent root?

[6:13:58](#IPbFfIw6_L8SBxDok2xV9H52eTrpzpb_9_idv5nRzj0) <rebolek (Boleslav Březovský)>:
`find-element/deep` - I don't think it makes sense to have flat search, XML structure is a tree, it should always search in nodes. So `find-element/deep` should be `find-element`.

[6:14:15](#qJ6IV9Z90pwXKQn6bK7Ck62zjnVgCc1YG-a-ehyl-GI) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
+1

[8:50:59](#s2L-7pJ5Gl8Yz8LQ5hITWHfj4vzWzBPKAtAmhiy5x3M) <zentrog>:
Blocks can also be trees. Probably anything we come up with searching in decoded xml could be generalized for recursive block searching as well

[9:23:32](#UiSKZiI9KACqmeiI7bxT_9Gawzoo84QKu5064lQkfd8) <rebolek (Boleslav Březovský)>:
True. But flat blocks are more common in Red than flat structure in XML IMO.

[18:47:43](#NogE1IITeRgLKTDj5OII-o1TcM1TowX1ZD3-rOobN6o) <greggirwin (Gregg Irwin)>:
So to get the root you do `first find-element ...`?

[18:50:32](#RCwewZCgyznIXqMbfsmrsHHAK30227mYC_S5oKQLGAs) <rebolek (Boleslav Březovský)>:
No, `find-element` takes element's name as an argument and you don't know what is the root element going to be. That's why there's also `find-root`.

[18:51:40](#_8LwR7FnEpszwZHcmaLB0pIrvrpPVaWURte9dEupNPE) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
There is a proposal for a node! type. If we want to have something re trees, I would expect similar proposal. find-root looks like a quick hack.

[18:52:46](#axq7bhIOqn1-pmIYSgpNrRWihP1_pP21jMRjJddZybU) <greggirwin (Gregg Irwin)>:
@rebolek Ahhhh, right. 

[18:53:20](#BYP7Vu5mYKo1zluXQKzI9BnU7WWgMiqNUsdF-J_FDUY) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
The question is, if the discussion is not preliminary. Let's get it out and improve in future. My feeling is, that whatever we chose now, is not backed by enough experience based upon a practical usage. Well, apart from few gurus here, who can think few steps ahead :-) ....

[18:53:45](#Lwd91kWx1B7NZbJXr_ciDK3Ea407lPeeHvuuQOMCRXo) <greggirwin (Gregg Irwin)>:
@pekr, we have to think very, very, very, very, very small here, or it won't ever get released. 

[18:53:48](#bhyGEBETyw1oKtynTP_uOn3c3Jkn4OZJeA3wL8CwlTE) <rebolek (Boleslav Březovský)>:
`find-root` is a quick hack, yes. But it's OK for now. Alo, you can just don't add `/meta` and then the root element is the first element.

[18:54:04](#1BZaaqe41_xEjWT9VO3nN59Ll17JH-x9Fq6YPeemT3w) <greggirwin (Gregg Irwin)>:
And we're only adding it in docs.

[18:54:39](#Rm8cav1Q_D0jIoIoQDoy_unl-P86rscssC_zZajTuNA) <rebolek (Boleslav Březovský)>:
Right. And to the separate repo with XML-tools file.

[18:55:15](#3Ba1CO14R0LcM1r0AlJ5CWgKx-XWiPli316SOEaL6GY) <greggirwin (Gregg Irwin)>:
Or put %xml-tools.red in red/code.

[18:55:54](#OZ0he1SUtmUwCaWQpfOrwHDT_CaKq7RdmHlyFMUcudE) <rebolek (Boleslav Březovský)>:
Ah, good idea.

[18:56:14](#-DJyhPqfOaBZ_jaWq2oVL38746I9MPL7pEj1O2SVvtw) <rebolek (Boleslav Březovský)>:
I'll fix the docs tomorrow and move the file to red/code.

[19:03:56](#sHZ4NxhRRg3Wu8YfYQtqdMkSUXZAzAk2YGrXVk1JTMo) <greggirwin (Gregg Irwin)>:
:+1:

## 9-Feb-2022

[10:07:19](#TvfgJIcmFu3lnN8I2WRxG5Hc_7gVdsbs_E1Wqi6qRIw) <rebolek (Boleslav Březovský)>:
Wiki page moved (copied) to https://github.com/red/red/wiki/XML-codec

[11:35:18](#ziYodVoNH2mWlZQ_ZSquYPQXNWJ7X86HwyPdLdpThYo) <ldci (François Jouen)>:
@rebolek Thanks a lot :)

[12:13:39](#PwaCPMSmTqCVmMnMiC7411PyHGGpdSZwHpHzOMQCID4) <ldci (François Jouen)>:
Have a look here: https://www.ephe.psl.eu/actualites/projet-serenite-remettre-le-conducteur-au-centre-du-vehicule-autonome-et-connecte. Red language will be used for developping the digital twin:)

[12:14:44](#nEjY2UP07pjibDTawO5Yubz-pI2yOU1_prUpvHoayN8) <rebolek (Boleslav Březovský)>:
@ldci wow, that sounds pretty cool!

[12:17:01](#TYNIlLj2AqBuPwRlgvohMb_gjnpCP8VfWqwYUW4HDo0) <ldci (François Jouen)>:
Oups, not the good room:)

[12:30:52](#jOwYQUINedHQK4hfJlmksRFY9a4rPQhYg757hthgx1c) <hiiamboris (NOT THIS ONE)>:
should that wiki page have a `[DOC]` prefix?

[12:34:49](#PV4Sbi9_MDrKLKtsfIh5wbxn90oX-z7OVdRR0uze2PQ) <rebolek (Boleslav Březovský)>:
I don’t know, is there a styleguide?

[12:35:40](#bcYlZdhw-Yul5S0GIkl210U4KiBwdZKyxUDT1sH8AD8) <hiiamboris (NOT THIS ONE)>:
\* scratches the head...

[12:35:53](#gpxvYigv6giayFbqwC0lppbGORJKHTAjMDINaUQV6Ko) <hiiamboris (NOT THIS ONE)>:
not that I recall

[12:37:18](#raDJ0387akRBMIM2k080nTJbvzu896B7XNJ70jwezRU) <rebolek (Boleslav Březovský)>:
CSV codec page doesn’t have that prefix. But if it’s preferable, I can change both. @greggirwin ?

[13:00:17](#kyO0LFqYcVItuIubjgJMAqR5v_Vo09Mns-vkXIsEyrA) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
@rebolek you have a bug in one example:

[13:00:20](#7I53zpYOdeHD3UhlXIM9SS2qt1abtthQzM9CJ1Irpoo) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
[![image.png](https://files.gitter.im/600719b0d73408ce4ff93018/bJnC/thumb/image.png)](https://files.gitter.im/600719b0d73408ce4ff93018/bJnC/image.png)

[13:45:28](#FXW8veR1VOMr-ZOjBaWQuTsYaswl2FBd0ChJr2Um-FA) <rebolek (Boleslav Březovský)>:
 @Oldes thank you! Fixed.

[13:57:13](#TDsyAgFDf5xy4lAmHM_w8SK2dE5lamSDoKthTRNK6aU) <endo64>:
When we organize the old wiki pages messes with GregT we've added prefixes to all the pages like ARCHIVE (old outdated pages), DOC (pages that probably used when we build official docs), HOWTO, LINK (to external sources), NOTES (to keep notes that won't be part of the official docs, but we direct users to) and PROP for proposals later moved to a repo.
But later we loose tracking the newly added pages.

[14:23:55](#XB1AqOSXKlRpjrUmM6GZcA7jVnpg0YtkltFVQC-wDQk) <rebolek (Boleslav Březovský)>:
@endo64 thanks, I’ll the [DOC] prefix to codec docs then.

## 15-Feb-2022

[19:40:41](#bxH4vXJ4SzmSxVG7lXnUaEz7R6qftbhd86ZSe3hf6f8) <greggirwin (Gregg Irwin)>:
Quick question @rebolek. I had an old console open for XML play, and doing some blog work ran some tests. Saw that the result of `load-xml` is not copied. Not sure how I missed this before. Is that fixed in the PR version? e.g.
```
>> compact-data: load-xml/as src 'compact
== [
    Migration [
        Session [#Name "Main gather (Machine Independent)" #Type "Online" 
            Platform [#Typ...
>> kv-data: load-xml/as src 'key-val
== [
    Migration [
        Session [
            attr! [Name "Main gather (Machine Independent)" Type "Online"] 
       ...
>> compact-data
== [
    Migration [
        Session [
            attr! [Name "Main gather (Machine Independent)" Type "Online"] 
       ...
```

[19:40:57](#5c38rdshb4OA395Hn1fpaKNI-tt3aH6W8HSzccuFY_c) <BuilderGuy1 (BuilderGuy1)>:
I'm looking for the docs for CSV and JSON but I can't find them in the wiki. Could someone post a link to them. Thanks!

[19:41:37](#DZHajeDxRuHQiRCeRrDpUWwyrRJY1-lz96geplEEGGo) <greggirwin (Gregg Irwin)>:
Search for `codec` in the wiki and they should show up.

[19:41:42](#8Uon7-gAp6R7tgatZoNk2ETQf2np9oiqv4f2WK-U1dw) <hiiamboris (NOT THIS ONE)>:
https://github.com/red/red/wiki/CSV-codec

[19:42:02](#Bv-YIqrHR94-l04MMWYb8y9Z9yPa-U2KY4u7pQoE6hI) <hiiamboris (NOT THIS ONE)>:
https://github.com/red/red/wiki/JSON-codec

[19:43:46](#zm6b606daJRg02WO-8TVb93UrXClJSXJeGpGwpiVbG0) <BuilderGuy1 (BuilderGuy1)>:
Awesome! Thanks !

[19:44:40](#ZRO0OqfreRrOn6d3A7XFZyDrJCUG5Dpnty68VRb54pA) <greggirwin (Gregg Irwin)>:
@rebolek seems the same in the PR, as `clear target` is used. 

[19:45:58](#Z92WBLrZGk0AK3fmSo8Hd5Au0omgdDMG2WGfpJ-tlrQ) <greggirwin (Gregg Irwin)>:
While reusing the buffer is more efficient, it's not safe in this context.

[19:46:19](#jbLd5Nqhnv4F65udy2To2hmLoMgkRZzX6ZotjYLkLHQ) <rebolek (Boleslav Březovský)>:
@greggirwin Ok, I take a look at it and fix it. Thanks letting me know!

[19:46:30](#Wmzyyp89kkj1wqnVwP9PA1j1xvQtsWKdWKNSRW8s04s) <greggirwin (Gregg Irwin)>:
:+1:

## 16-Feb-2022

[12:57:42](#YwfkRqwM1CoYY8yWKua9OR9T6ZYGh3PR6tV-txw79ys) <toomasv>:
@rebolek There seems to be problem with `load-csv/as-records`:
```
>> load-csv/as-records {"A","B"^/"1","2"}
*** Script Error: append does not allow map! for its series argument
*** Where: append
*** Near : value char
*** Stack: load-csv  
```
But these work:
```
>> load-csv/as-records/header {"A","B"^/"1","2"}
== [#(
    "A" "1"
    "B" "2"
)]
>> load-csv/as-records {"A","B"^/1,"2"}
== [#(
    "A" "A"
    "B" "B"
) #(
    "A" "1"
    "B" "2"
)]
```

[12:58:52](#1RG4TG86EgyCMb5Hf8I8sxcJLl2488SrTreztGBbJ7Y) <hiiamboris (NOT THIS ONE)>:
https://github.com/red/red/issues/5075

[12:59:18](#DeLclz7wGIo2IuCxYvODpb0ENjpVZ-RIuU-6-bKUkSE) <toomasv>:
Ah, thanks!

[13:30:46](#OXAQdfd6it4b01D9SOEqr8OaeJ4E45gpwVaZJgtKmAU) <toomasv>:
Ah, thanks!

[13:34:59](#gs5yhHSLf3wSM0OK15kXbxpW7M9Cm0CYQxGGPF5EeXY) <rebolek (Boleslav Březovský)>:
@toomasv thanks, I'll fix it

[14:02:32](#i3nnrQVQXHYMjJsmM-Ijw1_uBVNGCUe6L3YxNjoLrus) <rebolek (Boleslav Březovský)>:
https://github.com/red/red/pull/5077

[17:32:07](#KXeDgzWsafYjWKeiTO_7wW6aHUg6dZ_8W7RHh2S9yqo) <toomasv>:
:+1: 

## 6-Aug-2022

[15:40:34](#gZ93yjHZshZn2oAmPAZel9fXqffXGlniPG35s79VdHE) <GiuseppeChillemi (GiuseppeChillemi)>:
@rebolek 
I am not able to run the code at the end of the script for [get-table](https://github.com/rebolek/red-tools/blob/master/html-tools.red)

How should  I do? I have tried various combinations, loading `%xml.red` and `%html-tools.red  and  `codepage.red` with no succes

[15:44:59](#cjBVF1yNJZdHdXjGsca7UpNXP13zXI-g0PnPp9R2PD8) <GiuseppeChillemi (GiuseppeChillemi)>:
* @rebolek 
I am not able to run the code at the end of the script for [get-table](https://github.com/rebolek/red-tools/blob/master/html-tools.red)

How should  I do? I have tried various combinations, loading `%xml.red` and `%html-tools.red ` and  `codepage.red` with no succes

## 11-Aug-2022

[8:16:58](#Skusaj9Z3C6cpQeq2DpRqx_ZaWXmSjP9PiUDttESX_E) <rebolek (Boleslav Březovský)>:
@GiuseppeChillemi I take a look and let you know

## 31-Oct-2022

[5:24:49](#YqvExyVn-5WJAJH6kWK2tM5BMAZYg5iQds0S5g2sEd4) <toomasv>:
While trying to save as redbin a tree of objects with references from children to parent (like view layout), I get error:
```
save/as %tmp layout [panel [field button]] 'redbin

*** Access Error: cannot decode or encode (no codec): handle!
*** Where: encode
*** Near : codec/encode :value dst
*** Stack: save 
```
Am I doing something wrong, is it expected, or TBD, or bug?


[5:32:27](#sKLFfc9WcPKoXn--6HyPQMqSvazkfwgoF3kkT-SLXhQ) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Handle is a pointer to system resource and cannot be loaded / restored.

[6:42:02](#olCVR1EORkBYwq5T9RR9EOi9cfDCg1TfxvzRmLkyNKY) <toomasv>:
Ok, thanks!

[7:45:43](#shlQmeQMacbqLYA9GqIIAyRZEdJZ7SjH5pG-CsoyDrI) <toomasv>:
Any suggestions how to save/load such things?

[9:33:19](#Kh9-NRYxsuPrlhnGfaHjSPFE2M0anN2kq88qSBaMrto) <dockimbel>:
@toomasv Either `unview` the window face tree before you are trying to save or make a copy of that face tree and set all `face/state` to `none`.

[9:33:45](#yvVQcY9Xj-nRxZOLrdk6wrborjllf0i5wBIDPluVHtI) <dockimbel>:
* @toomasv Set all `face/state` to `none`.

[9:35:54](#v0nnTzAm2Mq26A-eNpCBUUqCmoGK0pwS2WzYp6GF4gQ) <dockimbel>:
Hmm, `layout` is connecting the root face generated to the `screen` face. It should not, only `view` or `show` should do that. 

[10:37:08](#AywuXR8BsESg3AePGtKxde8kMmvwoB8lUpKHk14wwN4) <toomasv>:
Ok, thanks! 

[10:42:12](#V_zVCB1lSpg3RIJJQxxGmINe6giVqT7139yLLu2ptDk) <dockimbel>:
It seems that trying to mold face objects results in pulling in the global context too as a dependency. I'm having a quick look at it to see why exactly.

[11:55:23](#NKUG4or_2DqtHG4aVNxaJk132z4Erx2jFdmVzXeHwgQ) <dockimbel>:
Even when using `layout/only` to avoid the creation of a window root face attached to the screen face, the serialization still chokes but on routines then. The culprit is the `/option` block created from a [template](https://github.com/red/red/blob/master/modules/view/VID.red#L700) bound to `system/view` which contains routines. 

If the binding of that template block is forced to the global context, the serialization still fails because of the face event handlers (`on-change*` mostly, which contains references to `system/view` context or other contexts like [`system/reactivity`](https://github.com/red/red/blob/master/modules/view/view.red#L435).

[11:55:48](#uA0IW4Z48dPuPf_PgZx8RBum3icIUzOg0fiNuX9Km7M) <dockimbel>:
* Even when using `layout/only` to avoid the creation of a window root face attached to the screen face, the serialization still chokes, but on routines. The culprit is the `/option` block created from a [template](https://github.com/red/red/blob/master/modules/view/VID.red#L700) bound to `system/view` which contains routines. 

If the binding of that template block is forced to the global context, the serialization still fails because of the face event handlers (`on-change*` mostly, which contains references to `system/view` context or other contexts like [`system/reactivity`](https://github.com/red/red/blob/master/modules/view/view.red#L435).

[11:56:17](#GfDcvqafpcbVDIoCIFer-EXZ653dvEBww6zAa2t_54Y) <dockimbel>:
* Even when using `layout/only` to avoid the creation of a window root face attached to the screen face, the serialization still chokes, but on routines. The culprit is the `/option` block created from a [template](https://github.com/red/red/blob/master/modules/view/VID.red#L700) bound to `system/view` which contains routines. 

If the binding of that template block is forced to the global context, the serialization still fails because of the face event handlers, `on-change*` mostly, which contains references to `system/view` context or other contexts like [`system/reactivity`](https://github.com/red/red/blob/master/modules/view/view.red#L435).

[12:10:51](#Q0vqHecjBC_rmiwq_rO3iRCYY2TGa1pbsiF19Q3Rxic) <dockimbel>:
As soon as you as trying to serialize some code that was evaluated, the dependencies pulled through referenced contexts will explode. One of the main contributors are evaluated paths, as the interpreter will tend to bind the path words to their partially evaluated parent objects in order to speed up interpretation. In doing so, it often will bind a path word that was global to a local context, expanding the dependency graph.

[12:17:36](#7i1GDXIqeIAA6cq2s1TB0mnEwytdic9OPJIH_mNNKrA) <dockimbel>:
Even if Redbin encoding was ignoring handles and routines, it would still result in a pretty huge payload, even for a single simple face object. So, complex objects like faces, with event handlers with big dependencies are not well-suited for full serialization. A good solution would probably be to have an intermediary layer that would convert those face objects into an intermediary representation more suitable for Redbin encoding, and a decoding layer on the other side, capable of reconstructing such face objects, even reallocating again the system resources they depend on. Ideally, using such intermediary framework, you could serialize displayed faces, send them to another Red session, and get them decoded and redisplayed with just a simple `load` call.
As a side note, such "special" encoding layer could be some user-provided plugins to Redbin, which could be triggerred as a front layer on Redbin invocation, when those special values or datastructures are recognized.

[12:17:49](#3eTgBiSm57wSBXh6OeabBQVxR_tN6iVAxVohJhpxLgY) <dockimbel>:
* As soon as you are trying to serialize some code that was evaluated, the dependencies pulled through referenced contexts will explode. One of the main contributors are evaluated paths, as the interpreter will tend to bind the path words to their partially evaluated parent objects in order to speed up interpretation. In doing so, it often will bind a path word that was global to a local context, expanding the dependency graph.

[12:19:25](#cylxPZDHY5OeqpmfS9p4CU7R_xuMja2iuKT3pfMfdvs) <dockimbel>:
Same approach could work for opened ports too.

[13:30:23](#Lb-RUlzQgQXXEQ88xtSTR24H5IhQaIoTJhgrjnnm580) <toomasv>:
Thanks! For now I solved it with saving the tree as simple object, and manipulating it with parse after loading (removing `parent: make object! [...]` parts) and then reallocating resources and recording references again throughout the tree.

## 1-Nov-2022

[22:55:27](#h3feKhtjF6bJzQ7yeX4tgaDsU4iet_c2cjA7TvQT0NY) <hiiamboris (NOT THIS ONE)>:
I think such plugin would be too tightly tied to the particular implementation version of the View module. On a different remote version, unlikely will do any good.

## 2-Nov-2022

[13:19:02](#2bamVA-cvSn0bXsKQWptcTgg_WVEnGJBNfs8RzJObmw) <dockimbel>:
I don't see any problem with that, users could overwrite the plugin for a specific datastructure when needed. "User-provided" means that you can freely add/remove/replace any plugin there.

[17:21:10](#vFRc6qgTTtT0q1FzAULz7RXWrjZKl3-UaE_d4y_jVhE) <hiiamboris (NOT THIS ONE)>:
But we shouldn't expect users to know the internals of View, which are needed to build such plugin properly.

[18:47:32](#a42oIL4xdvHfiJd1w_ld7t5tsvLas99aAxBzSrVk-e0) <greggirwin (Gregg Irwin)>:
It's a cool technical problem to think about, but is there value that makes it worth the effort? Rather than working at the displayed faces level, would it make more sense to use an XWindows approach where net speed is high enough, or a VID+state management system that lets you send VID and a current state to recreate it somewhere else? Most importantly, of course, is use cases. 

[18:47:41](#mrUHaeVhUM2MwpO0egUrO0mckLXEeVecF0kLKDKrNUk) <greggirwin (Gregg Irwin)>:
* It's a cool technical problem to think about, but is there value that makes it worth the effort? Rather than working at the displayed faces level, would it make more sense to use an XWindows approach where net speed is high enough, or a VID+state management system that lets you send VID and a current state to recreate it somewhere else? Most important, of course, is use cases. 

## 31-Jan-2024

[12:13:36](#3sZyDqPyLAwRYngG3YEVYr8SbdwqEJdaohOR9u0kICI) <rebolek (Boleslav Březovský)>:
continuing from Red/Red, HTML codec can be found in [CASTR repo](https://gitlab.com/rebolek/castr/-/blob/master/html-codec.red?ref_type=heads)

## 3-Feb-2024

[8:40:58](#Vtk-T9B6gVBNn9GkEB3gRH0pzye_tecLhDODf3Nnx6E) <Boum69 (Boum69)>:
> <@rebolek-5565a4bf15522ed4b3e100bc:gitter.im> continuing from Red/Red, HTML codec can be found in [CASTR repo](https://gitlab.com/rebolek/castr/-/blob/master/html-codec.red?ref_type=heads)

������

## 4-Feb-2024

[17:11:58](#7TNJdNtSQFn98TChzQgZFCr1swYgM3RAC-Qs4J4PtLQ) <hiiamboris>:
```
>> length? read/binary %PS_2024.01.22_07.39.09.csv
== 25619749
>> clock [data: load %PS_2024.01.22_07.39.09.csv]
47734 ms        [data: load %PS_2024.01.22_07.39.09.csv]
== [["pl_name" "hostname" "sy_snum" "sy_pnum" "discoverymet
```

[17:15:18](#36G84wu2AqzIt8sVoXp7GfLFjXHlB-fhH6Qtr7bLR8c) <hiiamboris>:
just 15sec without GC but still lazy..

[17:17:31](#CJQjjeRnUx2Xu1SsCIVPxLYfhCD7AoFtouUAB56YFJE) <hiiamboris>:
* just 10sec without GC but still lazy..

[17:24:46](#H7ezwD0GNd79HzYl36I1gv4yKUBlbbrkXdt9T4sNfl4) <hiiamboris>:
* ```
>> length? read/binary %PS_2024.01.22_07.39.09.csv
== 25619749
>> loop 4 [clock [data: load %PS_2024.01.22_07.39.09.csv]]
30909 ms        [data: load %PS_2024.01.22_07.39.09.csv]
47178 ms        [data: load %PS_2024.01.22_07.39.09.csv]
69511 ms        [data: load %PS_2024.01.22_07.39.09.csv]
97542 ms        [data: load %PS_2024.01.22_07.39.09.csv]
```

[17:24:54](#Ifnq-tgSGsDChtgeZ1VAuD2VwVLXePAUT57pMzWf2GI) <hiiamboris>:
* 'just' 10sec without GC but still lazy..

[23:05:48](#nVwzOLIGtU4xARvdd5oyNUAbLZV8jzVDcaj7WkFE2J8) <greggirwin (Gregg Irwin)>:
Did you try various `load-csv` refinements? `/flat` was the fastest IIRC. 

How many records in the 25M CSV file, out of curiosity? This is where profiling would be great, to see where the time is spent.

## 5-Feb-2024

[9:12:22](#l0dLwuSp6LUYaa_TjCq0VHc0Y8IkR7-fno3lzv0wqGA) <hiiamboris>:
about 2.7M records

[18:15:50](#88lLyT6oYul37f00ro1EABoclYjNB8EuC7BoxrJ23FQ) <greggirwin (Gregg Irwin)>:
Just collecting that many (copied) recs into a block, as sub-blocks, takes ~30s here. Making a flat block cuts that in half. Not copying the recs, into a flat result cuts it to ~1.5s.

[18:17:56](#FnXRB4TAkxWLskYp5SQliLwLMxtskra2cBuedegacIA) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@greggirwin-55659ddb15522ed4b3e1006f:gitter.im> Just collecting that many (copied) recs into a block, as sub-blocks, takes ~30s here. Making a flat block cuts that in half. Not copying the recs, into a flat result cuts it to ~1.5s.

What ypu mean for not copying the RECS?

[18:20:49](#nlw1OsNQwr6l02WkJtWtL0TrPhsbRomGPRBJsqRODT4) <greggirwin (Gregg Irwin)>:
`append result copy rec` vs `append result rec`

Finally, if you `keep/only`, and don't copy, it's ~1s.

[18:20:56](#Dr9IhVL_gBQwE3Kc0xG04t76B-40_zOIRPYrmYUiLgc) <hiiamboris>:
```
>> clock [loop 2.7e6 [append [] copy "abcdefghijkl"]]
3014 ms [loop 2700000.0 [append [] copy "abcdefghijkl"]]
>> without-gc [clock [loop 2.7e6 [append [] copy "abcdefghijkl"]]]
1383 ms [loop 2700000.0 [append [] copy "abcdefghijkl"]]
```

[18:21:27](#AssvjFRAXQDVKqcp49NsOPCULafu2htQkSoYrit3xis) <greggirwin (Gregg Irwin)>:
GC will also make a big difference in this case of course.

[18:21:35](#sg8rrJCQN66bGkmNVm-yOJTFf-LVwwFoT6cLDhU_cn8) <hiiamboris>:
how 30s?

[18:21:48](#XZHszUYWEmQLd9Snbfq7ymfAiH0QCRjoMmhfjVHvJEk) <hiiamboris>:
ah, sub-blocks

[18:21:49](#zHdCIBV6pft8HtTmZ9XbSVyHQf6ezQdmUus9BZyilpI) <greggirwin (Gregg Irwin)>:
What do you mean?

[18:22:18](#MN9IIJ5kYP1whIR0WxzXEaxTJUjRh7moFZYkIZgIujM) <greggirwin (Gregg Irwin)>:
Right, and I didn't even `copy/deep`. :^)

[18:25:08](#P9A42N1vGeMeVI92upDnGDEl6kMKwQKcnraIyNvpXZk) <hiiamboris>:
```
>> result: [] clock [loop 30000 [row: clear [] loop 90 [append row copy "abcdefghijkl"] append result copy row]]
5540 ms [loop 30000 [row: clear [] loop 90 [append row copy "abcdefghijkl"] ap
>> without-gc [result: [] clock [loop 30000 [row: clear [] loop 90 [append row copy "abcdefghijkl"] append result copy row]]]
1454 ms [loop 30000 [row: clear [] loop 90 [append row copy "abcdefghijkl"] ap
```

[18:25:34](#kopDk8FIbfJOhkgLThn10ji9r4zHBVWnQD8GxyneAYc) <hiiamboris>:
probably keep overhead

[18:25:35](#D74nOVzEsfdaAyX1KCr98C7hinHRXlNsutiZFQEDeNc) <hiiamboris>:
* probably `keep` overhead

[18:29:46](#13fAGqqG8QoITt0STpzkgXl2zxNeIqTNjarOqadRgB4) <greggirwin (Gregg Irwin)>:
https://gist.github.com/rebolek/e9c718175a0c60c1ec1a6e1a97d8cd2c

[18:33:58](#nl-_7utehAOWsGVabZ5koWsow_eDeMfa7Drdbtej1EY) <greggirwin (Gregg Irwin)>:
I thought we had some general profiling results on large datasets as well. 

[18:37:10](#uRrrkaCX-38-P095XBBNHkbftGA2q0aMhOt-wDfpMQ4) <greggirwin (Gregg Irwin)>:
Maybe we did that for the markup codec.

[21:23:15](#fYG752kPR5GhTiJ0qFbASXMWwumFAGVe9UvvgC7Ph9w) <greggirwin (Gregg Irwin)>:
An interesting experiment would be to use the model dockimbel created for the fast lexer and apply it to codec lexers. The major overhead will still be creating the data structures and values though. Plus, other data formats don't give you much type information, though some modern schema-based formats do. I remember running up against this in chat with other lang devs and libraries. You can make the fastest loader, but *then what*? If you are super fast at loading draw data, but then it's a pain and/or still has to be converted to values, it's a micro-optimization. So, while we want fast loading because it's cool and looks good, where are the bottlenecks in the big picture. e.g., for CSV data like yours, what happens if you load it once, save it as Red data, and then work against that going forward?

[21:25:45](#4s__3p8akDRNbIlvyhHbVqT8cJVyU5vx9Hfqs8gc3zw) <greggirwin (Gregg Irwin)>:
I've written more than one system that predigested data and organized it for use in real, ongoing work. In the old days, which doesn't mean it's not still a valid approach, late night batch processes would even create pre-compiled query results. When you have common queries, and data isn't up-to-the-minute, it works really well.

[21:31:22](#kFuw6g-H-GQcJO4gDYoKRsPTwvyFqh7b0SV4VJCCc7k) <hiiamboris>:
Bottleneck obviously is you don't want to hang for a few minutes while the user waits.

[21:32:02](#zeY30u37wfPul3c1HjqGnFbwAzbrQxCiKu3JZvfgImE) <hiiamboris>:
But ofc I'm using gzipped Red format, which takes 1.1s to load.

[21:41:48](#iox4BXXtL9y5YWQW8FMUvBpLX1I08BhUjjWHEJVmOFo) <greggirwin (Gregg Irwin)>:
An old mentor of mine said, in cases like this, fix it with language. Pop up a message. "Dear user, that's a lot of data. It will take some time to process, so now is a great time to get a cup of coffee or tea, stand up from your desk, or call your Mom."

[21:44:32](#yTp0NDmSDTDctIycYnYUlCCOv_gPbvxbRleuX_f6f4Q) <hiiamboris>:
I can't agree. If I was a user I would ditch such program :)

[21:45:24](#rsXBHivORWcWOlt9la-8wycAosl5Vzlze2w-RyouGFo) <hiiamboris>:
(to be fair, without GC it's tolerable, so that should be the primary optimization vector)

[21:46:30](#dItKIYDoJAulT9AIwCNsAlNaLt7wr7EzccgOOARlTlk) <hiiamboris>:
https://github.com/red/red/issues/5316

[21:47:47](#M_THTrR_iZigRt2FRnl55AfeiimHVrOVvekh4o-hHkA) <greggirwin (Gregg Irwin)>:
We're not normal users. I have been amazed at UIs I thought were horrible, and I railed against in the name of what I thought was better and more modern. Seeing users *love* and *appreciate* them is eye opening every time.

[21:48:17](#BWxtlDKuxO88WXZOuYJxpNXTqvJq3ZFxsJkP6SRcM0c) <greggirwin (Gregg Irwin)>:
We also know Doc plans to improve the GC.

[21:49:19](#_6ycUbBEk4NfrXwVPLRNeUvUS7BZm32PAZlgn9pdhbE) <greggirwin (Gregg Irwin)>:
Ultimately, we have to ask the users what they want, and what is most important to them, no matter how crazy we think their requests are.

[21:55:33](#yHUduGcXamwAUwKUSqaqmVMPMvmrPmWtYiUr5K8DdYY) <greggirwin (Gregg Irwin)>:
For CSV we can also experiment with sniffing data, because it's generally very regular. e.g. look at the overall data size, sniff a few rows, and preallocate based on that.

[22:15:20](#9CALlBqEI1-41JEEDTdkdWbxSZiuGnx9LzML6ZlOhWM) <hiiamboris>:
not entirely regular, eg. it may have 50 rows with empty fields in a column, then 50 rows with some 50-100 chars

[22:16:22](#n6FtAt-g-8BKiHGKbC6qQSJWychPA3OynMLc1ii5gIE) <greggirwin (Gregg Irwin)>:
Of course, but you know how many fields, and an *idea* of their sizes. Will never be perfect though, without working against repeated data with updates and such.

[22:16:23](#fTX01eiWtsP3a6xugNQC947fTNrtm0ohe6M78zRam2s) <hiiamboris>:
my usual trick is to use a static buffer, clear it, then copy the result

[22:16:46](#vj-uq9WyBa38h1LQUFsSjzLKUsavezmP6UhN3wsyWQE) <hiiamboris>:
* my usual trick is to use a static buffer, clear it, then copy into the result

[22:17:30](#5FpU10_YZcQHqXOK6SukFFxSPKaoyLppcm72wTholV0) <hiiamboris>:
* my usual trick is to use a static buffer, clear it, then copy into the result (but really we should just implement ranges and call it a day - simplu map a CSV against the original string)

[22:17:39](#nk0WoedXn0Y4-ecYXD6Dq9CQ6E9LsFgamiZejq6hGoQ) <hiiamboris>:
* my usual trick is to use a static buffer, clear it, then copy into the result (but really we should just implement ranges and call it a day - simply map a CSV against the original string)

[22:17:53](#fzX8QSaiDZvWV-su-gy52mJ77ozz-GJMC6SnELSbsTk) <hiiamboris>:
* my usual trick is to use a static buffer, clear it, then copy into the result (but really we should just implement slices and call it a day - simply map a CSV against the original string)

## 6-Feb-2024

[9:26:04](#WyaKSgCIdOvaLo7H9p-WWVdigM_f835875uHvOwVWwg) <rebolek (Boleslav Březovský)>:
Slices would help *soooo* much....

## 7-Feb-2024

[17:02:47](#lU45mWz_OkIOWupcACMsFW1q_CSx7vIUFktMDcT0Pzo) <Oldes (@oldes.h:matrix.org)>:
Is there any available proposal how it should work?

[17:32:19](#upm45UQ1w5vDLfTExC5UCzJmXVU94Txjoi1PbcZo5g4) <hiiamboris>:
https://github.com/red/REP/issues/97

[17:52:56](#Mlzbn6iqaNeCVvhz9ADbz8cjTfHeYwqERu1Fi_6WtpQ) <rebolek (Boleslav Březovský)>:
IMO special type would be better. Or just add start position to block!, it's half-slice already, just make it full one.

[17:53:31](#_-b7eGXOVz2DfupKV4x0GfK4cWqB4539LywtCHY6YqI) <rebolek (Boleslav Březovský)>:
* IMO special type would be better. Or just add end position to block!, it's half-slice already, just make it full one.

[17:54:38](#H5ThLdhc3JqPfW0c4H2n8sYodihnqL-8GAqzXJH91Lc) <hiiamboris>:
you mean another type for every series type? :)

[18:21:59](#Oc8mpzsc5UTF_GKNy6WwloZ-zDfzlOCuxa6SC3REkzI) <Oldes (@oldes.h:matrix.org)>:
So your proposition is, that is should work like this?
```
ser: "abcd"
par: part ser 2 ;== "ab"
next' par       ;== "cd"
```

[18:23:24](#AlYiN9KM9ufVrkINFCxm3-kVeescz6px4eGTkdvPzA4) <hiiamboris>:
`next' par   ;== "bc"` more like

[18:23:58](#h2PE1oGegDPBPq6kvDOoAC9APvj_xBkWgFM2zvj6hAY) <Oldes (@oldes.h:matrix.org)>:
What if someone modifies `ser` or the `par`? like using `append` or `remove`?

[18:24:30](#vqe_bjR6JLT5DLgFzqCMBcBfMX0ktuHcQDzz74qHIEk) <hiiamboris>:
try it, I hope the code still works :)

## 8-Feb-2024

[17:10:29](#Xc6hP2IgFIJee361NSgJCSr4bu_b194j4M82UjBNaqk) <hiiamboris>:
try it, I hope the code still works :)

[17:10:46](#GuutK0Xw2ZbaLcm0fR2u-fcFuo0Mg0h2z9X5MnnKbxE) <hiiamboris>:
try it, I hope the code still works :)

[17:21:31](#F__U0Yvy4Ifans1j6dJ_rqr2lnN8MDl9ggwP_Yiwd6A) <hiiamboris>:
* I'm seeing [these morons](https://bingx-api.github.io/docs/#/en-us/swapV2/trade-api.html) freely abusing JSON by passing int64 values in and out without enclosing into strings. Should we try to support some workarounds?

[17:21:51](#ljWmLPMb41n8wJEKSKQEimr4W2OiKCgnJQH-LJRH2J0) <hiiamboris>:
* I'm seeing [these morons](https://bingx-api.github.io/docs/#/en-us/swapV2/trade-api.html) freely abusing JSON by passing int64 values in and out without enclosing into strings. Should we try to support some workarounds?

[17:22:01](#s5P9w8naVzxrZz4nkQnKRx3r8lvBDuvy0O17Bz2COXw) <hiiamboris>:
I'm seeing [these morons](https://bingx-api.github.io/docs/#/en-us/swapV2/trade-api.html) freely abusing JSON by passing int64 values in and out without enclosing into strings. Should we try to support some workarounds?

[17:44:20](#nNZpuujA__L-M9JAKzrvDMqgJsYyguoXdX1996FYvxk) <hiiamboris>:
it seems that the RFC does not limit precision (may have 10000 bits all the same) https://www.rfc-editor.org/rfc/rfc8259#section-6

[17:45:23](#wlMhfl3PySbervaHY3x6Ts0YwnbFy7MD-L6BUjCZwf0) <hiiamboris>:
they're using Go library which facilitates this non portable behavior https://cs.opensource.google/go/go/+/refs/tags/go1.22.0:src/encoding/json/decode.go;l=201

[17:52:36](#24ntcH8O3z9ccoi0Vwaf78f9YgSgKp83zdPnH-A6w1s) <hiiamboris>:
don't know how we could format it properly though, without having int64 type in Red

## 9-Feb-2024

[0:41:18](#QK7txIB0sWipvpKlshzEw67u5BhaKSpHqfXeD5tCZD0) <greggirwin (Gregg Irwin)>:
Yeah, the "implementations have to agree" part is an issue. 

[0:42:12](#9eA4syjIpY9ezAbQY1NQWi98QrB0TdnnzMaeHT7zWiQ) <greggirwin (Gregg Irwin)>:
And yet it still runs the world. I bet somebody could topple a lot of systems without much effort, or even intentionally.

## 13-Feb-2024

[18:32:37](#jeLYcW9ioMRpPJBVEDLRrg2XuS2962NCljxaqTMHFog) <hiiamboris>:
Should `load` maybe automatically decompress `.gz` files?

[18:34:16](#bbSdqduS5zH-zdtMN0Tzu31inQfb7QcWEL9gMU4Uz2Y) <greggirwin (Gregg Irwin)>:
Wouldn't %.gz be its own codec? We've talked about it for %.zip in the past.

[18:35:28](#b6JaiFFQqNi7EdLjmERGuvCZYh37i7dnC_R3vhPrze0) <hiiamboris>:
zip is trickier as it's a file tree

[18:35:52](#WAw-f4d_EJKU-CBfpE6dKw3HD7_B0wJncjQ1oRLrDM4) <hiiamboris>:
but yeah good point

[18:36:41](#piUk2waCcuQ7BW9W6Zjn4oPsEJH0n8wNu3m1Nr9LOLc) <greggirwin (Gregg Irwin)>:
It's a question of how much happens automatically. e.g. %.tar.gz. 

[18:37:53](#ePRS5T3pv2lxI8XocOlDI18MWa31wpwcnBu9b4XBN50) <hiiamboris>:
I don't have a design for it, just have a `.red.gz` file (which is a kludge anyway) and I have to read, decompress it and only then load

[18:41:07](#bfp0XN0DnFZbA3mD1IaVOcPFlj7VUzDLnelBZGOUzRs) <greggirwin (Gregg Irwin)>:
Single file archives are a special case, but a library for archives would be really useful for automated processing. 

[18:42:07](#PHN-ozy5uC0FsaC2Uq8oEp5avbQBZpKi1Sax3YIVU5g) <greggirwin (Gregg Irwin)>:
DiaGrammar supports %.zip file output, which is nice for sharing.

[18:42:37](#NTun2Fwv7dzNbrea8QIUVJZL6QFRg8vIyZoE2mwLE44) <hiiamboris>:
why not merge it into Red?

[18:43:21](#6bykHDObUVFWBnXfPj-zq2ONN-4yX5YBv25shBVh3aU) <hiiamboris>:
I guess it's limited in DG though

[18:43:24](#Biykb2ZCai5BxJwRWrP3_cUo_STcmRsLoqGRjL4a10I) <hiiamboris>:
* I guess it's limited implementation in DG though

[18:44:29](#M0fRY-RGxI18Fc4kOi-Km2Dob74ZUkfydzfZTFbU2fQ) <greggirwin (Gregg Irwin)>:
IIRC, Bolek's original, which DG built on, was a core but without a defined API that we'd want for general archive use. 

[18:45:05](#I9r-QX4mwriJK3gbLrH5X6CXiYVFjWNR19sDvf4NK7w) <greggirwin (Gregg Irwin)>:
But it can both read and write them.

[18:45:29](#HYk3Dr6EQpu4hIzjdtqrqeKfcQUd10wNfW8jUHCYaw4) <hiiamboris>:
I see

[18:45:43](#w_fLfi_27N1wXKv9Y9lzGYZY5MdqBETgkyLz5DuoEEE) <hiiamboris>:
and that goes into virtual file systems support

[18:45:55](#O5LvSUYdpWi8blZmULME-4RR1dyzilwVMpABHIvA9sU) <greggirwin (Gregg Irwin)>:
At a glance, looks like DG just updated for Red's change to `compress`, so Bolek's is still the reference.

[18:46:27](#6XxIxSdqnuUM_t5lvf9mKUzteAthdU4BRnanA5ujgFY) <greggirwin (Gregg Irwin)>:
> <@hiiamboris:tchncs.de> and that goes into virtual file systems support

Right.

[18:47:50](#zPa3o09N6YVBVUQcrEeJzqnf2uHHFPB_q3dWWP_XR1o) <greggirwin (Gregg Irwin)>:
Also hard-coded for `deflate`.

[18:49:37](#x750BHuyv64OTpnTYQSWAx9QaxbXeKU5RhjNl0qVMyY) <greggirwin (Gregg Irwin)>:
And no streaming, so the full archive lives in memory while working.

[18:50:07](#_g8EiBKrJWC676_4cKkjHwWccVk3PHtZUdjohJaaOY0) <greggirwin (Gregg Irwin)>:
Still useful for most cases.

## 14-Feb-2024

[8:44:22](#yrfsA0lFMFRo-UKeU9m4mEB5dsNB-kwMS1CgS2x7ijQ) <rebolek (Boleslav Březovský)>:
> <@greggirwin-55659ddb15522ed4b3e1006f:gitter.im> IIRC, Bolek's original, which DG built on, was a core but without a defined API that we'd want for general archive use.

actually, no. It has a simple API that's made to be turned into a codec. There are two in-memory functions, `load-tar` and `make-tar` and two file functions, `tar` and `untar`. Same with ZIP, it follows the same structure, just replace `tar` with `zip`.

