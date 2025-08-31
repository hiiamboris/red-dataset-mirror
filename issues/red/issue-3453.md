
#3453: Case folding should use latest Unicode data
================================================================================
Issue is closed, was reported by meijeru and has 12 comment(s).
[status.built] [type.wish]
<https://github.com/red/red/issues/3453>

### Expected behavior
the table in `%runtime/case-folding.txt` should correspond to the latest Unicode version (currently 11)
### Actual behavior
the table uses version 7
### Steps to reproduce the problem
N/A
### Red and platform version
all


Comments:
--------------------------------------------------------------------------------

On 2018-07-04T13:17:38Z, endo64, commented:
<https://github.com/red/red/issues/3453#issuecomment-402476588>

    The file name should be `%runtime/case-folding.reds`

--------------------------------------------------------------------------------

On 2018-07-04T13:43:26Z, meijeru, commented:
<https://github.com/red/red/issues/3453#issuecomment-402483341>

    Right you are!

--------------------------------------------------------------------------------

On 2018-07-16T08:42:38Z, bitbegin, commented:
<https://github.com/red/red/issues/3453#issuecomment-405181564>

    1. the rust-lang have a good case folding, we can get our tables from it. (rust-lang source file: https://github.com/rust-lang/rust/blob/master/src/libcore/unicode/tables.rs).
    
    2. use https://github.com/bitbegin/generate-unicode-table to generate two tables in one file, one for to-uppercase, another for to-lowercase.
    
    3. #include this file to case-folding.reds, directly use these two tables without sort.
    
    We can surely produce this table file from unicode.org, but Red not support ftp:// for now. when full feature io is ready, we can write transfer tool use Red.

--------------------------------------------------------------------------------

On 2018-07-16T17:27:14Z, greggirwin, commented:
<https://github.com/red/red/issues/3453#issuecomment-405323457>

    Thanks @bitbegin ! Looks like the PR builds clean now, so I will merge that. 
    
    @meijeru, does this look OK to you for now? And the plan to pull directly later when we can?

--------------------------------------------------------------------------------

On 2018-07-17T09:12:10Z, meijeru, commented:
<https://github.com/red/red/issues/3453#issuecomment-405515080>

    I continue to think that pulling directly from `unicode.org`  is the most desirable solution, notwithstanding the anomalies that @bitbegin found. These should be reported to Unicode instead of being circumvented. As to reading directly, I did not need `ftp://` for that, as my Gist shows. But if the current solution passes all tests, let it stand...

--------------------------------------------------------------------------------

On 2018-07-17T14:38:11Z, bitbegin, commented:
<https://github.com/red/red/issues/3453#issuecomment-405605455>

    @meijeru  this file CaseFolding.txt cannot give us whole information for case folding direction.
    For example, `00B5; C; 03BC; # MICRO SIGN` cannot tell us which is uppercase, which is lowercase. But we can get it from UnicodeData.txt.  Maybe we can also parse this file to get two tables if we have time. (I found the UnicodeData.txt from here https://www.unicode.org/Public/UCD/latest/ucd/UnicodeData.txt, but being blocked in China)

