# Issue #5658: On GTK tab-panel access violation
<https://github.com/red/red/issues/5658>

I understand that tab-panel maintains tabs by having the name in the data block and a panel in the pane block. I found by probing with a simple two panel view this to be confirmed. However in more complex app when trying to change the name of a tab via the tab-panels data block that it had none.
Digging through docs I found Gregg Irwin's dyn-tab-panel.red example.

```

<img width="581" height="441" alt="Image" src="https://github.com/user-attachments/assets/41f4ef7e-fb63-4de3-a4e1-2dfce05dc2de" />

```

When clicking the check box nothing happens except at the third time a crash
Am I missing something has changed or is there a bug?



## hiiamboris on 2025-10-22T17:09:00Z
### 🤦‍♂️

The test code is:
```
Red [needs: view]

detail-tab: first layout/only [panel [text "hello"]]

toggle-detail: function [state [logic!]][
    probe state
    either state [
        insert at tabs/data 2 "Detail"
        insert at tabs/pane 2 detail-tab
    ][
        remove at tabs/data 2
        remove at tabs/pane 2
    ]
]

view [
    tabs: tab-panel [
        "General" [check "Detail" [toggle-detail face/data]]
        "Tags"    []
    ]
]
```
Which after 3 consecutive clicks on the "Detail" button on GTK produces:
```
*** Runtime Error 98: assertion failed
*** in file: /D/devel/red/red-src/master/runtime/datatypes/block.reds
*** at line: 83
***
***   --Frame-- --Code--  --Call--
***   FFCF4B90h 080925D1h red/block/rs-abs-at EFF09214h 3
***   FFCF4BC8h 0819D816h gui/append-tab 09F1FCD8h 09F1A938h
***   FFCF4C0Ch 0819FC0Ch gui/set-widget-child 09F1FCD8h 09F1A938h F2A053DCh
***   FFCF4D14h 081A500Fh gui/OS-make-view 09D279A4h 166853848
***   FFCF4D38h 081A6072h ctx||477~make-view 09D279A4h 09D279B4h
***   FFCF4E08h 08147641h show
***   FFCF4EC0h 08131CFCh on-face-deep-change*
***   FFCF4F04h 080E8B56h red/interpreter/call 09D276A4h F2CAE038h EFF0EDCCh 0
***   FFCF4F4Ch 080EAE7Ch red/interpreter/eval-code F2A2083Ch EFF0EE6Ch EFF0EE6Ch EFF0ED24h false 00000000h 00000000h F2A2083Ch 0 false
***   FFCF4FD0h 080EB728h red/interpreter/eval-expression EFF0EDDCh EFF0EE6Ch EFF0ED24h false false false
***   FFCF5020h 080EBD2Fh red/interpreter/eval EFF0ED24h true
***   FFCF5060h 080E8D75h red/interpreter/eval-function EFF09324h EFF0ED24h F2B858E4h
***   FFCF50A8h 080E8AB5h red/interpreter/call EFF09324h F2B021C8h F2B858E4h 16
***   FFCF50E8h 080AB37Fh red/object/fire-on-deep F2BF33BCh F2BF33CCh 09D27604h F2B857B4h 09D27614h 1 1
***   FFCF5138h 0808A927h red/ownership/check 09D27604h F2B857B4h 09D27614h 1 1
***   FFCF51C0h 080961D1h red/block/insert 09D27604h 09D27614h 09D275F4h false 09D275F4h false
***   FFCF51F8h 080D15F5h red/actions/insert 09D27604h 09D27614h 09D275F4h false 09D275F4h false
***   FFCF5228h 080D158Fh red/actions/insert* -1 -1 -1
***   FFCF5324h 080EAAFEh red/interpreter/eval-arguments 09D275F4h EFF02A44h EFF02A44h 09D275D4h 00000000h 00000000h 0 false
***   FFCF537Ch 080EAC9Fh red/interpreter/eval-code F2A1C43Ch EFF02A04h EFF02A44h 09D275D4h false 00000000h 00000000h F2A1C43Ch 0 false
***   FFCF5400h 080EB728h red/interpreter/eval-expression EFF02A04h EFF02A44h 09D275D4h false false false
***   FFCF5450h 080EBD2Fh red/interpreter/eval 09D275D4h true
***   FFCF5474h 080D29E4h red/natives/either* false
***   FFCF5568h 080EAAFEh red/interpreter/eval-arguments 09D275B4h EFF0298Ch EFF0298Ch EFF0278Ch 00000000h 00000000h 0 false
***   FFCF55C0h 080EAC9Fh red/interpreter/eval-code F2A1D0CCh EFF0295Ch EFF0298Ch EFF0278Ch false 00000000h 00000000h F2A1D0CCh 0 false
***   FFCF5644h 080EB728h red/interpreter/eval-expression EFF0295Ch EFF0298Ch EFF0278Ch false false false
***   FFCF5694h 080EBD2Fh red/interpreter/eval EFF0278Ch true
***   FFCF56D4h 080E8D75h red/interpreter/eval-function 09D27594h EFF0278Ch EFF1BDECh
***   FFCF571Ch 080E8AB5h red/interpreter/call 09D27594h F2CAE038h EFF1BDECh 0
***   FFCF5764h 080EAE7Ch red/interpreter/eval-code F2A2626Ch EFF1BE0Ch EFF1BE0Ch EFF1BC3Ch false 00000000h 00000000h F2A2626Ch 0 false
***   FFCF57E8h 080EB728h red/interpreter/eval-expression EFF1BDFCh EFF1BE0Ch EFF1BC3Ch false false false
***   FFCF5838h 080EBD2Fh red/interpreter/eval EFF1BC3Ch true
***   FFCF5878h 080E8D75h red/interpreter/eval-function 09D27564h EFF1BC3Ch F291EEA4h
***   FFCF58C0h 080E8AB5h red/interpreter/call 09D27564h F282B398h F291EEA4h 0
***   FFCF5908h 080EAE7Ch red/interpreter/eval-code 09D27474h F291EED4h F291EED4h 09D27554h false 00000000h 00000000h 09D27474h 0 false
***   FFCF598Ch 080EB728h red/interpreter/eval-expression F291EEB4h F291EED4h 09D27554h false false false
***   FFCF59DCh 080EBD2Fh red/interpreter/eval 09D27554h true
***   FFCF5A3Ch 080D408Dh red/natives/do* false -1 -1 -1 -1
***   FFCF5B40h 080EAAFEh red/interpreter/eval-arguments 09D27544h F291ED2Ch F291ED3Ch 09D27504h 00000000h 00000000h 0 false
***   FFCF5B98h 080EAC9Fh red/interpreter/eval-code F2A1D22Ch F291ED1Ch F291ED3Ch 09D27504h true 00000000h 00000000h F2A1D22Ch 0 false
***   FFCF5C1Ch 080EB728h red/interpreter/eval-expression F291ED1Ch F291ED3Ch 09D27504h false true false
***   FFCF5D38h 080E9ACEh red/interpreter/eval-arguments 09D27524h F291ED0Ch F291ED3Ch 09D27504h F291ECECh F291ED54h 0 false
***   FFCF5D90h 080EAC9Fh red/interpreter/eval-code F2A1C46Ch F291ECFCh F291ED3Ch 09D27504h true F291ECECh F291ED54h F2A1C46Ch 0 false
***   FFCF5E14h 080E9559h red/interpreter/eval-path F291ECECh F291ECFCh F291ED3Ch 09D27504h false false false false
***   FFCF5E90h 080EB7A7h red/interpreter/eval-expression F291ECFCh F291ED3Ch 09D27504h false false false
***   FFCF5EE0h 080EBD2Fh red/interpreter/eval 09D27504h true
***   FFCF5F20h 080D835Fh red/natives/catch* true 1
***   FFCF5F70h 08145F65h do-safe
***   FFCF5FC8h 0814647Dh do-actor
***   FFCF6038h 0813792Fh ctx||469~awake F2829978h
***   FFCF6078h 0818B59Fh gui/make-event 09EA2168h 0 26
***   FFCF60C8h 081996F9h gui/button-toggled 09EA2168h 09EA2168h
***   FFCF6A18h F70D55F2h <external>
```

