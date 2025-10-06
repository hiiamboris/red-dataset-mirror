# Red caching

## No index

There is no index of cached file. Due to the mechanism how cached files 
are named, this information is lost.

Solution:

1) keep global index of cached files
2) store cached files with metadata

## Cannot cache some requests

`write` - for some requests, WRITE must be used. 
	WRITE doesn't support caching
