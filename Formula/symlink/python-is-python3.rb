class PythonIsPython3 < Formula
  desc "Symlink latest python3 as python"
  url "https://raw.githubusercontent.com/rattatap/homebrew-tap/refs/heads/main/empty.txt?v=0.1"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"

  def install
    mkdir bin
    ln_s Pathname(ENV["HOMEBREW_OPT"])/"python@3/libexec/bin/python", bin/"python"
  end
end
