class Wikiget < Formula
  include Language::Python::Virtualenv

  desc "Download files from MediaWiki sites"
  homepage "https://github.com/clpo13/wikiget"
  url "https://files.pythonhosted.org/packages/0b/bf/f67b11e5f32218c5793b4dbbb7ae9309f11db10c1f750a059bdc843f1de2/wikiget-0.8.0.tar.gz"
  sha256 "6ddf1d43c725c2e52fab5bd7e80f13155acbda2f873f197e3bfccb129f693649"
  license "GPL-3.0-or-later"
  head "https://github.com/clpo13/wikiget.git", branch: "master"

  depends_on "clpo13/wikiget/mwclient"
  depends_on "clpo13/wikiget/tqdm"
  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
    man1.install_symlink libexec/"share/man/man1/wikiget.1"
  end

  test do
    system bin/"wikiget", "-vv", "File:Example.jpg"
    assert_predicate testpath/"Example.jpg", :exist?
  end
end
