class Jdupes < Formula
  desc "Duplicate file finder and an enhanced fork of 'fdupes'"
  homepage "https://github.com/jbruchon/jdupes"
  url "https://github.com/jbruchon/jdupes/archive/v1.10.1.tar.gz"
  sha256 "94f0a5d50738f912f552cd99b2b1658c1bdeee0ff2836601999316ebc0a229a5"

  bottle do
    cellar :any_skip_relocation
    sha256 "fccd81d12aba6799be3b14951dcb1c8a12fecae5a8a03edcb2df17814d482e91" => :high_sierra
    sha256 "ec253cb11c9e0085bfda9c3685e88c7a6f09f613d458788fce52a3e392e5a506" => :sierra
    sha256 "ada6220e0d26d404df7fb4877834c19ee55905e1202f950ab55234f5651aafd5" => :el_capitan
  end

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    touch "a"
    touch "b"
    (testpath/"c").write("unique file")
    dupes = shell_output("#{bin}/jdupes --zeromatch .").strip.split("\n").sort
    assert_equal ["./a", "./b"], dupes
  end
end
