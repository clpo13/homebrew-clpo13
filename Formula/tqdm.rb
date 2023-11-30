class Tqdm < Formula
  include Language::Python::Virtualenv

  desc "Fast, extensible progress bar for Python and CLI"
  homepage "https://tqdm.github.io/"
  url "https://files.pythonhosted.org/packages/62/06/d5604a70d160f6a6ca5fd2ba25597c24abd5c5ca5f437263d177ac242308/tqdm-4.66.1.tar.gz"
  sha256 "d88e651f9db8d8551a62556d3cff9e3034274ca5d66e93197cf2490e2dcb69c7"
  license all_of: ["MPL-2.0", "MIT"]
  head "https://github.com/tqdm/tqdm.git", branch: "master"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end
end
