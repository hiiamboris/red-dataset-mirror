
#3008: OSX Brew unable to install Red due to invalid checksum
================================================================================
Issue is closed, was reported by jhawk28 and has 2 comment(s).
<https://github.com/red/red/issues/3008>

$ brew cask install red

==> Satisfying dependencies
==> Downloading http://static.red-lang.org/dl/mac/red-063
######################################################################## 100.0%
==> Verifying checksum for Cask red
==> Note: running "brew update" may fix sha256 checksum errors
Error: Checksum for Cask 'red' does not match.

Expected: 8fa0aecd8c0cc21ea87c2b26ce940a8cb53ef61d78f1b9e350d2fa8a4e5e7990
Actual:   3558eb6c7973443c91361b9d2b5824a4b3229209af0a13a580f46ae0f4043e81
File:     /Users/jhawk28/Library/Caches/Homebrew/Cask/red--0.6.3

To retry an incomplete download, remove the file above.
Error: Install incomplete.


Comments:
--------------------------------------------------------------------------------

On 2019-09-11T15:41:47Z, dockimbel, commented:
<https://github.com/red/red/issues/3008#issuecomment-530439616>

    Issue moved to [red/Homebrew-red #4](https://github.com/red/Homebrew-red/issues/4) via [**ZenHub**](https://www.zenhub.com/)

