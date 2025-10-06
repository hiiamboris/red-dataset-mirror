# Point to part

## Description:
Adds ability to point not only to some position but to part of the series.   
Any change in the part should be propagated to the original series.

## Usage:
See [tests folder](tests/).

## Other info:
My goal was to implement it in the pure Red. It should work but might be slow with a "bigger data".  
As I was implementing this I've found that sometimes we don't want to propagate some operations on whole series (e.g. `reverse` or `sort`). I'm going to play with this idea and see what I can do.

## License
[license.md](license.md)
