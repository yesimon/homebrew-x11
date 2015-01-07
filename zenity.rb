class Zenity < Formula
  homepage "https://live.gnome.org/Zenity"
  url "http://ftp.gnome.org/pub/gnome/sources/zenity/3.14/zenity-3.14.0.tar.xz"
  sha1 "a38b98a99c44b05c1a8573fa8e0cc53a191868fb"

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
