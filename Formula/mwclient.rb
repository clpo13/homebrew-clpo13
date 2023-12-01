class Mwclient < Formula
  include Language::Python::Virtualenv

  desc "Python client library to interface with the MediaWiki API"
  homepage "https://github.com/mwclient/mwclient"
  url "https://files.pythonhosted.org/packages/97/b4/5fc70ad3286a8d8ec4b9ac01acad0f6b00c5a48d4a16b9d3be6519b7eb21/mwclient-0.10.1.tar.gz"
  sha256 "79363dd8d12f5e3b91b92b63152bf9dfef27da786c076a244e1f148c8dd67139"
  license "MIT"
  head "https://github.com/mwclient/mwclient.git", branch: "master"

  depends_on "python-requests-oauthlib"
  depends_on "python@3.12"
  depends_on "six"

  def install
    virtualenv_install_with_resources
  end
end
