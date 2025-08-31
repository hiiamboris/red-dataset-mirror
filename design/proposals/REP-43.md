
#43: DESIGN: Dialect for efficient scalar combinations of vectors and some other vector-related design thoughts
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
<https://github.com/red/REP/issues/43>

I have a few thoughts here resulted from https://github.com/red/red/issues/2216.
See also REPs on vectors https://github.com/red/REP/issues/12 and esp. https://github.com/red/REP/issues/10

The **agenda** is: vector! datatype must support fast **in-place** (to avoid allocations) operations on it **as a whole** (to exploit the fact that the same operation is applied to a huge number of elements).

I find a **solution** to that in a new **dialect**, that I'm drafting below, as well as hinting what **new possibilities** this solution opens and how.

## Dialect for efficient scalar combinations of vectors:
- efficient: aimed to achieve a balance between the **programmer's effort and program execution time**
- scalar: all calculations in this dialect are **scalar operations** on individual vector elements
- vectors: designed to work with vectors of the **same size** so that i-th items of source vectors are mapped into i-th item of the target vector

I'm going to refer to this dialect as `scalar [expression..]`, highlighting it's scalar nature. A better name is welcome, but I haven't found one yet.

### I. Ideally it should proceed like this:

Given a Red expression: `scalar [target-vector: expression...]`
e.g.
```
scalar [a: a * a + tan a / ((p/q + 1) + b)]
```
where `a` is some big vector, `b` is another vector, `b/size = a/size`, `p/q` is a constant: `p/q: 0.1`

1. **Resolve Red symbols** (words, paths) into **constants & vector pointers** (ignoring words that resolve to any types(ets) except number! and vector!)
e.g.
`a:` is resolved as a target vector `a`
`a` and `b` are resolved as source vectors (and pointers to vector data are saved)
`p/q` is replaced in the expression by it's value `0.1`
`tan` is left out by this step, as it resolves to a function
`*`, `+`, `/` and all the other R/S operators must be probably hard-coded to be ignored on this stage too

2. **Resolve** previously unresolved symbols in the **R/S namespace** (words, paths) into function pointers (see below)
e.g.
`tan` resolves to a pointer to an R/S tangent function of the same name

3. **Precalculate** expressions that consist solely of constants and replace those expressions with the result (only a convenience move, not important)
e.g.
`(p/q + 1)` is replaced by a constant = `1.1`

4. **Verify** that all vectors mentioned are of the **same size** (not necessarily one-dimensional), throw exceptions if needed

5. At this point, ideally, we should have **constructed** an anonymous R/S-level **function** that will take pointers to vector elements as arguments. This function should be then **evaluated for each** `i` in `[1,vector size]`, putting the results into the target vector
e.g.
`a/i` is set to the result of `a/i * a/i + tan a/i / (1.1 + b/i)`

### II. Going back to earth:

However, as Red symbols are resolved in runtime and R/S symbols are only known to the compiler, this outcome may be hard to achieve.

So, an **alternative** would be to swap 1 & 2.

The *problem* then is that R/S symbols will have *higher priority* than those defined in Red, even local to the current function. Depending on R/S global namespace pollution it may lead to weird experience. So if this algorithm is chosen, an attempt should be made to *limit the set of R/S functions* available to this dialect.

Perhaps, a specific R/S context (namespace) should be reserved for this dialect and it will only resolve functions defined within that namespace.

### III. On R/S symbol resolution:

A simple **limited version** of the dialect might support only math operators and basic trigonometry. For a limited set of functions, their symbol resolution can be done as a `switch` block. It will however be possible to use it **in the interpreter**.

A more **advanced version** should be able to construct a new anonymous function taking vector data pointers as arguments, and then call this function for every vector element.
This version should be able to call **arbitrary R/S functions**, including those previously defined by the coder in a Red file inside a `#system []` block.
It will **require compilation** to be able to access R/S code (or JIT compilation on later stages of Red development).

### IV. Some design cues:

