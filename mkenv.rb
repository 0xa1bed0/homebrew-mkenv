class Mkenv < Formula
  desc "Fast, secure, reproducible local isolated development environment generator"
  homepage "https://mkenv.sh/"
  version "0.0.5"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/0xa1bed0/mkenv/releases/download/v0.0.5/mkenv-darwin-arm64"
      sha256 "50d7095b00007de28512c1c78de7e95961e3453a48e5712d104b6efa9ac03647"
    else
      url "https://github.com/0xa1bed0/mkenv/releases/download/v0.0.5/mkenv-darwin-amd64"
      sha256 "ef8ab0c45d755b371bb2bb88499231ec05c56ac771b0271bfa4fc809e28a47a5"
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
