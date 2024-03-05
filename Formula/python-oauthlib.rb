class PythonOauthlib < Formula
  desc "Python Framework for OAuth1 & OAuth2"
  homepage "https://oauthlib.readthedocs.io/en/latest/"
  url "https://files.pythonhosted.org/packages/6d/fa/fbf4001037904031639e6bfbfc02badfc7e12f137a8afa254df6c4c8a670/oauthlib-3.2.2.tar.gz"
  sha256 "9859c40929662bec5d64f34d01c99e093149682a3f38915dc0655d5a633dd918"
  license "BSD-3-Clause"

  bottle do
    root_url "https://ghcr.io/v2/clpo13/clpo13"
    sha256 cellar: :any_skip_relocation, ventura: "68670238f60006d6cb3af18e87a7836c8552843dee46444349aa230f93f7f3b7"
  end

  depends_on "python-setuptools" => :build
  depends_on "python@3.11" => [:build, :test]
  depends_on "python@3.12" => [:build, :test]

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
      system python_exe, "-c", "from oauthlib import oauth1, oauth2"
    end
  end
end