1. The expression must have **a single target** (designated by a set-word/set-path). No symbols used as vector sources in subexpressions will change their data.
It may be possible later to chain a few expressions in a single block if it will improve the readability:
`scalar [a: b + c  d: e + c]` <=> `scalar [a: b + c] scalar [d: e + c]`

2. **Explicit target** designation allows more sophisticated calculations to be done in one run:
e.g.
`scalar [a: b + c]` places the result of `b + c` into `a`
while with implicit targeting (e.g. `scalar [a + b]` to modify `a`) it would have required two operations, including an allocation: `a: copy b  scalar [a + b]`

3. **Constants** (and symbols resolved to constants) **are fixed** for the whole run:
```
v: vector [1 2 3]
scalar [v: v + v/2]  	; <- v/2 resolves to `2` and the whole expr is equivalent to [v: v + 2]
```
Otherwise, v/2 would change mid-evaluation, producing a result that **(a)** it would be hard to reason about, **(b)** prevents optimizations.

4. **In-place slices** (multi-dimensional vectors are still absent in Red, so it's purely theoretical here...)

a) 2D (and higher dimensional) vectors should support an **easy way** to get their **slices**.
These slices should refer to the **same RAM** area, but may have **different dimensions**. By modifying a slice one modifies the original vector.

**An example.** For a matrix it's very useful to read/modify the row or a column.
Suppose we have `m/:i` syntax to get the i-th **row** of the matrix `m`. How do we get a **column**?
Since vectors indices are 1-based, `0` can be used as a shortcut for **"whole range"**. So then `m/0/:j` may get the `j-th` column, while `m/:i/:j` gets the j-th item in i-th row.

**Note** that `m/0/0` = `m/0` = `m` here are all **equivalent**, **except for path** accessors: `m/:i` is different from `m/0/:i`, and `m/0/0/:i` is an error for a 2D vector.

**Note 2:** 1-based indexing is currently consistent with `image!` type and the **image** can be seen as a 2D **vector** of tuples, supporting all vector operations.

b) Another, more **general slice** operation seems also useful:
`v-slice: slice vector x1 x2`, where `x1` and `x2` are either integers or blocks of length equal to the number of vector dimensions, e.g. `slice matrix [i - 1 j - 1] [i + 1 j + 1]` is a 3x3 slice.
**Note:** Makes sense to automatically **reduce** the blocks inside the slice function, like cause-error does. Otherwise it's 2 extra calls to reduce in every line.

**An example** where this slice is very desirable is filters:
```
	; let M be some (monochrome image) source matrix
	; and M' - an empty matrix of the same dimensions that we're filling ...
	w: matrix [ 		; some 5x5 weighted average blur filter
		1  4  7  4 1
		4 16 26 16 4
		7 26 41 26 7
		4 16 26 16 4
		1  4  7  4 1
	]
	scalar [w: w / 273] 	; normalize: 273 = sum w
	w': matrix 5x5
	repeat i m/size/1 [repeat j m/size/2 [
		s: slice m [i - 2 j - 2] [i + 2 j + 2]	; don't wanna copy: S slice refers to the data inside M
		scalar [w': w * s]			; W items are multiplied by S items and copied into W'
		m'/i/j: sum w' 				; becomes the result of filter application on m/i/j neighborhood
	]]
```

