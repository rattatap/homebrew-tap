class FakePython < Formula
  desc "Install symlinks to latest python, without extra bins"
  url "https://raw.githubusercontent.com/rattatap/homebrew-tap/refs/heads/main/Fake_Python_README.md?v=0.8"
  sha256 "67696c00fa3cdaa5cc5bcb954d0631d6fd65163ba76d19f680c76f91e0e1fb19"

  def install
    mkdir bin
    python3 = Pathname(ENV["HOMEBREW_OPT"])/"python@3"
    ln_s python3/"libexec/bin/python", bin/"python3"
    ln_s python3/"libexec/bin/pip", bin/"pip3"

    mkdir_p share/"man/man1"
    ln_s python3/"share/man/man1/python3.1", share/"man/man1/python3.1"
  end
end
