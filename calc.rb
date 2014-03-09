require "formula"

class Calc < Formula
  homepage "http://agordon.github.io/calc/"
  head "https://github.com/agordon/calc.git"
  url "https://github.com/agordon/calc/releases/download/0.98.0/calc-0.98.0.tar.gz"
  sha1 "31882d3c42f5319c594302be53f56bcb5dec7556"

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
