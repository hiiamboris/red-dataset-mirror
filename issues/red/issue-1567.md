
#1567: gui-console history scrolls in wrong order
================================================================================
Issue is closed, was reported by WiseGenius and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1567>

gui-console history scrolls in wrong order

Write some lines as follows:

```
red>> ;1
red>> ;2
red>> ;3
red>> ;4
red>> ;5
red>> ;6
red>> ;7
red>> ;8
red>> ;9
```

Scroll through the history randomly with the up and down keys, and you'll soon discover that the behaviour is not straightforward each time the direction is changed:

Expected behaviour (as in old console):

&uarr;  `;9`
&uarr;  `;8`
&uarr;  `;7`
&uarr;  `;6`
&uarr;  `;5`
&darr;  `;6`
&darr;  `;7`
&darr;  `;8`
&uarr;  `;7`
&uarr;  `;6`

Actual behaviour in gui-console:

&uarr;  `;9`
&uarr;  `;8`
&uarr;  `;7`
&uarr;  `;6`
&uarr;  `;5`
&darr;  `;4`
&darr;  `;5`
&darr;  `;6`
&uarr;  `;7`
&uarr;  `;6`

I suspect this may be related to #1562?



Comments:
--------------------------------------------------------------------------------

On 2016-02-02T00:55:30Z, qtxie, commented:
<https://github.com/red/red/issues/1567#issuecomment-178285843>

    Should be fix now.

