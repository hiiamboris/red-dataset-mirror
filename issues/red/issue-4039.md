
#4039: GTK: crash when setting panel's size or appending it to parent's pane
================================================================================
Issue is closed, was reported by loziniak and has 20 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/4039>

Red crashes when resizing window like that: `panel-face/size: 200x200`, after some manipulations - replacing another pane by `remove`-ing it from parent's `pane` and `append`-ing the new one. When we want to replace it back, the error occurs.

```
-- on-change event -- 
	face : panel 
	word : size 
	old  : pair 
	new  : pair
show: panel  with?: false

(console-view:4101): GLib-GObject-CRITICAL **: 23:04:29.861: g_object_get_qdata: assertion 'G_IS_OBJECT (object)' failed

(console-view:4101): Gtk-CRITICAL **: 23:04:29.864: gtk_widget_set_size_request: assertion 'GTK_IS_WIDGET (widget)' failed

(console-view:4101): Gtk-CRITICAL **: 23:04:29.864: gtk_widget_queue_resize: assertion 'GTK_IS_WIDGET (widget)' failed

(console-view:4101): Gtk-CRITICAL **: 23:04:29.864: gtk_widget_queue_draw: assertion 'GTK_IS_WIDGET (widget)' failed
show: text  with?: true
show: panel  with?: true
show: base  with?: true
show: panel  with?: true
show: text  with?: true
show: text  with?: true

(console-view:4101): Gtk-CRITICAL **: 23:04:29.865: gtk_widget_show_all: assertion 'GTK_IS_WIDGET (widget)' failed

(console-view:4101): Gtk-CRITICAL **: 23:04:29.865: gtk_widget_grab_focus: assertion 'GTK_IS_WIDGET (widget)' failed

(console-view:4101): GLib-GObject-CRITICAL **: 23:04:29.865: g_object_get_qdata: assertion 'G_IS_OBJECT (object)' failed

*** Runtime Error 1: access violation
*** in file: /mnt/share/prj/red/gtk/red-github/modules/view/backends/gtk3/gui.reds
*** at line: 1618
***
***   stack: gui/OS-show-window 155186768
***   stack: gui/OS-refresh-window 155186768
***   stack: ctx408~refresh-window 09210BC4h
***   stack: show
***   stack: show
***   stack: show
***   stack: red/_function/call 092106B4h F7EEC884h
***   stack: red/interpreter/eval-code 092106B4h F55827ACh F55827ACh false 00000000h 00000000h F3AFF118h
***   stack: red/interpreter/eval-expression F558279Ch F55827ACh false false false
***   stack: red/interpreter/eval 092106A4h true
***   stack: red/natives/if* false
***   stack: red/interpreter/eval-arguments F3AFE458h F5582588h F5582588h 00000000h 00000000h
***   stack: red/interpreter/eval-code F3AFE458h F5582558h F5582588h false 00000000h 00000000h F3AFE458h
***   stack: red/interpreter/eval-expression F5582558h F5582588h false false false
***   stack: red/interpreter/eval 09210664h true
***   stack: red/natives/either* false
***   stack: red/interpreter/eval-arguments F3AFEE58h F5581238h F5581238h 00000000h 00000000h
***   stack: red/interpreter/eval-code F3AFEE58h F5581208h F5581238h false 00000000h 00000000h F3AFEE58h
***   stack: red/interpreter/eval-expression F5581208h F5581238h false false false
***   stack: red/interpreter/eval 09210634h true
***   stack: red/natives/if* false
***   stack: red/interpreter/eval-arguments F3AFE458h F5580DD8h F5580DD8h 00000000h 00000000h
***   stack: red/interpreter/eval-code F3AFE458h F5580DA8h F5580DD8h false 00000000h 00000000h F3AFE458h
***   stack: red/interpreter/eval-expression F5580DA8h F5580DD8h false false false
***   stack: red/interpreter/eval F5580CF4h true
***   stack: red/interpreter/eval-function F557F148h F5580CF4h
***   stack: red/_function/call F557F148h F405DB4Ch
***   stack: red/object/fire-on-set 09210544h F535D7CCh 09210584h 09210574h
***   stack: red/object/eval-path 09210544h F535D7CCh 09210574h F535D3E8h false
***   stack: red/actions/eval-path 09210544h F535D7CCh 09210574h F535D3E8h false
***   stack: red/interpreter/eval-path F535D7CCh F535D408h F535D5B8h true true false false
***   stack: red/interpreter/eval-expression F535D408h F535D5B8h false false false
***   stack: red/interpreter/eval F528E64Ch true
***   stack: red/interpreter/eval-function 09210514h F528E64Ch
***   stack: red/_function/call 09210514h F7EEC884h
***   stack: red/interpreter/eval-code 09210514h F5572B8Ch F5572B8Ch false 00000000h 00000000h F3B067D8h
***   stack: red/interpreter/eval-expression F5572B2Ch F5572B8Ch false false false
***   stack: red/interpreter/eval F5572AB8h true
***   stack: red/interpreter/eval-function 092104E4h F5572AB8h
***   stack: red/_function/call 092104E4h F7ED797Ch
```

