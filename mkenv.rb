class Mkenv < Formula
  desc "Fast, secure, reproducible local isolated development environment generator"
  homepage "https://mkenv.sh/"
  version "0.0.8"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/0xa1bed0/mkenv/releases/download/v0.0.8/mkenv-darwin-arm64"
      sha256 "8e16aa3cd480f2da7f921590ab7a9363ac6bb12e02d36b808a0c986875138ac0"
    else
      url "https://github.com/0xa1bed0/mkenv/releases/download/v0.0.8/mkenv-darwin-amd64"
      sha256 "d32c35517a3df2a119dd50496293d620b3a4ffb46f0f6bc11bb86a3d99fbdabd"
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
