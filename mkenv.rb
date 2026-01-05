class Mkenv < Formula
  desc "Fast, secure, reproducible local isolated development environment generator"
  homepage "https://mkenv.sh/"
  version "0.0.6"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/0xa1bed0/mkenv/releases/download/v0.0.6/mkenv-darwin-arm64"
      sha256 "12c0ebcb8874e7aa9aff3c934dec3c3c57ce031456d075c1fafe7d69545cd16a"
    else
      url "https://github.com/0xa1bed0/mkenv/releases/download/v0.0.6/mkenv-darwin-amd64"
      sha256 "4c3c0c79925b1a6b8432f0ea19ecde6f6e4fc7cec8f2bbddf6726960aa7ce8bc"
    end
  end

  def install
    bin.install "mkenv-darwin-arm64" => "mkenv" if Hardware::CPU.arm?
    bin.install "mkenv-darwin-amd64" => "mkenv" if Hardware::CPU.intel?
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mkenv --version")
  end
end
