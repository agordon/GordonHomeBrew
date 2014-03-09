require "formula"

class Calc < Formula
  homepage "http://agordon.github.io/calc/"
  head "https://github.com/agordon/calc.git"
  url "https://s3.amazonaws.com/agordon/calc/src/calc-1.0.0.tar.gz"
  sha1 "507ffbd88d6d8edce1bab389b9a74eee3b7cf930"

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
