
#1740: GUI controls not reachable by pressing tab.
================================================================================
Issue is closed, was reported by mikolysz and has 24 comment(s).
[status.tested] [type.review] [GUI]
<https://github.com/red/red/issues/1740>

There is a problem with the red's gui targeting blind users using screen readers to hear what happens on the screen. It's impossible to access gui controls like buttons, text boxes etc. with the tab key. Screen reader users use the keyboard to access the computer, so, using programs written in red is very complicated for them.
This problem can also affect users that don't have a mouse. Setting  a tab order attribute by default  might be a solution.



Comments:
--------------------------------------------------------------------------------

On 2016-03-27T15:03:58Z, dockimbel, commented:
<https://github.com/red/red/issues/1740#issuecomment-202081622>

    Supporting TAB navigation is in our plans (as many other features), we just didn't have enough time to include everything in the 0.6.0 release. We should add it in the next releases.

--------------------------------------------------------------------------------

On 2016-04-16T06:27:40Z, mydoghasworms, commented:
<https://github.com/red/red/issues/1740#issuecomment-210746035>

     :+1: 
    When implementing this, please be so kind as to ensure that tabbing can also reach other controls like buttons. (Unlike Rebol/View, where you can tab between fields but not to buttons).

--------------------------------------------------------------------------------

On 2016-04-20T04:29:44Z, mydoghasworms, commented:
<https://github.com/red/red/issues/1740#issuecomment-212251407>

    Also, I suppose it would be nice if there were a way to express Tab order of controls. (Just something to think about; maybe you have already).

--------------------------------------------------------------------------------

On 2020-07-18T14:46:26Z, hiiamboris, commented:
<https://github.com/red/red/issues/1740#issuecomment-660493886>

    On order. We have a natural `pane` order, which is used as Z-order when faces overlap each other. I don't see any problems using it as Tab order. It's doable already. I've written it two times I think. I can externalize it in the future. The point is just to make an event function that captures Tab from certain face types (e.g. excluding `area`), and passes focus to the next/previous focusable face. It's not the tab order we should think about but the focusability.
    Obviously for buttons, fields and such - we just need to answer 2 questions:
    - is this face deeply visible? i.e. it is `visible?` and all it's parents are `visible?`
    - is this face deeply enabled?
    
    If both answers are true, then we can set focus to this face. Otherwise we need to continue scanning the face tree.
    But when we're talking about `base` or `rich-text`, it's not that simple. It may be a static image, background or illustration. Or it may be a fully interactive face. So we need `focusable?` facet or option for such faces to declare them as able to receive keyboard input and that they should be focused automatically on mouse click (or whatever means of mouse focusing are default on particular platform). And this little part is something that should be designed, not built ad hoc.
    
    Bigger issues start when you make a compound face. E.g. a Table. If the table is based on `base`, it may want to capture Tab itself, and handle it personally. E.g. move the edit field from one cell to another. And it should also be able to give up focus when Tab is pressed in the bottom rightmost cell. So there must also be a way for each face to control whether it is ready to give up focus or not. Which is also useful when validating input - to display an error tooltip and let the user fix the errors until focus can be given up.

--------------------------------------------------------------------------------

On 2020-07-18T23:07:12Z, greggirwin, commented:
<https://github.com/red/red/issues/1740#issuecomment-660555248>

    ZOrder is not related to layout coordinates, though it may work in some cases. It's a place to start, and `focusable?` is important. We also want to support access keys for non-focusable faces that can focus the next face in the pane. e.g. labels and fields.

--------------------------------------------------------------------------------

On 2020-07-19T09:37:13Z, hiiamboris, commented:
<https://github.com/red/red/issues/1740#issuecomment-660616780>

    > ZOrder is not related to layout coordinates
    
    This is how VID will lay out faces. One by one, in the screen order. From top left to bottom right, but with the consideration of panels. And by switching the order at runtime one has full control over it (e.g. changing it from `below` to `across` after the window has been created, though it seems a rare use case).
    
    On access keys, I didn't read ya. Tab will go from field to field. Or from any face to next focusable face. Shift-Tab from any face to previous focusable face. Why you mention labels?
    
    And btw, what about scrollbars? I would probably hate to have them focusable, but blind people may disagree.

--------------------------------------------------------------------------------

On 2020-07-19T14:54:21Z, greggirwin, commented:
<https://github.com/red/red/issues/1740#issuecomment-660657670>

    VID, untainted by use of `at`, yes. But consider a GUI layout tool, where users can add faces in any order, via drag and drop. ZOrder is invisible to them, except for `bring to front`/`send to back` features.
    
    Labels:
    ```
    User &Name: [field]
    &Email: [field]
    ```
    `<key>+N` should set focus to the Name field, `<key>+E` should set focus to the Email field, 
    
    Good question on scrollbars. I don't know enough about accessibility to say what's best, so we need to learn. Dialected commands for navigation may be useful here: `[set focus to <face ID>]`. If we can figure out how to leverage that kind of thing for internal dispatch systems, where the messages are parameterized, it's a win all around.

--------------------------------------------------------------------------------

On 2020-07-19T15:41:12Z, hiiamboris, commented:
<https://github.com/red/red/issues/1740#issuecomment-660665321>

    > But consider a GUI layout tool, where users can add faces in any order, via drag and drop. 
    
    Makes sense, okay. Though that just means a proper layout tool would order faces as they appear on screen, while the naive one would require it's users to manually fill in every face's tab order value.
    
    On accelerator keys - this is probably unconnected to tabbing. Just find the visible text face or button or menu. If it's a text face: select next field or the field to the right of it.

--------------------------------------------------------------------------------

On 2020-07-19T16:21:16Z, greggirwin, commented:
<https://github.com/red/red/issues/1740#issuecomment-660671057>

    One of those areas where prior art may inform our design. In earlier tools you specified a tab index for every face, which gave you fine grained control, and auto renumbering, if you "inserted" a value. We can probably cover most use cases with an automatic system, and see how far it goes. 

--------------------------------------------------------------------------------

On 2023-04-27T20:33:58Z, hiiamboris, commented:
<https://github.com/red/red/issues/1740#issuecomment-1526396247>

    Related quotes from browser accessibility guidelines:
    
    > [In general, avoid using tabindex greater than 0. Doing so creates maintainability problems and unexpected user behavior.](https://usability.yale.edu/web-accessibility/articles/focus-keyboard-operability)
    > [Focus order should be logical, and should generally follow the visual order of the page. CSS positioning and floats do not affect the focus order, even if they do affect the visual order.](https://usability.yale.edu/web-accessibility/articles/focus-keyboard-operability)
    
    > [Do not use tabindex values of 1 or greater to change the default keyboard navigation order.](https://webaim.org/techniques/keyboard/)
    
    English translation: arrange your DOM (pane) in the order of visual appearance and let browser do its thing.

--------------------------------------------------------------------------------

On 2023-04-27T20:35:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/1740#issuecomment-1526398597>

    Current workaround for this issue: https://codeberg.org/hiiamboris/red-common/src/branch/master/tabbing.red

--------------------------------------------------------------------------------

On 2023-11-21T17:04:14Z, hiiamboris, commented:
<https://github.com/red/red/issues/1740#issuecomment-1821318476>

    This is now working since https://github.com/red/red/commit/dce72b16a2b5677f5000435befc0b9bf64358125

