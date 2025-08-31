
#2586: Exclude percent! from trig functions
================================================================================
Issue is closed, was reported by greggirwin and has 12 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/2586>

Today the trig funcs use `number!`, which includes `percent!`. Change to `integer! float!` in their type signatures. Percent support is not by design.


Comments:
--------------------------------------------------------------------------------

On 2017-04-16T16:13:37Z, greggirwin, commented:
<https://github.com/red/red/issues/2586#issuecomment-294359921>

    Also consider `log`, `square-root`, and `exp`

--------------------------------------------------------------------------------

On 2017-07-28T16:02:52Z, dockimbel, commented:
<https://github.com/red/red/issues/2586#issuecomment-318693710>

    Maybe it would be better to rather exclude `percent!` from `number!`, what do you think?

--------------------------------------------------------------------------------

On 2017-07-29T00:30:05Z, greggirwin, commented:
<https://github.com/red/red/issues/2586#issuecomment-318790204>

    Maybe so. Hard call as funcs that take `number!` today seem almost an even mix of those that could use it, and those where it doesn't make sense. Anyplace a range arg is used with `/part` it doesn't make sense, even with special handling. That should be done another way, e.g., if you want to change or take 50% of items in a series.
    
    Categorically, it is a number of course. We'll have the same question with `money!` soon. 
    
    If we remove it now, very little code is likely to break. It just means adding it to type specs where you need it. If we later add it back, after learning more, still nothing breaks. There's just a little extra code there. If we leave it in now, but remove it later, we risk breaking a lot of code. Therefore, I think removing it, and maybe starting a wiki on numeric type goals and intended semantics, or at least some notes, is a good idea.

--------------------------------------------------------------------------------

On 2018-12-31T18:10:20Z, hiiamboris, commented:
<https://github.com/red/red/issues/2586#issuecomment-450676163>

    My, this is still not fixed...
    Affected functions (never mind the `f***` censorship):
    ```
    >> a: 0.1 b: 10% c: 10  a = b
    true
    
    >> foreach w [atan arctangent asin arcsine acos arccosine tan tangent sin sine cos cosine exp] [
      f: get w foreach v reduce [a b c] [prin [w v "=>"] print [try [f v]]] print ""
    ]
    
    atan 0.1 =>0.09966865249116204
    atan 10% =>
    *** Script Error: f does not allow percent! for its angle argument
    *** Where: f*** Stack: f 
    atan 10 =>
    *** Script Error: f does not allow integer! for its angle argument
    *** Where: f*** Stack: f 
    
    arctangent 0.1 =>5.710593137499643
    arctangent 10% =>-89.99999996664947                          ;-- nonsense!
    arctangent 10 =>84.28940686250037
    
    asin 0.1 =>0.1001674211615598
    asin 10% =>
    *** Script Error: f does not allow percent! for its angle argument
    *** Where: f*** Stack: f 
    asin 10 =>
    *** Script Error: f does not allow integer! for its angle argument
    *** Where: f*** Stack: f 
    
    arcsine 0.1 =>5.739170477266787
    arcsine 10% =>
    *** Math Error: math or number overflow
    *** Where: f*** Stack: 
    arcsine 10 =>
    *** Math Error: math or number overflow
    *** Where: f*** Stack: 
    
    acos 0.1 =>1.470628905633337
    acos 10% =>
    *** Script Error: f does not allow percent! for its angle argument
    *** Where: f*** Stack: f 
    acos 10 =>
    *** Script Error: f does not allow integer! for its angle argument
    *** Where: f*** Stack: f 
    
    arccosine 0.1 =>84.26082952273322
    arccosine 10% =>
    *** Math Error: math or number overflow
    *** Where: f*** Stack: 
    arccosine 10 =>
    *** Math Error: math or number overflow
    *** Where: f*** Stack: 
    
    tan 0.1 =>0.1003346720854506
    tan 10% =>
    *** Script Error: f does not allow percent! for its angle argument
    *** Where: f*** Stack: f 
    tan 10 =>
    *** Script Error: f does not allow integer! for its angle argument
    *** Where: f*** Stack: f 
    
    tangent 0.1 =>0.0017453310241888
    tangent 10% =>0.90040404429784                          ;-- nonsense!
    tangent 10 =>0.176326980708465
    
    sin 0.1 =>0.09983341664682816
    sin 10% =>
    *** Script Error: f does not allow percent! for its angle argument
    *** Where: f*** Stack: f 
    sin 10 =>
    *** Script Error: f does not allow integer! for its angle argument
    *** Where: f*** Stack: f 
    
    sine 0.1 =>0.001745328365898309
    sine 10% =>0.6691306063588582                           ;-- nonsense!
    sine 10 =>0.1736481776669303
    
    cos 0.1 =>0.9950041652780258
    cos 10% =>
    *** Script Error: f does not allow percent! for its angle argument
    *** Where: f*** Stack: f 
    cos 10 =>
    *** Script Error: f does not allow integer! for its angle argument
    *** Where: f*** Stack: f 
    
    cosine 0.1 =>0.9999984769132877
    cosine 10% =>0.7431448254773942                           ;-- nonsense!
    cosine 10 =>0.984807753012208
    
    exp 0.1 =>1.105170918075648
    exp 10% =>0.0                                             ;-- nonsense!
    exp 10 =>22026.4657948067
    ```

--------------------------------------------------------------------------------

On 2022-09-16T14:33:05Z, dockimbel, commented:
<https://github.com/red/red/issues/2586#issuecomment-1249447236>

    @hiiamboris Can you submit the last 2 commits above as a PR?

--------------------------------------------------------------------------------

On 2022-09-16T14:56:59Z, hiiamboris, commented:
<https://github.com/red/red/issues/2586#issuecomment-1249472715>

    Sure, a little later. Now I wonder who stopped me previously...

