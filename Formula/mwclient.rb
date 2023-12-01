class Mwclient < Formula
  desc "Python client library to interface with the MediaWiki API"
  homepage "https://github.com/mwclient/mwclient"
  url "https://files.pythonhosted.org/packages/97/b4/5fc70ad3286a8d8ec4b9ac01acad0f6b00c5a48d4a16b9d3be6519b7eb21/mwclient-0.10.1.tar.gz"
  sha256 "79363dd8d12f5e3b91b92b63152bf9dfef27da786c076a244e1f148c8dd67139"
  license "MIT"
  head "https://github.com/mwclient/mwclient.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/clpo13/clpo13"
    rebuild 1
    sha256 cellar: :any_skip_relocation, ventura:      "65744703885563b9cfd9f6d6c1afc768d2028ffc9891b310c983fc48b181c6fc"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "90588da699526cc1ec1e3192ca54936076e1c92c46d2800a2ad4577b92e72c58"
  end

  depends_on "python-setuptools" => :build
  depends_on "python@3.11" => [:build, :test]
  depends_on "python@3.12" => [:build, :test]
  depends_on "python-requests-oauthlib"
  depends_on "six"

  def pythons
    deps.map(&:to_formula).sort_by(&:version).filter { |f| f.name.start_with?("python@") }
  end

  def install
    pythons.each do |python|
      python_exe = python.opt_libexec/"bin/python"
      system python_exe, *Language::Python.setup_install_args(prefix, python_exe)
    end
  end

  test do
    pythons.each do |python|
      python_exe = python.opt_libexec/"bin/python"
      system python_exe, "-c", "import mwclient"
    end
  end
end
