class Mwclient < Formula
  desc "Python client library to interface with the MediaWiki API"
  homepage "https://github.com/mwclient/mwclient"
  url "https://files.pythonhosted.org/packages/97/b4/5fc70ad3286a8d8ec4b9ac01acad0f6b00c5a48d4a16b9d3be6519b7eb21/mwclient-0.10.1.tar.gz"
  sha256 "79363dd8d12f5e3b91b92b63152bf9dfef27da786c076a244e1f148c8dd67139"
  license "MIT"
  head "https://github.com/mwclient/mwclient.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/clpo13/clpo13"
    rebuild 2
    sha256 cellar: :any_skip_relocation, ventura:      "c20edea2fc6d66c4260600778083fcd2dbc3f24eaf3240d55b74cd3885e99ed4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "17a4a6b267125a95ed71ecd47f149d40a3c8a8bf35b2562b7ef416d84a5a5b5f"
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
      system python_exe, "-m", "pip", "install", *std_pip_args, "."
    end
  end

  test do
    pythons.each do |python|
      python_exe = python.opt_libexec/"bin/python"
      system python_exe, "-c", "import mwclient"
    end
  end
end
