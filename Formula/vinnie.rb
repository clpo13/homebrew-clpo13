class Vinnie < Formula
  desc "VIN decoder (WIP)"
  homepage "https://github.com/clpo13/vinnie"
  url "https://github.com/clpo13/vinnie/releases/download/v0.1.0-alpha/vinnie-0.1.0-alpha.tar.xz"
  sha256 "9351123cf61dbd2632dc2dccd3ef9b93d668f5b2b86b07c7344f13035f29c733"
  head "https://github.com/clpo13/vinnie.git"

  depends_on "meson" => :build
  depends_on "ninja" => :build

  def install
    system "meson", "--buildtype", "release", "--prefix", prefix, "build"
    system "ninja", "-C", "build", "install"
  end

  test do
    assert_match "VIN 11111111111111111 is valid!", shell_output("#{bin}/vinnie 11111111111111111")
  end
end
