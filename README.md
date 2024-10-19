# Tap of Useful Formulae

If you find anything here useful, your stars are appreciated.

## Patched Formulae
I was unhappy with how the official Homebrew versions of these packages worked. These formulae are hacks that load their data from official formulae or casks and then customize some element of the build or installation. Because the soruce links come from the official formulae they will always install current versions, but they could concievably break if there are major changes to how these packages are installed.

- `fwknop-client`: Patched version of [homebrew/core/fwknop](https://github.com/Homebrew/homebrew-core/blob/master/Formula/f/fwknop.rb). Removes gpg dependencies, server binary.
- `op`: Patched version of [homebrew/cask/1password-cli](https://github.com/Homebrew/homebrew-cask/blob/master/Casks/1/1password-cli.rb). Adds shell completion.

## New Formulae
Formulae that aren't in [homebrew/core](https://github.com/homebrew/homebrew-core/) yet. I'm usually pretty quick to get new versions here when they are released, but if you are using one of these formulae and find it out of date PRs are welcome.

Unless otherwise noted these are formulae that I'm working on submitting to homebrew/core. I will remove formulae here if/when they are upstreamed.

- `sequoia-sq`: Sequoia-PGP command-line tool. Alternative to GnuPG. Please star its [GitLab repo](https://gitlab.com/sequoia-pgp/sequoia-sq) if you'd like to see it in homebrew/core.

## How do I install these formulae?

`brew install rattatap/tap/<formula>`

Or `brew tap rattatap/tap` and then `brew install <formula>`.

Or, in a [`brew bundle`](https://github.com/Homebrew/homebrew-bundle) `Brewfile`:

```ruby
tap "rattatap/tap"
brew "<formula>"
```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
