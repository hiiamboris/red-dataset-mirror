Original URL: <https://red.qyz.cz/red-system-from-red.html>

# red-system-from-red

* * *

## How to use Red/System code from Red?

This is frequently asked question, so I decided to write a simple guide. It will take about 5 minutes to read it AND test it. Yes, it’s that easy.

First thing you need to know is that using Red/System code requires the Red code to be compiled. It is not possible to use R/S code in interpreter. At least yet. So, how to do it? There are more ways, let’s look at them.

`#system` directive lets you use Red/System code in Red directly. Here's an example:

```
Red[]

print "This print is on Red level and therefore adds newline."
#system [
    print "This print is on R/S level, so no newline here."
]
print "See? Now we are back in Red."
```

## routine

Using `#system` is nice, but you may want to reuse the code. Red provides you with `routine` function that is similar to `func`, but its body is written in Red/System instead of Red. See example:

```
Red[]

rs-print: routine [] [
    print "Now we are printing in "
    print "Red/System.
]

rs-print
```

## #include

You may also want to use existing R/S code or split your source to Red and Red/System part. For adding source file, we use `#include` directive in Red, but for Red/System code we need to use `#include` on R/S level. So instead of `#include %my-rs-file.reds` we need to use `#system [#include %my-rs-file.reds]`. Here is an example:

### Red/System part

First we need some Red/System code. Copy this source and save it as `%test.reds`:

```
Red/System [
    Title: "Red/System test"
]

double: func [
    value [integer!]
    return: [integer!]
] [
    return value + value
]
```

This simple function multiplies input by two. Now we have our R/S code and we can use it in Red:

### Red part

Here is the source for `%test.red`:

```
Red []

#system [
    #include %test.reds
]

rs-double: routine [
    value [integer!]
    return: [integer!]
] [
    double value
]

print rs-double 10
```

As you can see, here we are using both `#system` directive and `routine` to use Red/System in Red.

Another thing that the last example introduced is passing arguments from Red to R/S code and vice versa. Please note that this is possible directly for scalar values like `integer!` or `float!`, but for datatypes like `string!` or `block!`, some conversion must be done on Red/System level. **IT IS NOT POSSIBLE TO USE THESE TYPES DIRECTLY IN RED/SYSTEM!** The conversion is not that hard but that is something outside the scope of this article. So, maybe next time.

And now lets have fun with Red and Red/System, thanks!
