class Mkenv < Formula
  desc "Fast, secure, reproducible local isolated development environment generator"
  homepage "https://mkenv.sh/"
  version "0.0.10"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/0xa1bed0/mkenv/releases/download/v0.0.10/mkenv-darwin-arm64"
      sha256 "649fe29191d95e30d805e7f2631c8cbe13ff07128c84f18deeb73c46c7bb6b9a"
    else
      url "https://github.com/0xa1bed0/mkenv/releases/download/v0.0.10/mkenv-darwin-amd64"
      sha256 "1e5b8955c35da8453d2a4006fede112529daa7b0c08d32faa2761c21c1aa1bd1"
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
