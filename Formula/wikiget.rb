class Wikiget < Formula
  include Language::Python::Virtualenv

  desc "Download files from MediaWiki sites"
  homepage "https://github.com/clpo13/wikiget"
  url "https://files.pythonhosted.org/packages/0b/bf/f67b11e5f32218c5793b4dbbb7ae9309f11db10c1f750a059bdc843f1de2/wikiget-0.8.0.tar.gz"
  sha256 "6ddf1d43c725c2e52fab5bd7e80f13155acbda2f873f197e3bfccb129f693649"
  license "GPL-3.0-or-later"
  head "https://github.com/clpo13/wikiget.git", branch: "master"

  depends_on "python-hatchling" => :build
  depends_on "python@3.12"

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/71/da/e94e26401b62acd6d91df2b52954aceb7f561743aa5ccc32152886c76c96/certifi-2024.2.2.tar.gz"
    sha256 "0569859f95fc761b18b45ef421b1290a0f65f147e92a1e5eb3e635f9a5e4e66f"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/63/09/c1bc53dab74b1816a00d8d030de5bf98f724c52c1635e07681d312f20be8/charset-normalizer-3.3.2.tar.gz"
    sha256 "f30c3cb33b24454a82faecaf01b19c18562b1e89558fb6c56de4d9118a032fd5"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/bf/3f/ea4b9117521a1e9c50344b909be7886dd00a519552724809bb1f486986c2/idna-3.6.tar.gz"
    sha256 "9ecdbbd083b06798ae1e86adcbfe8ab1479cf864e4ee30fe4e46a003d12491ca"
  end

  resource "mwclient" do
    url "https://files.pythonhosted.org/packages/97/b4/5fc70ad3286a8d8ec4b9ac01acad0f6b00c5a48d4a16b9d3be6519b7eb21/mwclient-0.10.1.tar.gz"
    sha256 "79363dd8d12f5e3b91b92b63152bf9dfef27da786c076a244e1f148c8dd67139"
  end

  resource "oauthlib" do
    url "https://files.pythonhosted.org/packages/6d/fa/fbf4001037904031639e6bfbfc02badfc7e12f137a8afa254df6c4c8a670/oauthlib-3.2.2.tar.gz"
    sha256 "9859c40929662bec5d64f34d01c99e093149682a3f38915dc0655d5a633dd918"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/9d/be/10918a2eac4ae9f02f6cfe6414b7a155ccd8f7f9d4380d62fd5b955065c3/requests-2.31.0.tar.gz"
    sha256 "942c5a758f98d790eaed1a29cb6eefc7ffb0d1cf7af05c3d2791656dbd6ad1e1"
  end

  resource "requests-oauthlib" do
    url "https://files.pythonhosted.org/packages/d5/5d/fd68baf0876774835068b557717932c44c6be42ee847bcc210bf389d4189/requests-oauthlib-1.4.0.tar.gz"
    sha256 "acee623221e4a39abcbb919312c8ff04bd44e7e417087fb4bd5e2a2f53d5e79a"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/71/39/171f1c67cd00715f190ba0b100d606d440a28c93c7714febeca8b79af85e/six-1.16.0.tar.gz"
    sha256 "1e61c37477a1626458e36f7b1d82aa5c9b094fa4802892072e49de9c60c4c926"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/ea/85/3ce0f9f7d3f596e7ea57f4e5ce8c18cb44e4a9daa58ddb46ee0d13d6bff8/tqdm-4.66.2.tar.gz"
    sha256 "6cd52cdf0fef0e0f543299cfc96fec90d7b8a7e88745f411ec33eb44d5ed3531"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/7a/50/7fd50a27caa0652cd4caf224aa87741ea41d3265ad13f010886167cfcc79/urllib3-2.2.1.tar.gz"
    sha256 "d0570876c61ab9e520d776c38acbbb5b05a776d3f9ff98a5c8fd5162a444cf19"
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