There is similar behavior when we try to change size AFTER `append`-ing the panel to parent's pane. But in that case `append` triggers an error, even before setting size.

```
-- on-deep-change event -- 
	owner      : window 
	action     : append 
	word       : pane 
	target type: block! 
	new value  : object! 
	index      : 1 
	part       : 1 
	auto-sync? : true 
	forced?    : false
show: panel  with?: true
show: text  with?: true
show: panel  with?: true
show: base  with?: true
show: panel  with?: true
show: text  with?: true
show: text  with?: true

(console-view:4153): Gtk-CRITICAL **: 23:07:12.040: gtk_widget_show_all: assertion 'GTK_IS_WIDGET (widget)' failed

(console-view:4153): Gtk-CRITICAL **: 23:07:12.040: gtk_widget_grab_focus: assertion 'GTK_IS_WIDGET (widget)' failed

(console-view:4153): GLib-GObject-CRITICAL **: 23:07:12.040: g_object_get_qdata: assertion 'G_IS_OBJECT (object)' failed

*** Runtime Error 1: access violation
*** in file: /mnt/share/prj/red/gtk/red-github/modules/view/backends/gtk3/gui.reds
*** at line: 1618
***
***   stack: gui/OS-show-window 147457616
***   stack: gui/OS-refresh-window 147457616
***   stack: ctx408~refresh-window 08AAFB54h
***   stack: show
***   stack: show
***   stack: show
***   stack: on-face-deep-change*
***   stack: red/_function/call 08AAF614h F7F36884h
***   stack: red/interpreter/eval-code 08AAF614h F55AF180h F55AF180h false 00000000h 00000000h F3B01F88h
***   stack: red/interpreter/eval-expression F55AF0F0h F55AF180h false false false
***   stack: red/interpreter/eval F55AF07Ch true
***   stack: red/interpreter/eval-function F55AB874h F55AF07Ch
***   stack: red/_function/call F55AB874h F40978BCh
***   stack: red/object/fire-on-deep F5434EE0h F5434EF0h 08AAF584h 08A9BD14h 08AAF594h 1 1
***   stack: red/ownership/check 08AAF584h 08A9BD14h 08AAF594h 1 1
***   stack: red/block/insert 08AAF584h 08AAF594h 08AAF574h false 08AAF574h true
***   stack: red/actions/insert 08AAF584h 08AAF594h 08AAF574h false 08AAF574h true
***   stack: red/actions/append* -1 -1 -1
***   stack: red/interpreter/eval-arguments F3AFE4E8h F53A74B8h F53A75B8h 00000000h 00000000h
***   stack: red/interpreter/eval-code F3AFE4E8h F53A7498h F53A75B8h false 00000000h 00000000h F3AFE4E8h
***   stack: red/interpreter/eval-expression F53A7498h F53A75B8h false false false
***   stack: red/interpreter/eval F52D864Ch true
***   stack: red/interpreter/eval-function 08AAF514h F52D864Ch
***   stack: red/_function/call 08AAF514h F7F36884h
***   stack: red/interpreter/eval-code 08AAF514h F55BCB8Ch F55BCB8Ch false 00000000h 00000000h F3B067D8h
***   stack: red/interpreter/eval-expression F55BCB2Ch F55BCB8Ch false false false
***   stack: red/interpreter/eval F55BCAB8h true
***   stack: red/interpreter/eval-function 08AAF4E4h F55BCAB8h
***   stack: red/_function/call 08AAF4E4h F7F2197Ch
***   stack: red/interpreter/eval-code 08AAF4E4h F3C933C0h F3C933C0h false 00000000h 00000000h 08AAF444h
***   stack: red/interpreter/eval-expression F3C933A0h F3C933C0h false false false
***   stack: red/interpreter/eval 08AAF4D4h true
***   stack: red/natives/do* false -1 -1 -1
***   stack: red/interpreter/eval-arguments F3AFEFB8h F3C9337Ch F3C9337Ch 00000000h 00000000h
***   stack: red/interpreter/eval-code F3AFEFB8h F3C9336Ch F3C9337Ch false 00000000h 00000000h F3AFEFB8h
***   stack: red/interpreter/eval-expression F3C9336Ch F3C9337Ch false false false
***   stack: red/interpreter/eval 08AAF4B4h true
***   stack: red/natives/try* true 0
***   stack: do-safe
***   stack: do-actor
```


