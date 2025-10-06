Red[]

null-byte: #{00}

load-int: func ['word][set word to integer! get word]

data: read/binary %/usr/share/zoneinfo/Europe/Prague

transition-times: copy []
types: copy []

parse data [
; * The magic four-byte ASCII sequence “TZif” identifies the file as a
; timezone information file.
	"TZif"

; * A byte identifying the version of the file's format (as of 2017,
; either an ASCII NUL, or “2”, or “3”).
	set version skip (version: to char! version)

; * Fifteen bytes containing zeros reserved for future use.
	15 null-byte

; * Six four-byte integer values, in the following order:

; tzh_ttisutcnt
; The number of UT/local indicators stored in the file.  (UT
; is Universal Time.)
	copy tzh_ttisutcnt 4 skip
	(load-int tzh_ttisutcnt)

; tzh_ttisstdcnt
; The number of standard/wall indicators stored in the file.

	copy tzh_ttisstdcnt 4 skip
	(load-int tzh_ttisstdcnt)

; tzh_leapcnt
; The number of leap seconds for which data entries are stored
; in the file.

	copy tzh_leapcnt 4 skip
	(load-int tzh_leapcnt)

; tzh_timecnt
; The number of transition times for which data entries are
; stored in the file.

	copy tzh_timecnt 4 skip
	(load-int tzh_timecnt)

; tzh_typecnt
; The number of local time types for which data entries are
; stored in the file (must not be zero).

	copy tzh_typecnt 4 skip
	(load-int tzh_typecnt)

; tzh_charcnt
; The number of bytes of time zone abbreviation strings stored
; in the file.

	copy tzh_charcnt 4 skip
	(load-int tzh_charcnt)

; tzh_timecnt four-byte signed integer values sorted in ascending
; order.  These values are written in network byte order.  Each is
; used as a transition time (as returned by time(2)) at which the
; rules for computing local time change.

	tzh_timecnt [
		copy value 4 skip
		(append transition-times to integer! value)
	]

; tzh_timecnt one-byte unsigned integer values; each one but the last
; tells which of the different types of local time types described in
; the file is associated with the time period starting with the same-
; indexed transition time and continuing up to but not including the
; next transition time.  (The last time type is present only for
; consistency checking with the POSIX-style TZ string described
; below.)  These values serve as indices into the next field.

	tzh_timecnt [
		copy value skip
		(append types to integer! value)
	]

]


