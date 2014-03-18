require "formula"

class Calc < Formula
  homepage "http://agordon.github.io/calc/"
  head "https://github.com/agordon/calc.git"
  url "https://github.com/agordon/calc/releases/download/v1.0.2/calc-1.0.2.tar.gz"
  sha1 "e58728e55eed78e55ee24d2004e07612987fe1bc"

  if build.head?
    depends_on :autoconf => :build
    depends_on :automake => :build
    depends_on :gettext => :build
  end

  def install
    # Remove unrecognized options if warned by configure
    system "./configure", "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "check"
    system "make", "install"
  end

  test do
    system "true"
  end
end
