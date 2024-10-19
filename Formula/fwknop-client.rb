class FwknopClient < Formula
  formula = Homebrew::API::Formula.all_formulae.find{|x| x[0] == "fwknop"}[1]
  desc "fwknop formula, patched to remove gpg dependencies and server binary"
  homepage formula["homepage"]
  url formula["urls"]["stable"]["url"]
  sha256 formula["urls"]["stable"]["checksum"]
  license formula["urls"]["stable"]["license"]
  head "https://github.com/mrash/fwknop.git", branch: "master"

  uses_from_macos "libpcap"

  def install
    args = %W[
      --disable-silent-rules
      --sysconfdir=#{etc}
      --disable-server
    ]
    system "./configure", *std_configure_args, *args
    system "make", "install"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fwknop --version")
    assert_match(/KEY_BASE64:\s*.+/, shell_output("#{bin}/fwknop --key-gen"))
  end
end
