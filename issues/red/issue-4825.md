
#4825: [Regression] GUI Console is in some kind of mourning lately?
================================================================================
Issue is closed, was reported by hiiamboris and has 44 comment(s).
[status.tested] [type.bug] [status.reviewed]
<https://github.com/red/red/issues/4825>

**Describe the bug**

It insists on using darker shades of whatever background color I'm choosing after restart:
<img src=https://i.gyazo.com/1d46d425b1aef064171f149bb47af003.gif width="400"></img>
The color is OK after re-setting it in settings dialog, then it becomes grayish after restart again. Every time.

**Expected behavior**

Joyful background with smileys jumping around.

**Platform version**
```
>> about
Red 0.6.4 for Windows built 9-Feb-2021/20:31:32+03:00 commit #18bc5f7
```
I have a build `red-28jan21-bae0c3400` that is not yet affected so it's recent



Comments:
--------------------------------------------------------------------------------

On 2021-02-11T20:52:21Z, greggirwin, commented:
<https://github.com/red/red/issues/4825#issuecomment-777781613>

    Funny ticket title. :^) D2D related perhaps?

--------------------------------------------------------------------------------

On 2021-02-11T20:53:43Z, greggirwin, commented:
<https://github.com/red/red/issues/4825#issuecomment-777782577>

    However, I don't see that behavior here on Win10.

--------------------------------------------------------------------------------

On 2021-02-12T08:01:56Z, toomasv, commented:
<https://github.com/red/red/issues/4825#issuecomment-778042130>

    Me neither (W10).

--------------------------------------------------------------------------------

On 2021-02-12T08:42:27Z, hiiamboris, commented:
<https://github.com/red/red/issues/4825#issuecomment-778059489>

    Can't say. Need to build all commits in the past week to pinpoint it ;)

--------------------------------------------------------------------------------

On 2021-02-12T13:36:03Z, hiiamboris, commented:
<https://github.com/red/red/issues/4825#issuecomment-778199021>

    I can say now. The exact commit that causes this regression is https://github.com/red/red/commit/022fa350256f3ddb71dba10bbb3b8d0940095caf  from PR https://github.com/red/red/pull/4816
    I have not the slightest idea what it has to do with the GUI console, but I double checked - that's the culprit.
    ):

--------------------------------------------------------------------------------

On 2021-02-16T07:58:27Z, qtxie, commented:
<https://github.com/red/red/issues/4825#issuecomment-779657103>

    @hiiamboris Is the `gui-console-ctx/console/color` correct after restart?

--------------------------------------------------------------------------------

