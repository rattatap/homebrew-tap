class CurlCompletion < Formula
  # zsh completion is part of curl source, but not packaged by Apple
  desc "Zsh and Fish completion for curl"
  homepage "https://curl.se"
  # version should match current curl in macOS
  url "https://curl.se/download/curl-8.7.1.tar.bz2"
  sha256 "05bbd2b698e9cfbab477c33aa5e99b4975501835a41b7ca6ca71de03d8849e76"
  license "curl"

  def install
    args = [
      buildpath/"scripts/completion.pl",
      # uncomment for version >=8.13.0
      # "--opts-dir", buildpath/"docs/cmdline-opts",
    ]
    generate_completions_from_executable(*args, base_name: "curl", shells: [:fish, :zsh])
  end

  test do
    File.file?(share/"zsh/site-functions/_curl")
  end
end