5. **Dimension ordering & transposition**
Vectors must hold their dimensions (e.g. 1st dimension = number of rows, 2nd = number of columns, 3rd = depth etc...). But along with these dimensions (hardcoded as 1,2,3..) they should also **hold the order** of those dimensions: path- and other accessors should be applied in this order.
e.g. a brand new 2D vector will have the order as `[1 2]`. To make transposition a fast operation we may just swap the order: `[2 1]`.
Here, I **generalize "transposition"** from 2D matrices to an arbitrary number of dimensions **as redefining the order** of these dimensions. Transposition will thus **affect path accessors** and vector-vector and matrix-vector multiplication when those become available (unrelated to this dialect).
Then, if matrix `m` is transposed (has the order of `[2 1]`), `m/:i` will get the row of this transposed `m`, which is equivalent to getting the column of original `m`.
Transposition should not have any effect on slices that were derived from the vector as **(a)** the internal representation of data remains the same and **(b)** slices should carry the dimension order around just as any "full" vector and should allow their transposition in the same manner.
Vector dimensions should be compared in the defined order at stage (I.4), e.g. to be able to sum a 10x100 vector with a 100x10 vector it will be enough to transpose one prior to calling `scalar []` or even Red's addition operator `+`. Then at stage (I.5) the order defines how vector data is iterated upon.

6. `sum` operation is a must-have for vectors and is already supported. That's great ☺