Platform: **Arch Linux, x64, Red compiled from source - commit 902a4175918**


Comments:
--------------------------------------------------------------------------------

On 2019-09-20T15:35:27Z, loziniak, commented:
<https://github.com/red/red/issues/4039#issuecomment-533604031>

    I've managed to extract minimal code that triggers the error. First click on `panel1`'s "Switch" button is ok, but when we then click on `panel2`'s button, the crash occurs.
    
    ```
    Red []
    ;system/view/debug?: true
    
    panel1: make face! [
    	type: 'panel
    
    	contents: [
    		below
    		text "Panel 1" 
    		button "Switch" [
    			print "1 -> 2"
    			remove find window/pane panel1
    			append window/pane panel2
    		]
    	]
    ]
    
    panel2: make face! [
    	type: 'panel
    
    	contents: [
    		below
    		text "Panel 2"
    		button "Switch" [
    			print "2 -> 1"
    			remove find window/pane panel2
    			append window/pane panel1
    		]
    	]
    ]
    
    window: layout []
    append window/pane layout/parent panel1/contents panel1 none
    layout/parent panel2/contents panel2 none
    
    view window
    ```

--------------------------------------------------------------------------------

On 2019-09-20T15:36:15Z, loziniak, commented:
<https://github.com/red/red/issues/4039#issuecomment-533604427>

    The error does not occur in Windows emulator, *Wine*.

--------------------------------------------------------------------------------

On 2019-09-22T19:00:21Z, rcqls, commented:
<https://github.com/red/red/issues/4039#issuecomment-533908282>

    After some debugging session, the issue is that after the second switch the GTK object initially associated to the `red` widget `panel1` (when added) is not anymore connected to it. My (really uncertain) guess is that `remove find window/pane panel1` is removing the connection of the GTK object to the widget `panel1`.... and I don't really understand how this is possible! It is the first time I see this kind of behavior...

--------------------------------------------------------------------------------

On 2019-09-23T06:03:46Z, rcqls, commented:
<https://github.com/red/red/issues/4039#issuecomment-533969316>

    @loziniak Just to let you  know that I found a fix. @dockimbel, do I have to wait for the new structure of `view` repo as a git submodule to propose a PR?

--------------------------------------------------------------------------------

On 2019-10-28T08:20:34Z, bitbegin, commented:
<https://github.com/red/red/issues/4039#issuecomment-546839249>

    it works on latest GTK branch

--------------------------------------------------------------------------------

