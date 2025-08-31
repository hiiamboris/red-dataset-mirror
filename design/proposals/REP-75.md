
#75: WISH: react/link to accept a single face
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
<https://github.com/red/REP/issues/75>

E.g. this is what I'm doing some times:
```
extend ...styles [
	my-style [
		template: [...]
		init: [
			react/link func [face _] [
				...
			] [face face]
		]
	]
]
```
`init` is evaluated from `make-face` with `face` bound to the `make-face`s (temporary) context, so I can't use `react [... face/facet]` there because `face` will be undefined by the time reaction gets evaluated. That's why I have to use `react/link` here, or do it's work of saving the objects myself.

I'd like to use simply `react/link func [face] [...] face` or `react/link func [face] [...] [face]` instead of `react/link func [face _] [...] [face face]`.



Comments:
--------------------------------------------------------------------------------

On 2020-05-17T19:32:56Z, hiiamboris, commented:
<https://github.com/red/REP/issues/75#issuecomment-629848639>

    As a workaround this works for me:
    ```
    	init: [
    		context copy/deep [
    			f: face
    			react [.. f/facet]
    		]
    	]
    ```