On 2021-02-16T10:36:50Z, hiiamboris, commented:
<https://github.com/red/red/issues/4825#issuecomment-779748347>

    ![](https://i.gyazo.com/0ed59c00713b0aa562255818ad677447.png)
    I made a screenshot so you can see the rendered color does not match the tuple.

--------------------------------------------------------------------------------

On 2021-02-17T14:47:53Z, 9214, commented:
<https://github.com/red/red/issues/4825#issuecomment-780606065>

    @hiiamboris is there anything suspicious in `%APPDATA%/Roaming/Red/Red-Console/console-cfg.red`? I can reproduce it on my end BTW.

--------------------------------------------------------------------------------

On 2021-02-19T08:15:39Z, hiiamboris, commented:
<https://github.com/red/red/issues/4825#issuecomment-781912588>

    @9214 It was the first thing that I checked.. but no nothing suspicious. And if I delete the config, console runs with proper background color, then upon restart it saves the config and loads itself with a wrong color again.

--------------------------------------------------------------------------------

On 2021-02-19T23:39:27Z, qtxie, commented:
<https://github.com/red/red/issues/4825#issuecomment-782457831>

    If the saved value in console-cfg.red was correct, then something wrong happened on loading part.

--------------------------------------------------------------------------------

On 2021-02-28T22:35:09Z, 9214, commented:
<https://github.com/red/red/issues/4825#issuecomment-787536910>

    `black` of a healthy person:
    ```
    02D8B59C: 00180027 00000000  00000000 00000000  '.?.............
    ```
    `black` of a smoker:
    ```
    02D8B59C: 00180027 41000000  6FDDC324 4BFE4E03  '.?....A$??o?N?K
    ```
    The upshot is that `tuple!` value slot gets corrupted.
    ```red
    >> black == gui-console-ctx/console/color
    == true
    >> black =? gui-console-ctx/console/color
    == false
    ```
    
    And the issue goes away if the GUI console is compiled with GDI+ compatibility. @hiiamboris's changes affect only the runtime Redbin encoder, since the decoder has no use for reference tracking that has been updated; if there's any Redbin inside the console binary, then it has been encoded by the compiler's [version](https://github.com/red/red/blob/master/utils/redbin.r) of it, which I didn't modify when working on Redbin v2.

--------------------------------------------------------------------------------

On 2021-02-28T22:43:43Z, hiiamboris, commented:
<https://github.com/red/red/issues/4825#issuecomment-787538169>

    Could it be that `load` somehow loads junk into unused bytes (after tuple/size), and then D2D uses 4th byte as opacity even though tuple is of size=3 only?

--------------------------------------------------------------------------------

On 2021-02-28T23:06:20Z, 9214, commented:
<https://github.com/red/red/issues/4825#issuecomment-787541599>

    @hiiamboris if it's a normal `load` (or rather `transcode`, since console config is stored in plaintext) then that's lexer's doing, which ~~IMO is unlikely~~ is what actually happens. It looks like the color value (`000000` in our case) is overwritten on top of an already trashed slot.
    
    Another observation: make the background color something like `255.255.255.255.255.255.255.255.255.255.255.255` thru console settings, then try to scroll the console history. Don't know if it's related or not.
    
    ![image](https://user-images.githubusercontent.com/15716466/109436822-c60a3800-7a21-11eb-8d70-18bee69d94d5.png)
    
    Ẇ̶̢̨̢͕̺̠̼̣̫̺͆͂̾̀̽͐̐̾̾̽̓̀̆͌͘̚͝͝͝ͅḧ̸͉̜͔̠͇̯̣͎̭̞̤̟̩̻̫̩̼͚̞̙́̒̎̂͗̓̓̿͛͒̎̏̿̀́͑̀͜͠͠͝͠å̵̢̹̹̻͇͉̮͍̳̞͆́̿̍̀͌̇̈́̽͋̉̆́͝͝͝t̵̢̢̘̫̯͐̔̽̎̑̄̈͋̇̈̄̏̐̾̈̚̕̕͝͝ ̶̛͙̜͇͓̹̎̊̍̍̍͌͂̃͒͒́̆̒̈́̀͂͗̾̿ͅh̴̛̘͙̜͖́͂̔̽̚ͅȧ̶̢̻͐̓́̔̚v̴̡̨̡̢̛̬̱̞͕̱̠͈͇̦̮̪̩͕̻̳̔̀͐̍̍̂̿͗̊͌͂̆́̄͊̅͘͠͠e̷̡̟̪̥̘͈͙͆̒͛̈͘͜ ̶̧̘͔̩̠͔͎͈̺̤̣̇̃̍̌̈̾̎̾͒́̀͘͝͝͠Ĩ̶͍͇̯̗̜͚̭̣̟̫̱̳̗͜ ̷̲̜̘͙̣̩̹͓̟̣̖͋̔̒̋̌̌͆̓̇̌̏͋̅͑͌͊̀̏̈́͠͝ḓ̴̛̛̘͕̝̏̔͋̓̔̌́̊͐̆̆̈́͌̓̀̓͝͠͝o̸͙͍͔͕̬̗̰̦̮͚̰̼̅̀́̈́̽͌̊̐̀͛̈͠͝͠n̵̡̡͈̱̪͙̭̙̼̫̜̔̇́̓̈̑͂̃̈͆̀è̷̜͙̜̦͖̜͔͔͔̥̬̤͍̹̌̉̓͑͜͠ ̵̨̛̪͕͗͂̋̐̋̈̿̉̑̕̚̕̚ơ̸̺̍̈͂̍̋͒̋̒̉̐̅̎̀͝͝h̶̛̛̦̤̥̹̞͕͚̔̂́́̽͐̒́̍͆̃̏̅͝͝ ̴͕̼͓̫͔̬̤͙͚̭͛͆̓̋͊̍̓̀̏̐͐̂̽̇͜ͅg̸̖͉̮̭̳͇̰̘̤̹̜̝̅͒͆̆̄ͅͅơ̸̦͍̮̰̖̎̌̅̇̆́̈́̂̄̔̎́̊̓͌̀̃̚͠͠d̶͓̰̜̠̱̪̭͖̝̭̿̍̉͐͑̋́̔̽͗́̂̈́̋̎͒̈́̓̾͝ ̶̨̼͇̬̗͔̺̯̜̠͎̼͔̩͕̻͓̜̟̙̯̆́͂̑̾̄͋̈̔͛͠h̷̝̖̼͕̤̅̌̇͐̅̄́̎͘̕e̵̜̳͔͙̽̐̀͒̄̂̇̑̋͒̐̀̔́͠͝ ̴̧͓̟͍͂̿̉̍̎̈́̈̆͐̆̿̽̂̋̿̍͋͝͝c̵̢̧̯̥͕͓͚̰̼̝̆̀̍̓͜ǫ̴̢̡̧̛̛̛̹̰͚͙͙̜͎̯̪̪͇̭̆͆͐͒̈́̎̀̔̈̀̽̏̂͝m̸̹̤̿̅́̾̀͋̏̔̆͌̄̎͆̽̍́̈́͘e̷̬̹̠͇̺̭͉̖̮̞̥̜̪̘̍͂͛͐s̵̢̛͈̮̝͚̙̰͕͚̩̘̺͎̀̇͂͂̓̑͌̃̋̄̌̎̾͗̽͑̇̚̚͝,̴͍̩͈͙̟͎͚̥͒̃̏̓̉͗̓͘ ̷̧̘͚͉̲͈̝̼̻̻̳̟͖͆̎̈́̍̿̌̈́͗̍̇͐̔̐̄͌̂̚͘̕͝͝H̸̛̰̭͑͗̉̈́̔̾̅͘͝E̶̢̛͚͉͇̭̯̹̜̳̳̼̗̎̈͋̈́̈̓͊̅̋̇̿̔͂̿̀̕͠ ̸̨̢͕̻̞͍̠̱͍̝̭͙̫̺̰͋̄̓͘C̷̨̤̝̖͓͍̤̲̭͆̏͐̓͛̽͐̄̍ͅȮ̴̡̳͙̤̠̮̤͕̤̲͍͉̈́M̴̢̛̹̻͔̹̩̯̥̣̼̜̯̹͌͊͊́̒͋̏͜ͅȨ̸̻̗͚͔̯͇̦̘̲̥̯̯̰̓̈́̓̉̓͑̑̀̉͛̍̓̏̅͛͗̂̑͘͝S̷̛͇͙͍̯̯̘͖̻̱̜͈͔̬̺͕̅͋́͊̈́͐̎̅̓̋͌͒͑̽̐̌͘͝!̸̞͙̘̠̭̜̩͈͈͆̇̐̓̌̍̑͊́̕

--------------------------------------------------------------------------------

On 2021-03-01T02:27:24Z, qtxie, commented:
<https://github.com/red/red/issues/4825#issuecomment-787591503>

    > ![](https://camo.githubusercontent.com/0cfdd9e52fa706a163103bf0646f5fc214b6bacdfb5fdb5f7b5987fb79fed2bc/68747470733a2f2f692e6779617a6f2e636f6d2f30656435396330303731336230616135363232353538313861643637373434372e706e67)
    > I made a screenshot so you can see the rendered color does not match the tuple.
    
    So the color tuple in console-cfg.red was `255.255.255`, then it's loaded as `253.246.227` after restarted the console? That's really weird.

--------------------------------------------------------------------------------

On 2021-03-01T02:30:39Z, qtxie, commented:
<https://github.com/red/red/issues/4825#issuecomment-787592433>

    > Another observation: make the background color something like 255.255.255.255.255.255.255.255.255.255.255.255 thru console settings, then try to scroll the console history. Don't know if it's related or not.
    
    That's because `255.255.255.255` is full transparent background color. ~~Seems D2D cannot handle it correctly.~~
    
    OK. Fixed.

--------------------------------------------------------------------------------

On 2021-03-01T02:36:13Z, qtxie, commented:
<https://github.com/red/red/issues/4825#issuecomment-787594154>

    > Could it be that load somehow loads junk into unused bytes (after tuple/size), and then D2D uses 4th byte as opacity even though tuple is of size=3 only?
    
    Yes. It's a problem. The new lexer does not zeroed all the unused bytes. Fixed by commit 81cf6866454d36c0155d8af0b894dd8a21cac7b6.

--------------------------------------------------------------------------------

On 2021-03-01T08:52:51Z, hiiamboris, commented:
<https://github.com/red/red/issues/4825#issuecomment-787775334>

    > So the color tuple in console-cfg.red was `255.255.255`, then it's loaded as `253.246.227` after restarted the console? That's really weird.
    
    No. It was 253.246.227, and loaded as such (properly), but shows gray 179.174.160 (apparently due to hidden alpha channel)

--------------------------------------------------------------------------------

On 2021-03-01T09:37:37Z, hiiamboris, commented:
<https://github.com/red/red/issues/4825#issuecomment-787807717>

    The fix works for me. But we still need to fix the lexer too, right?

--------------------------------------------------------------------------------

On 2021-03-01T11:01:10Z, qtxie, commented:
<https://github.com/red/red/issues/4825#issuecomment-787859516>

    No issue in the lexer.

--------------------------------------------------------------------------------

On 2021-03-02T15:46:41Z, 9214, commented:
<https://github.com/red/red/issues/4825#issuecomment-789004929>

    > No issue in the lexer.
    
    ```red
    >> 1.2.3 =? 1.2.3
    == false
    >> 1x2 =? 1x2
    == false
    >> 1:2 =? 1:2
    == false
    >> 1% =? 1%
    == false
    
    >> 1 =? 1
    == true
    >> 1.2 =? 1.2
    == true
    >> 1-2-3 =? 1-2-3
    == true
    >> $1 =? $1
    == true
    >> #"1" =? #"1"
    == true
    ```

--------------------------------------------------------------------------------

On 2021-03-02T16:09:25Z, hiiamboris, commented:
<https://github.com/red/red/issues/4825#issuecomment-789020973>

    @9214 nice catch! would you open a separate issue for that?

--------------------------------------------------------------------------------

On 2021-03-02T17:24:22Z, hiiamboris, commented:
<https://github.com/red/red/issues/4825#issuecomment-789074720>

    Thanks. Closing this one then.

