
#4852: Anti-aliasing looks poor in recent releases
================================================================================
Issue is closed, was reported by dsunanda and has 16 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/4852>

**Describe the bug**
Anti-aliaisng is making lines very jagged

**To reproduce**
view [box  draw [line 0x0 100x100]]

**Expected behavior**
No jaggedness
**Screenshots**
[Old vs Recent](https://i.imgur.com/duDJAP7.png)

**Platform version**
Red 0.6.4 for Windows built 9-Mar-2021/9:08:43 commit #c4d9b0a

**Notes**
Gitter discussion:

 @ldci  - says not seeing problem at all on MacOS

@hiiamboris - not seeing transparency at all; suggests D2D regression



Comments:
--------------------------------------------------------------------------------

On 2021-03-12T09:50:00Z, ldci, commented:
<https://github.com/red/red/issues/4852#issuecomment-797373493>

    Thanks for reporting :)
    
    ***@***.***D41D15.0B4818A0]
    
    
    
    
    ***@***.***D41D15.0B4818A0]
    
    François Jouen
    École Pratique des Hautes Études
    Doyen de la section des Sciences de la Vie et de la Terre
    Chaire Psychobiologie du Développement
    Laboratoire Cognitions Humaine et Artificielle (CHArt) EA 4004 FED 4246
    Patios Saint-Jacques
    4-14, rue Ferrus - 75014 Paris
    01 53 63 61 64 / 06 87 13 76 81
    ***@***.******@***.***>
    www.ephe.fr<http://www.ephe.fr>
    
    Le 12 mars 2021 à 10:44, dsunanda ***@***.******@***.***>> a écrit :
    
    
    
    Before submitting
    Prior to opening this ticket, please share your finding in our dedicated chat<https://gitter.im/red/bugs>, so we can confirm it and help in reproducing it, including on other platforms.
    
    Describe the bug
    Anti-aliaisng is making lines very jagged
    
    To reproduce
    view [box draw [line 0x0 100x100]]
    
    Expected behavior
    No jaggedness
    Screenshots
    Old vs Recent<https://i.imgur.com/duDJAP7.png>
    
    Platform version
    Red 0.6.4 for Windows built 9-Mar-2021/9:08:43 commit #c4d9b0a
    
    Notes
    Gitter discussion:
    
    @ldci<https://github.com/ldci> - says not seeing problem at all on MacOS
    
    @hiiamboris<https://github.com/hiiamboris> - not seeing transparency at all; suggests D2D regression
    
    —
    You are receiving this because you were mentioned.
    Reply to this email directly, view it on GitHub<https://github.com/red/red/issues/4852>, or unsubscribe<https://github.com/notifications/unsubscribe-auth/AAXI3IKGI6YFBUALVIAPXRDTDHPADANCNFSM4ZB6D4EQ>.
    

--------------------------------------------------------------------------------

On 2021-03-20T15:26:43Z, dsunanda, commented:
<https://github.com/red/red/issues/4852#issuecomment-803378884>

    The initial problem is solved. But I can still see jaggies with other code when running Win10.
    
    I do not see the problem when running Win7. Other people (on Gitter) also say they do not see the problem.
    
    This is the code that goes jaggy for me on Win10:
    
    view/no-wait compose [h3 (system/build/date/date)
         b: box 100x100 draw [
          pen off fill-pen black spline 100x100 100x50 50x50 50x100
         ]]
         repeat w 30 [
            xx: random length? b/draw
            if pair? b/draw/:xx [b/draw/:xx: random 100x100]
            ]
    
    Jaggies as I see them:
    https://i.imgur.com/vSEmtJw.png

--------------------------------------------------------------------------------

On 2021-03-23T10:40:36Z, hiiamboris, commented:
<https://github.com/red/red/issues/4852#issuecomment-804798302>

    Reopened but we'll have to find some way to reproduce this.
    
    can't add status.waiting label due to GH bugs again

--------------------------------------------------------------------------------

On 2021-07-25T12:08:36Z, qtxie, commented:
<https://github.com/red/red/issues/4852#issuecomment-886192466>

    On my Win10:
    ![image](https://user-images.githubusercontent.com/1673525/126898379-58af8dd3-f2f7-4418-af98-27570dbaf6c0.png)

--------------------------------------------------------------------------------

On 2021-07-25T12:20:41Z, hiiamboris, commented:
<https://github.com/red/red/issues/4852#issuecomment-886193943>

    Could it be that some drivers do not support our antialiasing mode? Can we fall back to a lower one in that case?

--------------------------------------------------------------------------------

On 2021-08-22T03:39:44Z, qtxie, commented:
<https://github.com/red/red/issues/4852#issuecomment-903208430>

    The Jaggies mentioned by @dsunanda is not seem to related to antialiasing mode. IIRC, the transparent face (box) has this issue on some machines.

--------------------------------------------------------------------------------

On 2021-08-22T07:25:41Z, hiiamboris, commented:
<https://github.com/red/red/issues/4852#issuecomment-903226335>

    Even then still looks like a driver issue to me.

--------------------------------------------------------------------------------

On 2021-09-27T02:27:22Z, qtxie, commented:
<https://github.com/red/red/issues/4852#issuecomment-927458117>

    @hiiamboris Yes. Most probably a driver issue. The driver issues usually take a long time to be fixed. So an option to switch to software rendering could be useful. https://github.com/red/red/pull/4968

