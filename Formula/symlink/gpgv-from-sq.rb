class GpgvFromSq < Formula
  desc "Symlink gpg-sq and gpgv-sq to replace gpg and gpgv"
  url "https://raw.githubusercontent.com/rattatap/homebrew-tap/refs/heads/main/empty.txt?v=0.1"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"

  depends_on "sequoia-chameleon-gnupg"

  def install
    mkdir bin
    ln_s Pathname(ENV["HOMEBREW_OPT"])/"sequoia-chameleon-gnupg/bin/gpgv-sq", bin/"gpgv"
  end
end
