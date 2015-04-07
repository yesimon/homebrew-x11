class Cwm < Formula
  homepage "https://github.com/chneukirchen/cwm"
  url "https://github.com/chneukirchen/cwm/archive/v5.6.tar.gz"
  sha1 "637f615a2a5944070cfe2a5fd0125daa461967b5"

  bottle do
    root_url "https://homebrew.bintray.com/bottles-x11"
    cellar :any
    sha256 "66505c17dbe6aabfc53d2cfd0d9b09f77ca384637ffcf99a209e0c87f6b37a85" => :yosemite
    sha256 "9665155b0132c3fd248bb81d44204b90e8b352fb82054b238b98d7223a92abdd" => :mavericks
    sha256 "895d906f52d9eca0a83a290bcb1499343ecf91b22cbee77f0494a39239fa7859" => :mountain_lion
  end

  depends_on :x11
  depends_on "pkg-config" => :build

  patch do
    # Fix 10.10 build. Merged upstream.
    url "https://github.com/chneukirchen/cwm/commit/81c05b3.diff"
    sha1 "adf1c676b693051d3c5dc964d8681eaf45b11dd7"
  end

  def install
    system "make", "PREFIX=#{prefix}", "install"
  end
end