`Red 0.6.6 for Linux built 29-Jun-2025/12:36:11` (doesn't show commit for some reason)


## guaracy on 2025-10-23T03:41:24Z
I’ll wait for this fix before opening a new issue.

When running from the command line, the program crashes on the first selection.

When launched from the Red View console, it crashes after 21 selections.

It doesn’t crash on Windows.

```red
Red [
  Needs: 'View
]

json: load-json read https://api.sampleapis.com/rickandmorty/characters

personagens: function[][
  db: copy []
  foreach item json [
    append db item/name
  ]
  return db
]

view [
  title "Rick And Morty"
  backdrop beige
  tl: text-list 150x200
  [
    ix: tl/selected
    im/image: load to url! json/:ix/image
    tx/text: json/:ix/type
  ]
  im: base 200x200
  return
  tx: text 300 "type"
  do [tl/data: personagens]
]
```

```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.6 ahead: 0 date: 19-Mar-2025/13:09:25 commit: #6942c7a021253150c3e3cf90428305892340db03 ]
PLATFORM: [ name: "Linux Mint 22.2" OS: 'Linux arch: 'x86_64 version: 6.14.0 build: {#33~24.04.1-Ubuntu SMP PREEMPT_DYNAMIC Fri Sep 19 17:02:30 UTC 2} ]
--------------------------------------------
```





## hiiamboris on 2025-10-23T12:13:20Z
@guaracy your crash has a different, GC-related, trigger. ~~You should open a separate issue~~ (nevermind, I did - #5659). I could reproduce it twice (21 is arbitrary though), and both times the crash happened in block/head:
```
*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/master/runtime/datatypes/block.reds
*** at line: 50
***
***   --Frame-- --Code--  --Call--
***   FFCEC758h 0808E4DEh red/block/rs-head F2944DDCh
```


