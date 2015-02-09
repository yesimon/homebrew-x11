class Mupdf < Formula
  homepage "http://mupdf.com"
  url "http://mupdf.com/downloads/mupdf-1.6-source.tar.gz"
  sha256 "9813ee330950a641364181649ebd369c947adbcea9d41ed953ec5365640ea563"
  revision 1

  bottle do
    cellar :any
    sha1 "30f8a874a36fa64447c1c2acd691df68ef070061" => :mavericks
    sha1 "aabd22a66449e271c00078f097fd7ae212019fa3" => :mountain_lion
    sha1 "98fbed77b4bf143d13b091b8a4c4349438f7ecd4" => :lion
  end

  depends_on :macos => :snow_leopard
  depends_on :x11
  depends_on "openssl"

  conflicts_with "mupdf-tools",
    :because => "mupdf and mupdf-tools install the same binaries."

  def install
    system "make", "install",
           "build=release",
           "verbose=yes",
           "CC=#{ENV.cc}",
           "prefix=#{prefix}"
  end

  test do
    pdf = test_fixtures("test.pdf")
    assert_match /Homebrew test/, shell_output("#{bin}/mudraw -t #{pdf} 2>/dev/null")
  end
end
