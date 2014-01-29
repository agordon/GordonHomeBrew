require 'formula'

class Xzalpha < Formula
  homepage 'http://tukaani.org/xz/'
  url 'http://tukaani.org/xz/xz-5.1.3alpha.tar.gz'
  sha1 'd71e7581c4e03837df073bc4aac476ac5a5a0f24'

  conflicts_with 'xz'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
