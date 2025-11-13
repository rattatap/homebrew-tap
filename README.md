# `rattatap/tap`: Useful Formulae and `brew` Commands

## Installation

`brew tap rattatap/tap`

## Homebrew Commands

A collection of added commands for [Homebrew](https://brew.sh).

### Alias commands
The following are essentially simple aliases of existing commands, but unlike commands added with `brew alias`, these come with tab completion!
* `brew out`: Alias for `brew outdated`
* `brew s`: Alias for `brew search`
* `brew show`: Alias for `brew info` (so `brew` doesn't confuse my muscle memory from Debian)
* `brew tree`: Alias for `brew deps --tree --installed` (the flags I nearly always want with `brew deps`, and I don't care to memorize them)
* `brew why`: Alias for `brew uses --installed --recursive` (see also: `aptitude why`)

### `brew blame`
Run `git blame` on a formula.

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
I was unhappy with how the official Homebrew versions of these packages worked. These formulae are hacks that load their data from official formulae and then customize some element of the build or installation. Because the soruce links come from the official formulae they will always install current versions, but they could concievably break if there are major changes to how these packages are installed.

- `bind-dnstools`: Patched version of [homebrew/core/bind](https://github.com/Homebrew/homebrew-core/blob/master/Formula/b/bind.rb). Just `delv`, `dig`, `host`. Removes server binaries, server only utils, libs, and dependencies.
- `fwknop-client`: Patched version of [homebrew/core/fwknop](https://github.com/Homebrew/homebrew-core/blob/master/Formula/f/fwknop.rb). Removes gpg dependencies, server binary.

### New Formulae
Formulae that aren't in [homebrew/core](https://github.com/homebrew/homebrew-core/) yet. I'm usually pretty quick to get new versions here when they are released, but if you are using one of these formulae and find it out of date PRs are welcome. I will remove formulae here if/when they are upstreamed to homebrew/core.

- `curl-completion`: curl completion for `zsh` (and `fish`). Missing from macOS base install due to Apple packaging curl poorly.

### How do I install these formulae?

`brew install rattatap/tap/<formula>`

Or `brew tap rattatap/tap` and then `brew install <formula>`.

Or, in a [`brew bundle`](https://github.com/Homebrew/homebrew-bundle) `Brewfile`:

```ruby
tap "rattatap/tap"
brew "<formula>"
```

### Tab completion isn't working?

If zsh tab completion isn't working for commands in this (or any) tap, first try running `brew tap --repair`, then try deleting your zcompcache (default location is `~/.zcompcache`).

### Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
