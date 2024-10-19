class Op < Formula
  op_cask = Homebrew::API::Cask.all_casks.find{|x| x[0] == "1password-cli"}[1]
  desc "1password-cli cask, patched to add shell completion"
  homepage op_cask["homepage"]
  sha256 op_cask["sha256"]
  url op_cask["url"]

  def install
    bin.install "op"

    generate_completions_from_executable(bin/"op", "completion")
  end
end
