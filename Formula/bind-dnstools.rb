class BindDnstools < Formula
  desc "BIND DNS query tools"
  formula = Homebrew::API::Formula.all_formulae.find{|x| x[0] == "bind"}[1]
  homepage formula["homepage"]
  url formula["urls"]["stable"]["url"]
  sha256 formula["urls"]["stable"]["checksum"]
  license formula["urls"]["stable"]["license"]

  version_scheme 1

  depends_on "pkgconf" => :build
  depends_on "libidn2"
  depends_on "libuv"
  depends_on "openssl@3"
  depends_on "userspace-rcu"

  uses_from_macos "zlib"

  on_linux do
    depends_on "libcap"
  end

  def install
    # disable options that are only useful for named
    args = [
      "--prefix=#{prefix}",
      "--sysconfdir=#{pkgetc}",
      "--localstatedir=#{var}",
      "--with-libidn2=#{Formula["libidn2"].opt_prefix}",
      "--with-openssl=#{Formula["openssl@3"].opt_prefix}",
      "--without-lmdb",
      "--without-jemalloc",
      "--without-libnghttp2",
      "--without-readline",
      "--without-libxml2",
      "--disable-doh",
    ]
    system "./configure", *args

    system "make"
    # Build scripts don't appear to support building selected artifacts.
    # Instead, we just build everything and only install delv and the
    # libraries we need to support it.
    system "mkdir", "-p", bin, lib
    bin.install "bin/delv/.libs/delv", "bin/dig/.libs/dig", "bin/dig/.libs/host"
    lib.install "lib/dns/.libs/libdns-#{version}.dylib", "lib/isc/.libs/libisc-#{version}.dylib"
    lib.install "lib/isccfg/.libs/libisccfg-#{version}.dylib", "lib/ns/.libs/libns-#{version}.dylib"
    man1.install "doc/man/delv.1", "doc/man/dig.1", "doc/man/host.1"
  end

  test do
    system bin/"dig", "-v"
    system bin/"dig", "brew.sh"
    system bin/"dig", "ü.cl"
  end
end
