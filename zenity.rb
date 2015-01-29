class Zenity < Formula
  homepage "https://live.gnome.org/Zenity"
  url "http://ftp.gnome.org/pub/gnome/sources/zenity/3.14/zenity-3.14.0.tar.xz"
  sha1 "a38b98a99c44b05c1a8573fa8e0cc53a191868fb"

  bottle do
    root_url "https://downloads.sf.net/project/machomebrew/Bottles/x11"
    sha1 "3426d2077fa335d2c215cce4903741c748e578c2" => :yosemite
    sha1 "9b356978fb0b758d0e420d3fdfa54ba538e5663b" => :mavericks
    sha1 "aee2c119bed7d6cf1c844f9670a11b0becb806d2" => :mountain_lion
  end

  depends_on "pkg-config" => :build
  depends_on "intltool" => :build
  depends_on "itstool" => :build
  depends_on "libxml2"
  depends_on "gtk+3"
  depends_on "gnome-doc-utils"
  depends_on "scrollkeeper"
  depends_on :x11

  def install
    ENV.append_path "PYTHONPATH", "#{Formula["libxml2"].opt_lib}/python2.7/site-packages"
    system "./autogen.sh" if build.head?
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end
end
