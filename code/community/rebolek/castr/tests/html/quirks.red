Red[
	Known-problems: [
		https://law.justia.com/codes/alabama/2019/title-2/chapter-10/article-3/section-2-10-58
	]
]
[
	{<div><p>First para</div>}
	[div [p [#(none) "First para" #[]] #[]] #[]]
]
[
	{<div><p>First para<p>Second para</div>}
	[
		div [
			p [#(none) "First para" #[]] #[]
			p [#(none) "Second para" #[]]#[]
		] #[]
	]
]
[
	{<div id="master"><div id="inner"></strong> this is wrong</div></div>}
	[
		div [
			div [
				#(none) " this is wrong" #[]
			] #["id" "inner"]
		] #["id" "master"]
	]
]
[
	{<p><a href="/">Click here</a> to return to the home page.</a></p>}
	[
		p [
			a [#(none) "Click here" #[]] #["href" "/"]
			#(none) " to return to the home page." #[]
		] #[]
	]
]
[
	"<body><p>first<dd>second</body>"
	[
		body [
			p [
				#(none) "first" #[]
				dd [#(none) "second" #[]] #[]
			] #[]
		] #[]
	]
]
[
	{<a href="/">Section 2.<p.</a>}
	[
		a [#(none) "Section 2." #[]] #["href" "/"]
	]
]
[
	{<a href="/">Section 2.</p><p.</a>}
	[
		a [#(none) "Section 2." #[]] #["href" "/"]
	]
]
[
	{<b>start<a href="/">inner</p><p.</a>end</b>}
	[
		b [
			#(none) "start" #[]
			a [#(none) "inner" #[]] #["href" "/"]
			#(none) "end" #[]
		] #[]
	]
]
[
	{<body><p>text<b>bold</b></body>}
	[body [p [#(none) "text" #[] b [#(none) "bold" #[]] #[]] #[]] #[]]
]
[
	{<body><p>text<dl><dt></dt><dd>unclosed</body>}
	[body [p [#(none) "text" #[]] #[] dl [dt [] #[] dd [#(none) "unclosed" #[]] #[]] #[]] #[]]
]
[
	{<body><p>some text<dl><dt></dt><dd>(1) first unclosed dd;<dt></dt><dd>(2) second unclosed dd; <dt></dt></body>}
	[
		body [
			p [#(none) "some text" #[]] #[]
			dl [
				dt [] #[]
				dd [#(none) "(1) first unclosed dd;" #[]] #[]
				dt [] #[]
				dd [#(none) "(2) second unclosed dd; " #[]] #[]
				dt [] #[]
			] #[]
		] #[]
	]
]
[
	{<div><nav><a href="/">Link</a><span>span</span>follows unclosed link<a href="/">IC 2</nav></div>}
	[
		div [
			nav [
				a [#(none) "Link" #[]] #["href" "/"]
				span [#(none) "span" #[]] #[]
				#(none) "follows unclosed link" #[]
				a [#(none) "IC 2" #[]] #["href" "/"]
			] #[]
		] #[]
	]
]
