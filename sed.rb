require "formula"

class Sed < Formula
  homepage "http://sed.sourceforge.net/"
  url "ftp://ftp.gnu.org/gnu/sed/sed-4.2.2.tar.bz2"
  sha1 "f17ab6b1a7bcb2ad4ed125ef78948092d070de8f"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    # Remove unrecognized options if warned by configure
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    system "make", "install" # if this fails, try separate make/make install steps
  end

end
