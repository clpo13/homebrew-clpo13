class Tqdm < Formula
  desc "Fast, extensible progress bar for Python and CLI"
  homepage "https://tqdm.github.io/"
  url "https://files.pythonhosted.org/packages/62/06/d5604a70d160f6a6ca5fd2ba25597c24abd5c5ca5f437263d177ac242308/tqdm-4.66.1.tar.gz"
  sha256 "d88e651f9db8d8551a62556d3cff9e3034274ca5d66e93197cf2490e2dcb69c7"
  license all_of: ["MPL-2.0", "MIT"]
  head "https://github.com/tqdm/tqdm.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/clpo13/clpo13"
    rebuild 1
    sha256 cellar: :any_skip_relocation, ventura:      "f09713b3d378ed219450edc7941c6f112e1aeb2e9c290ff06bae342b5f678936"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9fc0a1d7d1dc19a83d53fdb335bb325eddaa83f20b8150be0df3f2777da39a6f"
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
      system python_exe, "-c", "import tqdm"
    end
  end
end
