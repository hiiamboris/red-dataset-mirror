URL: <https://github.com/red/red/discussions/4972>
Date created: 2021-09-29T11:43:46Z

# How to do custom title bar on Windows 10 using the GUI DSL?

There are hard problems with custom title bar discussed in https://kubyshkin.name/posts/win32-window-custom-title-bar-caption/ along with a working solution to those.

Currently Red doesn't implement this which is a pity as people expect the Red "hackability" to extend over pretty much "anything".

Feel free to use these "hacks" to allow full customizability of the window (incl. title bar). This goes hand in hand with the trend "the app itself should draw everything itself" on other platforms (think Wayland, Mir, etc.).

## Comments

### greggirwin commented at 2021-09-29T19:00:16Z:

Good article. Thanks for posting it.

> people expect the Red "hackability" to extend over pretty much "anything"

I don't know who you're talking to, but is that a reasonable expectation? :^) In any case, if it's done with APIs, you can probably do it with R/S (until we have FFI in Red). We can't support everything out of the box, and if this feature is product critical, it can be done. But there's also something to be said for following OS standards.


### hiiamboris commented at 2021-12-20T10:56:10Z:

Nothing stops you from removing OS title bar and drawing it yourself:
<img src=https://i.gyazo.com/6467bfe7e6ea4be04162400c62dc7de3.png width=200></img>
code: `view/flags/tight [base 300x20 draw [line-width 0 fill-pen linear magenta cyan box 0x0 300x20 text 1x1 "My custom title bar"] base 20x20 cyan draw [line 3x3 16x16 line 3x16 16x3] on-down [unview] return base white 320x300 "workspace"] 'no-title`

It's just extra work to reinvent the wheel (e.g. Alt+Space menu on Windows), and there's a possibility that other programs are using your title bar to place some controls.


