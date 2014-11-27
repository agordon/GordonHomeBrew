require 'formula'

class Lobstr < Formula
  homepage 'http://lobstr.teamerlich.org'
  url "http://erlichlab.wi.mit.edu/lobSTR/lobSTR-3.0.2.tar.gz"
  sha1 "75a475d4673bace7378728337790e6f37eb04178"
  head 'https://github.com/mgymrek/lobstr-code', :using => :git

  if build.head?
    depends_on :autoconf => :build
    depends_on :automake => :build
  end
  depends_on :libtool => :build
  depends_on 'pkg-config' => :build
  depends_on "cppunit" => :build
  depends_on "gsl"
  depends_on "boost"

  def install
    if build.head?
      system 'sh', './reconf'
    end
    system './configure', "--prefix=#{prefix}"
    system 'make'
    system 'make', 'check'
    system 'make', 'install'
  end

  test do
    system '#{bin}/lobSTR', "--version"
    assert $?.success?
  end
end
