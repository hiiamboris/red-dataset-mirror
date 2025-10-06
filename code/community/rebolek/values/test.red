Red[]

do %values.red

; MAKE-FUNC

tests: [
	"fn:x y;x + y" ["fn" "x y" "x + y"]
	"fn: x y ;x + y" ["fn" "x y" "x + y"]
	"fn;print 1" ["fn" "" "print 1"]
	"fn%t;t: now;print t" ["fn" "/local t" "^-^/^-t: now^/^-print t^/"]
	"fn:x y%t;t: x + y;t" ["fn" "x y /local t" "^-^/^-t: x + y^/^-t^/"]
]
index: 1
foreach [test result] tests [
	out: either result = make-func test ["Passed"]["Failed"]
	print rejoin ["#" index " - " out]
	index: index + 1
]
