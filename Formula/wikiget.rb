class Wikiget < Formula
  include Language::Python::Virtualenv

  desc "Download files from MediaWiki sites"
  homepage "https://github.com/clpo13/wikiget"
  url "https://files.pythonhosted.org/packages/0b/bf/f67b11e5f32218c5793b4dbbb7ae9309f11db10c1f750a059bdc843f1de2/wikiget-0.8.0.tar.gz"
  sha256 "6ddf1d43c725c2e52fab5bd7e80f13155acbda2f873f197e3bfccb129f693649"
  head "https://github.com/clpo13/wikiget.git"

  depends_on "python-requests-oauthlib"
  depends_on "python@3.12"
  depends_on "six"

  resource "mwclient" do
    url "https://files.pythonhosted.org/packages/97/b4/5fc70ad3286a8d8ec4b9ac01acad0f6b00c5a48d4a16b9d3be6519b7eb21/mwclient-0.10.1.tar.gz"
    sha256 "79363dd8d12f5e3b91b92b63152bf9dfef27da786c076a244e1f148c8dd67139"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/62/06/d5604a70d160f6a6ca5fd2ba25597c24abd5c5ca5f437263d177ac242308/tqdm-4.66.1.tar.gz"
    sha256 "d88e651f9db8d8551a62556d3cff9e3034274ca5d66e93197cf2490e2dcb69c7"
  end

  def install
    virtualenv_install_with_resources
    man1.install_symlink libexec/"share/man/man1/wikiget.1"
  end

  test do
    system bin/"wikiget", "-vv", "File:Example.jpg"
    assert_predicate testpath/"Example.jpg", :exist?
  end
end
