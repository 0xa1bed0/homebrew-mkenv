class Mkenv < Formula
  desc "Fast, secure, reproducible local isolated development environment generator"
  homepage "https://mkenv.sh/"
  version "0.0.11"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/0xa1bed0/mkenv/releases/download/v0.0.11/mkenv-darwin-arm64"
      sha256 "ef8be2aab3888e1ba9e5144714da2373a40a91bf5f7f5fa90734dd7a11e566c4"
    else
      url "https://github.com/0xa1bed0/mkenv/releases/download/v0.0.11/mkenv-darwin-amd64"
      sha256 "1e618d4dfa2f10d16d8dd11d355fde966b24625609476a1d5963b967b63c28e9"
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
