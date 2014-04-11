require "formula"

class Compute < Formula
  homepage "http://agordon.github.io/compute/"
  head "https://github.com/agordon/compute.git"
  url "https://s3.amazonaws.com/agordon/compute/src/compute-1.0.4.tar.gz"
  sha1 "058c36814d071f8334e74c5d01edab94941e8368"

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
