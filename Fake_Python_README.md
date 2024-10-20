# Rattatap-Tap Fake Python

* Problem: macOS ships a prehistoric python3, I don't want that junk on my `$PATH`!
* Solution: `brew install python`
* New problem: Homebrew python includes suffixed bins (e.g. python3.12) and bins I don't need (e.g. wheel3), I don't want that junk on my `$PATH`!
* New solution: Unlink Homebrew python formula, and create symlinks to it so I can use Homebrew python without the extra bins.

## Installation
Manual:
```
brew install python
brew unlink python
brew install rattatap/tap/fake-python
```

via Brewfile:
```
brew "python", link: false
brew "rattatap/tap/op"
```
