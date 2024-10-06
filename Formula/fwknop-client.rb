class FwknopClient < Formula
  desc "build fwknop client without gpg support"
  homepage "https://www.cipherdyne.org/fwknop/"
  url "https://www.cipherdyne.org/fwknop/download/fwknop-2.6.11.tar.gz"
  mirror "https://github.com/mrash/fwknop/releases/download/2.6.11/fwknop-2.6.11.tar.gz"
  sha256 "bcb4e0e2eb5fcece5083d506da8471f68e33fb6b17d9379c71427a95f9ca1ec8"
  license "GPL-2.0-or-later"
  head "https://github.com/mrash/fwknop.git", branch: "master"

  uses_from_macos "libpcap"

  on_linux do
    depends_on "iptables"
  end

  def install
    args = %W[
      --disable-silent-rules
      --sysconfdir=#{etc}
      --disable-server
    ]
    args << "--with-iptables=#{Formula["iptables"].opt_prefix}" unless OS.mac?
    system "./configure", *std_configure_args, *args
    system "make", "install"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fwknop --version")
    assert_match(/KEY_BASE64:\s*.+/, shell_output("#{bin}/fwknop --key-gen"))
  end
end
