require "formula"

class EasyTag < Formula
  homepage "https://projects.gnome.org/easytag"
  url "http://ftp.gnome.org/pub/GNOME/sources/easytag/2.2/easytag-2.2.6.tar.xz"
  sha256 "26437f0d698c3b16794336c335b40f53fa26aefeb77322e45e4e2501c4cff14a"

  bottle do
    root_url "https://homebrew.bintray.com/bottles-x11"
    sha256 "88a3c59ab8c4535c5b4e4ff1ac78e994106e6ec0247de6e727cba89f17db8b7e" => :yosemite
    sha256 "ffc3a8efa986fbcd9ca6bb7d728a00c58bbe8feb7407ff847625054199d078e9" => :mavericks
    sha256 "e148032bdd5eaf577328da670966c95f60ef42517f1ee6f00316526d3b27ed89" => :mountain_lion
  end

  depends_on :x11
  depends_on "pkg-config" => :build
  depends_on "intltool" => :build
  depends_on "itstool" => :build
  depends_on "gtk+"
  depends_on "hicolor-icon-theme"
  depends_on "id3lib"
  depends_on "libid3tag"
  depends_on "taglib"

  depends_on "libvorbis" => :recommended
  depends_on "flac" => :recommended
  depends_on "libogg" if build.with? "flac"

  depends_on "speex" => :optional
  depends_on "wavpack" => :optional

  def install
    ENV.append_path "PYTHONPATH", "#{Formula["libxml2"].opt_lib}/python2.7/site-packages"
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"
    ENV.deparallelize # make install fails in parallel
    system "make install"
  end
end
