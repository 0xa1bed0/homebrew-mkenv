class Mkenv < Formula
  desc "Fast, secure, reproducible local isolated development environment generator"
  homepage "https://mkenv.sh/"
  version "0.0.9"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/0xa1bed0/mkenv/releases/download/v0.0.9/mkenv-darwin-arm64"
      sha256 "92f78592476b78b4c32e7bb1589d900371a17d08ea1135081126a8acde82e269"
    else
      url "https://github.com/0xa1bed0/mkenv/releases/download/v0.0.9/mkenv-darwin-amd64"
      sha256 "7b237277a44570df2049b54b5296212fefbacba03d3a9fa9b1f93ec8f298df31"
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
