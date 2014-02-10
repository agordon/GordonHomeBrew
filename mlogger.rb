require "formula"

# 'mlogger' is a logger(1)-like program,
# with larger limit on message size.
#
# See:
# Original program:
#   http://lists.adiscon.net/pipermail/rsyslog/2014-February/036208.html
#
# With fixed unix-socket code:
#   http://lists.adiscon.net/pipermail/rsyslog/2014-February/036321.html

class Mlogger < Formula
  homepage "https://github.com/agordon/mlogger/tree/dgram_400"
  url "https://github.com/agordon/mlogger/releases/download/1.1.0-custom/mlogger-1.1.0-custom.tar.gz"
  sha1 "54f3f46d1621c62f5132daf147a2dc0241995207"

  def install
    system 'make'
    bin.install 'mlogger'
  end
end
