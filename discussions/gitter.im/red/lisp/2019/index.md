# Archived messages from: [gitter.im/red/red/lisp](/gitter.im/red/red/lisp/) from year: 2019

## Thursday 10th January, 2019

9214

[01:14](#msg5c369c76b35a087766593c92)Are there any Racketeers here who would like to chime in in \[this](https://www.reddit.com/r/redlang/comments/aebxct/contrast\_red\_with\_racket/) subbredit? @JacobGood1 ?  
"Contrast Red with Racket?"

## Friday 11st January, 2019

JacobGood1

[14:09](#msg5c38a3a59289cc7aa758c835)I am more familiar with Clojure, Common Lisp, and Shen, I never really dabbled in Racket. Everyone of those languages, even though they are all Lisps, treat meta-programming differently. In any case, I have nothing to add to the book you wrote for a response =).

[14:14](#msg5c38a4ae83c7e3776551f3fe)I really need to do some red programming again. I have been busy in a Smalltalk derivative, SkookumScript, doing game development. At this point, I am convinced that delimited continuations (fancy talk for coroutines), are the ultimate imperative abstraction, like monads are for functional languages.

[14:17](#msg5c38a5749289cc7aa758d233)By the way, there is an interesting implementation of common lisp called clasp, where the goal is seamless interoperability with c++. Here is a recent talk on it: https://www.youtube.com/watch?v=mbdXeRBbgDM

9214

[15:04](#msg5c38b08c66f3433023af45c9)@JacobGood1 I haven't grokked continuations yet.

JacobGood1

[16:47](#msg5c38c8a0dfe133282034cfe9)Someone of your capability would most likely be able to get a good grasp on them in a short time, if you had the desire to do so.

[16:49](#msg5c38c91883c7e37765530f73)Something like parse would be relatively easy (in the right context) to create with DC.

9214

[16:58](#msg5c38cb37a57b501bcfeb588b)@JacobGood1 I get that continuation represent "the rest of computation", and can follow code written in CP, but not sure what you mean by \*direct* continuation. In fact, continuation is just a function that accepts the computed result, with a caveat that it doesn't leave an activation frame on evaluation stack - Scheme people, who are fond of continuations, don't mention that, because they the take tail-call optimization for granted :wink: CPS itself is just a restricted and quirky version of lambda calculus. There's also \[this](https://www.cambridge.org/core/books/compiling-with-continuations/7CA9C36DCE78AD82218E745F43A4E740) book from Appel, which is a bit over my head. Anyway, off-topic.

greggirwin

[17:05](#msg5c38ccd183c7e3776553266b)I think that's still on topic for this group.

9214

[17:17](#msg5c38cf90b35a087766677ad8)OK. At some point there was a \[discussion](http://www.rebol.org/ml-display-message.r?m=rmlJQZK) about continuations in Rebol mailing list, and why they were removed in Rebol2. You still can write in CPS though, except that stack grows and it can get tricky without lexical scope (or `closure!`).

[17:22](#msg5c38d0bda57b501bcfeb7847)I think this topic will get more interesting after introduction of `stack` native.  
https://github.com/red/red/issues/3552#issuecomment-447326519

[18:18](#msg5c38ddfc83c7e37765539e27)\[Holy cow](https://www.semanticsarchive.net/Archive/902ad5f7/barker.continuations.pdf) :exclamation: :cow:

## Saturday 12nd January, 2019

JacobGood1

[06:00](#msg5c3982880999400604d9e0c9)Stack sounds interesting... Yea, there are some crazy papers/lectures written on DC that convince one that it is a truly powerful way to program. I meant to say earlier, that the reason I mentioned them is because Skookum basically built a language that focuses on using them.

I like how you mentioned that one must know blub in order to make a fair comparison with blah, in my view, two languages that focus on meta-programming cannot be compared since they can be bent into any language. Thus, as you demonstrated, the only way to really compare them is by their implementation, the underlying technology that empowers them to complete various tasks. Red should be quite compelling in the future as it fulfills its many promises to be a great language implementation.