On 2019-10-28T12:36:50Z, loziniak, commented:
<https://github.com/red/red/issues/4039#issuecomment-546927055>

    For me the problem persists for the script in my comment from 20 Sep. Error message:
    ```
    -- on-deep-change event -- 
    	owner      : window 
    	action     : append 
    	word       : pane 
    	target type: block! 
    	new value  : object! 
    	index      : 0 
    	part       : 1 
    	auto-sync? : true 
    	forced?    : false
    show: panel  with?: true
    show: text  with?: true
    show: button  with?: true
    
    (console-view:5217): Gtk-CRITICAL **: 13:22:11.434: gtk_widget_queue_draw: assertion 'GTK_IS_WIDGET (widget)' failed
    show: window  with?: false
    
    (console-view:5217): GLib-GObject-CRITICAL **: 13:22:11.436: g_object_get_qdata: assertion 'G_IS_OBJECT (object)' failed
    
    (console-view:5217): GLib-GObject-CRITICAL **: 13:22:11.436: g_object_get_qdata: assertion 'G_IS_OBJECT (object)' failed
    
    (console-view:5217): GLib-GObject-CRITICAL **: 13:22:11.436: g_object_get_qdata: assertion 'G_IS_OBJECT (object)' failed
    
    (console-view:5217): GLib-GObject-CRITICAL **: 13:22:11.436: g_object_get_qdata: assertion 'G_IS_OBJECT (object)' failed
    
    *** Runtime Error 1: access violation
    *** in file: /home/devel/prj/red/gtk/red-github/runtime/datatypes/object.reds
    *** at line: 114
    ***
    ***   stack: red/object/get-values 081E0550h
    ***   stack: gui/get-face-values 0978C258h
    ***   stack: gui/set-widget-child 09777238h 0978C258h F533A9C0h
    ***   stack: gui/change-pane 09777238h F53414E4h 108
    ***   stack: gui/OS-update-view 095B7894h
    ***   stack: ctx||441~update-view 095B7894h
    ***   stack: show
    ***   stack: on-face-deep-change*
    ***   stack: red/_function/call 095B7614h F7ECE884h
    ***   stack: red/interpreter/eval-code 095B7614h F5344E90h F5344E90h false 00000000h 00000000h F54F7554h
    ***   stack: red/interpreter/eval-expression F5344E00h F5344E90h false false false
    ***   stack: red/interpreter/eval F5344D8Ch true
    ***   stack: red/interpreter/eval-function F5341584h F5344D8Ch
    ***   stack: red/_function/call F5341584h F5232684h
    ***   stack: red/object/fire-on-deep F5518074h F5518084h 095B7584h 095A31F4h 095B7594h 0 1
    ***   stack: red/ownership/check 095B7584h 095A31F4h 095B7594h 0 1
    ***   stack: red/block/insert 095B7584h 095B7594h 095B7574h false 095B7574h true
    ***   stack: red/actions/insert 095B7584h 095B7594h 095B7574h false 095B7574h true
    ***   stack: red/actions/append* -1 -1 -1
    ***   stack: red/interpreter/eval-arguments F54F3A24h F535B374h F535B374h 00000000h 00000000h
    ***   stack: red/interpreter/eval-code F54F3A24h F535B354h F535B374h false 00000000h 00000000h F54F3A24h
    ***   stack: red/interpreter/eval-expression F535B354h F535B374h false false false
    ***   stack: red/interpreter/eval F535B280h true
    ***   stack: red/interpreter/eval-function 095B7544h F535B280h
    ***   stack: red/_function/call 095B7544h F7EB8DD0h
    ***   stack: red/interpreter/eval-code 095B7544h F528EFFCh F528EFFCh false 00000000h 00000000h 095B74A4h
    ***   stack: red/interpreter/eval-expression F528EFDCh F528EFFCh false false false
    ***   stack: red/interpreter/eval 095B7534h true
    ***   stack: red/natives/do* false -1 -1 -1
    ***   stack: red/interpreter/eval-arguments F54F44B4h F528EFB8h F528EFB8h 00000000h 00000000h
    ***   stack: red/interpreter/eval-code F54F44B4h F528EFA8h F528EFB8h false 00000000h 00000000h F54F44B4h
    ***   stack: red/interpreter/eval-expression F528EFA8h F528EFB8h false false false
    ***   stack: red/interpreter/eval 095B7514h true
    ***   stack: red/natives/try* true 0
    ***   stack: do-safe
    ***   stack: do-actor
    ***   stack: ctx||433~awake F7EBA258h
    ***   stack: gui/make-event 0978D348h 0 9
    ***   stack: gui/button-clicked 0978D348h 0978D348h
    ```
    The script was run by interpreter: `~/prj/red/gtk/red-github/console-view 4039.red`.

--------------------------------------------------------------------------------

On 2019-10-28T13:45:36Z, bitbegin, commented:
<https://github.com/red/red/issues/4039#issuecomment-546952837>

    still can't reproduce

--------------------------------------------------------------------------------

On 2019-10-28T14:21:07Z, rcqls, commented:
<https://github.com/red/red/issues/4039#issuecomment-546968456>

    It crashes also on my docker container too!

--------------------------------------------------------------------------------

On 2019-10-29T09:53:40Z, loziniak, commented:
<https://github.com/red/red/issues/4039#issuecomment-547341337>

    Reference to a discussion on Gitter: https://gitter.im/red/GTK?at=5db6f205e469ef43587d31af

--------------------------------------------------------------------------------

On 2019-10-31T12:32:41Z, loziniak, commented:
<https://github.com/red/red/issues/4039#issuecomment-548350782>

    Works for me with latest code.

