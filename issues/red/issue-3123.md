
#3123: Potential problems in random number generator
================================================================================
Issue is closed, was reported by harry75369 and has 8 comment(s).
<https://github.com/red/red/issues/3123>

Use the following code to calculate pi
```
Red []

NSAMPLE: 6000
NTEST: 2000

sample: func [] [
  x: random 1.0 - 0.5
  y: random 1.0 - 0.5
  r2: x * x + y * y
  either r2 <= 0.25 [ 1.0 ] [ 0.0 ]
]

getPi: func [] [
  ps: 0.0
  loop NSAMPLE [ ps: ps + sample ]
  4.0 * ps / NSAMPLE
]

main: func [] [
  random/seed (to integer! now)
  ps: 0.0
  loop NTEST [ ps: ps + getPi ]
  ps / NTEST
]

print main
```

In comparison, the following is C version
```
#include <stdlib.h>
#include <time.h>
#include <stdio.h>

#define NSAMPLE 6000
#define NTEST 2000

double random1() {
  int a = rand();
  return (double)a / RAND_MAX;
}

double sample() {
  double x = random1() - 0.5;
  double y = random1() - 0.5;
  double r2 = x * x + y * y;
  return r2 <= 0.25 ? 1.0 : 0.0;
}

double pi() {
  double ps = 0.0;
  for (int i = 0; i < NSAMPLE; i += 1) {
    ps += sample();
  }
  return 4.0 * ps / NSAMPLE;
}

int main() {
  srand(time(0));
  double ps = 0.0;
  for (int i = 0; i < NTEST; i += 1) {
    double p = pi();
    ps += p;
  }
  double pi = ps / NTEST;
  printf("%lf\n", pi);
  return 0;
}
```
### Expected behavior

It should give approximately 3.14 ( as the C version gives )

### Actual behavior

It gives approximately 3.69

### Steps to reproduce the problem

Compile with `-r` and run.

### Red version and build date, operating system with version.

Red 0.6.3, Mac.

### Notes

An irrelevant question. Red has much slower compile time (31.31s vs 0.06s) and run time (11.43s vs 0.21s) compared with C(gcc). Am I using it wrong?


Comments:
--------------------------------------------------------------------------------

On 2017-11-29T06:58:09Z, greggirwin, commented:
<https://github.com/red/red/issues/3123#issuecomment-347770456>

    If you want to compare with C, you should write in Red/System (the low level dialect of Red). Red is high level, includes the full runtime, and if you compile with `-r` rebuilds that all each time. There is no modular compilation in place yet.

--------------------------------------------------------------------------------

On 2017-11-29T07:10:25Z, greggirwin, commented:
<https://github.com/red/red/issues/3123#issuecomment-347772549>

    You have a number of issues in your code. Please join the Red rooms on Gitter and post there before opening tickets. I'll post an analysis here shortly, but there is no problem in Red, so I will also close this ticket.

--------------------------------------------------------------------------------

On 2017-11-29T07:11:12Z, greggirwin, commented:
<https://github.com/red/red/issues/3123#issuecomment-347772680>

    First, the working code:
    ```
    NSAMPLE: 6000
    NTEST: 2000
    
    sample: function [] [
      x: (random 1.0) - 0.5
      y: (random 1.0) - 0.5
      r2: (x * x) + (y * y)
      either r2 <= 0.25 [ 1.0 ] [ 0.0 ]
    ]
    
    getPi: function [] [
      ps: 0.0
      loop NSAMPLE [ ps: ps + sample ]
      4.0 * ps / NSAMPLE
    ]
    
    main: function [] [
      random/seed (to integer! now)
      ps: 0.0
      loop NTEST [ ps: ps + getPi ]
      ps / NTEST
    ]
    
    print main
    ```

--------------------------------------------------------------------------------

On 2017-11-29T07:15:33Z, greggirwin, commented:
<https://github.com/red/red/issues/3123#issuecomment-347773417>

    Notes:
    
    - `func` doesn't automatically capture local variables. `function` does, or you can use `/local` with func to declare them.
    - Infix operators have precedence over function calls. Use parens to control precedence: `(random 1.0) - 0.5` vs `random 1.0 - 0.5`
    - Operator precedence is strictly left to right. Use parens or `math` if you want traditional operator precedence: `(x * x) + (y * y)` vs `x * x + y * y`