7. **Arbitrary R/S function support** seems very useful for regression analysis.
For example in [Gauss-Newton method of least-squares fitting](https://en.wikipedia.org/wiki/Gauss%E2%80%93Newton_algorithm) one will have a vector of coordinates, and one will iteratively calculate a vector of values of **some custom function** at those coordinates, as well as values of that function's 1st (and maybe 2nd) **partial derivatives** (which are again, custom functions).
The whole calculation efficiency is thus depends on the ability to execute user defined R/S functions from within the dialect expression.

### V. Proposed syntax:
```
syntax: [target source-expr]
target: [set-word! | set-path!]
source-expr: [term any [op term]]
term: [source | ahead paren! into source-expr | function-call]
function-call: [f-name f-arity term]
f-name: [word!]
source: [source-symbol | constant]
source-symbol: [path! | word! | get-path! | get-word!]
constant: [number!]
```

### VI. As a toy example of this dialect application
let's **solve a system of linear equations** using a very naive [Gaussian elimination](https://en.wikipedia.org/wiki/Gaussian_elimination) method.
Out in the world, **spline interpolation** of a data set can be a good example this technique's application.

The system is **defined** (in matrix form) as M (3=R rows, 4=1+R columns):
```
M: matrix [
	5 1 2 3
	2 2 0 0
	1 3 1 4
]
```
The naive **algorithm** will look like this:
```
; zero the subdiagonal items of the matrix
repeat j R [
	scalar [m/:j: m/:j / m/:j/:j]		; each row is scaled so that m/j/j = 1
	if j < R [
		for i j + 1 R [			; each row below j-th
						; gets 1..j columns zeroed
			scalar [m/:i: m/:i / (m/:i/:j / m/:j/:j) - m/:j]
			; grouping here   ---^  is only an optimization (see I.3)
		]
	]
]
; zero the superdiagonal items
for j R 2 [ 			; j  <- 3,2
	repeat i j - 1 [ 	; i  <- 1,2, 1
		; rows 1..j-1 get j+1..R columns zeroed:
		scalar [m/:i: m/:i - (m/:j * m/:i/:j)]
	]
]
```
After the executon, `m` contains the solved system:
```
[	1 0 0 -0.625
	0 1 0  0.625
	0 0 1  2.75		]
```

### VII. A model code (in Red) for the dialect, executing the above example.
```
; let's define a helper `for` loop to keep the main code clean
for: func ['w s e c] [
	set w s
	either e >= s
		[ until [do c  e < set w  1 + get w] ]
		[ until [do c  e > set w -1 + get w] ]
]

; source data
m: [
	[5 1 2 3]
	[2 2 0 0]
	[1 3 1 4]
]
R: 3

; dialect evaluator
scalar: function [expr] [
	r: first expr: copy/deep expr
	r: get as either set-path? :r [path!][word!] :r
	parse next expr rule: [some [
		change only [set x [path! | word! | number!]] (
			case [
				number? x [x]
				any-function? get x [x]
				number? x: get x [to float! x]
				block? x [as paren! compose/only [to float! pick (x) index? r]]
				'else [none]
			]
		)
	|	ahead paren! into rule
	]]
	forall r [change r do next expr]
	r
]

; application example
repeat j R [
	scalar [m/:j: m/:j / m/:j/:j]
	if j < R [
		for i j + 1 R [
			scalar [m/:i: m/:i / (m/:i/:j / m/:j/:j) - m/:j]
		]
	]
]
for j R 2 [
	repeat i j - 1 [
		scalar [m/:i: m/:i - (m/:j * m/:i/:j)]
	]
]

probe m
```



Comments:
--------------------------------------------------------------------------------

On 2019-02-13T19:31:19Z, 9214, commented:
<https://github.com/red/REP/issues/43#issuecomment-463335295>

    > A better name is welcome, but I haven't found one yet.
    
    [APL](https://en.wikipedia.org/wiki/APL_(programming_language)).
    
    > **Precalculate** expressions that consist solely of constants and replace those expressions with the result
    
    It's called "constant folding" and is a standard optimization that happens at compile-time. However, in this case, the cost is always paid at run-time, so I don't see any pay-off in introducing it. Unless if it's a way to counter `vector!` mutability.
    
    > At this point, ideally, we should have **constructed** an anonymous R/S-level **function** that will take pointers to vector elements as arguments.
    
    But that's an insane overhead, no? Not feasible without JIT compilation. Also - SIMD instruction support.
    
    > _limit the set of R/S functions_ available to this dialect
    
    Worth to note that Iversion's [book](http://www.jsoftware.com/papers/APL.htm), albeit dated, covers this aspect in a great detail. He basically devised an elegant programming math notation based on vector and matrix manipulation, and with a great emphasis on composability.
    
    > A more **advanced version** should be able to construct a new anonymous function taking vector data pointers as arguments, and then call this function for every vector element.
    
    ... [hooks](https://code.jsoftware.com/wiki/Vocabulary/hook) and [forks](https://code.jsoftware.com/wiki/Vocabulary/fork) in J (S and K combinators in disguise).
    
    To put it simply, a set of small vector / matrix operations with a couple of combinators (high order functions that combine other functions) should address "not polluting R/S namespace" goal and ease of compilation. 
    
    > The expression must have **a single target** (designated by a set-word/set-path). No symbols used as vector sources in subexpressions will change their data.
    
    In such case, I would suggest to move target vector out of dialect expression block.
    
    `scalar [a: b + c]` -> `scalar a [b + c]`
    
    That abstracts computation from the actual argument, and makes code generation more easier. I would also suggest to push it further and design this dialect with [point-free style](https://en.wikipedia.org/wiki/Tacit_programming) in mind.
    
    > In-place slices
    
    You should also think about row / column / matrix generalizations of operators. Concept of a *rank* (number of dimensions) applies here.
    
    In J:
    ```J
       >: i.3 3 NB. 3x3 matrix of natural numbers, or a 3-element vector of 3-element vectors
    1 2 3
    4 5 6
    7 8 9
       +/ >: i.3 3 NB. summing 3 vector elements (rows) together
    12 15 18
       +/"1 >: i.3 3 NB. apply sum to rank-1 elements of the matrix, that is, to rows (sum each row separately
    6 15 24 NB. sum each row separately and collect result into row's shape (3)
    ```
    
    Extrapolating from that, here's how to take a 2x2 "slice" of a matrix:
    ```J
       >:i.3 3
    1 2 3
    4 5 6
    7 8 9
       0 { >:i.3 3 NB. select zeroth element of a vector (first row)
    1 2 3
        0 {"1 >:i.3 3 NB. select zeroth elements of EACH vector (i.e. first column)
    1 4 7
       <0 1;0 1 NB. a box of two boxes (essentially J's equivalent of C's dereferencing operator)
    ┌─────────┐ NB. acts as a selector among multiple axes
    │┌───┬───┐│
    ││0 1│0 1││
    │└───┴───┘│
    └─────────┘
       (<0 1;0 1) { >:i.3 3 NB. select 0th and 1st rows, 0th and 1st columns (top-left 2x2 portion)
    1 2
    4 5
    ```
    
    It should be noted that J is a functional language, which does not modifies its arguments, instead creating new copies.
    
    > `sum` operation is a must-have for vectors and is already supported. That's great
    
    I don't think it's _that_ great. Suppose that `/` is a combinator that takes function on the left and "inserts" it between each element, and then evaluates the result. Then:
    
    ```J
       +/ 1 2 3 NB. sum
    6
       */ 1 2 3 NB. product
    6
       6 >. 2 NB. maximum out of two
    6
       >./ 3 1 7 2 0 5 NB. maximum out of a vector
    7
    ```
    
    That's what we should aim for [IMO](https://github.com/red/red/pull/3498#issuecomment-413458458), in the grand scheme of things.
    
    > let's **solve a system of linear equations** using a very naive [Gaussian elimination](https://en.wikipedia.org/wiki/Gaussian_elimination) method.
    
    I find it extremely off-putting seeing a dialect for matrix manipulation combined with nested `for` loops; it kinda defies the very meaning of array processing. That said, your dialect, as it is now, is too fine-grained, and needs to scale to high-dimensional structures (matrices, at the very least).
    
    ---
    
    I mused over "embedded APL-like dialect" since a while, mainly because of my interest in APL family and Iverson's work on mathematical notation, and because Rebol historically sucks at math, which left me largely dissatisfied when I tried to apply Red in a nearby setting. So, thumbs up from me for bringing this up.
    
    Nowadays, array languages are uncharted waters, obscured by terse syntax and peculiar rules of function composition (tacit programming); paradigm is much different from what we have in Red, and, in my view, can complement it in major ways, with potential generalization of many ideas (see my examples in `sum` PR above).
    
    Putting conceptual differences aside, implementation of array languages is a mystery too - within my recollection, all popular APL dialects are written in, how to put it, _APL style_ (see for example [kona](https://github.com/kevinlawler/kona) and [J](https://github.com/jsoftware/jsource/tree/master/jsrc) sources)**†**. Thus, mimicing existing implementations (or using them as references) is rather challenging.
    
    [Lang5](http://lang5.sourceforge.net/tiki-index.php) comes to mind, as it is written in Perl, so might be a bit more human-friendly in its implementation (as far as Perl goes). J's implementation is [documented](http://www.jsoftware.com/ioj/ioj.htm).
    
    [Kx systems](https://kxsystems.github.io/) with their K and Q languages should be mentioned too. [Q-SQL](http://code.kx.com/q4m3/9_Queries_q-sql/) is a human-friendly (that is, slightly more verbose than usual Q code) subset of a language that uses English words for operations.
    
    With that said, I don't think that creating a dialect solely for `vector!` manipulations is a good idea - it's too fine-grained, and all induced overhead doesn't pay off for such small-scale operations. And seeing "dialect that addresses `vector!` *inefficency* by avoiding allocations" that basically relies on JIT compilation with runtime verifications / optimizations  is a bit ironic. At this point in development it's too much of a price to pay for little gain, but I'm all hands for digging deeper.
    
    Instead, a bigger picture should be considered, with matrix manipulations, row / column operators, minimum set of general operators and means of their combination, concept of dimensions (ranks) and slices... but then we naturally arrive at APL, and there's no point to reinvent the wheel when people spent their lifetimes on this stuff. OTOH, it's easier to opt out of this endeavor and use an embeded [J engine](https://code.jsoftware.com/wiki/System/Interpreter), provided that a proper FFI is implemented.
    
    **†** not meant to cast aspersions on these projects and their authors or anything like that.

--------------------------------------------------------------------------------

On 2019-02-14T00:14:20Z, hiiamboris, commented:
<https://github.com/red/REP/issues/43#issuecomment-463429956>

    Thanks for your review @9214 :+1: 
    I don't think that APL-family model of vector combination is going to suit Red, but there should be practices well worth adapting and it's great to have your experience in this area.
    I myself think more in a C and R/S space, how things are going to work exactly ☻
    
    I should also say that I meant this dialect to be as simple and Red-compliant as possible. Imperative, not functional. I agree that a dialect with high abstraction level is also a benefit, but at this point I don't see if it's a good idea to mix these two (but I'm open to that option):
    - my idea was to combine the expressiveness of Red with the performance of R/S, as sort of a bridge (any other stuff we can apply this idea to, apart from vectors?)
    - operations supported here are all scalar functions, one-to-one mapping between vector elements; it's unrelated to most operations in vector/matrix algebra that either turn vector into a scalar or a matrix, or produce an output of different size
    - more abstract and advanced logic, determinants, matrix/vector algebra, HOF support might be fast enough at Red level and not benefit from R/S bridging enough to make it worth the while to fuse the two dialects
    
    This is probably the most important question here: one or two dialects to be.
    
    Let me clarify a few sources of possible confusion...
    
    > > Precalculate expressions that consist solely of constants and replace those expressions with the result
    
    > It's called "constant folding" and is a standard optimization that happens at compile-time. However, in this case, the cost is always paid at run-time, so I don't see any pay-off in introducing it. Unless if it's a way to counter vector! mutability.
    
    The idea is that if you have a vector of 10k items, you wouldn't want to recalculate constant expressions for each item. It can totally be done outside of the dialect scope though, and isn't really significant. Just a convenience to mind for the future, which may as well one day be supported by the compiler for arbitrary code.
    
    > > At this point, ideally, we should have constructed an anonymous R/S-level function that will take pointers to vector elements as arguments.
    
    > But that's an insane overhead, no? Not feasible without JIT compilation. Also - SIMD instruction support.
    
    JIT compilation is the ideal for the future, but pretty hard, yes.
    Fow now - we can keep it simple. You can get an array of function pointers and an array of vector data pointers, then put all the arguments into stack and call those functions one by one in a loop. This basic version is totally doable in the current Red state. With little effort. Promise :)
    
    > I would suggest to move target vector out of dialect expression block.
    
    > scalar [a: b + c] -> scalar a [b + c]
    
    Possible, but here's a counter-argument. Set-words/paths are a common Red practice, relied upon by many of it's faculties: `function` and `object`/`context` constructors, reactivity framework. Plus I find it more readable, and replacing `scalar` with `do` doesn't break things, just loses some performance.
    
    > You should also think about row / column / matrix generalizations of operators. Concept of a rank (number of dimensions) applies here.
    > ... your dialect, as it is now, is too fine-grained, and needs to scale to high-dimensional structures (matrices, at the very least).
    
    In my model you sum rows as (M is 2D) `m/:i + m/:j` and sum columns as `m/0/:i + m/0/:j`. If M is 3D, then `m/:i + m/:j`, `m/0/:i + m/0/:j` and `m/0/0/:i + m/0/0/:j` sum 2D planes of M with a specific coordinate fixed. After all, no matter how many dimensions we have, we can linearly each element in a linear succession.
    
    > > sum operation is a must-have for vectors and is already supported. That's great
    
    > I don't think it's that great. Suppose that / is a combinator that takes function on the left and "inserts" it between each element, and then evaluates the result.
    
    I agree, and with this dialect we can rewrite both sum and functions defined in the REP #10, and any other function we can imaging. But `sum` is kinda special since it's just everywhere - in dot-product, in modulus, etc ;)
    
    > I find it extremely off-putting seeing a dialect for matrix manipulation combined with nested for loops; it kinda defies the very meaning of array processing.
    
    It's just how the Gaussian elimination works, row by row. Plus ideally there should be zero checks, row reordering. I'd like to see how it would look on a higher abstraction plane, and if it will simplify the algorithm of complicate it.
    
    > SIMD
    
    This is also a very important point. Insights on how to make the dialect SIMD-friendly or what can prohibit us from using SIMD optimizations are welcome.

