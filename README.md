# Rattatap-Tap: Useful Formulae and `brew` Commands

## Installation

`brew tap rattatap/tap`

## Homebrew Commands

A collection of added commands for [Homebrew](https://brew.sh).

### `brew env`
Execute `env` in `brew` environment. See [env(1)](https://ss64.com/mac/env.html).

Examples:
* `brew env` prints brew's environment
* `brew env foobar` execute command `foobar` with brew's environment.

### `brew taps`

Print a table summarizing installed taps, including information on the current git status.

Sample output:
```
~ % brew taps
Tap              Size   🍺   🍷 Cmd
homebrew/aliases 268K    0    0   2
homebrew/bundle   15M    0    0   1
homebrew/cask       -    0 6989   0
homebrew/core    678M 7086    0   3
rattatap/tap     164K    3    0   2 (wip)
```

## Formulae

### Patched Formulae
I was unhappy with how the official Homebrew versions of these packages worked. These formulae are hacks that load their data from official formulae or casks and then customize some element of the build or installation. Because the soruce links come from the official formulae they will always install current versions, but they could concievably break if there are major changes to how these packages are installed.

- `fwknop-client`: Patched version of [homebrew/core/fwknop](https://github.com/Homebrew/homebrew-core/blob/master/Formula/f/fwknop.rb). Removes gpg dependencies, server binary.

### New Formulae
Formulae that aren't in [homebrew/core](https://github.com/homebrew/homebrew-core/) yet. I'm usually pretty quick to get new versions here when they are released, but if you are using one of these formulae and find it out of date PRs are welcome. I will remove formulae here if/when they are upstreamed to homebrew/core.

_None currently_

### How do I install these formulae?

`brew install rattatap/tap/<formula>`

Or `brew tap rattatap/tap` and then `brew install <formula>`.

Or, in a [`brew bundle`](https://github.com/Homebrew/homebrew-bundle) `Brewfile`:

```ruby
tap "rattatap/tap"
brew "<formula>"
```

### Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
