class Mkenv < Formula
  desc "Fast, secure, reproducible local isolated development environment generator"
  homepage "https://mkenv.sh/"
  version "0.0.7"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/0xa1bed0/mkenv/releases/download/v0.0.7/mkenv-darwin-arm64"
      sha256 "525f3f995c0e4eadb1bd0bf5031497d521f13766ca963963e06de59496bafdc1"
    else
      url "https://github.com/0xa1bed0/mkenv/releases/download/v0.0.7/mkenv-darwin-amd64"
      sha256 "9da1b63ca98ce0401745b567e130955fe24acab626031f7132a41f518a120f60"
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
